<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<link rel="stylesheet" href="resources/css/join.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>

<!-- header -->
		<%@include file="../includes/main/header.jsp"%> 
		
		<div class="content_area">
			<div class="wrapper">
				<form id="update_form" method="post">
				<div class="wrap">
						<div class="subjecet">
							<span>회원정보 수정</span>
						</div>
						 <input type="hidden" value="${member.uid}" id="uid" name="uid"><br>
						<div class="user_wrap">
							<div class="user_name">이름</div>
							<div class="user_input_box">
								<input class="user_input" id="name" name="name">
							</div>
						</div>
						
						<div class="mail_wrap">
							<div class="mail_name">이메일</div> 
							<div class="mail_input_box">
								<input class="mail_input" id="email" name="email">
							</div>
						</div>

						<div class="phone_wrap">
							<div class="phone_name">휴대전화</div>
							<div class="phone_input_box">
								<input class="phone_input" id="phone" name="phone">
							</div>
						</div>

						<div class="address_wrap">
							<div class="address_name">주소</div>
							<div class="address_input_1_wrap">
								<div class="address_input_1_box">
									<input class="address_input_1" id="address1" name="address1" readonly="readonly">
								</div>
								<div class="address_button" onclick="execution_daum_address()">
									<span>주소 찾기</span>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class ="address_input_2_wrap">
								<div class="address_input_2_box">
									<input class="address_input_2" id="address2" name="address2" readonly="readonly">
								</div>
							</div>
							<div class ="address_input_3_wrap">
								<div class="address_input_3_box">
									<input class="address_input_3" id="address3" name="address3" readonly="readonly">
								</div>
							</div>
						</div>
						
						<div class="update_button_wrap">
							<input type="button" class="update_button" value="수정하기">
							<input type="button" class="back_button" value="돌아가기">
						</div>
					</div>
				</form>
			</div>
		</div>
		
		<!-- footer -->
		<%@include file="../includes/admin/footer.jsp"%>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
/* $(".back_button").clicl(function() {
	$("")
}) */


var nameCheck = false;            // 이름
var phoneCheck = false;			  // 핸드폰번호
var emailCheck = false;            // 이메일
var address1Check = false;		  // 주소1
var address2Check = false;		  // 주소2
var address3Check = false;		  // 주소3


$(".update_button").click(function() {
	var name = $('.name_input').val();
	var phone = $('.phone_input').val();
	var email = $('.mail_input').val();
	var address1 = $('.address1_input').val();
	var address2 = $('.address2_input').val();
	var address3 = $('.address3_input').val();
	
	if(name == "") {
		nameCheck = false;
	} else {
		nameCheck = true;
	}
	
	if(phone == "") {
		phoneCheck = false;
	} else {
		phoneCheck = true;
	}
	
	if(email == "") {
		emailCheck = false;
	} else {
		emailCheck = true;
	}
	
	if(address1 == "") {
		address1Check = false;
	} else {
		address1Check = true;
	}
	
	if(address2 == "") {
		address2Check = false;
	} else {
		address2Check = true;
	}
	
	if(address3 == "") {
		address3Check = false;
	} else {
		address3Check = true;
	}
	
	if(nameCheck && phoneCheck && emailCheck && address1Check && address2Check && address3Check) {
		$("#update_form").attr("action", "/bookshop/member/update.do");
		$("#update_form").submit(); 
		alert("회원정보 수정 완료");
	} else {
		alert("변경할 값을 모두 입력해주세요.");
	}
	
	return false;
	
})

// 다음 주소 연동
function execution_daum_address(){
	new daum.Postcode({
        oncomplete: function(data) {
        	// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                addr += extraAddr;
            
            } else {
            	 addr += ' ';
            }
            $(".address_input_1").val(data.zonecode);
            $(".address_input_2").val(addr);
            // 커서를 상세주소 필드로 이동한다.
            $(".address_input_3").attr("readonly",false);
            $(".address_input_3").focus();
        }
    }).open();
}
</script>

</body>
</html>