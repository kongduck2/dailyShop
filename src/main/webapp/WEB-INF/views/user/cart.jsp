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
	 		<div class="col">
	 		<div class="qlText">
	 			<h5>상품목록(${count })</h5>
	 		</div>
	 		<table class="table table-borderless">
			  <thead>
			    <tr>
				    <td scope="col"><input type="checkbox"></td>
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
		  		    <c:forEach var="item" items="${list}" varStatus="status">
					  <c:if test="${item.option1 == null}"> <!-- 옵션값 없는 단독상품 -->
			    		<tr class="cartListTr">
				  		    <td><input type="checkbox"></td>
			  				<td><img class="thumbnail" alt="썸네일 이미지" src="/upload/${cartInfo[status.index].thumbnailImg}"></td>
					        <td class="pInfo"><span>${cartInfo[status.index].name}</span>
					        	<div class="cartOpText">[옵션 : ${item.option1 }]</div></td>
					        <td id="sellPriceText">${cartInfo[status.index].price}원	</td>
					        <td class="quantityTd">
					        <input class="quantity" name="quantity" value="${item.option1Quantity }" type="number" onchange="calc(this)">
					        <input class="sellPrice" type="hidden" value="${cartInfo[status.index].price }" >
					        <input class="sumVal" type="hidden" value="${(fn:replace(cartInfo[status.index].price,',','')) *(item.option1Quantity)}" name="sumVal"></td>
					        <td>기본배송</td>
					        <td id="delChargeText">3,000원</td>
					        <td class="sumPrice"></td>
					        <td></td>
			 		   </tr>
				  	  </c:if>
				  	  
				  	  <c:if test="${!(item.option1 eq '') && item.option1 != null }"> <!-- 옵션값 있는 상품 -->
			    		<tr class="cartListTr">
				  		    <td><input type="checkbox"></td>
			  				<td><img class="thumbnail" alt="썸네일 이미지" src="/upload/${cartInfo[status.index].thumbnailImg}"></td>
					        <td class="pInfo"><span>${cartInfo[status.index].name}</span>
					        	<div class="cartOpText">[옵션 : ${item.option1 }]</div></td>
					        <td id="sellPriceText">${cartInfo[status.index].price}원	</td>
					        <td class="quantityTd">
					        <input class="quantity1" name="quantity" value="${item.option1Quantity }" type="number" onchange="calc1(this)">
					        <input class="sellPrice1" type="hidden" value="${cartInfo[status.index].price }" >
					        <input class="sumVal" type="hidden" value="${(fn:replace(cartInfo[status.index].price,',','')) *(item.option1Quantity)}" name="sumVal"></td>
					        <td>기본배송</td>
					        <td id="delChargeText">3,000원</td>
					        <td class="sumPrice1"></td>
					        <td></td>
			 		   </tr>
				  	  </c:if>
				  	  
				  	  <c:if test="${!(item.option2 eq '') && item.option2 != null }"> <!-- 옵션값 있는 상품 -->
			    		<tr class="cartListTr">
				  		    <td><input type="checkbox"></td>
			  				<td><img class="thumbnail" alt="썸네일 이미지" src="/upload/${cartInfo[status.index].thumbnailImg}"></td>
					        <td class="pInfo"><span>${cartInfo[status.index].name}</span>
					        	<div class="cartOpText">[옵션 : ${item.option2 }]</div></td>
					        <td id="sellPriceText">${cartInfo[status.index].price}원	</td>
					        <td class="quantityTd">
					        <input class="quantity2" name="quantity" value="${item.option2Quantity }" type="number" onchange="calc2(this)">
					        <input class="sellPrice2" type="hidden" value="${cartInfo[status.index].price }" >
					        <input class="sumVal" type="hidden" value="${(fn:replace(cartInfo[status.index].price,',','')) *(item.option2Quantity)}" name="sumVal"></td>
					        <td>기본배송</td>
					        <td id="delChargeText">3,000원</td>
					        <td class="sumPrice2"></td>
					        <td></td>
			 		   </tr>
				  	  </c:if>
				  	  
				  	  <c:if test="${!(item.option3 eq '') && item.option3 != null }"> <!-- 옵션값 있는 상품 -->
			    		<tr class="cartListTr">
				  		    <td><input type="checkbox"></td>
			  				<td><img class="thumbnail" alt="썸네일 이미지" src="/upload/${cartInfo[status.index].thumbnailImg}"></td>
					        <td class="pInfo"><span>${cartInfo[status.index].name}</span>
					        	<div class="cartOpText">[옵션 : ${item.option3 }]</div></td>
					        <td id="sellPriceText">${cartInfo[status.index].price}원	</td>
					        <td class="quantityTd">
					        <input class="quantity3" name="quantity" value="${item.option3Quantity }" type="number" onchange="calc3(this)">
					        <input class="sellPrice3" type="hidden" value="${cartInfo[status.index].price }" >
					        <input class="sumVal" type="hidden" value="${(fn:replace(cartInfo[status.index].price,',','')) *(item.option3Quantity)}" name="sumVal"></td>
					        <td>기본배송</td>
					        <td id="delChargeText">3,000원</td>
					        <td class="sumPrice3"></td>
					        <td></td>
			 		   </tr>
				  	  </c:if>
				  	  
				  	  <c:if test="${!(item.option4 eq '') && item.option4 != null }"> <!-- 옵션값 있는 상품 -->
			    		<tr class="cartListTr">
				  		    <td><input type="checkbox"></td>
			  				<td><img class="thumbnail" alt="썸네일 이미지" src="/upload/${cartInfo[status.index].thumbnailImg}"></td>
					        <td class="pInfo"><span>${cartInfo[status.index].name}</span>
					        	<div class="cartOpText">[옵션 : ${item.option4 }]</div></td>
					        <td id="sellPriceText">${cartInfo[status.index].price}원	</td>
					        <td class="quantityTd">
					        <input class="quantity4" name="quantity" value="${item.option4Quantity }" type="number" onchange="calc4(this)">
					        <input class="sellPrice4" type="hidden" value="${cartInfo[status.index].price }" >
					        <input class="sumVal" type="hidden" value="${(fn:replace(cartInfo[status.index].price,',','')) *(item.option4Quantity)}" name="sumVal"></td>
					        <td>기본배송</td>
					        <td id="delChargeText">3,000원</td>
					        <td class="sumPrice4"></td>
					        <td></td>
			 		   </tr>
				  	  </c:if>
				  	  
				  	  	    
		  		    </c:forEach>
			  </tbody>
			  <tfoot>
				<tr class="sumTextTr">
					<td class="sumText" colspan="9"><span><span>상품구매금액 </span><span id="pTotalText">토탈</span> + <span>배송비</span>
					<span id="deliText">배송비</span> <span> = 합계:</span><span id="totalPrice"></span></span> </td>
				</tr>				  
			  </tfoot>
			</table>
	 		</div>
	 	</div>
	 </div>
	 	
