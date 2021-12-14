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
<body id="emailCheckBody">
	<div class="container" id="pwCon1" style="display: block;">
		<div class="row" id="emailChckDiv">
		<h3>비밀번호 찾기</h3>
		 <div>
			<input id="inputEmail" type="text" name="sm_email" value="" required placeholder="이메일을 입력해주세요." />
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
		</div>
	</div>
	
	<div class="container" id="pwCon2" style="display: none;" onsubmit="return updateCheck()">
		<div class="row">
		<h3>비밀번호 변경</h3>
			<form method="post" action="updatePw" id="updatePwForm">
				<input type="hidden" name="email" value="" id="updateEmail">
					 <div style="padding: 18px;">
						<input type="password" id="pw1" name="password" placeholder="비밀번호를 입력해주세요." required>
					 </div>
					 <div style="padding: 18px;">
						<input type="password" id="pw2" placeholder="비밀번호를 재입력해주세요." required>
					</div>
						<span id="pwCheckMsg"></span>
					 <div class="updatePwDiv" style="padding: 18px;">
						<input type="submit" value="비밀번호변경">
					 </div>
				</form> 
		</div>
	</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/findPw.js" defer></script>	
</body>
</html>