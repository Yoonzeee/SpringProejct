<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<link rel="stylesheet" href="resources/css/join.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>

</head>
<body>
	<!-- header -->
	<%@include file="../includes/main/header.jsp"%>

	<div class="content_area">
		<div class="wrapper">
			<form id="delete_form" method="post">
				<div class="wrap">
					<div class="subjecet">
						<span>회원탈퇴</span>
					</div>
					<input type="hidden" class="session_uid" value="${member.uid}"
						id="uid" name="uid"></br> <input type="hidden"
						class="session_pwd" value="${member.pwd}" id="member_pwd"
						name="member_pwd"></br>
					<div class="user_wrap">
						<div class="pwd_name">비밀번호</div>
						<div class="pwd_input_box">
							<input class="pwd_input" id="pwd" name="pwd">
						</div>
					</div>

					<div class="delete_button_wrap">
						<input type="button" class="delete_button" value="탈퇴하기"> <input
							type="button" class="back_button" value="돌아가기">
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- footer -->
	<%@include file="../includes/admin/footer.jsp"%>
</body>

<script>
	$(".delete_button").click(function() {
		var input_pwd = $('.pwd_input').val();
		var session_pwd = $('.session_pwd').val();

		if (input_pwd == session_pwd) {
			var confirmMessage = confirm("정말로 탈퇴하시겠습니까?")

			if (confirmMessage == true) {
				$("#delete_form").attr("action", "/bookshop/member/delete.do")
				$("#delete_form").submit()
			} else {

			}
		} else {
			alert("정보가 일치하지 않습니다");
		}
	});
</script>

</html>