
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
	
	function qChange(btn){
		console.log(btn.parentNode.childNodes);
		console.log(btn.parentNode.childNodes[11].value);
		let param = new Object();
		param.quantity = btn.parentNode.childNodes[1].value;
		param.opNum = btn.parentNode.childNodes[9].value;
		param.idx = btn.parentNode.childNodes[13].value;
			
		$.ajax({
			type: 'POST',
			url: 'quanUpdate',
			contentType: 'application/x-www-form-urlencoded; charset=utf-8',
			data:param, 
				success: function(){
			    	Swal.fire({icon: 'info',
			    		text: '상품 수량이 변경되었습니다.',})
				},
				error:function(request,status,error){
			        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			    }
		  })//ajax end
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
	
	  // 장바구니 전체삭제
 	function removeAll(){
		
	Swal.fire({
		  text: "장바구니를 비우시겠습니까?",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '예',
		  cancelButtonText: '아니오'
		}).then((result) => {
		  if (result.isConfirmed) {
		    Swal.fire({
		      text:'장바구니를 비웠습니다.',
		      icon:'success'
		    }).then(function(){
			let param = new Object();
			$.ajax({
				type: 'POST',
				url: 'delAllCart',
				contentType: 'application/x-www-form-urlencoded; charset=utf-8',
				data:param, 
					success: function(){
						location.reload();
					},
					error:function(request,status,error){
				        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				    }
		  })//ajax end
	    })
	  }
	})
 }//removeAll end  
	
	function allOrder(){
    	Swal.fire({icon: 'info',
    		text: '주문서 작성 페이지로 이동합니다.',}).then(function(){
    			location.href='order';
   		})
	}
 
	function selectOrder(){ //선택상품 주문
		let check = $("input[class=check]:checked");
			if(check.length > 0){
		    	Swal.fire({icon: 'info',
	    		text: '주문서 작성 페이지로 이동합니다.',}).then(function(){
	    			
				let form = $('<form></form>');
				form.attr('action', 'selectOrder');
				form.attr('method', 'post');
				form.appendTo('body');
				for (let i = 0; i < check.length; i++) {
					let idx = check[i].nextSibling.nextSibling.value; //카트 idx값
					form.append($('<input type="hidden" value="' + idx + '" name="order'+(i+1)+'">'));
				}
				form.submit();
    		})
    		}else{
		    	Swal.fire({icon: 'warning',
		    		text: '선택된 상품이 없습니다.',})
			}
    			
   		
	}//selectOrder end 