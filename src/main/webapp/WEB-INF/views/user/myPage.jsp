<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댕냥이의 일상</title>
</head>
<body>

<%@ include file="../header.jsp"%>


<div class="container">
	<div class="row" style="height: 150px;">
		<div class="col">
			<div>
				<span>[<b>${user.name}</b>]님 저희 쇼핑몰을 이용해 주셔서 감사합니다.</span><br>
				<span>원하시는 메뉴를 클릭하시면 해당 페이지로 이동됩니다.</span>
			</div>		
		</div>
	</div>
	<div class="row" id="myPageBox">
		<div class="col"><a href="orderList">주문내역조회</a></div>
		<div class="col"><a href="cart">장바구니</a></div>
		<div class="col"><a href="favorite">관심상품</a></div>
	</div>
</div>



<%@ include file="../footer.jsp"%>

</body>
</html>