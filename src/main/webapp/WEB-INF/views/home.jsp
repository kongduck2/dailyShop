<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
	<title>댕냥이의 일상</title>
</head>
<body>
<!-- header -->
<%@ include file="header.jsp"%>

<section>

	<!-- 배너 -->
	<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
	  <div class="carousel-inner">
	    <div class="carousel-item active" data-bs-interval="5000">
	      <img src="${pageContext.request.contextPath}/resources/image/feedTub.jpeg" class="d-block w-100" alt="사료통">
	    </div>
	    <div class="carousel-item" data-bs-interval="5000">
	      <img src="${pageContext.request.contextPath}/resources/image/round.jpeg" class="d-block w-100" alt="스크래쳐">
	    </div>
	    <div class="carousel-item" data-bs-interval="5000">
	      <img src="${pageContext.request.contextPath}/resources/image/catToy.jpeg" class="d-block w-100" alt="고양이장난감">
	    </div>
	  </div>
	  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
	</div>
	
	<!-- container 시작 -->
	 <div class="container">	
	 
	 		<!-- 중간 배너 -->
	<div class="row" id="midBanner">
		<div class="col-md-4">
			<a href="#"><img src="${pageContext.request.contextPath}/resources/image/mid-b1.jpeg" class="img-fluid" alt="중간배너"></a>
		</div>
		<div class="col-md-4">
			<a href="#"><img src="${pageContext.request.contextPath}/resources/image/mid-b2.jpeg" class="img-fluid" alt="중간배너"></a>
		</div>
		<div class="col-md-4">
			<a href="#"><img src="${pageContext.request.contextPath}/resources/image/mid-b3.jpeg" class="img-fluid" alt="중간배너"></a>
		</div>
	</div>		
	
		<!-- best 상품 나열 -->
			<div class="row">
				<h2 class="text-center">BEST</h2>
				<c:forEach var="item" items="${list }">
					<c:set var="fileArr" value="${fn:split(item.thumbnailImg,',')}"/>
					<div class="col">
						<c:forEach var="img" items="${fileArr }">
							<div class="card" style="width: 18rem;" id="card">
							  <a href="#"><img src="/upload/${img }" class="card-img-top" alt="thumbnailImg"></a>
							  <div class="card-body">
							    <div class="card-text">
							    <c:if test="${fn:length(item.name) <= 20 }"> <!-- 한줄일때 경계선 높낮이 다름 -->
							    	<div class="productName" style="line-height : 47px;">${item.name }</div>
							    </c:if>
							    <c:if test="${fn:length(item.name) > 20 }">
							    	<div class="productName">${item.name }</div>
							    </c:if>	
							    		<div class="productPrice">${item.price}원</div>
							    </div>	
							  </div>
							</div>
						</c:forEach>	  
					</div>
				</c:forEach>	
			</div>
	</div>
</section>

<!-- footer -->
<%@ include file="footer.jsp"%>


</body>
</html>

