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
		<input type="number" name="price" placeholder="가격 ex)00000" required>
		<span style="color: gray; font-size: 12px"> 단독 상품일경우 옵션명 기재 X</span>
	 </div>
	 <div>	
		<input type="text" name="option1" placeholder="옵션명1">
		<input type="text" name="option2" placeholder="옵션명2">
	 </div>
	 <div>	
		<input type="text" name="option3" placeholder="옵션명3">
		<input type="text" name="option4" placeholder="옵션명4">
	 </div>
	 <div class="file-div">	
		<label for="files" class="form-label">썸네일 이미지 등록</label>
		<input name="files" type="file" id="files" accept="image/*" onchange="setImg(event);" required>
	 </div>
	 <div class="file-div">	 
		<label for="files" class="form-label">제품상세 이미지 등록1</label>
		<input name="files" type="file" id="files" accept="image/*" onchange="setImg(event);" required>
	 </div>
	 <div class="file-div">	 
		<label for="files" class="form-label">제품상세 이미지 등록2</label>
		<input name="files" type="file" id="files" accept="image/*" onchange="setImg(event);">
	 </div>
	 <div class="file-div">	 
		<label for="files" class="form-label">제품상세 이미지 등록3</label>
		<input name="files" type="file" id="files" accept="image/*" onchange="setImg(event);">
	 </div>
		 <div id="imageContainer">이미지 미리보기 </div>
	 <div>	 
		<input type="submit" value="등록" >
	 </div>	
	</form>

<%@ include file="../footer.jsp"%>


</body>
</html>