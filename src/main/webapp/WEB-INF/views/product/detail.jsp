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

<!-- 제품 상단 디테일 영역 시작 -->
<div class="container" id="detailContainer">
  <div class="row">
  	<!-- 이미지 영역 -->
    <div class="col-md-6">
      <img alt="썸네일 이미지" src="/upload/${product.thumbnailImg }">
    </div>
    <!-- 제품 상세 정보 -->
    <div class="col-md-6">
   	<!-- 제품 설명 텍스트 -->
    	<table class="detailTextTable">
    		<tr>
    			<td class="detailName" colspan="2">${product.name }</td>
    			<td class="detailName"></td>
    		</tr>
    		<tr>
    			<td class="detailText">판매가</td>
    			<th class="detailPrice">${product.price }원</th>
    		</tr>
    		<tr>
    			<td class="detailText">국내·해외배송</td>
    			<td class="detailText">국내배송</td>
    		</tr>
    		<tr>
    			<td class="detailText">배송방법</td>
    			<td class="detailText">택배</td>
    		</tr>
    		<tr>
    			<td class="detailText">배송비</td>
    			<td class="detailText">3,000원 (50,000원 이상 구매 시 무료)</td>
    		</tr>
    	</table>
    	
    	<!-- 제품 주문 수량 -->
    	<table class="quantityTable">
    		<thead class="quantityThead">
    			<tr>
    				<td>상품명</td>
    				<td>상품수량</td>
    				<td>가격</td>
    			</tr>
    		</thead>
    		
    		<tbody class="quantityTbody">
    			<tr>
    				<td>${product.name }</td>
    				<td>
    				<span class="upDownImg"> <a href="#"><img alt="downButton" src="${pageContext.request.contextPath}/resources/image/btn_count_down.gif"></a></span>
    				<span class="quantity"><input id="quantity" name="quantity" value="1" type="text">
    					<span class="upDownImg"> 
    					<a href="#"><img alt="upButton" src="${pageContext.request.contextPath}/resources/image/btn_count_up.gif"></a>
    					</span>
    				</span></td>
    				<td>${product.price }원</td>
    			</tr>
    		</tbody>	
    	</table>
    	<div class="col-lg-9">
    		<div class="total">Total : <span>${product.price}원</span></div>
    	</div>	
    	<!-- 제품 상세부분 조작 버튼 -->
    	<div class="row" id="detailbutton">
    		<div class="col-md-3">
    		 	<button class="buyButton">바로구매</button>
    		</div>
    		<div class="col-md-3">
    			<button class="cartButton">장바구니</button>
    		</div>
    		<div class="col-md-3">
    			<button class="favoriteButton">관심상품</button>
    		</div>
    	</div>	
    </div>
  </div>
  
  <div class="row" id="guideVarDiv">
  	<div class="col-md-12">
  		<table class="guideVar">
  			<tr>
  				<td>상품정보</td>
  				<td>구매안내</td>
  				<td>상품후기</td>
  			</tr>
  		</table>
  	</div>
  </div>
  
  <!-- 디테일 이미지 -->
  <div class="row" id="detailBox">
  	<div class="col-md-12">
		<img alt="디테일 이미지" src="/upload/${product.detailImg1 }">  	
  	</div>
  </div>
  <c:if test="${!(product.detailImg2 eq 'dImg_2,') }"> <!-- 기본 설정이름 -->
	  <div class="row" id="detailBox2">
  		<div class="col-md-12">
			<img alt="디테일 이미지" src="/upload/${product.detailImg2 }">  	
	  	</div>
	  </div>  
  </c:if>
  <c:if test="${!(product.detailImg3 eq 'dImg_3,') }"> <!-- 기본 설정이름 -->
	  <div class="row" id="detailBox3">
  		<div class="col-md-12">
			<img alt="디테일 이미지" src="/upload/${product.detailImg3 }">  	
	  	</div>
	  </div>  
  </c:if>
  
  <!-- 가이드 이미지 -->
  <div class="row" id="guideBox">
  	<div class="col-md-12">
		<img alt="가이드 이미지" src="${pageContext.request.contextPath}/resources/image/guide.jpg">  	
  	</div>
  </div>
  
</div><!-- container end -->

<%@ include file="../footer.jsp"%>

</body>
</html>