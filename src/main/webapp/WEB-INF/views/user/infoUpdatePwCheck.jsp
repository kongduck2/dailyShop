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
<div class="Frame">
	<form action="pwCheck" class="pwForm" method="post">
		<h3>비밀번호 확인</h3>
		<p>회원정보를 안전하게 보호하기 위해 비밀번호를 한번 더 확인해 주세요.</p>
	      <input type="password" name="password" class="form-control" id="inputPassword" placeholder="비밀번호" required>
	      <button type="submit" class="btn btn-primary">확인</button>
	</form>	
</div>
<%@ include file="../footer.jsp"%>

</body>
</html>