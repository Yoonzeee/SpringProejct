<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link rel="stylesheet" href="resources/css/login.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>

<div class="wrapper">
	<form id="login_form" method="post">
	<div class="wrap">
		<div class="logo_wrap">
			<span>Book Mall</span>
		</div>
		<div class="login_wrap"> 
			<div class="id_wrap">
					<div class="id_input_box">
					<input class="id_input" type="text" id="uid" name="uid" placeholder="아이디를 입력해주세요.">
				</div>
			</div>
			<div class="pw_wrap">
				<div class="pw_input_box">
					<input class="pw_iput" type="password" id="pwd" name="pwd" placeholder="비밀번호를 입력해주세요.">
				</div>
			</div>
			
			<c:if test = "${result == 0 }">
                <div class = "login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
            </c:if>
            
			<div class="login_button_wrap">
				<input type="button" class="login_button" value="로그인">
			</div>			
		</div>
		
		<div class="login_search_wrap">
			<a href="/bookshop/member/idSearch">아이디 찾기</a>
			<a>    |    </a>
			<a href="/bookshop/member/pwdSearch">비밀번호 찾기</a>
		</div>
	</div>
	</form>
</div>
<script>
//회원가입 버튼(회원가입 기능 작동)
$(".login_button").click(function(){
	$("#login_form").attr("action", "/bookshop/member/login.do");
    $("#login_form").submit();  
});
</script>

</body>
</html>