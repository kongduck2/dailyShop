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
	<!-- 카테고리별 상품 나열 -->
		<div class="row">
			<h2 class="text-center">${categoryName}</h2>
			<c:forEach var="item" items="${list }">
				<c:set var="fileArr" value="${fn:split(item.thumbnailImg,',')}"/>
				<div class="col-md-3" id="cardList">
					<c:forEach var="img" items="${fileArr }">
						<div class="card" style="width: 18rem;" id="card">
						  <a href="detail?idx=${item.idx}"><img src="/upload/${img }" class="card-img-top" alt="썸네일"></a>
						  <div class="card-body">
						    <div class="card-text">
						    <c:if test="${fn:length(item.name) <= 23 }"> <!-- 한줄일때 경계선 높낮이 다름 -->
						    	<div class="productName" style="line-height : 40px;"><a href="detail?idx=${item.idx}">${item.name }</a></div>
						    </c:if>
						    <c:if test="${fn:length(item.name) > 23 }">
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

 <!-- 페이지 이동 :전체보기 -->
 <c:if test="${findText == null}">
 <div style="text-align: center;">
	<a class="pagenum" href="?page=1&category=${category}">&lt;&lt;</a> 
	<a class="${page.startPage>1? 'pagenum':'none'}" href="?page=${page.startPage-1 }&category=${category}">&lt;</a>  
	<!-- 현재페이지값을 변경 : blists.getStartPage() -1 -->
	
	<c:forEach var="i" begin="${page.startPage }" end="${page.endPage}">  <!-- 페이지목록의 범위  -->
		<a class="pagenum" href="?page=${i}&category=${category}">${i}</a>     <!-- 현재페이지 i값으로 변경  -->
	</c:forEach>
	
	<!-- 현재페이지값을 변경 : blists.getEndPage() +1 -->
	<a class="${page.endPage!=page.totalPage? 'pagenum':'none'}" href="?page=${page.endPage+1 }&category=${category}">&gt;</a> 
	<a class="pagenum" href="?page=${page.totalPage }&category=${category}">&gt;&gt;</a>
</div>
</c:if>

<!-- 페이지 이동 :검색결과 보기 -->
 <c:if test="${findText!=null}">
 <div style="text-align: center;">
	<a class="pagenum" href="?page=1&category=${category}&findText=${findText}">&lt;&lt;</a>   <!-- 요청url은 동일하고 파라미터만 변경됩니다. -->
	<a class="${page.startPage > 1 ? 'pagenum':'none'}" href="?page=${page.startPage == 1? page.startPage :page.startPage-1 }&category=${category}&findText=${findText}">&lt;</a>  
	<!-- 현재페이지값을 변경 : blists.getStartPage() -1 -->
	
	<c:forEach var="i" begin="${page.startPage }" end="${page.endPage}">  <!-- 페이지목록의 범위  -->
		<a class="pagenum" href="?page=${i}&category=${category}&findText=${findText}">${i}</a>     <!-- 현재페이지 i값으로 변경  -->
	</c:forEach>
	
	<!-- 현재페이지값을 변경 : blists.getEndPage() +1 -->
	<a class="${page.endPage != page.totalPage? 'pagenum':'none'}" href="?page=${page.endPage+1 }&category=${category}&findText=${findText}">&gt;</a> 
	<a class="pagenum" href="?page=${page.totalPage }&category=${category}&findText=${findText}">&gt;&gt;</a>
</div>
</c:if>


<%@ include file="../footer.jsp"%>

</body>
</html>