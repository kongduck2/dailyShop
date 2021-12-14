$(document).ready(function(){
	let code = '';
	$('#emailChk').on('click',function(){
		$('.loader').css('display','block');
		$.ajax({
	        type:'POST',
	        url:'emailCheck',
			data: { "inputEmail" : $("#inputEmail").val()}, 
	        success:function(data){
	        	if(data == 'error'){//이메일 전송 실패
	        		Swal.fire({icon: 'error',text: '입력하신 이메일이 유효하지 않습니다.'}).then(function(){
	        			$('.loader').css('display','none');
		    		});
	        	}else{	        		
					Swal.fire({icon: 'info',
						text: '인증번호 발송이 완료되었습니다.입력한 이메일에서 인증번호 확인을 해주십시오.'}).then(function(){
						$('.loader').css('display','none');
		        		$('#inputEmail2').attr('disabled',false);
		        		$('#emailChk2').css('display','inline-block');
		        		$('.successEmailChk').text('인증번호를 입력한 뒤 이메일 인증을 눌러주십시오.');
		        		$('.successEmailChk').css('color','green');
		        		let code = data;
		        		
		        		$('#emailChk2').click(function(){
		        			if($('#inputEmail2').val() == code){
		        				Swal.fire({icon: 'success',
		    						text: '인증번호가 일치합니다. 이메일 인증 완료'}).then(function(){
		    							//부모창으로 이메일 인증 완료했다는 값 넘기기
		    							opener.document.getElementById('emailSucChk').value = 'true';
		    							opener.document.getElementById('emailChkBtn').disabled ='true';
		    							opener.document.getElementById('checkbtn').disabled ='true';
										window.close(); //창닫기
		    						})
		        			}else{
		        				$('.successEmailChk').text('인증번호가 일치하지 않습니다.');
		        				$('.successEmailChk').css('color','red');
		        				$('#inputEmail2').attr('autofocus',true);
		        			}
		        		});
		    		});
	        	}
	        }
	    });
	});
});	