<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="resources/css/login.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>

	<!-- header -->
	<%@include file="../includes/main/header.jsp"%>
	
	<!-- <form id="join_form" method="post">
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
			</div>

			<div class="join_button_wrap">
				<input type="button" class="idSearch_button" value="아이디 찾기">
			</div>
		</div>
	</form> -->

	<section>
		<header class="major">
			<h2>아이디 찾기</h2>
		</header>
		<div class="features">

			<article>

				<div class="content">

					<form method="post" id="find_form" name="find_form">
						<div class="row gtr-uniform">
							<div class="col-12 col-4-xsmall">
								<input type="text" class="user_input" id="name"
									name="name" placeholder="이름" required>
							</div>
							<div class="col-12 col-4-xsmall">
								<input type="text" class="user_input" id="phone"
									name="phone" placeholder="핸드폰번호" required>
							</div>

						</div>
						<br />
						<div class="button_container" style="text-align: center;">
							<button type="button" class="btn" id="find_button">
								<span>찾기</span>
							</button>
							<button type="button" class="btn" onclick="location.href='/main'">
								<span>취소</span>
							</button>
						</div>
					</form>
					
				</div>
			</article>

		</div>
	</section>

	<!-- Section -->


	<script>

$(".idSearch_button").click(function(){
	var name = $(".user_input").val(); 				// 입력한 이름
	var email = $(".mail_input").val();            // 입력한 이메일
    
	
	
	$("#find_form").attr("action", "/bookshop/member/findId");
	$("#join_form").submit(); 
	
});


</script>

</body>
</html>