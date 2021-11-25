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
	 			<h5>상품목록(상품갯수)</h5>
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
			    <tr>
		  		    <td><input type="checkbox"></td>
		  		    <td>이미지</td>
			        <td>상품정보</td>
			        <td>판매가</td>
			        <td>수량</td>
			        <td>배송구분</td>
			        <td>배송비</td>
			        <td>합계</td>
			        <td>선택</td>
			    </tr>
			  </tbody>
			  <tfoot>
				<tr class="sumTextTr">
					<td class="sumText" colspan="9"><span><span>상품구매금액</span><span>상품금액+</span><span>배송비</span><span>배송비=</span>
					 <span>합계:</span><span>총금액</span></span></td>
				</tr>				  
			  </tfoot>
			</table>
	 		</div>
	 	</div>
	 </div>
	 	
<%@ include file="../footer.jsp"%>

</body>
</html>