<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css?v=3">
<meta charset="UTF-8">
<title>댕냥이의 일상</title>
</head>
<body style="background-color: white;">
	<div class="container">
		<div class="row" id="findIdDiv">
			<h3>아이디 찾기</h3>
				<form method="post" action="findId" id="findIdForm">
					 <div>
						<input type="text" name="name"  placeholder="이름을 입력해주세요." required>
					 </div>
					 <div>
						<input type="number" name="phone"  placeholder="핸드폰번호를 입력해주세요." maxlength="11" required>
					</div>
					 <div class="findBtnDiv">
						<input type="submit" value="아이디찾기">
						<input type="button" value="취소" onclick="window.close()">
					 </div>		<!-- 찾는 아이디가 있을때 -->
						<c:if test="${result == '1'}" > 
							<div style="margin-top: 15px;">
								<p>회원가입시 사용하신 아이디는[<b>${id}</b>]입니다.</p>
							</div>
						</c:if>
							<!-- 찾는 아이디가 없을 때 -->
						<c:if test="${result == '0'}" > 
							<div style="margin-top: 15px;">찾으시는 아이디가 없습니다.</div>
						</c:if>
				</form> 
		</div>
	</div>

</body>
</html>