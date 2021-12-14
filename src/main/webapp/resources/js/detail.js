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
		let pIdx = document.getElementById('pIdx').value;
		console.log(pIdx);
    	Swal.fire({icon: 'info',
    		text: '로그인 후 이용가능합니다.',	}).then(function(){
    			location.href='login?pIdx='+pIdx;
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

	//상품후기
		$(document).ready(function () { //더보기
			$('.more').on('click',function(){
				$(this).parent().css('display','none');
				$(this).parent().next().css('display','block');
			})
		})
		
		$(document).ready(function () { //접기
			$('.fold').on('click',function(){
				$(this).parent().parent().css('display','none');
				$(this).parent().parent().prev().css('display','block');
			})
		})
		

	