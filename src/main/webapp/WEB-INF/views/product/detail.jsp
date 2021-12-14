<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>        
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>댕냥이의 일상</title>

</head>
<body>

<%@ include file="../header.jsp"%>

<!-- 제품 상단 디테일 영역 시작 -->
<div class="container" id="detailContainer">
 <input type="hidden" name="page" value="${page}">
  <div class="row">
  	<!-- 이미지 영역 -->
    <div class="col-md-6"  id="thumbnail">
      <img alt="썸네일 이미지" src="/upload/${product.thumbnailImg }">
    </div>
    <!-- 제품 상세 정보 -->
    <div class="col-md-5">
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
   		<c:if test="${product.option1 != ''}"> <!-- 옵션이 2개이상일 경우 -->
    		<tr>
    			<td class="detailText">옵션</td>
    			<td class="detailText"><select name="selectBox" id="selectBox" onchange="selectOnChange(this)">
    				<option value="">--[필수] 옵션을 선택해주세요.--</option>
    				<option value="option1">${product.option1 }</option>
    				<option value="option2">${product.option2 }</option>
    			<c:if test="${product.option3 != ''}">	
    				<option value="option3">${product.option3 }</option>
    			</c:if>	
    			<c:if test="${product.option4 != ''}">	
    				<option value="option4">${product.option4 }</option>
    			</c:if>	
    				</select>
    			</td>
    		</tr>
    	</c:if>	
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
    		
    	<!-- 옵션값 없을때 기본 상품명 추가 -->
	    	<c:if test="${product.option1 eq ''}">	
	    		<tbody class="quantityTbody" >
	    			<tr>
	    				<td class="optionName" id="optionText">${product.name }</td>
	    				<td>
	    				<input type="hidden" id="sellPrice" value="${product.price }">
	    				<span class="quantitySpan"><input class="quantity" id="quantity" name="quantity" value="1" type="number" onchange="change()">
	    				</span></td>
	    				<td class="sumPrice">${product.price }원</td>
	    			</tr>
	    		</tbody>	
	    	</c:if>
	    	
	    <!-- 옵션값 있는경우 -->
	    	<c:if test="${product.option1 != ''}">	
	   			<c:forEach var="i" begin="1" step="1" end="4">
		    		<tbody class="quantityTbody" id="optionTbody${i }" >
			    		<tr>
		    				<td class="optionName" id="optionText${i }"></td>
		    				<td>
		    				<input type="hidden" id="sellPrice" value="${product.price }">
		    				<span class="quantitySpan"><input class="quantity" id="quantity" name="quantity" value="0" type="number" onchange="change()">
		    				<input type="hidden" value="${i}"><!-- 옵션번호 -->
		    					<img onclick="del(this)" id="delButton" alt="delButton" src="${pageContext.request.contextPath}/resources/image/btn_delete.gif">
		    				</span></td>
		    				<td class="sumPrice">${product.price }원</td>
		    			</tr>
		    		</tbody>
		    	</c:forEach>	
	    	</c:if>
	    		
    	</table>
    	<div class="col-lg-11">
    	<!-- 옵션값 없는경우 -->
    	<c:if test="${product.option1 eq ''}">	
    		<div class="total" >Total : <span id="totalPrice" >${product.price}원</span></div>
    	</c:if>	
    	<!-- 옵션값 있는경우 -->
    	<c:if test="${product.option1 != ''}">	
    		<div class="total" >Total : <span id="totalPrice" >0원</span></div>
    	</c:if>	
    	</div>	
    	<!-- 제품 상세부분 조작 버튼 -->
    	<div class="row" id="detailBtn">
    		
    		<!-- 장바구니 버튼 -->
   			
   			<input type="hidden" name="pIdx" id="pIdx" value="${product.idx }"><!-- 로그인 페이지 이동시필요 -->
    		<c:if test="${user != null}"> <!-- 로그인 상태 -->
    		<div class="col-md-3">
	    			<input type="hidden" name="uIdx" id="uIdx" value="${user.idx }">
	    		 	<button class="buyButton" id="buyBtn" type="button">바로구매</button> <!-- 넘겨줄정보 제품 idx ,유저 선택수량 -->
    		</div>
    		<div class="col-md-3">
    			<button class="cartButton" id="addCartBtn" type="button">장바구니</button> 
    		</div>
    		<div class="col-md-3">
    			<button class="favoriteButton" id="addFavoriteBtn" type="button">관심상품</button>
    		</div>
    		</c:if>
    		
    		<c:if test="${user == null}"> <!-- 로그인 안된상태 -->
    		<div class="col-md-3">
    		 	<button class="buyButton" type="button" onclick="loginAlert()">바로구매</button>
    		</div>
    		<div class="col-md-3">
    			<button class="cartButton" type="button" onclick="loginAlert()">장바구니</button> 
    		</div>
    		<div class="col-md-3">
    			<button class="favoriteButton" type="button"  onclick="loginAlert()"> 관심상품</button>
    		</div>
    		</c:if>
    		
    	</div>	
    </div>
  </div>
		  <!-- 장바구니 Modal -->
		<div class="modal fade" id="cartModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">장바구니</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		          <div class="modal-body">
			        <p class="text-start" id="cartText">상품을 장바구니에 담았습니다.</p>
			      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="location.reload();">쇼핑계속하기</button>
		        <button type="button" class="btn btn-primary" id="moveCartBtn" onclick="location.href='cart'">장바구니로 이동</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		  <!-- 관심상품 Modal -->
		<div class="modal fade" id="favoriteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">관심상품</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		          <div class="modal-body">
			        <p class="text-start" id="cartText">관심상품목록에 담았습니다.</p>
			      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="location.reload();">쇼핑계속하기</button>
		        <button type="button" class="btn btn-primary" onclick="location.href='favorite'">관심상품목록 이동</button>
		      </div>
		    </div>
		  </div>
		</div>
  
  <!-- 상단 가이드바 (상품정보) -->
  <div class="row" id="topGuideVar">
  	<div class="col-md-12">
		<ul class="guideVar">
			<li class="guideText"><a href="#topGuideVar">상품정보</a></li>
			<li class="guideText"><a href="#middleGuideVar">구매안내</a></li>
			<li class="guideText"><a href="#bottomGuideVar">상품후기</a></li>
		</ul>  		
  	</div>
  </div>
  
  <!-- 디테일 이미지 -->
  <div class="row" id="detailBox">
  	<div class="col-md-12">
		<img alt="디테일 이미지1" src="/upload/${product.detailImg1 }">  	
  	</div>
  </div>
  <c:if test="${!(product.detailImg2 eq 'empty') }"> <!-- 사진없는경우 파일명 "empty" -->
	  <div class="row" id="detailBox2">
  		<div class="col-md-12">
			<img alt="디테일 이미지2" src="/upload/${product.detailImg2 }">  	
	  	</div>
	  </div>  
  </c:if>
  <c:if test="${!(product.detailImg3 eq 'empty')}">
	  <div class="row" id="detailBox3">
  		<div class="col-md-12">
			<img alt="디테일 이미지3" src="/upload/${product.detailImg3 }">  	
	  	</div>
	  </div>  
  </c:if>
  
  <!-- 중간 가이드바 (구매안내)-->
  <div class="row" id="middleGuideVar">
  	<div class="col-md-12">
		<ul class="guideVar">
			<li class="guideText"><a href="#topGuideVar">상품정보</a></li>
			<li class="guideText"><a href="#middleGuideVar">구매안내</a></li>
			<li class="guideText"><a href="#bottomGuideVar">상품후기</a></li>
		</ul>  		
  	</div>
  </div>
  
  <!-- 가이드 이미지 -->
  <div class="row" id="guideBox">
  	<div class="col-md-12">
		<img alt="가이드 이미지" src="${pageContext.request.contextPath}/resources/image/guide.jpg">  	
  	</div>
  </div>
  
    <!-- 하단 가이드바 (후기) -->
  <div class="row" id="bottomGuideVar">
  	<div class="col-md-12">
		<ul class="guideVar">
			<li class="guideText"><a href="#topGuideVar">상품정보</a></li>
			<li class="guideText"><a href="#middleGuideVar">구매안내</a></li>
			<li class="guideText"><a href="#bottomGuideVar">상품후기</a></li>
		</ul>  		
  	</div>
  </div>
  <div class="row">
  	<c:if test="${!empty list}">
		<div class="col"  style="margin-top: 100px; height: 1100px; overflow : auto;">
			<c:forEach var="item" items="${list }">
				<ul class="reviewList">
					<li>
						<div class="reviewTuhmnail">
							<a href="#"><img alt="썸네일" src="/upload/${item.thumbnailImg }"></a>		
						</div>
						
						<div class="reviewText">
							<div>
								<span class="productName">${item.productName }</span>
							</div>
							<div>
								<div class="foldedText">
									<div class="shortText"><span>${item.content }</span>
									</div>
									<a href="javascript:void(0);" class="more">-더보기</a>
								</div>
								<div class="openText">
									<div class="longText"><span>${item.content }</span>
									<div><a href="#"><img alt="유저이미지" src="/upload/${item.contentImg }"></a>
									</div>
									<a href="javascript:void(0);" class="fold">-접기</a>
								</div>
								 </div>
							</div>
						</div>
						
						<div class="reviewWriter"> <!-- 별점 표시 -->
							<div>
							<c:if test="${item.starRating ==1}">
								<span><label></label></span>
							</c:if>	
							<c:if test="${item.starRating ==2}">
								<span><label></label><label></label></span>
							</c:if>	
							<c:if test="${item.starRating ==3}">
								<span><label></label><label></label><label></label></span>
							</c:if>	
							<c:if test="${item.starRating ==4}">
								<span><label></label><label></label><label></label><label></label></span>
							</c:if>	
							<c:if test="${item.starRating ==5}">
								<span><label></label><label></label><label></label><label></label><label></label></span>
							</c:if>	
							</div>
							<div>
								<span>${item.writer }</span>
							</div>
							<c:if test="${item.contentImg != null}">
							<div class="reviewContentImg">
								<a href="#"><img alt="유저이미지" src="/upload/${item.contentImg }"></a>		
							</div>
							</c:if>
						</div>
					</li>
				</ul>
			</c:forEach>	
		</div>
	</c:if>
	<c:if test="${empty list }">
		<div class="col" style="margin-top: 100px">
			<span><i class="fas fa-search fa-2x"></i>  아직 작성된 후기가 없습니다.</span>
		</div>
	</c:if>	
	</div>
  
</div><!-- container end -->

<%@ include file="../footer.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/detail.js" defer></script>
</body>
</html>