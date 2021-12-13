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
	
//onsubmit 검사		
function registCheck(){
	var email = document.getElementById('email').value;
	var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;//이메일 정규식
	var password = document.getElementById('password').value;
	var password2 = document.getElementById('password2').value;
	var passRule = /^[A-Za-z0-9]{6,15}$/; //패스워드 정규식
	var phone = document.getElementById('phone').value;
	var phoneRule = /^[0-9]{11}$/;
	
	if(!passRule.test(password)){
    	Swal.fire({icon: 'error',text: '비밀번호 형식이 올바르지 않습니다.'})
		return false;
  	}else if(password != password2){
    	Swal.fire({icon: 'error',text: '비밀번호가 일치하지 않습니다.'})
		alert('비밀번호가 일치하지 않습니다.');
		return false;
  	}else if(!phoneRule.test(phone)){
    	Swal.fire({icon: 'error',text: '휴대전화 형식이 올바르지 않습니다.'})
  		return false;
  	}else{
  		return true;
  	}
}//registCheck end		

function deleteUser(){
	Swal.fire({
		  text: "정말 회원탈퇴를 하시겠습니까?",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '예',
		  cancelButtonText: '아니오'
		}).then((result) => {
			if (result.isConfirmed) {
				location.href='userDelete';
				}
		})
}