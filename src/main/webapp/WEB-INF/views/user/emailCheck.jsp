<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댕냥이의 일상</title>
</head>
<body>


	<div class="container">
		<div class="row">
			<input id="sm_email" type="text" name="sm_email" title="이메일 주소를 입력해주세요." required/>
			<span id="emailChk" class="doubleChk">인증번호 보내기</span><br/>
			<input id="sm_email2" type="text" name="sm_email2" title="인증번호 입력" disabled required/>
			<span id="emailChk2" class="doubleChk">이메일인증</span>
			<span class="point successEmailChk">이메일 입력후 인증번호 보내기를 해주십시오.</span>
			<input type="hidden" id="emailDoubleChk"/>
		</div>	
	</div>
		<p class="tip">
			아이디 비밀번호 분실시 필요한 정보이므로, 정확하게 기입해 주십시오.
		</p>
</body>
</html>