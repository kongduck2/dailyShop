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
	  param.pIdx = select.nextSibling.nextSibling.value; //<input class="pIdx" 
		$.ajax({
			type: 'POST',
			url: 'delFavorite',
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
  // 관심목록 전체삭제
 	function removeAll(){
	  Swal.fire({
		  text: "관심상품 목록을 비우시겠습니까?",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '예',
		  cancelButtonText: '아니오'
		}).then((result) => {
		  if (result.isConfirmed) {
		    Swal.fire({
		      text:'관심상품 목록을 비웠습니다.',
		      icon:'success'
		    }).then(function(){
			let param = new Object();
			$.ajax({
				type: 'POST',
				url: 'delAllFavorite',
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
  }  
		  