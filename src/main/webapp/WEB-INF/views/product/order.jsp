<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<meta charset="UTF-8">
<title>댕냥이의 일상</title>
</head>
<body>

<%@ include file="../header.jsp"%>
	 
	 <div class="container">
	 	<div class="row">	
	 		<h2 class="text-center">주문서 작성</h2>
	 		<div class="col" id="orderTable">
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
			    </tr>
			  </thead>
			  <tbody>
		  		    <c:forEach var="item" items="${list}" varStatus="status">
					  <c:if test="${item.option1 == null}"> <!-- 옵션값 없는 단독상품 -->
			    		<tr class="cartListTr" id="cartListTr">
				  		    <td><input type="checkbox" name="check" class="check"></td>
			  				<td><a href="detail?idx=${cartInfo[status.index].idx }"><img class="thumbnail" alt="썸네일 이미지" src="/upload/${cartInfo[status.index].thumbnailImg}">
			  				</a></td>
					        <td class="pInfo"><a href="detail?idx=${cartInfo[status.index].idx }"><span class="pName">${cartInfo[status.index].name}</span></a>
					        	<div class="cartOpText"></div></td>
					        <td id="sellPriceText">${cartInfo[status.index].price}원	</td>
					        <td class="quantityTd">
						        <input class="sumVal" type="hidden" value="${(fn:replace(cartInfo[status.index].price,',','')) *(item.option1Quantity)}" name="sumVal">
						        <input class="quantity" name="quantity" value="${item.option1Quantity }" type="text" readonly style="border: none">
						        <input type="hidden" value="${cartInfo[status.index].idx }">
						        <input class="sellPrice" type="hidden" value="${cartInfo[status.index].price }" >
						        </td>
					        <td>기본배송</td>
					        <td class="delChargeText">3,000원</td>
					        <td class="sumPrice"></td>
			 		   </tr>
				  	  </c:if>
				  	  
				  	  <c:if test="${!(item.option1 eq '') && item.option1 != null }"> <!-- 옵션값 있는 상품 -->
			    		<tr class="cartListTr">
				  		    <td><input type="checkbox" name="check1" class="check"></td>
			  				<td><a href="detail?idx=${cartInfo[status.index].idx }"><img class="thumbnail" alt="썸네일 이미지" src="/upload/${cartInfo[status.index].thumbnailImg}"></a></td>
					        <td class="pInfo"><a href="detail?idx=${cartInfo[status.index].idx }"><span class="pName">${cartInfo[status.index].name}</span></a>
					        	<div class="cartOpText">[옵션 : ${item.option1 }]</div></td>
					        <td id="sellPriceText">${cartInfo[status.index].price}원	</td>
					        <td class="quantityTd">
						        <input class="sumVal" type="hidden" value="${(fn:replace(cartInfo[status.index].price,',','')) *(item.option1Quantity)}" name="sumVal">
						        <input class="quantity1" name="quantity" value="${item.option1Quantity }" type="text" readonly style="border: none">
						        <input type="hidden" value="${cartInfo[status.index].idx }">
						        <input class="sellPrice1" type="hidden" value="${cartInfo[status.index].price }" >
						        </td>
					        <td>기본배송</td>
					        <td class="delChargeText">3,000원</td>
					        <td class="sumPrice1"></td>
			 		   </tr>
				  	  </c:if>
				  	  
				  	  <c:if test="${!(item.option2 eq '') && item.option2 != null }"> <!-- 옵션값 있는 상품 -->
			    		<tr class="cartListTr">
				  		    <td><input type="checkbox" name="check2" class="check"></td>
			  				<td><a href="detail?idx=${cartInfo[status.index].idx }"><img class="thumbnail" alt="썸네일 이미지" src="/upload/${cartInfo[status.index].thumbnailImg}">
			  				</a></td>
					        <td class="pInfo"><a href="detail?idx=${cartInfo[status.index].idx }"><span class="pName">${cartInfo[status.index].name}</span></a>
					        	<div class="cartOpText">[옵션 : ${item.option2 }]</div></td>
					        <td id="sellPriceText">${cartInfo[status.index].price}원	</td>
					        <td class="quantityTd">
						        <input class="sumVal" type="hidden" value="${(fn:replace(cartInfo[status.index].price,',','')) *(item.option2Quantity)}" name="sumVal">
						        <input class="quantity2" name="quantity" value="${item.option2Quantity }" type="text" readonly style="border: none">
						        <input type="hidden" value="${cartInfo[status.index].idx }">
						        <input class="sellPrice2" type="hidden" value="${cartInfo[status.index].price }" >
						        </td>
					        <td>기본배송</td>
					        <td class="delChargeText">3,000원</td>
					        <td class="sumPrice2"></td>
			 		   </tr>
				  	  </c:if>
				  	  
				  	  <c:if test="${!(item.option3 eq '') && item.option3 != null }"> <!-- 옵션값 있는 상품 -->
			    		<tr class="cartListTr">
				  		    <td><input type="checkbox" name="check3" class="check"></td>
			  				<td><a href="detail?idx=${cartInfo[status.index].idx }"><img class="thumbnail" alt="썸네일 이미지" src="/upload/${cartInfo[status.index].thumbnailImg}">
			  				</a></td>
					        <td class="pInfo"><a href="detail?idx=${cartInfo[status.index].idx }"><span class="pName">${cartInfo[status.index].name}</span></a>
					        	<div class="cartOpText">[옵션 : ${item.option3 }]</div></td>
					        <td id="sellPriceText">${cartInfo[status.index].price}원	</td>
					        <td class="quantityTd">
						        <input class="sumVal" type="hidden" value="${(fn:replace(cartInfo[status.index].price,',','')) *(item.option3Quantity)}" name="sumVal">
						        <input class="quantity3" name="quantity" value="${item.option3Quantity }" type="text" readonly style="border: none">
						        <input type="hidden" value="${cartInfo[status.index].idx }">
						        <input class="sellPrice3" type="hidden" value="${cartInfo[status.index].price }" >
						        </td>
					        <td>기본배송</td>
					        <td class="delChargeText">3,000원</td>
					        <td class="sumPrice3"></td>
			 		   </tr>
				  	  </c:if>
				  	  
				  	  <c:if test="${!(item.option4 eq '') && item.option4 != null }"> <!-- 옵션값 있는 상품 -->
			    		<tr class="cartListTr">
				  		    <td><input type="checkbox" name="check4" class="check"></td>
			  				<td><a href="detail?idx=${cartInfo[status.index].idx }"><img class="thumbnail" alt="썸네일 이미지" src="/upload/${cartInfo[status.index].thumbnailImg}">
			  				</a></td>
					        <td class="pInfo"><a href="detail?idx=${cartInfo[status.index].idx }"><span class="pName">${cartInfo[status.index].name}</span></a>
					        	<div class="cartOpText">[옵션 : ${item.option4 }]</div></td>
					        <td id="sellPriceText">${cartInfo[status.index].price}원	</td>
					        <td class="quantityTd">
						        <input class="quantity4" name="quantity" value="${item.option4Quantity }" type="text" readonly style="border: none">
						        <input type="hidden" value="${cartInfo[status.index].idx }">
						        <input class="sellPrice4" type="hidden" value="${cartInfo[status.index].price }" >
						        <input class="sumVal" type="hidden" value="${(fn:replace(cartInfo[status.index].price,',','')) *(item.option4Quantity)}" name="sumVal">
						        </td>
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
	 			<table class="table table-borderless" id="buyerInfoTable">
	 				<thead>
	 					<tr>
	 						<th>배송정보</th>
	 					</tr>
	 				</thead>
	 				<tbody>
	 					<tr>
	 						<td>배송지 선택</td>
	 						<td class="buyerInfo"><div><input id="sameaddr0" name="sameaddr" value="M" type="radio" checked><label for="sameaddr0">회원 정보와 동일</label>
	 						<input id="sameaddr1" name="sameaddr" value="F" type="radio"><label for="sameaddr1">새로운 배송지</label></div></td>
	 					</tr>
	 					<tr>
	 						<td>받으시는분</td>
	 						<td class="buyerInfo"><input type="text" name="name" id="buyerName" value="${user.name }" required></td>
	 					</tr>
	 					<tr>
	 						<td>주소</td>
	 						<td class="buyerInfo" id="addrTd">
	 						<div><input type="text" name="zipCode" id="buyerZipCode" value="${user.zipCode }" readonly style="width: 60px;"></div>
	 						<div><input type="text" name="address" id="buyerAddr" value="${user.address }" required readonly></div>
	 						<div><input type="text" name="addressDetail" id="buyerAddrDetail" value="${user.addressDetail }"></div></td>		 						
	 					</tr>
	 					<tr>
	 						<td>휴대전화</td>
	 						<td class="buyerInfo"><input type="text" name="phone" id="buyerPhone" value="${user.phone }" required></td>
	 					</tr>
	 					<tr>
	 						<td>이메일</td>
	 						<td class="buyerInfo"><input type="email" name="email" id="buyerEmail" value="${user.email }" required></td>	 					
	 					</tr>
	 					<tr>
	 						<td>배송메세지</td>
	 						<td class="buyerInfo"><textarea id="omessage" name="omessage" maxlength="200" cols="70" id="buyerMsg"></textarea></td>	 					
	 					</tr>
	 				</tbody>
	 			</table>
	 		</div>
	 	</div>
	 </div>
	<div class="PaymentBtnDiv">
		<ul>
			<li><div>최종 결제금액</div><span id="bottomTotalPrice"></span></li>
			<li><button type="button" onclick="iamport()">주문하기</button></li>
		</ul>	
	</div>
	<c:forEach var="i" begin="1" end="${fn:length(list)}">
 	<form action="orderList" method="post">
		<input type="hidden" name="list" value="${list }">
		
	</form>	 
	<div>${fn:length(list)}</div>
	</c:forEach>
	
		 <!-- 주문 이용안내 -->
	 <div class="row" id="guideRow">
	 	<div class="col-xl-12" id="guideCol">
	 		<ol>
	 			<li>- 무이자할부가 적용되지 않은 상품과 무이자할부가 가능한 상품을 동시에 구매할 경우 전체 주문 상품 금액에
	 			 대해 무이자할부가 적용되지 않습니다.</li>
	 			 <li>- 무이자할부를 원하시는 경우 장바구니에서 무이자할부 상품만 선택하여 주문하여 주시기 바랍니다.</li>
	 		</ol>
	 	</div>
	 </div>
 	 <div class="row" id="guideRow">
 		<div class="col-xl-12" id="guideCol">
 		<h6>WindowXP 서비스팩2를 설치하신후 결제가 정상적인 단계로 처리되지 않는경우, 아래의 절차에 따라 해결하시기 바랍니다.</h6>
 		<ol>
 			<li><a target="blank" href="https://service-api.echosting.cafe24.com/shop/notice_XP_ActiveX.html">1. 안심클릭 결제모듈이 설치되지 않은 경우 ActiveX 수동설치</a></li>
 			<li><a target="blank" href="https://www.microsoft.com/ko-kr">2. Service Pack 2에 대한 Microsoft사의 상세안내</a></li>
 		</ol>
 		
 		<h6>아래의 쇼핑몰일 경우에는 모든 브라우저 사용이 가능합니다.</h6>
 		<ol>
 			<li>1. KG이니시스, KCP, LG U+를 사용하는 쇼핑몰일 경우</li>
 			<li>2. 결제가능브라우저 : 크롬,파이어폭스,사파리,오페라 브라우저에서 결제 가능
					(단, window os 사용자에 한하며 리눅스/mac os 사용자는 사용불가)</li>
 			<li>3. 최초 결제 시도시에는 플러그인을 추가 설치 후 반드시 브라우저 종료 후 재시작해야만 결제가 가능합니다.
					(무통장, 휴대폰결제 포함)</li>
 		</ol>
 		
 		<h6>세금계산서 발행 안내</h6>
 		<ol>
 			<li>1. 부가가치세법 제 54조에 의거하여 세금계산서는 배송완료일로부터 다음달 10일까지만 요청하실 수 있습니다.</li>
 			<li>2. 세금계산서는 사업자만 신청하실 수 있습니다.</li>
 			<li>3. 배송이 완료된 주문에 한하여 세금계산서 발행신청이 가능합니다.</li>
 			<li>4. [세금계산서 신청]버튼을 눌러 세금계산서 신청양식을 작성한 후 팩스로 사업자등록증사본을 보내셔야 세금계산서 발생이 가능합니다.</li>
 			<li>5. [세금계산서 인쇄]버튼을 누르면 발행된 세금계산서를 인쇄하실 수 있습니다.</li>
 		</ol>
 		
 		<h6>부가가치세법 변경에 따른 신용카드매출전표 및 세금계산서 변경안내</h6>
 		<ol>
 			<li>1. 변경된 부가가치세법에 의거, 2004.7.1 이후 신용카드로 결제하신 주문에 대해서는 세금계산서 발행이 불가하며</li>
 			<li>2. 신용카드매출전표로 부가가치세 신고를 하셔야 합니다.(부가가치세법 시행령 57조)</li>
 			<li>3. 상기 부가가치세법 변경내용에 따라 신용카드 이외의 결제건에 대해서만 세금계산서 발행이 가능함을 양지하여 주시기 바랍니다.</li>
 		</ol>
 		
 		<h6>현금영수증 이용안내</h6>
 		<ol>
 			<li>1. 현금영수증은 1원 이상의 현금성거래(무통장입금, 실시간계좌이체, 에스크로, 예치금)에 대해 발행이 됩니다.</li>
 			<li>2. 현금영수증 발행 금액에는 배송비는 포함되고, 적립금사용액은 포함되지 않습니다.</li>
 			<li>3. 발행신청 기간제한 현금영수증은 입금확인일로 부터 48시간안에 발행을 해야 합니다.</li>
 			<li>4. 현금영수증 발행 취소의 경우는 시간 제한이 없습니다. (국세청의 정책에 따라 변경 될 수 있습니다.)</li>
 			<li>5. 현금영수증이나 세금계산서 중 하나만 발행 가능 합니다.</li>
 		</ol>
 	</div>
 </div>
	 	
	 	
