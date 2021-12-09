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
    		<c:if test="${user != null}"> <!-- 로그인 상태 -->
    		<div class="col-md-3">
	    			<input type="hidden" name="pIdx" id="pIdx" value="${product.idx }">
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
    		 	<button class="buyButton" type="button" onclick="loginAlert()">바로구매</button> <!-- 넘겨줄정보 제품 idx ,유저 선택수량 -->
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
<script type="text/javascript" >

		//옵션선택
	function selectOnChange(o){
	 	const x = document.getElementById("selectBox").selectedIndex;
		const y = document.getElementById("selectBox").options;
		let idx = y[x].index;
		let option = document.getElementById("optionText");
		const text = o.options[o.selectedIndex].text;
		const value = o.value;
		let quantity = document.getElementById('optionTbody'+idx).childNodes[1].querySelector(".quantity");//선택된 값의 자식 input값
		
		if(value != ""){
			document.getElementById('optionText'+idx).innerText = text;
			quantity.value = 1;
			change();
			document.getElementById('optionTbody'+idx).style.display='table-row-group';
		//selectBox.options[selectBox.selectedIndex].text
		}
	}; 
	//제품 수량별 가격변경
	function change(){
		let quantity = document.getElementsByClassName('quantity');
		let sum = document.getElementsByClassName('sumPrice'); //getElementsByClassName 반환값 배열
		let price = document.getElementById('sellPrice');
		let totalPrice = document.getElementById('totalPrice');
		let totalQuantity = 0;
			
			for (let i = 0; i < quantity.length; i++) {
			if (quantity[i].value == '' || quantity[i].value < 0) { 
				quantity[i].value = 1;
			}
				totalQuantity += parseInt(quantity[i].value); //타입이 객체기떄문에 Int타입으로 파싱
			}
			
			for (let i = 0; i < sum.length; i++) { //상품별 총합
				sum[i].innerText = (parseInt(quantity[i].value) * parseInt(price.value.replace(',',''))).toLocaleString('ko-KR')+'원';
			}
			//토탈가격
			totalPrice.innerText = (parseInt(totalQuantity) * parseInt(price.value.replace(',',''))).toLocaleString('ko-KR')+'원';
	}  
	//옵션 삭제버튼 클릭했을때 quantity value 0되고 디스플레이 none
	function del(d){
		d.parentNode.firstChild.value = 0 ;//선택된 제품 quantity 값 0으로 수정(선택자 input태그)
		change();	//적용
		d.parentNode.parentNode.parentNode.parentNode.style.display = 'none'; //선택된 제품 숨기기(선택자 tbody태그)
		d.parentNode.parentNode.parentNode.childNodes[1].textContent = '';
	}
	
	//비로그인시 alert
	function loginAlert(){
    	Swal.fire({icon: 'info',
    		text: '로그인 후 이용가능합니다.',	}).then(function(){
    			location.href='login';
    		})
	}
	
	//장바구니에 추가 및 추가상품 중복검사
	$(document).ready(function(){
		let param = new Object();
		$('#addCartBtn').on('click', function(){
			if($('.optionName').length > 1){ //옵션이 있을때 단일품목일때는 옵션값 안넘어감
				for (let i = 0; i < $('.optionName').length; i++) {
					let option = 'option'+(i+1);
					param[option] = $('.optionName')[i].textContent; //키값 동적으로 할당
					param[option +'Quantity'] = $('.quantity')[i].value; 
				}
			}else{
				param['option1' +'Quantity'] = $('.quantity')[0].value; //단독상품 수량값
			}
			//옵션 비선택시
			if(param.option1Quantity == 0 && param.option2Quantity == 0 &&
					param.option3Quantity == 0 && param.option4Quantity == 0){
		    	Swal.fire({icon: 'warning',text: '옵션값을 선택해주세요.'}); 
			}else{
				param.pIdx = $('#pIdx').val();
				param.uIdx = $('#uIdx').val();
				$.ajax({
					type: 'POST',
					url: 'addCart',
				contentType: 'application/x-www-form-urlencoded; charset=utf-8',
				//Json안써주면 파라미터 형식으로 넘길수있음 서버에서 String 타입으로받을시 한글 깨짐 
					data:param, //위에 json 타입으로 안해줬기때문에 형변환 안함
						success: function(){
							$('#cartModal').modal('show');
						},
						error:function(request,status,error){
					        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
					       }
					}); //end ajax 
			}//else end
		}); //end on 
	});
	
	//관심상품에 추가
	$(document).ready(function(){
		let param = new Object();
		$('#addFavoriteBtn').on('click', function(){
				param.pIdx = $('#pIdx').val();
				param.uIdx = $('#uIdx').val();
				$.ajax({
					type: 'POST',
					url: 'addFavorite',
				contentType: 'application/x-www-form-urlencoded; charset=utf-8',
					data:param,
						success: function(){
							$('#favoriteModal').modal('show');
						},
						error:function(request,status,error){
					        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
					       }
					}); //end ajax 
		}); //end on 
	});
	
	//바로구매
		$(document).ready(function () {
			$('#buyBtn').on('click', function() {
			let param = new Object();
			if($('.optionName').length > 1){ //옵션이 있을때 단일품목일때는 옵션값 안넘어감
				for (let i = 0; i < $('.optionName').length; i++) {
					let option = 'option'+(i+1);
					param[option] = $('.optionName')[i].textContent; //키값 동적으로 할당
					param[option +'Quantity'] = $('.quantity')[i].value;
				}
			}else{
				for (let i = 1; i < 4; i++) { //단독상품일때 값 초기화 
					let option = 'option'+(i+1); 
					param[option] = ''; 
					param[option +'Quantity'] = 0;
				}
				param['option1' +'Quantity'] = $('.quantity')[0].value; //단독상품 수량값
			}
			if(param.option1Quantity == 0 && param.option2Quantity == 0 &&
					param.option3Quantity == 0 && param.option4Quantity == 0){
				Swal.fire({icon: 'warning',text: '옵션값을 선택해주세요.'});
			}else{
				let form = $('<form></form>');
					form.attr('action', 'order');
					form.attr('method', 'post');
					form.appendTo('body');
					form.append($('<input type="hidden" value="' + $('#uIdx').val() + '" name="uIdx">'));
					form.append($('<input type="hidden" value="' + $('#pIdx').val() + '" name="pIdx">'));
					form.append($('<input type="hidden" value="' + param.option1Quantity + '" name="option1Quantity">'));
					form.append($('<input type="hidden" value="' + param.option2Quantity + '" name="option2Quantity">'));
					form.append($('<input type="hidden" value="' + param.option3Quantity + '" name="option3Quantity">'));
					form.append($('<input type="hidden" value="' + param.option4Quantity + '" name="option4Quantity">'));
					form.append($('<input type="hidden" value="' + param.option1 + '" name="option1">'));
					form.append($('<input type="hidden" value="' + param.option2 + '" name="option2">'));
					form.append($('<input type="hidden" value="' + param.option3 + '" name="option3">'));
					form.append($('<input type="hidden" value="' + param.option4 + '" name="option4">'));
					form.submit();
					}
				});
			});

</script>
</body>
</html>