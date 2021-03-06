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
								$('#idCheckMsg').html('<div style="color:red; margin-top:9px;">이메일을 입력해주세요.</div>');
							}else if(!emailRule.test(email)){
								$('#idCheckMsg').html('<div style="color:red; margin-top:9px;">이메일 형식이 올바르지 않습니다.</div>');
							}else if($.trim(data) == 0){
								$('#idCheckMsg').html('<span style="color:green">사용가능한 아이디 입니다.</span>');
								$('#idCheckMsg').append('<span><button type="button" id="emailChkBtn" class="emailChkBtn" onclick="openPopUp()">이메일 인증</button><span>');
							}else{ 
								$('#idCheckMsg').html('<div style="color:red; margin-top:9px;">이미 사용중인 아이디입니다.</div>');
							}
						}
					}); //end ajax 
				}); //end on 
			}); 
			
//이메일 인증 자식창 열기			
		function openPopUp(){
			window.name = 'registFrom';
			let _width = '650';
			let _height = '380';
			// 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
			let _left = Math.ceil((window.screen.width - _width) / 2);
			let _top = Math.ceil((window.screen.height - _height) / 2);
			let emailChk = window.open('emailCheck', 'emailChk', 'width=' + _width + ', height=' + _height + ', left=' + _left + ', top=' + _top,'location=no');
			let email = document.getElementById('email').value;
			
		    emailChk.addEventListener("DOMContentLoaded", () => { //자식창 페이지 로드후 값넣기
		 	   emailChk.document.getElementById('inputEmail').value = email;
		  });
	  }

			
			
			
//패스워드 체크
		$(document).ready(function(){ 
				 var password = $('#password').val();
				 var password2 = $('#password2').val();
				 var passRule = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/; //패스워드 정규식
		    $('#password').keyup(function(){
			    	if(!passRule.test($('#password').val())){
			          $('#pwCheckMsg').html('비밀번호는 영문 , 숫자, 특수문자 각 1회 이상 포함 6~15자리만 가능합니다.');
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
			var phoneRule = /^[0-9]{11}$/;
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
	var passRule = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/; //패스워드 정규식
	var phone = document.getElementById('phone').value;
	var phoneRule = /^[0-9]{11}$/;
	var emailSucChk = document.getElementById('emailSucChk').value;
	console.log(emailSucChk);
	if(!emailRule.test(email)){
		Swal.fire({icon: 'error',text: '이메일 형식이 올바르지 않습니다.'})
		return false;
	}else if(!passRule.test(password)){
		Swal.fire({icon: 'error',text: '비밀번호 형식이 올바르지 않습니다.'})
		return false;
  	}else if(password != password2){
		Swal.fire({icon: 'error',text: '비밀번호가 일치하지 않습니다.'})
		return false;
  	}else if(!phoneRule.test(phone)){
  		Swal.fire({icon: 'error',text: '휴대전화 형식이 올바르지 않습니다.'})
  		return false;
  	}else if(emailSucChk == 'false'){
  		Swal.fire({icon: 'error',text: '이메일 인증을 완료하셔야 합니다.'})
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
	                document.getElementById('zipCode').value = data.zonecode; // 우편번호 넣기
	            }
	        }).open();
	    });
	}
	
//회원약관 체크박스
function cAll() {
            if ($("#checkAll").is(':checked')) {
                $("input[type=checkbox]").prop("checked", true);
                $('#regist-btn').prop('disabled' , false);
            } else {
                $("input[type=checkbox]").prop("checked", false);
                $('#regist-btn').prop('disabled' , true);
          }
      }
//체크박스 필수항목 미동의시 버튼 비활성화      
$(document).ready(function(){
	$('#checkAllow,#checkInfo').change (function () {
		if($('#checkAllow').is(':checked') == true && $('#checkInfo').is(':checked') == true ){
			$('#regist-btn').prop('disabled' , false);
		}else{
			$('#regist-btn').prop('disabled' , true);
		}
	});
});      
      
      
      
