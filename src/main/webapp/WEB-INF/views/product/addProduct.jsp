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


	<form action="addProduct" method="post" enctype="multipart/form-data">
		<input type="text" name="name" placeholder="상품명" required>
		<select name="category" required>
		    <option value="x">카테고리</option>
		    <option value="d-feed">강아지 사료</option>
		    <option value="d-snack">강아지 간식 </option>
		    <option value="d-fashion">강아지 패션</option>
		    <option value="d-care">강아지 미용·목욕</option>
		    <option value="d-walk">강아지 외출</option>
		    <option value="c-feed">고양이 사료</option>
		    <option value="c-snack">고양이 간식</option>
		    <option value="c-fashion">고양이 패션</option>
		    <option value="c-care">고양이 미용·목욕</option>
		</select>
		<input type="text" name="price" placeholder="가격 " required>
		<br>
		 <br> 
		<table id="fileview">
		<tr><td><input name="files" type="file"  accept="image/*"  
		 placeholder="썸네일 이미지 파일" required></td></tr>
		<tr><td><input name="files" type="file"  accept="image/*"  
		 placeholder="상세 이미지 파일" required></td></tr>
		</table>
		<input type="submit" value="전송">
	</form>

<%@ include file="../footer.jsp"%>


</body>
</html>