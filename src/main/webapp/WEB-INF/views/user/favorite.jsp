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
				    <td scope="col">합계</td>
			    </tr>
			  </thead>
			  <tbody>
			  <!--<c:if test="0">
			  	<tr class="emptyFavorite">
			  		<td colspan="9"> <i class="fas fa-shopping-basket fa-2x"></i> 관심상품 목록이 비어 있습니다.</td>
			  	</tr>
			  </c:if>-->
		  		    <!--<c:forEach var="item" items="${list}" varStatus="status">-->
			    		<tr class="" id="">
				  		    <td><input type="checkbox" name="check" class="check"></td>
			  				<td><a href="detail?idx=1"><img class="" alt="썸네일 이미지" src="#">d
			  				</a></td>
					        <td class=""><span>상품명</span></td>
					        <td id="">가격	</td>
					        <td>기본배송</td>
					        <td class="">3,000원</td>
					        <td class="">합계가격</td>
			 		   </tr>
		  		    <!--</c:forEach>-->
			  </tbody>
			</table>
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
</script>
</body>
</html>