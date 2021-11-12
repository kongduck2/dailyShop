<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>댕냥이의 일상</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css?v=3">
<!-- 부트스트랩 css 사용 -->
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css?v=3">
 <!-- 부트스트랩 js 사용 -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.js"></script>
</head>
<body>
<header>
		<!-- logo -->
		<div id="header-first">
			<div id="#">
				<a href="#"><img
					src="#" id="#" /></a>
			</div>
		</div>
		<!-- 네비게이션 바 -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            강아지
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#">사료</a></li>
            <li><a class="dropdown-item" href="#">간식</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">장난감</a></li>
            <li><a class="dropdown-item" href="#">패션</a></li>
            <li><a class="dropdown-item" href="#">미용·목욕</a></li>
            <li><a class="dropdown-item" href="#">외출</a></li>
          </ul>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            고양이
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#">사료</a></li>
            <li><a class="dropdown-item" href="#">간식</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">장난감</a></li>
            <li><a class="dropdown-item" href="#">패션</a></li>
            <li><a class="dropdown-item" href="#">미용·목욕</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">사용후기</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">고객센터</a>
        </li>
      </ul>
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="상품명을 입력하세요" aria-label="Search">
        <button class="btn btn-outline-primary" type="submit">search</button>
      </form>
    </div>
  </div>
</nav>
		
		
	</header>

</body>
</html>