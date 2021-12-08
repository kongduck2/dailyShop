<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
</head>
<body>
<%@ include file="../header.jsp"%>

<div class="container">
	<div class="row">
		<div class="col">
			<form action="writeReview" method="post" enctype="multipart/form-data" id="writeForm">
				<input type="hidden" value="${order.productName }" name="productName">     
				<input type="hidden" value="${order.thumbnailImg }" name="thumbnailImg">
				<input type="hidden" name="starRating" id="rate" value="0"/>
			<div class="reviewOpBox"><img class="thumbnail" alt="썸네일 이미지" src="/upload/${order.thumbnailImg}">
			<div><span>${order.productName }</span><div class="cartOpText">${order.productOpName }</div>
				 </div>
			 </div>
	             <div class="rating">
	             <div>별점</div>
	                <input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점" checked>
	                <label for="rating1" ></label>
	                <input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점">
	                <label for="rating2"></label>
	                <input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점" >
	                <label for="rating3"></label>
	                <input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점">
	                <label for="rating4"></label>
	                <input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점">
	                <label for="rating5"></label>
	            </div>
				<div class="contentBox"><div class="contentText">내용</div>
				 <textarea class="review_textarea" rows="12" cols="80" name="content" ></textarea></div>
				<div class="filebox">
				    <input class="upload-name" placeholder="첨부파일(선택)" readonly>
				    <label for="file">사진첨부</label> 
				    <input type="file" id="file" name="file" accept="image/*" onchange="setImg(event);">
				</div>
				<div id="imageContainer"></div>
				<div><input type="submit" value="리뷰등록" id="writeBtn"></div>
			</form>
		</div>
	</div>
</div>

<%@ include file="../footer.jsp"%>
<script type="text/javascript">

function setImg(event) {
	for (var image of event.target.files) {
		var reader = new FileReader();
		
		reader.onload = function(event) {
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			document.querySelector("div#imageContainer").appendChild(img);
			};
			console.log(image);
			reader.readAsDataURL(image); 
			}
	
}
//사진첨부시 경로표시
$("#file").on('change',function(){
	  var fileName = $("#file").val();
	  $(".upload-name").val(fileName);
	});


//별점 마킹 모듈 프로토타입으로 생성
function Rating(){};
Rating.prototype.rate = 0;
Rating.prototype.setRate = function(newrate){
    //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
    this.rate = newrate;
    let items = document.querySelectorAll('.rate_radio');
    items.forEach(function(item, idx){
        if(idx < newrate){
            item.checked = true;
        }else{
            item.checked = false;
        }
    });
}
let rating = new Rating();//별점 인스턴스 생성

document.addEventListener('DOMContentLoaded', function(){
    //별점선택 이벤트 리스너
    document.querySelector('.rating').addEventListener('click',function(e){
        let elem = e.target;
        let result = document.getElementById('rate');
        console.log(elem);
        console.log(elem.value);
        if(elem.classList.contains('rate_radio')){
            rating.setRate(parseInt(elem.value));
            result.value = rating.rate
        }
    })
});

</script>
</body>
</html>