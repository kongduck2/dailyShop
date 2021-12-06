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
	 		<h2 class="text-center">관심상품</h2>
	 		<div class="col">
	 		<table class="table table-borderless">
			  <thead>
			    <tr class="cartTitleTr">
				    <td scope="col"><input type="checkbox" id="checkAll" onclick="cAll()"></td>
				    <td scope="col">이미지</td>
				    <td scope="col">상품정보</td>
				    <td scope="col">판매가</td>
				    <td scope="col">배송구분</td>
				    <td scope="col">배송비</td>
				    <td scope="col">선택</td>
			    </tr>
			  </thead>
			  <tbody class="favoriteTb">
			  <c:if test="${fCount == 0 }">
			  	<tr class="emptyFavorite">
			  		<td colspan="9"> <i class="fas fa-search fa-2x"></i>  관심상품 목록이 비어 있습니다.</td>
			  	</tr>
			  </c:if>
		  		    <c:forEach var="item" items="${list}" varStatus="status">
			    		<tr class="favoriteListTr" id="">
				  		    <td><input type="checkbox" name="check" class="check"></td>
			  				<td><a href="detail?idx=${item.idx }"><img class="thumbnail" alt="썸네일 이미지" src="/upload/${item.thumbnailImg}">
			  				</a></td>
					        <td class="pInfo"><a href="detail?idx=${item.idx }"><span>${item.name }</span></a></td>
					        <td id="">${item.price }원</td>
					        <td>기본배송</td>
					        <td>3,000원</td>
					        <td class="selectBtnTd"> <div><button type="button" class="selectBtn" onclick="remove(this)">삭제</button>
					        	<input type="hidden" value="${item.idx}"></div></td>
			 		   </tr>
		  		    </c:forEach>
			  </tbody>
			</table>
			<c:if test="${fCount > 0 }">
			<div style="text-align: left;"><button style="width: 150px; height: 27px; font-size: 14px" 
				type="button" class="selectBtn" onclick="removeAll()">관심목록 비우기</button></div>
	 		</c:if>
	 		</div>
	 	</div>
	 </div>
	 
<%@ include file="../footer.jsp"%>
<script type="text/javascript" >
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
					alert('관심상품이 삭제되었습니다.');
				},
				error:function(request,status,error){
			        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			    }
	  })//ajax end
  }  
  // 관심목록 전체삭제
 	function removeAll(){
			let param = new Object();
		$.ajax({
			type: 'POST',
			url: 'delAllFavorite',
			contentType: 'application/x-www-form-urlencoded; charset=utf-8',
			data:param, 
				success: function(){
					location.reload();
				alert('관심상품 목록을 비웠습니다.');
				},
				error:function(request,status,error){
			        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			    }
	  })//ajax end
  }  
		  
</script>
</body>
</html>