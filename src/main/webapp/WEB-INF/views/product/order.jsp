<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<meta charset="UTF-8">
<title>댕냥이의 일상</title>
</head>
<body>

<%@ include file="../header.jsp"%>
	 
	 <div class="container">
	 	<div class="row">	
	 		<h2 class="text-center">주문</h2>
	 		<div class="col">
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
				  		    <td><input type="checkbox" name="check" class="check"></td>
			  				<td><a href="detail?idx=${cartInfo[status.index].idx }"><img class="thumbnail" alt="썸네일 이미지" src="/upload/${cartInfo[status.index].thumbnailImg}">
			  				</a></td>
					        <td class="pInfo"><a href="detail?idx=${cartInfo[status.index].idx }"><span>${cartInfo[status.index].name}</span></a>
					        	<div class="cartOpText"></div></td>
					        <td id="sellPriceText">${cartInfo[status.index].price}원	</td>
					        <td class="quantityTd">
					        <input class="quantity" name="quantity" value="${item.option1Quantity }" type="text" onchange="calc(this)" readonly style="border: none">
					        <input class="sellPrice" type="hidden" value="${cartInfo[status.index].price }" >
					        <input class="sumVal" type="hidden" value="${(fn:replace(cartInfo[status.index].price,',','')) *(item.option1Quantity)}" name="sumVal"></td>
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
				  		    <td><input type="checkbox" name="check1" class="check"></td>
			  				<td><a href="detail?idx=${cartInfo[status.index].idx }"><img class="thumbnail" alt="썸네일 이미지" src="/upload/${cartInfo[status.index].thumbnailImg}"></a></td>
					        <td class="pInfo"><a href="detail?idx=${cartInfo[status.index].idx }"><span>${cartInfo[status.index].name}</span></a>
					        	<div class="cartOpText">[옵션 : ${item.option1 }]</div></td>
					        <td id="sellPriceText">${cartInfo[status.index].price}원	</td>
					        <td class="quantityTd">
					        <input class="quantity1" name="quantity" value="${item.option1Quantity }" type="text" onchange="calc1(this)" readonly style="border: none">
					        <input class="sellPrice1" type="hidden" value="${cartInfo[status.index].price }" >
					        <input class="sumVal" type="hidden" value="${(fn:replace(cartInfo[status.index].price,',','')) *(item.option1Quantity)}" name="sumVal"></td>
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
				  		    <td><input type="checkbox" name="check2" class="check"></td>
			  				<td><a href="detail?idx=${cartInfo[status.index].idx }"><img class="thumbnail" alt="썸네일 이미지" src="/upload/${cartInfo[status.index].thumbnailImg}">
			  				</a></td>
					        <td class="pInfo"><a href="detail?idx=${cartInfo[status.index].idx }"><span>${cartInfo[status.index].name}</span></a>
					        	<div class="cartOpText">[옵션 : ${item.option2 }]</div></td>
					        <td id="sellPriceText">${cartInfo[status.index].price}원	</td>
					        <td class="quantityTd">
					        <input class="quantity2" name="quantity" value="${item.option2Quantity }" type="text" onchange="calc2(this)" readonly style="border: none">
					        <input class="sellPrice2" type="hidden" value="${cartInfo[status.index].price }" >
					        <input class="sumVal" type="hidden" value="${(fn:replace(cartInfo[status.index].price,',','')) *(item.option2Quantity)}" name="sumVal"></td>
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
				  		    <td><input type="checkbox" name="check3" class="check"></td>
			  				<td><a href="detail?idx=${cartInfo[status.index].idx }"><img class="thumbnail" alt="썸네일 이미지" src="/upload/${cartInfo[status.index].thumbnailImg}">
			  				</a></td>
					        <td class="pInfo"><a href="detail?idx=${cartInfo[status.index].idx }"><span>${cartInfo[status.index].name}</span></a>
					        	<div class="cartOpText">[옵션 : ${item.option3 }]</div></td>
					        <td id="sellPriceText">${cartInfo[status.index].price}원	</td>
					        <td class="quantityTd">
					        <input class="quantity3" name="quantity" value="${item.option3Quantity }" type="text" onchange="calc3(this)" readonly style="border: none">
					        <input class="sellPrice3" type="hidden" value="${cartInfo[status.index].price }" >
					        <input class="sumVal" type="hidden" value="${(fn:replace(cartInfo[status.index].price,',','')) *(item.option3Quantity)}" name="sumVal"></td>
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
				  		    <td><input type="checkbox" name="check4" class="check"></td>
			  				<td><a href="detail?idx=${cartInfo[status.index].idx }"><img class="thumbnail" alt="썸네일 이미지" src="/upload/${cartInfo[status.index].thumbnailImg}">
			  				</a></td>
					        <td class="pInfo"><a href="detail?idx=${cartInfo[status.index].idx }"><span>${cartInfo[status.index].name}</span></a>
					        	<div class="cartOpText">[옵션 : ${item.option4 }]</div></td>
					        <td id="sellPriceText">${cartInfo[status.index].price}원	</td>
					        <td class="quantityTd">
					        <input class="quantity4" name="quantity" value="${item.option4Quantity }" type="text" onchange="calc4(this)" readonly style="border: none">
					        <input class="sellPrice4" type="hidden" value="${cartInfo[status.index].price }" >
					        <input class="sumVal" type="hidden" value="${(fn:replace(cartInfo[status.index].price,',','')) *(item.option4Quantity)}" name="sumVal"></td>
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
				<div style="display: flex; justify-content: space-between;">
					<span style="color: gray; font-size: 13px;"><span>상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서 가능합니다.</span></span>
					<span><button class="selectBtn" onclick="history.back()">이전</button></span>
		 		</div>
	 		</div>
	 	</div>
	 </div>
	 
	 <div class="container">
	 	<div class="row">
	 		<div class="col">
	 		</div>
	 	</div>
	 </div>
	 
	 	
	<!-- <button type="button" onclick="iamport()">결제하기</button> -->
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
		document.getElementById('totalPrice').innerText = comma(String(totalPrice))+'원'; 
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
		document.getElementById('totalPrice').innerText = comma(String(totalPrice))+'원'; 
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
		document.getElementById('totalPrice').innerText = comma(String(totalPrice))+'원'; 
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
		document.getElementById('totalPrice').innerText = comma(String(totalPrice))+'원'; 
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
		document.getElementById('totalPrice').innerText = comma(String(totalPrice))+'원'; 
	}
	
	
	//수량변경시 변하는 값
	$(document).ready(function(){
		$(':input').on('change',function(){
			let totalPrice = 0;
			for (let i = 0; i < $('.sumVal').length; i++) {
				totalPrice += parseInt($('.sumVal')[i].value);
			}
			
			if(totalPrice >= 30000 ){
				$('#deliText').text('0');
				$('#totalPrice').text(comma(String(parseInt(totalPrice)))+'원');
				for (let i = 0; i < $('.delChargeText').length; i++) {
					$('.delChargeText').text('0원');
				}
				$('#pTotalText').text(comma(String(totalPrice)));
			}else{
				$('#deliText').text('3,000');
				$('#totalPrice').text(comma(String(parseInt(totalPrice)+3000))+'원');
				for (let i = 0; i < $('.delChargeText').length; i++) {
					$('.delChargeText').text('3,000원');
				}
				$('#pTotalText').text(comma(String(totalPrice)));
			}
			
		})
	})
	
	//제품값
	$(document).ready(function(){
		
		let totalPrice = 0;
		for (let i = 0; i < $('.sumVal').length; i++) {
			totalPrice += parseInt($('.sumVal')[i].value);
		}
		
		$('#pTotalText').text(comma(String(totalPrice)));//배송비 추가 계산전 토탈금액
		
		//배송비 처리
		if(totalPrice >= 30000 || totalPrice == 0){//총합 3만원이상 ,장바구니 비었을때
			$('#deliText').text('0');
			$('#totalPrice').text(comma(String(parseInt(totalPrice)))+'원');//페이지 진입 토탈금액 입력
			for (let i = 0; i < $('.delChargeText').length; i++) {
				$('.delChargeText').text('0원');
			}
		}else{
			$('#deliText').text('3,000');
			$('#totalPrice').text(comma(String(parseInt(totalPrice)+3000))+'원');//페이지 진입 토탈금액 입력
		}
		
		
		for (let i = 0; i < $('.sumPrice').length; i++) {
			$('.sumPrice')[i].innerText = comma(String(parseInt($('.sellPrice')[i].value.replace(',',''))
					* parseInt($('.quantity')[i].value))) +'원'; 
		}
				
		for (let i = 0; i < $('.sumPrice1').length; i++) {
			$('.sumPrice1')[i].textContent = comma(String(parseInt($('.sellPrice1')[i].value.replace(',',''))
					* parseInt($('.quantity1')[i].value))) +'원';
		}
	
				
		for (let i = 0; i < $('.sumPrice2').length; i++) {
			$('.sumPrice2')[i].textContent = comma(String(parseInt($('.sellPrice2')[i].value.replace(',',''))
					* parseInt($('.quantity2')[i].value))) +'원';
		}
	
				
		for (let i = 0; i < $('.sumPrice3').length; i++) {
			$('.sumPrice3')[i].textContent = comma(String(parseInt($('.sellPrice3')[i].value.replace(',',''))
					* parseInt($('.quantity3')[i].value))) +'원';
		}
	
				
		for (let i = 0; i < $('.sumPrice4').length; i++) {
			$('.sumPrice4')[i].textContent = comma(String(parseInt($('.sellPrice4')[i].value.replace(',',''))
					* parseInt($('.quantity4')[i].value))) +'원';
		}
	})
	
	   //천단위 콤마 펑션
   function comma(value){
        value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        return value; 
    }
	
	//체크박스
	function cAll() {
        if ($("#checkAll").is(':checked')) {
            $("input[type=checkbox]").prop("checked", true);
        }
        else {
            $("input[type=checkbox]").prop("checked", false);
        }
  }//cAll() end
  
  //전체 체크시 모두선택 체크
       $(document).ready(function(){
    	   $('input[class=check]').click(function(){
				let total = $("input[class=check]").length;
				let checked = $("input[class=check]:checked").length;
				if(total == checked){
					$("#checkAll").prop("checked", true); 
				}
				else{
					$("#checkAll").prop("checked", false);
				}
    	   })
       }) 
	
       
       //삭제
  	function remove(select){
   	  let param = new Object();
	  if(select.nextSibling.nextSibling.value == 0){ //단독상품 삭제
		  param.pIdx = select.nextSibling.nextSibling.nextSibling.nextSibling.value;//<input class="pIdx" 
			$.ajax({
				type: 'POST',
				url: 'delCart',
				contentType: 'application/x-www-form-urlencoded; charset=utf-8',
				data:param, 
					success: function(){
						location.reload();
					},
					error:function(request,status,error){
				        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				    }
		  })//ajax end
		  
	  }else{ //옵션 상품 삭제
		  param.opNum = select.parentNode.childNodes[2].value; //옵션 번호
		  param.idx = select.parentNode.childNodes[4].value; // 상품번호
		  
			$.ajax({
				type: 'POST',
				url: 'opDelCart',
				contentType: 'application/x-www-form-urlencoded; charset=utf-8',
				data:param, 
					success: function(){
						location.reload();
					},
					error:function(request,status,error){
				        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				    }
			  })//ajax end
		  }
	}//remover end	
	
	//아임포트 결제
	function iamport(){
			//가맹점 식별코드
			IMP.init('imp84467091');
			IMP.request_pay({
			    pg : 'html5_inicis',
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '상품1' , //결제창에서 보여질 이름
			    amount : 100, //실제 결제되는 가격
			    buyer_email : 'iamport@siot.do',
			    buyer_name : '구매자이름',
			    buyer_tel : '010-1234-5678',
			    buyer_addr : '서울 강남구 도곡동',
			    buyer_postcode : '123-456'
			}, function(rsp) {
				console.log(rsp);
			    if ( rsp.success ) {
			    	var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			    } else {
			    	 var msg = '결제에 실패하였습니다.';
			         msg += '에러내용 : ' + rsp.error_msg;
			    }
			    alert(msg);
			});
		}

	
	
</script>
</body>
</html>