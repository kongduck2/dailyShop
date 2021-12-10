<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css?v=3">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<meta charset="UTF-8">
<title>댕냥이의 일상</title>
</head>
<body>


	<div class="container">
		<div class="row" id="emailChckDiv">
		 <div>
			<input id="inputEmail" type="text" name="sm_email" value="" required readonly/>
			<button id="emailChk" class="doubleChk">인증번호 전송</button>
		</div>
		<div>
			<span class="successEmailChk"></span>
		</div>
		<div class="loader"> </div>
		<div>
			<input id="inputEmail2" type="text" name="sm_email2" title="인증번호 입력" disabled required/>
			<button id="emailChk2" class="doubleChk">인증번호 확인</button>
		 </div>	
		 <div>
		 	<p class="tip">이메일 인증을 하셔야 정상적으로 가입이 가능합니다. 정확하게 기입해 주십시오.</p>
		 </div>	
		</div>
	</div>
	
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/emailCheck.js"></script>	
</body>
</html>