<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<!-- header -->
<%@ include file="../header.jsp"%>

<div class="regist-form">
	<form class="row g-4">
	<input type="hidden" name="regist_type" value=""/> <!-- 카카오 회원가입시 넘어가는값 1 기본 회원가입시 0  -->
	  <div class="col-md-5">
	    <label for="email" class="form-label">이메일</label>
	    <input name="email" type="email" class="form-control" id="email" required>
	  </div>
	  <div class="col-md-5">
	    <label for="password" class="form-label">비밀번호</label>
	    <input name="password" type="password" class="form-control" id="password" required>
	  </div>
	  <div class="col-12">
	    <label for="address" class="form-label">주소</label> <!-- 카카오 주소 api 사용 예정 -->
	    <input name="address" type="text" class="form-control" id="address" required>
	  </div>
	  <div class="col-md-6">
	    <label for="name" class="form-label">이름</label>
	    <input name="name" type="text" class="form-control" id="name" required>
	  </div>
	  <div class="col-md-3">
	    <label for="phone" class="form-label">휴대전화</label>
	    <input name="phone" type="text" class="form-control" id="phone">
	  </div>
	  <!-- 회원가입 약관  -->
	  
	  
	  <div class="col-12">
	    <button type="submit" class="btn btn-primary">회원가입</button>
	  </div>
	</form>
</div>

<!-- footer -->
<%@ include file="../footer.jsp"%>
</body>
</html>