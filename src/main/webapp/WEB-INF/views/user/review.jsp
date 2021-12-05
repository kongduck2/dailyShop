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
								<div id="foldedText">
									<div class="shortText"><span>${item.content }</span>
									</div>
									<a href="javascript:open();" class="more">-더보기</a>
								</div>
								<div id="openText">
									<div class="longText"><span>${item.content }</span>
									<div><a href="#"><img alt="유저이미지" src="/upload/${item.contentImg }"></a>
									</div>
									<a href="javascript:fold();" class="fold">-접기</a>
								</div>
								 </div>
							</div>
						</div>
						
						<div class="reviewWriter">
							<div>
								<span>${item.starRating }</span>
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
	let foldText = document.getElementById('foldedText');
	let openText = document.getElementById('openText');
	
	function open() {
		foldText.style.display = 'none';
		openText.style.display = 'block';
	}
	
	function fold() {
		foldText.style.display = 'block';
		openText.style.display = 'none';
	}

</script>
</body>
</html>