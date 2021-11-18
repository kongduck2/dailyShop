<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 제이쿼리 라이브러리 가져오기 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 카카오 주소 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/regist.js"></script>

</head>
<body>
<!-- header -->
<%@ include file="../header.jsp"%>

<div class="regist-form">
	<form class="row g-4" action="userRegist" onsubmit="return registCheck()" id="joinForm" method="post">
	<h3>회원등록</h3>
	<input type="hidden" name="regist_type" value="${kakao}"/> <!-- 카카오 회원가입시 넘어가는값 1 기본 회원가입시 0  -->
	  <div class="col-md-5">
	    <label for="email" class="form-label">* 이메일(아이디)</label>
	    <input name="email" type="email" class="form-control" id="email" required>
	    <div id="idCheckMsg"></div>
	  <button type="button" id="checkbtn" class="btn btn-primary">중복확인</button>
	  </div>
	  <div class="col-md-5">
	    <label for="password" class="form-label">* 비밀번호</label>
	    <input name="password" type="password" class="form-control" id="password" required>
	    <label for="password2" class="form-label">* 비밀번호 확인</label>
	    <input name="password2" type="password" class="form-control" id="password2" required>
	    <label id="pwCheckMsg"></label>
	  </div>
	  <div class="col-12">
	    <label for="address" class="form-label">* 주소</label> <!-- 카카오 주소 api 사용 -->
	    <input name="address" type="text" class="form-control" id="address" required>
	    <label for="addressDetail" class="form-label">상세주소</label> 
	    <input name="addressDetail" type="text" class="form-control" id="addressDetail" >
	  </div>
	  <div class="col-md-6">
	    <label for="name" class="form-label">* 이름</label>
	    <input name="name" type="text" class="form-control" id="name" required>
	  </div>
	  <div class="col-md-3">
	    <label for="phone" class="form-label">* 휴대전화('-' 제외)</label>
	    <input name="phone" type="text" class="form-control" id="phone" maxlength="11">
	     <label id="pnCheckMsg"></label>
	  </div>
	  
	  <!-- 회원가입 약관  -->
    <ul class="join_box">
      <li class="checkBox check01">
          <ul class="checkAllInput">
            <li>이용약관, 개인정보 수집 및 이용,프로모션 안내 메일 수신(선택)에 모두 동의합니다.</li>
                <li class="checkAllBtn">
                    <input type="checkbox" name="checkAll" id="checkAll" class="checkAll"  onclick="cAll()">
             </li>
           </ul>
          <textarea readonly>
                    제1조(목적)
이 약관은 센시블(전자상거래 사업자)이 운영하는 댕냥이의 일상(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리.의무 및 책임사항을 규정함을 목적으로 합니다.
※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」
제2조(정의)
① “몰”이란 OO 회사가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.
② “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
③ ‘회원’이라 함은 “몰”에 회원등록을 한 자로서, 계속적으로 “몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.
④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.
제3조 (약관 등의 명시와 설명 및 개정)
① “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호.모사전송번호.전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보보호책임자등을 이용자가 쉽게 알 수 있도록 00 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.
② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회.배송책임.환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.
③ “몰”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
④ “몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 “몰“은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.
⑤ “몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 “몰”에 송신하여 “몰”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.
⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.
       </textarea>
                </li>
                <li class="checkBox check02">
                    <ul class="checkInput">
                        <li>이용약관 동의(필수)</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="checkAllow" id="checkAllow" value="checkAllow">
                        </li>
                    </ul>
 
                    <textarea readonly>
                    1. 개인정보 수집목적 및 이용목적
가. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산
콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송 , 금융거래 본인 인증 및 금융 서비스
나. 회원 관리
회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지 , 가입 의사 확인 , 연령확인 , 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 불만처리 등 민원처리 , 고지사항 전달
2. 수집하는 개인정보 항목 : 이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 , 자택 전화번호 , 휴대전화번호 , 이메일 , 14세미만 가입자의 경우 법정대리인의 정보
3. 개인정보의 보유기간 및 이용기간
원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.
가. 회사 내부 방침에 의한 정보 보유 사유
o 부정거래 방지 및 쇼핑몰 운영방침에 따른 보관 : OO년
나. 관련 법령에 의한 정보보유 사유
o 계약 또는 청약철회 등에 관한 기록
-보존이유 : 전자상거래등에서의소비자보호에관한법률
-보존기간 : 5년
o 대금 결제 및 재화 등의 공급에 관한 기록
-보존이유: 전자상거래등에서의소비자보호에관한법률
-보존기간 : 5년 
o 소비자 불만 또는 분쟁처리에 관한 기록
-보존이유 : 전자상거래등에서의소비자보호에관한법률
-보존기간 : 3년 
o 로그 기록 
-보존이유: 통신비밀보호법
-보존기간 : 3개월
※ 동의를 거부할 수 있으나 거부시 회원 가입이 불가능합니다.
       </textarea>
                </li>
                <li class="checkBox check03">
                    <ul class="checkInput">
                        <li>개인정보 수집 및 이용에 대한 안내(필수)</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="checkInfo" id="checkInfo" value="checkInfo" >
                        </li>
                    </ul>
 
                    <textarea readonly>할인쿠폰 및 혜택, 이벤트, 신상품 소식 등 쇼핑몰에서 제공하는 유익한 쇼핑정보를 SMS나 이메일로 받아보실 수 있습니다.
단, 주문/거래 정보 및 주요 정책과 관련된 내용은 수신동의 여부와 관계없이 발송됩니다.
선택 약관에 동의하지 않으셔도 회원가입은 가능하며, 회원가입 후 회원정보수정 페이지에서 언제든지 수신여부를 변경하실 수 있습니다.
       </textarea>
                </li>
                <li class="checkBox check04">
                    <ul class="checkInput">
                        <li>이벤트 등 프로모션 알림 메일 수신(선택)</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="checkPromotion" id="checkPromotion" value="checkPromotion">
                        </li>
                    </ul>
                </li>
            </ul>
	  <div class="col-12" >
	    <button type="submit" class="btn btn-success" id="regist-btn" disabled>회원가입</button>
	  </div>
	</form>
</div>

<!-- footer -->
<%@ include file="../footer.jsp"%>

</body>
</html>