<%@ include file="../footer.jsp"%>
<script type="text/javascript" >

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
		$('#bottomTotalPrice').text($('#totalPrice').text());//주문내역 토탈값
		
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
		
	//배송정보 라디오버튼
       $(document).ready(function(){
    	   $('input:radio[id=sameaddr0]').click(function(){
				location.reload(true);
    	   })
       }) 
       
       $(document).ready(function(){
    	   $('input:radio[id=sameaddr1]').click(function(){
    		  $('#buyerInfoTable').find('input').val(''); 
    	   })
       }) 
       
       //카카오 주소 api
	window.onload = function(){
	    document.getElementById('buyerAddr').addEventListener('click', function(){
	        new daum.Postcode({
	            oncomplete: function(data) { //선택시 입력값 세팅
	            	console.log(data)
	                document.getElementById('buyerAddr').value = data.address; // 주소 넣기
	                document.getElementById('buyerZipCode').value = data.zonecode; // 우편번호 넣기
	            }
	        }).open();
	    });
	}
	
	//아임포트 결제
	function iamport(){
		//결제전 정규식검사
		let email = document.getElementById('buyerEmail').value;
		let phone = document.getElementById('buyerPhone').value;
		let bName = document.getElementById('buyerName').value;
		let addr = document.getElementById('buyerAddr').value;
		let addrDetail = document.getElementById('buyerAddrDetail').value;
		let zipCode = document.getElementById('buyerZipCode').value;
		
		let temp = document.getElementsByClassName('pName');
		let pName =''; //상품명 담을변수 
		for (let i = 0; i < temp.length; i++) {
			console.log(temp[i]);
			if(i == (temp.length-1)){
				pName += temp[i].innerText;
			}else{
				pName += temp[i].innerText +',';
			}
		}
		
		let emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;//이메일 정규식
		let passRule = /^[A-Za-z0-9]{6,15}$/; //패스워드 정규식
		let phoneRule = /^[0-9]{11}$/;
		if(!emailRule.test(email)){
	    	Swal.fire({icon: 'warning',text: '이메일 형식이 올바르지 않습니다.'})
			return false;
		}else if(!phoneRule.test(phone)){
	    	Swal.fire({icon: 'warning',text: '휴대전화 형식이 올바르지 않습니다.'}) 

	  		return false;
	  	}
			//가맹점 식별코드
			IMP.init('imp84467091');
			IMP.request_pay({
			    pg : 'html5_inicis',
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : pName , //결제창에서 보여질 이름
			    amount : 100, //parseInt($('#pTotalText').text().replace(',','')), //실제 결제되는 가격
			    buyer_email : email,
			    buyer_name : bName,
			    buyer_tel : phone,
			    buyer_addr : addr + addrDetail,
			    buyer_postcode : zipCode
			}, function(rsp) {
				console.log(rsp);
			    if ( rsp.success ) {
			    	var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			    	Swal.fire({icon: 'success',
			    		title: '결제완료',
			    		text: msg}).then(function(){
			    			addOrderList();
			    		}) // sweetAlert2 api
			    	
			    } else {
			    	 var msg = '결제에 실패하였습니다.';
			         msg += '에러내용 : ' + rsp.error_msg;
			         
			    	Swal.fire({icon: 'error',
			    		title: '결제실패',
			    		text: msg,	}).then(function(){
			    			location.reload();
			    		})
			    	//location.href='orderList';
			    }
			});
		}//iamport end
		
	function addOrderList(){
			let param = new Object;
			let quantity = $('input[name=quantity]');
			for (let i = 0; i < quantity.length; i++) { //주문한 제품번호,옵션명,수량,제품별합계 가져오기
				let totalPrice = quantity[i].previousSibling.previousSibling.value;
				let pIdx = quantity[i].nextSibling.nextSibling.value;
				let opName = quantity[i].parentNode.parentNode.childNodes[5].childNodes[2].innerText;
				let order = 'order'+(i+1);
				
				if(opName == ''){
					param[order] = pIdx + '/' + quantity[i].value + '/' + comma(totalPrice) + '/ ';//옵션값 없을때
				}else{
					param[order] = pIdx + '/' + quantity[i].value + '/' + comma(totalPrice) + '/' + opName;
				}
			}
			$.ajax({
				type: 'POST',
				url: 'addOrderList',
				contentType: 'application/x-www-form-urlencoded; charset=utf-8',
				data:param, 
					success: function(){
						location.href='orderList';
					},
					error:function(request,status,error){
				        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				    }
			  })//ajax end
		}	
	
</script>
</body>
</html>