<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="resources/css/login.css">
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
				<span>비밀번호 찾기</span>
			</div>
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

			<div class="join_button_wrap">
				<input type="button" class="idSearch_button" value="인증 메일 발송">
			</div>
		</div>
	</form>
</div>

<script>

//인증번호 이메일 전송
$(".idSearch_button").click(function(){
	var email = $(".mail_input").val();            // 입력한 이메일
    
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

</script>

</body>
</html>