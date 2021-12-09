<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댕냥이의 일상</title>
</head>
<body>

<%@ include file="../header.jsp"%>

<!-- container 시작 -->
	 <div class="container">	
		<div class="row">
			<h2 class="text-center">BEST</h2>
			<c:forEach var="item" items="${list }">
				<c:set var="fileArr" value="${fn:split(item.thumbnailImg,',')}"/>
				<div class="col-md-3" id="cardList">
					<c:forEach var="img" items="${fileArr }">
						<div class="card" style="width: 18rem;" id="card">
						  <a href="detail?idx=${item.idx}"><img src="/upload/${img }" class="card-img-top" alt="thumbnailImg"></a>
						  <div class="card-body">
						    <div class="card-text">
						    <c:if test="${fn:length(item.name) <= 20 }"> <!-- 한줄일때 경계선 높낮이 다름 -->
						    	<div class="productName" style="line-height : 47px;"><a href="detail?idx=${item.idx}">${item.name }</a></div>
						    </c:if>
						    <c:if test="${fn:length(item.name) > 20 }">
						    	<div class="productName"><a href="detail?idx=${item.idx}">${item.name }</a></div>
						    </c:if>	
						    		<div class="productPrice">${item.price}원</div>
						    </div>	
						  </div>
						</div>
					</c:forEach>	  
				</div>
			</c:forEach>	
		</div>
	</div><!-- container end -->

<%@ include file="../footer.jsp"%>

</body>
</html>