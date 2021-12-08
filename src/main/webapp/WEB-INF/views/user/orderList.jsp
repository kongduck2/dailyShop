<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	 		<h2 class="text-center">주문 목록</h2>
	 		<div class="col">
	 		<table class="table table-borderless">
			  <thead>
			    <tr class="cartTitleTr">
				    <td scope="col">주문일자</td>
				    <td scope="col">이미지</td>
				    <td scope="col">상품정보</td>
				    <td scope="col">수량</td>
				    <td scope="col">상품구매금액</td>
				    <td scope="col">주문처리상태</td>
			    </tr>
			  </thead>
			  <tbody>
			  <c:if test="${list == null}"> <!-- 주문목록 비었을때 -->
			  	<tr class="emptyCart">
			  		<td colspan="9"> <i class="fas fa-shopping-basket fa-2x"></i> 주문목록이 비어 있습니다.</td>
			  	</tr>
			  </c:if>
			  
		  		    <c:forEach var="item" items="${list}" varStatus="status">
					  <c:if test="${list != null}">
			    		<tr class="cartListTr" id="cartListTr">
			    			<fmt:parseDate value="${item.registDate }" pattern="yyyy-MM-dd'T'HH:mm" var="registDate" type="both"/>
			    			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${registDate}"/></td> <!-- LocalDateTime 형변환 -->
			  				<td><a href="detail?idx=${list[status.index].productIdx }"><img class="thumbnail" alt="썸네일 이미지" src="/upload/${item.thumbnailImg}">
			  				</a></td>
					        <td class="pInfo"><a href="detail?idx=${list[status.index].productIdx }"><span>${item.productName}</span></a>
					        	<div class="cartOpText">${item.productOpName }</div></td>
					        <td class="quantityTd"><div>${item.quantity }</div></td>
					        <td id="sellPriceText">${item.totalPrice}원</td>
					        <td>제품준비중</td>
			 		   </tr>
				  	  </c:if>
		  		    </c:forEach>
			  </tbody>
			</table>
	 		</div>
	 	</div>
	 </div>
	 
<%@ include file="../footer.jsp"%>
	
</body>
</html>