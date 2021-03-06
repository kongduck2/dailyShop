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
	 		<h2 class="text-center">장바구니</h2>
	 		<div class="text-end" style="color: #aeaeae" >※장바구니에 담긴 상품은 5일이 지나면 자동으로 삭제됩니다.</div>
	 		<div class="text-end" style="color: #aeaeae; font-size: 12px;">※상품 수량변경후 변경버튼을 눌러주셔야 적용됩니다.</div>
	 		<div class="col" id="cartTable">
	 		<div class="qlText">
	 			<h4>상품목록(${count })</h4>
	 		</div>
	 		<table class="table table-borderless">
			  <thead>
			    <tr class="cartTitleTr">
				    <td scope="col"><input type="checkbox" id="checkAll" onclick="cAll()"></td>
				    <td scope="col">이미지</td>
				    <td scope="col">상품정보</td>
				    <td scope="col">판매가</td>
				    <td scope="col">수량</td>
				    <td scope="col">배송구분</td>
				    <td scope="col">배송비</td>
				    <td scope="col">합계</td>
				    <td scope="col">선택</td>
			    </tr>
			  </thead>
			  <tbody>
			  <c:if test="${count == 0}"> <!-- 장바구니 비었을때 -->
			  	<tr class="emptyCart">
			  		<td colspan="9"> <i class="fas fa-shopping-basket fa-2x"></i> 장바구니가 비어 있습니다.</td>
			  	</tr>
			  </c:if>
			  
		  		    <c:forEach var="item" items="${list}" varStatus="status">
					  <c:if test="${item.option1 == null}"> <!-- 옵션값 없는 단독상품 -->
			    		<tr class="cartListTr" id="cartListTr">
				  		    <td><input type="checkbox" name="check" class="check">
				  		    	<input type="hidden" value="${item.idx }">
				  		    </td>
			  				<td><a href="detail?idx=${cartInfo[status.index].idx }"><img class="thumbnail" alt="썸네일 이미지" src="/upload/${cartInfo[status.index].thumbnailImg}">
			  				</a></td>
					        <td class="pInfo"><a href="detail?idx=${cartInfo[status.index].idx }"><span>${cartInfo[status.index].name}</span></a>
					        	<div class="cartOpText"></div></td>
					        <td id="sellPriceText">${cartInfo[status.index].price}원	</td>
					        <td class="quantityTd">
					        <input class="quantity" name="quantity" value="${item.option1Quantity }" type="number" onchange="calc(this)">
					        <input class="sellPrice" type="hidden" value="${cartInfo[status.index].price }" >
					        <input class="sumVal" type="hidden" value="${(fn:replace(cartInfo[status.index].price,',','')) *(item.option1Quantity)}" name="sumVal">
					        <button class="qChangeBtn" type="button" onclick="qChange(this)">변경</button>
					        <input type="hidden" value="1"/> <!-- 수량변경 위한 값 -->
					        <input type="hidden" value="${item.idx}">
					        </td>
					        <td>기본배송</td>
					        <td class="delChargeText">3,000원</td>
					        <td class="sumPrice"></td>
					        <td class="selectBtnTd">
					        <div><button type="button" class="selectBtn" onclick="remove(this)">삭제</button>
					        	<input type="hidden" value="0"/>
					        	<input type="hidden" value="${cartInfo[status.index].idx}">
					        </div></td>
			 		   </tr>
				  	  </c:if>
				  	  
				  	  <c:if test="${!(item.option1 eq '') && item.option1 != null }"> <!-- 옵션값 있는 상품 -->
			    		<tr class="cartListTr">
				  		    <td><input type="checkbox" name="check1" class="check">
				  		    	<input type="hidden" value="${item.idx }">
				  		    </td>
			  				<td><a href="detail?idx=${cartInfo[status.index].idx }"><img class="thumbnail" alt="썸네일 이미지" src="/upload/${cartInfo[status.index].thumbnailImg}"></a></td>
					        <td class="pInfo"><a href="detail?idx=${cartInfo[status.index].idx }"><span>${cartInfo[status.index].name}</span></a>
					        	<div class="cartOpText">[옵션 : ${item.option1 }]</div></td>
					        <td id="sellPriceText">${cartInfo[status.index].price}원	</td>
					        <td class="quantityTd">
					        <input class="quantity1" name="quantity1" value="${item.option1Quantity }" type="number" onchange="calc1(this)">
					        <input class="sellPrice1" type="hidden" value="${cartInfo[status.index].price }" >
					        <input class="sumVal" type="hidden" value="${(fn:replace(cartInfo[status.index].price,',','')) *(item.option1Quantity)}" name="sumVal">
					        <button class="qChangeBtn" type="button" onclick="qChange(this)">변경</button>
					        <input type="hidden" value="1"/> <!-- 수량변경 위한 값 -->
					        <input type="hidden" value="${item.idx}"></td>
					        <td>기본배송</td>
					        <td class="delChargeText">3,000원</td>
					        <td class="sumPrice1"></td>
					        <td class="selectBtnTd">
					        <div><button type="button" class="selectBtn" onclick="remove(this)">삭제</button>
					        	<input type="hidden" value="1"/>
					        	<input type="hidden" value="${item.idx}">
					        </div></td>
			 		   </tr>
				  	  </c:if>
				  	  
				  	  <c:if test="${!(item.option2 eq '') && item.option2 != null }"> <!-- 옵션값 있는 상품 -->
			    		<tr class="cartListTr">
				  		    <td><input type="checkbox" name="check2" class="check">
				  		    	<input type="hidden" value="${item.idx }">
				  		    </td>
			  				<td><a href="detail?idx=${cartInfo[status.index].idx }"><img class="thumbnail" alt="썸네일 이미지" src="/upload/${cartInfo[status.index].thumbnailImg}">
			  				</a></td>
					        <td class="pInfo"><a href="detail?idx=${cartInfo[status.index].idx }"><span>${cartInfo[status.index].name}</span></a>
					        	<div class="cartOpText">[옵션 : ${item.option2 }]</div></td>
					        <td id="sellPriceText">${cartInfo[status.index].price}원	</td>
					        <td class="quantityTd">
					        <input class="quantity2" name="quantity2" value="${item.option2Quantity }" type="number" onchange="calc2(this)">
					        <input class="sellPrice2" type="hidden" value="${cartInfo[status.index].price }" >
					        <input class="sumVal" type="hidden" value="${(fn:replace(cartInfo[status.index].price,',','')) *(item.option2Quantity)}" name="sumVal">
					        <button class="qChangeBtn" type="button" onclick="qChange(this)">변경</button>
					        <input type="hidden" value="1"/> <!-- 수량변경 위한 값 -->
					        <input type="hidden" value="${item.idx}"></td>
					        <td>기본배송</td>
					        <td class="delChargeText">3,000원</td>
					        <td class="sumPrice2"></td>
					        <td class="selectBtnTd">
					        <div><button type="button" class="selectBtn" onclick="remove(this)">삭제</button>
					        	<input type="hidden" value="2"/>
					        	<input type="hidden" value="${item.idx}">
					        </div></td>
			 		   </tr>
				  	  </c:if>
				  	  
				  	  <c:if test="${!(item.option3 eq '') && item.option3 != null }"> <!-- 옵션값 있는 상품 -->
			    		<tr class="cartListTr">
				  		    <td><input type="checkbox" name="check3" class="check">
				  		    	<input type="hidden" value="${item.idx }">
				  		    </td>
			  				<td><a href="detail?idx=${cartInfo[status.index].idx }"><img class="thumbnail" alt="썸네일 이미지" src="/upload/${cartInfo[status.index].thumbnailImg}">
			  				</a></td>
					        <td class="pInfo"><a href="detail?idx=${cartInfo[status.index].idx }"><span>${cartInfo[status.index].name}</span></a>
					        	<div class="cartOpText">[옵션 : ${item.option3 }]</div></td>
					        <td id="sellPriceText">${cartInfo[status.index].price}원	</td>
					        <td class="quantityTd">
					        <input class="quantity3" name="quantity3" value="${item.option3Quantity }" type="number" onchange="calc3(this)">
					        <input class="sellPrice3" type="hidden" value="${cartInfo[status.index].price }" >
					        <input class="sumVal" type="hidden" value="${(fn:replace(cartInfo[status.index].price,',','')) *(item.option3Quantity)}" name="sumVal">
					        <button class="qChangeBtn" type="button" onclick="qChange(this)">변경</button>
					        <input type="hidden" value="1"/> <!-- 수량변경 위한 값 -->
					        <input type="hidden" value="${item.idx}"></td>
					        <td>기본배송</td>
					        <td class="delChargeText">3,000원</td>
					        <td class="sumPrice3"></td>
					        <td class="selectBtnTd">
					        <div><button type="button" class="selectBtn" onclick="remove(this)">삭제</button>
					        	<input type="hidden" value="3"/>
					        	<input type="hidden" value="${item.idx}">
					        </div></td>
			 		   </tr>
				  	  </c:if>
				  	  
				  	  <c:if test="${!(item.option4 eq '') && item.option4 != null }"> <!-- 옵션값 있는 상품 -->
			    		<tr class="cartListTr">
				  		    <td><input type="checkbox" name="check4" class="check">
				  		    	<input type="hidden" value="${item.idx }">
				  		    </td>
			  				<td><a href="detail?idx=${cartInfo[status.index].idx }"><img class="thumbnail" alt="썸네일 이미지" src="/upload/${cartInfo[status.index].thumbnailImg}">
			  				</a></td>
					        <td class="pInfo"><a href="detail?idx=${cartInfo[status.index].idx }"><span>${cartInfo[status.index].name}</span></a>
					        	<div class="cartOpText">[옵션 : ${item.option4 }]</div></td>
					        <td id="sellPriceText">${cartInfo[status.index].price}원	</td>
					        <td class="quantityTd">
					        <input class="quantity4" name="quantity4" value="${item.option4Quantity }" type="number" onchange="calc4(this)">
					        <input class="sellPrice4" type="hidden" value="${cartInfo[status.index].price }" >
					        <input class="sumVal" type="hidden" value="${(fn:replace(cartInfo[status.index].price,',','')) *(item.option4Quantity)}" name="sumVal">
					        <button class="qChangeBtn" type="button" onclick="qChange(this)">변경</button>
					        <input type="hidden" value="1"/> <!-- 수량변경 위한 값 -->
					        <input type="hidden" value="${item.idx}"></td>
					        <td>기본배송</td>
					        <td class="delChargeText">3,000원</td>
					        <td class="sumPrice4"></td>
					        <td class="selectBtnTd">
					        <div><button type="button" class="selectBtn" onclick="remove(this)">삭제</button>
					        	<input type="hidden" value="4"/>
					        	<input type="hidden" value="${item.idx}">
					        </div></td>
			 		   </tr>
				  	  </c:if>
		  		    </c:forEach>
			  </tbody>
			  <tfoot>
				<tr class="sumTextTr">
					<td class="sumText" colspan="9"><span><span>상품구매금액 </span><span id="pTotalText">토탈</span> + <span>배송비</span>
					<span id="deliText">배송비</span> <span> = 합계: </span><span id="totalPrice"></span></span> </td>
				</tr>				  
			  </tfoot>
			</table>
			<c:if test="${count > 0 }">
				<div style="text-align: left;">
				<button style="width: 150px; height: 29px; font-size: 14px" 
				type="button" class="selectBtn" onclick="selectOrder()" >선택상품주문</button>
				<button style="width: 150px; height: 29px; font-size: 14px" 
				type="button" class="selectBtn" onclick="allOrder()" >전체상품주문</button></div>
				<div style="text-align: left;"><button style="width: 150px; height: 29px; font-size: 14px" 
				type="button" class="selectBtn" onclick="removeAll()">장바구니 비우기</button></div>
			</c:if>	
	 		</div>
	 	</div>
	 </div>
	 
	 <!-- 장바구니 이용안내 -->
	 <div class="row" id="guideRow">
	 	<div class="col-xl-12" id="guideCol">
	 		<h5>이용안내</h5>
	 		<ol>
	 			<li>1. 해외배송 상품과 국내배송 상품은 함께 결제하실 수 없으니 장바구니 별로 따로 결제해 주시기 바랍니다.</li>
	 			<li>2. 해외배송 가능 상품의 경우 국내배송 장바구니에 담았다가 해외배송 장바구니로 이동하여 결제하실 수 있습니다.</li>
	 			<li>3. 선택하신 상품의 수량을 변경하시려면 수량변경 하시면 됩니다.</li>
	 			<li>4. 파일첨부 옵션은 동일상품을 장바구니에 추가할 경우 마지막에 업로드 한 파일로 교체됩니다.</li>
	 		</ol>
	 		
	 		<h5>무이자할부 이용안내</h5>
	 		<ol>
	 			<li>1. 상품별 무이자할부 혜택을 받으시려면 무이자할부 상품만 선택하여 [주문하기] 버튼을 눌러 주문/결제 하시면 됩니다.</li>
	 			<li>2. [전체 상품 주문] 버튼을 누르시면 장바구니의 구분없이 선택된 모든 상품에 대한 주문/결제가 이루어집니다.</li>
	 			<li>3. 단, 전체 상품을 주문/결제하실 경우, 상품별 무이자할부 혜택을 받으실 수 없습니다.</li>
	 			<li>4. 무이자할부 상품은 장바구니에서 별도 무이자할부 상품 영역에 표시되어, 무이자할부 상품 기준으로 배송비가 표시됩니다.
					실제 배송비는 함께 주문하는 상품에 따라 적용되오니 주문서 하단의 배송비 정보를 참고해주시기 바랍니다.</li>
	 		</ol>
	 	</div>
	 </div>
	 	
<%@ include file="../footer.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/cart.js" defer></script>
</body>
</html>