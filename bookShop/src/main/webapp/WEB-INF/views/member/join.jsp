<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<link rel="stylesheet" href="resources/css/join.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>

<div class="wrapper">
	<form id="join_form" method="post">
	<div class="wrap">
			<div class="subjecet">
				<span>회원가입</span>
			</div>
			<div class="uid_wrap">
				<div class="uid_name">아이디</div>
				<div class="uid_input_box">
					<input class="uid_input" id="uid" name="uid">
				</div>
				<span class="uid_input_re_1">사용 가능한 아이디입니다.</span>
				<span class="uid_input_re_2">아이디가 이미 존재합니다.</span>
			</div>
			<span class="final_uid_ck">아이디를 입력해주세요.</span>
			<div class="pwd_wrap">
				<div class="pwd_name">비밀번호</div>
				<div class="pwd_input_box">
					<input class="pwd_input" name="pwd">
				</div>
			</div>
			<div class="pwdck_wrap">
				<div class="pwdck_name">비밀번호 확인</div>
				<div class="pwdck_input_box">
					<input class="pwdck_input" name="pwd1">
				</div>
			</div>
			<span class="final_pwd_ck">비밀번호를 입력해주세요.</span>
			<span class="pwdck_input_re_1">비밀번호가 일치합니다.</span>
            <span class="pwdck_input_re_2">비밀번호가 일치하지 않습니다.</span>
			<div class="user_wrap">
				<div class="user_name">이름</div>
				<div class="user_input_box">
					<input class="user_input" name="name">
				</div>
			</div>
			<span class="final_name_ck">이름을 입력해주세요.</span>
			<div class="mail_wrap">
				<div class="mail_name">이메일</div> 
				<div class="mail_input_box">
					<input class="mail_input" name="email">
				</div>
				<div class="mail_check_wrap">
					<div class="mail_check_input_box" id="mail_check_input_box_false">
						<input class="mail_check_input" disabled="disabled">
					</div>
					<div class="mail_check_button">
						<span>인증번호 전송</span>
					</div>
					<div class="clearfix"></div>
					<span id="mail_check_input_box_warn"></span>
				</div>
			</div>
			<span class="final_mail_ck">이메일을 입력해주세요.</span>
			<div class="phone_wrap">
				<div class="phone_name">휴대전화</div>
				<div class="phone_input_box">
					<input class="phone_input" name="phone">
				</div>
			</div>
			<span class="final_phone_ck">휴대전화 번호를 입력해주세요.</span>
			<div class="address_wrap">
				<div class="address_name">주소</div>
				<div class="address_input_1_wrap">
					<div class="address_input_1_box">
						<input class="address_input_1" name="address1" readonly="readonly">
					</div>
					<div class="address_button" onclick="execution_daum_address()">
						<span>주소 찾기</span>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class ="address_input_2_wrap">
					<div class="address_input_2_box">
						<input class="address_input_2" name="address2" readonly="readonly">
					</div>
				</div>
				<div class ="address_input_3_wrap">
					<div class="address_input_3_box">
						<input class="address_input_3" name="address3" readonly="readonly">
					</div>
				</div>
			</div>
			<span class="final_address_ck">주소를 입력해주세요.</span>
			<div class="join_button_wrap">
				<input type="button" class="join_button" value="가입하기">
			</div>
		</div>
	</form>
</div>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
var code = ""; // 이메일 전송 인증번호 저장용

/* 유효성 검사 통과유무 변수 */
var uidCheck = false;            // 아이디
var uidckCheck = false;            // 아이디 중복 검사
var pwdCheck = false;            // 비번
var pwdckCheck = false;            // 비번 확인
var pwdckcorCheck = false;        // 비번 확인 일치 확인
var nameCheck = false;            // 이름
var phoneCheck = false;
var mailCheck = false;            // 이메일
var mailnumCheck = false;        // 이메일 인증번호 확인
var addressCheck = false         // 주소

/* $(document).ready(function(){
//회원가입 버튼(회원가입 기능 작동)
$(".join_button").click(function(){
	$("#join_form").attr("action", "/bookshop/member/join.do");
	$("#join_form").submit();
});
}); */

