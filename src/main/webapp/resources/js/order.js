
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
			    amount : 100,//parseInt($('#pTotalText').text().replace(',','')), //100, //실제 결제되는 가격
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
	