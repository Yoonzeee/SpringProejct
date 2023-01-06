<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
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
				<span>아이디 찾기</span>
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
				<div class="mail_check_wrap">
					<div class="mail_check_input_box" id="mail_check_input_box_false">
						<input class="mail_check_input" disabled="disabled">
					</div>
				</div>
			</div>
			<div class="phone_wrap">
				<div class="phone_name">휴대전화</div>
				<div class="phone_input_box">
					<input class="phone_input" id="phone" name="phone">
				</div>
			</div>
			<div class="join_button_wrap">
				<input type="button" class="idSearch_button" value="가입하기">
			</div>
		</div>
	</form>
</div>

<script>
// 아이디찾기 버튼()
$(".idSearch_button").click(function(){
	// 입력값 변수
	var phone = $('.phone_input').val();
	var email = $('.mail_input').val();
	var postData = {'phone' : phone , 'email' : email };
	
	$.ajax({
        type: "post",
		url: "/bookshop/member/idSearch",
        data: postData,
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        dataType: "json",
        success: function(data){
        	var emailLists = data.user_email;
        	var emailLength = emailLists.length
        	var emailfind = emailLists.substring(1, emailLength-1)
       	 		 $("#emailList").append("<h1>"+"회원님의 정보로 등록된 이메일은 : "+emailfind+" 입니다.</h1>")
        },
        error: function (XMLHttpRequest, textStatus, errorThrown){
        	alert('정보를 다시 입력해주시길 바랍니다.' );
        }
	});
});
</script>

</body>
</html>