<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댕댕이의 일상</title>
<!-- 제이쿼리 라이브러리 가져오기 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 카카오 주소 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/infoUpdate.js"></script>
</head>
<body>

<%@ include file="../header.jsp"%>



<div class="update-form">
	<form class="row g-4" action="userUpdate" onsubmit="return registCheck()" id="joinForm" method="post">
		<input type="hidden" value="${user.idx }">
	<h3>회원정보 수정</h3>
	  <div class="col-md-5">
	    <label for="email" class="form-label">* 이메일(아이디)</label>
	    <input name="email" type="email" class="form-control" id="email" readonly value="${user.email }">
	    <div id="idCheckMsg"></div>
	  </div>
	  <div class="col-md-5">
	    <label for="password" class="form-label">* 변경할 비밀번호</label>
	    <input name="password" type="password" class="form-control" id="password" required>
	    <label for="password2" class="form-label">* 변경할 비밀번호 확인</label>
	    <input name="password2" type="password" class="form-control" id="password2" required>
	    <label id="pwCheckMsg"></label>
	  </div>
	  <div class="col-12">
	    <label for="address" class="form-label">* 주소</label> <!-- 카카오 주소 api 사용 -->
	    <input name="address" type="text" class="form-control" id="address" value="${user.address }" required>
	    <label for="addressDetail" class="form-label">상세주소</label> 
	    <input name="addressDetail" type="text" class="form-control" id="addressDetail" value="${user.addressDetail }" >
	  </div>
	  <div class="col-md-6">
	    <label for="name" class="form-label">* 이름</label>
	    <input name="name" type="text" class="form-control" id="name" value="${user.name }" readonly>
	  </div>
	  <div class="col-md-3">
	    <label for="phone" class="form-label">* 휴대전화('-' 제외)</label>
	    <input name="phone" type="text" class="form-control" id="phone" maxlength="11" value="${user.phone }">
	     <label id="pnCheckMsg"></label>
	  </div>
	  <div class="col-12" >
	    <button type="submit" class="btn btn-primary" >정보 수정</button>
	    <button type="button" class="btn btn-primary" onclick="location.href='/dailyshop'">취소</button>
	  </div>
	</form>
</div>




<%@ include file="../footer.jsp"%>

</body>
</html>