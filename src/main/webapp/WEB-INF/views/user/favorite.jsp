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
	 
	 <div class="container">
	 	<div class="row">	
	 		<h2 class="text-center">관심상품</h2>
	 		<div class="col">
	 		<table class="table table-borderless">
			  <thead>
			    <tr class="cartTitleTr">
				    <td scope="col"><input type="checkbox" id="checkAll" onclick="cAll()"></td>
				    <td scope="col">이미지</td>
				    <td scope="col">상품정보</td>
				    <td scope="col">판매가</td>
				    <td scope="col">배송구분</td>
				    <td scope="col">배송비</td>
				    <td scope="col">선택</td>
			    </tr>
			  </thead>
			  <tbody class="favoriteTb">
			  <c:if test="${fCount == 0 }">
			  	<tr class="emptyFavorite">
			  		<td colspan="9"> <i class="fas fa-search fa-2x"></i>  관심상품 목록이 비어 있습니다.</td>
			  	</tr>
			  </c:if>
		  		    <c:forEach var="item" items="${list}" varStatus="status">
			    		<tr class="favoriteListTr" id="">
				  		    <td><input type="checkbox" name="check" class="check"></td>
			  				<td><a href="detail?idx=${item.idx }"><img class="thumbnail" alt="썸네일 이미지" src="/upload/${item.thumbnailImg}">
			  				</a></td>
					        <td class="pInfo"><a href="detail?idx=${item.idx }"><span>${item.name }</span></a></td>
					        <td id="">${item.price }원</td>
					        <td>기본배송</td>
					        <td>3,000원</td>
					        <td class="selectBtnTd"> <div><button type="button" class="selectBtn" onclick="remove(this)">삭제</button>
					        	<input type="hidden" value="${item.idx}"></div></td>
			 		   </tr>
		  		    </c:forEach>
			  </tbody>
			</table>
			<c:if test="${fCount > 0 }">
			<div style="text-align: left;"><button style="width: 150px; height: 27px; font-size: 14px" 
				type="button" class="selectBtn" onclick="removeAll()">관심목록 비우기</button></div>
	 		</c:if>
	 		</div>
	 	</div>
	 </div>
	 
<%@ include file="../footer.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/favorite.js" defer></script>
</body>
</html>