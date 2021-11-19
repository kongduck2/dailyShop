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

<!-- container 시작 -->
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
	
	 <div class="container">	
		<!-- best 상품 나열 -->
		
			<div class="row">
				<c:forEach var="item" items="${list }">
					<c:set var="fileArr" value="${fn:split(item.thumbnailImg,',')}"/>
					<div class="col">
						<c:forEach var="img" items="${fileArr }">
							<div class="card" style="width: 18rem;">
							  <img src="/upload/${img }" class="card-img-top" alt="thumbnailImg">
							  <div class="card-body">
							    <p class="card-text">${item.price }</p>
							  </div>
							</div>
						</c:forEach>	  
					</div>
				</c:forEach>	
			</div>
		

		
		
	</div>
		
		<!-- 펫 new 시간남으면  -->
		<div>
		</div>
	
</section>

<!-- footer -->
<%@ include file="footer.jsp"%>


</body>
</html>

