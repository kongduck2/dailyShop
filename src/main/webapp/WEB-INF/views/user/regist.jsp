<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 제이쿼리 라이브러리 가져오기 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 카카오 주소 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript"> 
//이메일 중복체크
		$(document).ready(function(){
			$('#checkbtn').on('click', function(){
				var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;//이메일 정규식
				var email = $('#email').val(); 
				$.ajax({
					type: 'POST',
					url: 'regist',
					data: { "email" : $('#email').val()},
						success: function(data){
							if(email == ""){
								$('#idCheckMsg').html('<p style="color:red">이메일을 입력해주세요.</p>');
							}else if(!emailRule.test(email)){
								$('#idCheckMsg').html('<p style="color:red">이메일 형식이 올바르지 않습니다.</p>')
							}else if($.trim(data) == 0){
								$('#idCheckMsg').html('<p style="color:green">사용가능한 아이디 입니다.</p>');
							}else{ 
								$('#idCheckMsg').html('<p style="color:red">이미 사용중인 아이디입니다.</p>');
							}
						}
					}); //end ajax 
				}); //end on 
			}); 
//패스워드 체크
		$(document).ready(function(){ 
				 var password = $('#password').val();
				 var password2 = $('#password2').val();
				 var passRule = /^[A-Za-z0-9]{6,15}$/; //패스워드 정규식
		    $('#password').keyup(function(){
			    	if(!passRule.test($('#password').val())){
			          $('#pwCheckMsg').html('비밀번호는 영문+숫자 6~15자리만 가능합니다.');
			          $('#pwCheckMsg').css('color', 'red');
			    	}else{
			      $('#pwCheckMsg').html('');
			    	}
			    });
			    $('#password2').keyup(function(){
			        if($('#password').val() != $('#password2').val()){
			          $('#pwCheckMsg').html('비밀번호 일치하지 않습니다.');
			          $('#pwCheckMsg').css('color', 'red');
			        } else{
			          $('#pwCheckMsg').html('비밀번호가 일치합니다.');
			          $('#pwCheckMsg').css('color', 'green');
			        }
			    });
			});
//폰넘버 체크
		$(document).ready(function(){
			var phoneRule = /^[0-9]+$/;
			$('#phone').keyup(function(){
				if(!phoneRule.test($('#phone').val())){
		          $('#pnCheckMsg').html('숫자만 입력 가능합니다.');
		          $('#pnCheckMsg').css('color', 'red');
				}else{
				  $('#pnCheckMsg').html('');
				}
			});
		});
		
//onsubmit 검사		
function registCheck(){
	var email = document.getElementById('email').value;
	var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;//이메일 정규식
	var password = document.getElementById('password').value;
	var password2 = document.getElementById('password2').value;
	var passRule = /^[A-Za-z0-9]{6,15}$/; //패스워드 정규식
	var phone = document.getElementById('phone').value;
	var phoneRule = /^[0-9]+$/;
	
	if(!emailRule.test(email)){
		alert('이메일 형식이 올바르지 않습니다.');
		return false;
	}else if(!passRule.test(password)){
		alert('비밀번호 형식이 올바르지 않습니다.');
		return false;
  	}else if(password != password2){
		alert('비밀번호가 일치하지 않습니다.');
		return false;
  	}else if(!phoneRule.test(phone)){
  		alert('휴대전화 형식이 올바르지 않습니다.');
  		return false;
  	}else{
  		return true;
  	}
}//registCheck end		
	
//카카오 주소 api
	window.onload = function(){
	    document.getElementById('address').addEventListener('click', function(){
	        new daum.Postcode({
	            oncomplete: function(data) { //선택시 입력값 세팅
	                document.getElementById('address').value = data.address; // 주소 넣기
	            }
	        }).open();
	    });
	}
</script>

</head>
<body>
<!-- header -->
<%@ include file="../header.jsp"%>

<div class="regist-form">
	<form class="row g-4" action="userRegist" onsubmit="return registCheck()" >
	<h3>회원등록</h3>
	<input type="hidden" name="regist_type" value=""/> <!-- 카카오 회원가입시 넘어가는값 1 기본 회원가입시 0  -->
	  <div class="col-md-5">
	    <label for="email" class="form-label">* 이메일(아이디)</label>
	    <input name="email" type="email" class="form-control" id="email" required>
	    <div id="idCheckMsg"></div>
	  <button type="button" id="checkbtn" class="btn btn-primary">중복확인</button>
	  </div>
	  <div class="col-md-5">
	    <label for="password" class="form-label">* 비밀번호</label>
	    <input name="password" type="password" class="form-control" id="password" required>
	    <label for="password2" class="form-label">* 비밀번호 확인</label>
	    <input name="password2" type="password" class="form-control" id="password2" required>
	    <label id="pwCheckMsg"></label>
	  </div>
	  <div class="col-12">
	    <label for="address" class="form-label">* 주소</label> <!-- 카카오 주소 api 사용 -->
	    <input name="address" type="text" class="form-control" id="address" required>
	    <label for="addressDetail" class="form-label">상세주소</label> 
	    <input name="addressDetail" type="text" class="form-control" id="addressDetail" required>
	  </div>
	  <div class="col-md-6">
	    <label for="name" class="form-label">* 이름</label>
	    <input name="name" type="text" class="form-control" id="name" required>
	  </div>
	  <div class="col-md-3">
	    <label for="phone" class="form-label">* 휴대전화('-' 제외)</label>
	    <input name="phone" type="text" class="form-control" id="phone">
	     <label id="pnCheckMsg"></label>
	  </div>
	  <!-- 회원가입 약관  -->
	  
	  
	  <div class="col-12" id="regist-btn">
	    <button type="submit" class="btn btn-success">회원가입</button>
	  </div>
	</form>
</div>

<!-- footer -->
<%@ include file="../footer.jsp"%>
</body>
</html>