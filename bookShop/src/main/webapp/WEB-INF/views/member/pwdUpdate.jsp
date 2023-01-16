<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<link rel="stylesheet" href="resources/css/join.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>

</head>
<body>

		<div class="subjecet">	
				<span>비밀번호 변경</span>
			
			<div class="pwd_wrap">
				<div class="pwd_name">비밀번호</div>
				<div class="pwd_input_box">
					<input type="password" class="pwd_input" id="pwd" name="pwd">
				</div>
			</div>
			
			<div class="pwdck_wrap">
				<div class="pwdck_name">비밀번호 확인</div>
				<div class="pwdck_input_box">
					<input type="password" class="pwdck_input" id="pwd1" name="pwd1">
				</div>
			</div>
			<span class="pwdck_input_re_1">비밀번호가 일치합니다.</span>
            <span class="pwdck_input_re_2">비밀번호가 일치하지 않습니다.</span>
			
			<div class="pwdUpdate_button_wrap">
				<input type="button" class="pwdUpdate_button" value="비밀번호 변경">
			</div>
		</div>

</body>

<script>

// 유효성 검사 통과유무 변수
var pwdCheck = false;            // 비번
var pwdckCheck = false;            // 비번 확인
var pwdckcorCheck = false;        // 비번 확인 일치 확인

// 비밀번호 변경 버튼(비밀번호 변경 기능 작동)
$(".pwdUpdate_button").click(function(){
	// 입력값 변수
    var pwd = $('.pwd_input').val();               // 비밀번호 입력란
    var pwdck = $('.pwdck_input').val();          // 비밀번호 확인 입력란

    
    // 비밀번호 유효성 검사
    if(pwd == ""){
        $('.final_pwd_ck').css('display','block');
        pwdCheck = false;
    }else{
        $('.final_pwd_ck').css('display', 'none');
        pwdCheck = true;
    }
    
    // 비밀번호 확인 유효성 검사
    if(pwdck == ""){
        $('.final_pwdck_ck').css('display','block');
        pwdckCheck = false;
    }else{
        $('.final_pwdck_ck').css('display', 'none');
        pwdckCheck = true;
    }
    
    // 최종 유효성 검사
    if(pwdckCheck){
    	 $("#join_form").attr("action", "/bookshop/member/update.do");
         $("#join_form").submit();  
    } else {
    	alert("다시 시도해주세요.")
    }
    
    return false;

});


// 비밀번호 확인 일치 유효성 검사
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
 



</script>

</html>