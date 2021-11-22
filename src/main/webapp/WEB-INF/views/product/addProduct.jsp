<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댕냥이의 일상</title>

<script> function setImg(event) {
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
</script>

</head>
<body>

<%@ include file="../header.jsp"%>


	<form action="addProduct" method="post" enctype="multipart/form-data" class="addForm">
	 <div>
		<input type="text" name="name" placeholder="상품명" required>
		<select name="category" required>
		    <option value="x">카테고리</option>
		    <option value="d-feed">강아지 사료</option>
		    <option value="d-snack">강아지 간식 </option>
		    <option value="d-fashion">강아지 패션</option>
		    <option value="d-toy">강아지 장난감</option>
		    <option value="d-walk">강아지 외출</option>
		    <option value="c-feed">고양이 사료</option>
		    <option value="c-snack">고양이 간식</option>
		    <option value="c-fashion">고양이 패션</option>
		    <option value="c-toy">고양이 장난감</option>
		</select>
	 </div>
	 <div>	
		<input type="number" name="price" placeholder="가격 " required>
	 </div>
	 <div class="file-div">	
		<label for="files" class="form-label">썸네일 이미지 등록</label>
		<input name="files" type="file" id="files" accept="image/*" onchange="setImg(event);" required>
	 </div>
	 <div class="file-div">	 
		<label for="files" class="form-label">제품상세 이미지 등록</label>
		<input name="files" type="file" id="files" accept="image/*" onchange="setImg(event);" required>
	 </div>
		 <div id="imageContainer">이미지 미리보기 </div>
	 <div>	 
		<input type="submit" value="등록" >
	 </div>	
	</form>

<%@ include file="../footer.jsp"%>


</body>
</html>