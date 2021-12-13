<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댕냥이의 일상</title>
</head>
<body>

<%@ include file="../header.jsp"%>

	<div class="container" id="choiceContainer">
		<div class="row" id="choiceTextRow">
			<div class="col" id="choiceText">
				<span>회원가입 방식을 선택해주세요.</span>
			</div>
		</div>
		
		<div class="row">
			<div class="col" id="kakaoDiv">
				<a href="https://kauth.kakao.com/oauth/authorize?client_id=b80983683de548ac06ba30cff2c65ae1&redirect_uri=http://localhost:8082/dailyshop/kakaoLogin&response_type=code"><span>카카오 아이디로 회원가입</span></a>
			</div>
			<div class="col" id="primaryDiv">
				<a href="regist"><span>일반 회원가입</span></a>
			</div>
		</div>
	</div>

<%@ include file="../footer.jsp"%>	
</body>
</html>