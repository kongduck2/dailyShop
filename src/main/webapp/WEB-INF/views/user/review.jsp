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

<div class="container" style="height: 1300px; overflow : auto;">
	<div class="row">
	<h2 class="text-center">사용후기</h2>
		<div class="col">
		<!-- foreach -->
			<c:forEach var="item" items="${list }">
				<ul class="reviewList">
					<li>
						<div class="reviewTuhmnail">
							<a href="#"><img alt="썸네일" src="/upload/${item.thumbnailImg }"></a>		
						</div>
						
						<div class="reviewText">
							<div>
								<span class="productName">${item.productName }</span>
							</div>
							<div>
								<div class="foldedText">
									<div class="shortText"><span>${item.content }</span>
									</div>
									<a href="javascript:void(0);" class="more">-더보기</a>
								</div>
								<div class="openText">
									<div class="longText"><span>${item.content }</span>
									<div><img alt="유저이미지" src="/upload/${item.contentImg }">
									</div>
									<a href="javascript:void(0);" class="fold">-접기</a>
								</div>
								 </div>
							</div>
						</div>
						
						<div class="reviewWriter"> <!-- 별점 표시 -->
							<div>
							<c:if test="${item.starRating ==1}">
								<span><label></label></span>
							</c:if>	
							<c:if test="${item.starRating ==2}">
								<span><label></label><label></label></span>
							</c:if>	
							<c:if test="${item.starRating ==3}">
								<span><label></label><label></label><label></label></span>
							</c:if>	
							<c:if test="${item.starRating ==4}">
								<span><label></label><label></label><label></label><label></label></span>
							</c:if>	
							<c:if test="${item.starRating ==5}">
								<span><label></label><label></label><label></label><label></label><label></label></span>
							</c:if>	
							</div>
							<div>
								<span>${item.writer }</span>
							</div>
							<c:if test="${item.contentImg != null}"> 
							<div class="reviewContentImg"> 
								<a href="#"><img alt="유저이미지" src="/upload/${item.contentImg }"></a>		
							</div>
							</c:if>
						</div>
					</li>
				</ul>
			</c:forEach>	
		</div>
	</div>
</div>

<%@ include file="../footer.jsp"%>
<script type="text/javascript">

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
	

</script>
</body>
</html>