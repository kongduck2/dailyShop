<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<meta charset="UTF-8">
</head>
<body>
<!-- header -->
<%@ include file="../header.jsp"%>

<div class="login-div">
<!-- 기본 로그인 form 태그 -->
 <form action="login" method="post" class="loginForm">
 	<input type="hidden" name="pIdx" value="${param.pIdx }">
      <h2>로그인</h2>
      <div class="idForm">
        <input type="text" name="email" class="id" placeholder="아이디" required>
      </div>
      <div class="passForm">
        <input type="password" name="password" class="pw" placeholder="비밀번호" required>
      </div>
      <input type="submit" class="btn" value="로그인">
      <div class="bottomText">
       <a href="regist" >회원 가입</a>  |  <a href='javascript:void(0);' onclick="findId()" >아이디 찾기</a>  |  
       <a href='javascript:void(0);' onclick="findPw()" >비밀번호 찾기</a>
      </div>
	      <!-- 카카오 로그인 -->
	  <div class="kakaoLogo">
	      <a href="https://kauth.kakao.com/oauth/authorize?client_id=b80983683de548ac06ba30cff2c65ae1&redirect_uri=http://localhost:8082/dailyshop/kakaoLogin&response_type=code">
	      <img src="${pageContext.request.contextPath}/resources/image/login_btn_ka.png" alt="카카오톡" >
	      </a>
	  </div>
    </form>
</div>

<!-- footer -->
<%@ include file="../footer.jsp"%>
<script type="text/javascript">
	function findId(){
		window.name = 'findId';
		let _width = '650';
		let _height = '380';
		let _left = Math.ceil((window.screen.width - _width) / 2);
		let _top = Math.ceil((window.screen.height - _height) / 2);
		let findId = window.open('findId', 'Id', 'width=' + _width + ', height=' + _height + ', left=' + _left + ', top=' + _top,'location=no');
	}
	
	function findPw(){
		window.name = 'findPw';
		let _width = '650';
		let _height = '380';
		let _left = Math.ceil((window.screen.width - _width) / 2);
		let _top = Math.ceil((window.screen.height - _height) / 2);
		let findPw = window.open('findPw', 'Pw', 'width=' + _width + ', height=' + _height + ', left=' + _left + ', top=' + _top,'location=no');
	}

</script>
</body>
</html>