//회원가입 버튼(회원가입 기능 작동)
$(".join_button").click(function(){
	  /* 입력값 변수 */
    var uid = $('.uid_input').val();               // id 입력란
    var pwd = $('.pwd_input').val();               // 비밀번호 입력란
    var pwdck = $('.pwdck_input').val();          // 비밀번호 확인 입력란
    var name = $('.user_input').val();            // 이름 입력란
    var phone = $('.phone_input').val();	      // 휴대폰 번호 입력란
    var email = $('.mail_input').val();  		  // 이메일 입력란
    var address = $('.address_input_3').val();    // 주소 입력란
    
    /* 아이디 유효성검사 */
   	if(uid == ""){
        $('.final_uid_ck').css('display','block');
        uidCheck = false;
    }else{
        $('.final_uid_ck').css('display', 'none');
        uidCheck = true;
    }
    
    /* 비밀번호 유효성 검사 */
    if(pwd == ""){
        $('.final_pwd_ck').css('display','block');
        pwdCheck = false;
    }else{
        $('.final_pwd_ck').css('display', 'none');
        pwdCheck = true;
    }
    
    /* 비밀번호 확인 유효성 검사 */
    if(pwdck == ""){
        $('.final_pwdck_ck').css('display','block');
        pwdckCheck = false;
    }else{
        $('.final_pwdck_ck').css('display', 'none');
        pwdckCheck = true;
    }
    
    /* 이메일 유효성 검사 */
    if(email == ""){
        $('.final_mail_ck').css('display','block');
        mailCheck = false;
    }else{
        $('.final_mail_ck').css('display', 'none');
        mailCheck = true;
    }
    
    /* 최종 유효성 검사 */
    if(uidckCheck && pwdckCheck && mailnumCheck){
    	 $("#join_form").attr("action", "/bookshop/member/join.do");
         $("#join_form").submit();  
    } else {
    	alert("다시 시도해주세요.")
    }
    
    return false;

});


//아이디 중복검사
$('.uid_input').on("propertychange change keyup paste input", function(){
	var uid = $('.uid_input').val();			// .id_input에 입력되는 값
	var data = {uid : uid}				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
	
	$.ajax({
		type : "post",
		url : "/bookshop/member/memberIdChk",
		data : data,
		success : function(result){
			
			 if(result != 'fail'){
				$('.uid_input_re_1').css("display","inline-block");
				$('.uid_input_re_2').css("display", "none");	
				uidckCheck = true;
			} else {
				$('.uid_input_re_2').css("display","inline-block");
				$('.uid_input_re_1').css("display", "none");			
				uidckCheck = false;
			} 
		}
	});
});

/* 비밀번호 확인 일치 유효성 검사 */
$('.pwdck_input').on("propertychange change keyup paste input", function(){
        
	var pwd = $('.pwd_input').val();
    var pwdck = $('.pwdck_input').val();
    $('.final_pwdck_ck').css('display', 'none');
    
    if(pwd == pwdck){
        $('.pwdck_input_re_1').css('display','block');
        $('.pwdck_input_re_2').css('display','none');
        pwdckCheck = true;
    }else{
        $('.pwdck_input_re_1').css('display','none');
        $('.pwdck_input_re_2').css('display','block');
        pwdckCheck = false;
    }   
});    
 


/* 인증번호 이메일 전송 */
$(".mail_check_button").click(function(){
	var email = $(".mail_input").val();            // 입력한 이메일
    var cehckBox = $(".mail_check_input");        // 인증번호 입력란
    var boxWrap = $(".mail_check_input_box");    // 인증번호 입력란 박스
    
	$.ajax({
        type:"GET",
        url:"mailCheck?email=" + email,
        success: function(data) {
        	/* console.log("data : " + data); */
        	cehckBox.attr("disabled",false);
        	boxWrap.attr("uid", "mail_check_input_box_true");
        	
        	code = data;
        }
                
    });
});


/* 인증번호 비교 */
$(".mail_check_input").blur(function(){
	var inputCode = $(".mail_check_input").val();         // 입력코드    
    var checkResult = $("#mail_check_input_box_warn");    // 비교 결과     
    
    if (inputCode == code) {
    	checkResult.html("인증번호가 일치합니다.");
        checkResult.attr("class", "correct"); 
        mailnumCheck = true;
    } else {
    	checkResult.html("인증번호를 다시 확인해주세요.");
        checkResult.attr("class", "incorrect"); 
        mailnumCheck = false;
    }
});


/* 다음 주소 연동 */
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
            //$("[name=memberAddr1]").val(data.zonecode);    // 대체가능
            $(".address_input_2").val(addr);
            //$("[name=memberAddr2]").val(addr);            // 대체가능
            // 커서를 상세주소 필드로 이동한다.
            $(".address_input_3").attr("readonly",false);
            $(".address_input_3").focus();
        }
    }).open();
}

</script>

</body>
</html>