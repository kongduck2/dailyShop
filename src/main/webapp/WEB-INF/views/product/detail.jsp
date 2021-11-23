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
<script type="text/javascript" defer>
	

		//옵션선택
 function selectOnChange(o){
	 	const x = document.getElementById("selectBox").selectedIndex;
		const y = document.getElementById("selectBox").options;
		let idx = y[x].index;
		let option = document.getElementById("optionText");
		const text = o.options[o.selectedIndex].text;
		const value = o.value;
		
		if(value != ""){
			document.getElementById('optionText'+idx).innerText = text;
			document.getElementById('optionTbody'+idx).style.display='table-row-group';
		//selectBox.options[selectBox.selectedIndex].text
		}
	}; 
	
function plus(){
	
}	

function change(){
	let quantity = document.getElementsByClassName('quantity');
	let sum = document.getElementsByClassName('sumPrice'); //getElementsByClassName 반환값 배열
	let price = document.getElementById('sellPrice');
	let totalPrice = document.getElementById('totalPrice');
	let totalQuantity = 0;
		
		for (let i = 0; i < quantity.length; i++) {
		if (quantity[i].value == '' || quantity[i].value < 0) { 
			quantity[i].value = 0;
		}
			totalQuantity += parseInt(quantity[i].value); //타입이 객체기떄문에 Int타입으로 파싱
		}
		
		for (let i = 0; i < sum.length; i++) { //상품별 총합
			sum[i].innerText = (parseInt(quantity[i].value) * parseInt(price.value.replace(',',''))).toLocaleString('ko-KR')+'원';
		}
		//토탈가격
		totalPrice.innerText = (parseInt(totalQuantity) * parseInt(price.value.replace(',',''))).toLocaleString('ko-KR')+'원';
}  
	
</script>
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
	    				<td>${product.name }</td>
	    				<td>
	    				<input type="hidden" id="sellPrice" value="${product.price }">
	    				<span class="upDownImg"><img onclick="minus()" id="downButton" alt="downButton" src="${pageContext.request.contextPath}/resources/image/btn_count_down.gif"></span>
	    				<span class="quantitySpan"><input class="quantity" id="quantity" name="quantity" value="1" type="number" onchange="change()">
	    					<span class="upDownImg"> 
	    					<img onclick="plus()" id="upButton" alt="upButton" src="${pageContext.request.contextPath}/resources/image/btn_count_up.gif">
	    					</span>
	    					<img onclick="delete()" id="delButton" alt="delButton" src="${pageContext.request.contextPath}/resources/image/btn_delete.gif">
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
		    				<td id="optionText${i }"></td>
		    				<td>
		    				<input type="hidden" id="sellPrice" value="${product.price }">
		    				<span class="upDownImg"><img onclick="minus()" id="downButton" alt="downButton" src="${pageContext.request.contextPath}/resources/image/btn_count_down.gif"></span>
		    				<span class="quantitySpan"><input class="quantity" id="quantity" name="quantity" value="0" type="text" onchange="change()">
		    					<span class="upDownImg"> 
		    					<img onclick="plus()" id="upButton" alt="upButton" src="${pageContext.request.contextPath}/resources/image/btn_count_up.gif">
		    					</span>
		    					<img onclick="delete()" id="delButton" alt="delButton" src="${pageContext.request.contextPath}/resources/image/btn_delete.gif">
		    				</span></td>
		    				<td class="sumPrice">${product.price }원</td>
		    			</tr>
		    		</tbody>
		    	</c:forEach>	
	    	</c:if>
	    		
    	</table>
    	<div class="col-lg-9">
    		<div class="total" >Total : <span id="totalPrice" >${product.price}원</span></div>
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
  <c:if test="${!(product.detailImg2 eq 'dImg_') }"> <!-- 기본 설정이름 -->
	  <div class="row" id="detailBox2">
  		<div class="col-md-12">
			<img alt="디테일 이미지2" src="/upload/${product.detailImg2 }">  	
	  	</div>
	  </div>  
  </c:if>
  <c:if test="${!(product.detailImg3 eq 'dImg_')}"> <!-- 기본 설정이름 -->
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
  
  
</div><!-- container end -->

<%@ include file="../footer.jsp"%>

</body>
</html>