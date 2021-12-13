<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css?v=3">
<head>
<meta charset="UTF-8">
<title>댕냥이의 일상</title>
</head>
<body>

<div class="container" id="errorContainer">
	<div class="row">
		<div class="col" id="errorImg">
			<a href="home"><img alt="에러 이미지" src="${pageContext.request.contextPath}/resources/image/sorry_cat.png"></a>
		</div>
		<div class="col">
			<c:if test="${requestScope['javax.servlet.error.status_code'] == 400}">
				<p class="eText">서비스에 불편을 드려 죄송합니다.</p>
				<p>잘못 된 요청입니다.</p>    
			</c:if>	
			
			<c:if test="${requestScope['javax.servlet.error.status_code'] == 404}">
				<p class="eText">서비스에 불편을 드려 죄송합니다.</p>
				<p>요청하신 페이지를 찾을 수 없습니다.</p>    
			</c:if>
			
			<c:if test="${requestScope['javax.servlet.error.status_code'] == 405}">
				<p class="eText">서비스에 불편을 드려 죄송합니다.</p>
				<p>요청된 메소드가 허용되지 않습니다.</p>    
			</c:if>
			
			<c:if test="${requestScope['javax.servlet.error.status_code'] == 500}">
				<p class="eText">서비스에 불편을 드려 죄송합니다.</p>
				<p>서버에 오류가 발생하여 요청을 수행할 수 없습니다.</p>
			</c:if>
			
			<c:if test="${requestScope['javax.servlet.error.status_code'] == 503}">
				<p class="eText">서비스에 불편을 드려 죄송합니다.</p>
				<p>서비스를 사용할 수 없습니다.</p>
			</c:if>
			<button type="button" onclick="location.href='home'">홈으로 이동</button>
		</div>	
	</div>	
</div>	
</body>
</html>