<%@ include file="../footer.jsp"%>
<script type="text/javascript" >

	//단독 상품
	function calc(quantity){
		let price = quantity.nextSibling.nextSibling.value.replace(',',''); //<input class="sellPrice"
		let sum = quantity.parentNode.parentNode.childNodes[15]; //<td class="sumPrice"></td>
		let sumVal = quantity.nextSibling.nextSibling.nextSibling.nextSibling;//<input class="sumVal"
		let totalSum = document.getElementsByClassName('sumVal');
		let totalPrice = 0;
		
		if (quantity.value == '' || quantity.value <= 0) { 
			quantity.value = 1;
		}
		sumVal.value = parseInt(quantity.value) * parseInt(parseInt(price)); //total값 계산하기 위해 저장(자동형변환)
		sum.innerText = comma(String(parseInt(quantity.value) * parseInt(parseInt(price)))) + '원';
		
		for (let i = 0; i < totalSum.length; i++) {
			totalPrice += parseInt(totalSum[i].value);
		}
		document.getElementById('totalPrice').innerText = totalPrice; 
	}
	
	//옵션1
	function calc1(quantity){
		let price = quantity.nextSibling.nextSibling.value.replace(',',''); //<input class="sellPrice"
		let sum = quantity.parentNode.parentNode.childNodes[15]; //<td class="sumPrice"></td>
		let sumVal = quantity.nextSibling.nextSibling.nextSibling.nextSibling;//<input class="sumVal"
		let totalSum = document.getElementsByClassName('sumVal');
		let totalPrice = 0;
		
		if (quantity.value == '' || quantity.value <= 0) { 
			quantity.value = 1;
		}
		sumVal.value = parseInt(quantity.value) * parseInt(parseInt(price)); //total값 계산하기 위해 저장(자동형변환)
		sum.innerText = comma(String(parseInt(quantity.value) * parseInt(parseInt(price)))) + '원';
		
		for (let i = 0; i < totalSum.length; i++) {
			totalPrice += parseInt(totalSum[i].value);
		}
		document.getElementById('totalPrice').innerText = totalPrice; 
	}
	
	//옵션2
	function calc2(quantity){
		let price = quantity.nextSibling.nextSibling.value.replace(',',''); //<input class="sellPrice"
		let sum = quantity.parentNode.parentNode.childNodes[15]; //<td class="sumPrice"></td>
		let sumVal = quantity.nextSibling.nextSibling.nextSibling.nextSibling;//<input class="sumVal"
		let totalSum = document.getElementsByClassName('sumVal');
		let totalPrice = 0;
		
		if (quantity.value == '' || quantity.value <= 0) { 
			quantity.value = 1;
		}
		sumVal.value = parseInt(quantity.value) * parseInt(parseInt(price)); //total값 계산하기 위해 저장(자동형변환)
		sum.innerText = comma(String(parseInt(quantity.value) * parseInt(parseInt(price)))) + '원';
		
		for (let i = 0; i < totalSum.length; i++) {
			totalPrice += parseInt(totalSum[i].value);
		}
		document.getElementById('totalPrice').innerText = totalPrice; 
	}
	
	//옵션3
	function calc3(quantity){
		let price = quantity.nextSibling.nextSibling.value.replace(',',''); //<input class="sellPrice"
		let sum = quantity.parentNode.parentNode.childNodes[15]; //<td class="sumPrice"></td>
		let sumVal = quantity.nextSibling.nextSibling.nextSibling.nextSibling;//<input class="sumVal"
		let totalSum = document.getElementsByClassName('sumVal');
		let totalPrice = 0;
		
		if (quantity.value == '' || quantity.value <= 0) { 
			quantity.value = 1;
		}
		sumVal.value = parseInt(quantity.value) * parseInt(parseInt(price)); //total값 계산하기 위해 저장(자동형변환)
		sum.innerText = comma(String(parseInt(quantity.value) * parseInt(parseInt(price)))) + '원';
		
		for (let i = 0; i < totalSum.length; i++) {
			totalPrice += parseInt(totalSum[i].value);
		}
		document.getElementById('totalPrice').innerText = totalPrice; 
	}
	
	//옵션4
	function calc4(quantity){
		let price = quantity.nextSibling.nextSibling.value.replace(',',''); //<input class="sellPrice"
		let sum = quantity.parentNode.parentNode.childNodes[15]; //<td class="sumPrice"></td>
		let sumVal = quantity.nextSibling.nextSibling.nextSibling.nextSibling;//<input class="sumVal"
		let totalSum = document.getElementsByClassName('sumVal');
		let totalPrice = 0;
		
		if (quantity.value == '' || quantity.value <= 0) { 
			quantity.value = 1;
		}
		sumVal.value = parseInt(quantity.value) * parseInt(parseInt(price)); //total값 계산하기 위해 저장(자동형변환)
		sum.innerText = comma(String(parseInt(quantity.value) * parseInt(parseInt(price)))) + '원';
		
		for (let i = 0; i < totalSum.length; i++) {
			totalPrice += parseInt(totalSum[i].value);
		}
		document.getElementById('totalPrice').innerText = totalPrice; 
	}
	
	
	//제품값
	$(document).ready(function(){
		let totalPrice = 0;
		for (let i = 0; i < $('.sumVal').length; i++) {
			totalPrice += parseInt($('.sumVal')[i].value);
		}
		$('#pTotalText').text(totalPrice);//배송비 추가 계산전 토탈금액
		$('#totalPrice').text(totalPrice+3000);//페이지 진입시 토탈금액 입력
		//배송비 처리
		console.log(typeof(totalPrice));
		
		if(totalPrice >= 30000){
			$('#deliText').text('0');
		}else{
			$('#deliText').text('3,000');
		}
		
		for (let i = 0; i < $('.sumPrice').length; i++) {
			$('.sumPrice')[i].innerText = comma(String(parseInt($('.sellPrice')[i].value.replace(',',''))
					* parseInt($('.quantity')[i].value))) +'원'; //장바구니 페이지 이동시 옵션1 합계
		}
				
		for (let i = 0; i < $('.sumPrice1').length; i++) {
			$('.sumPrice1')[i].textContent = comma(String(parseInt($('.sellPrice1')[i].value.replace(',',''))
					* parseInt($('.quantity1')[i].value))) +'원'; //장바구니 페이지 이동시 옵션1 합계
		}
	
				
		for (let i = 0; i < $('.sumPrice2').length; i++) {
			$('.sumPrice2')[i].textContent = comma(String(parseInt($('.sellPrice2')[i].value.replace(',',''))
					* parseInt($('.quantity2')[i].value))) +'원'; //장바구니 페이지 이동시 옵션1 합계
		}
	
				
		for (let i = 0; i < $('.sumPrice3').length; i++) {
			$('.sumPrice3')[i].textContent = comma(String(parseInt($('.sellPrice3')[i].value.replace(',',''))
					* parseInt($('.quantity3')[i].value))) +'원'; //장바구니 페이지 이동시 옵션1 합계
		}
	
				
		for (let i = 0; i < $('.sumPrice4').length; i++) {
			$('.sumPrice4')[i].textContent = comma(String(parseInt($('.sellPrice4')[i].value.replace(',',''))
					* parseInt($('.quantity4')[i].value))) +'원'; //장바구니 페이지 이동시 옵션1 합계
		}
	})
	
	   //천단위 콤마 펑션
   function comma(value){
        value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        return value; 
    }
</script>
</body>
</html>