<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<link rel="stylesheet" href="resources/css/view.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>

	<!-- header -->
	<%@include file="../includes/main/header.jsp"%>
	<div class="content_area">
		<h1>마이 페이지</h1>
	</div>
	<form id="join_form" method="post">
		<div class="wrap">

			<div class="uid_wrap">
				<div class="uid_name">아이디</div>
				<div class="uid_input_box">
					<input class="uid_input" id="uid" name="uid" value="${member.uid}" readonly>
					<input type="hidden" id="pwd" name="pwd" value="${member.pwd}">
				</div>
			</div>

			<div class="user_wrap">
				<div class="user_name">이름</div>
				<div class="user_input_box">
					<input class="user_input" id="name" name="name" value="${member.name}" readonly>
				</div>
			</div>

			<div class="mail_wrap">
				<div class="mail_name">이메일</div>
				<div class="mail_input_box">
					<input class="mail_input" id="email" name="email" value="${member.email}" readonly>
				</div>
			</div>

			<div class="phone_wrap">
				<div class="phone_name">휴대전화</div>
				<div class="phone_input_box">
					<input class="phone_input" id="phone" name="phone" value="${member.phone}" readonly>
				</div>
			</div>

			<div class="address_wrap">
				<div class="address_name">주소</div>
				<div class="address_input_1_wrap">
					<div class="address_input_1_box">
						<input class="address_input_1" id="address1" name="address1" value="${member.address1}" readonly>
					</div>
				</div>
				<div class="address_input_2_wrap">
					<div class="address_input_2_box">
						<input class="address_input_2" id="address2" name="address2" value="${member.address2}" readonly>
					</div>
				</div>
				<div class="address_input_3_wrap">
					<div class="address_input_3_box">
						<input class="address_input_3" id="address3" name="address3" value="${member.address3}" readonly>
					</div>
				</div>
			</div>

			<div class="update_button_wrap">
				<a href="/bookshop/member/update">회원정보수정</a>
			</div>

			<div class="delete_button_wrap">
				<a href="/bookshop/member/delete">회원탈퇴</a>
			</div>
		</div>
	</form>
	</div>
	<!-- footer -->
	<%@include file="../includes/admin/footer.jsp"%>

	<script>
		$("#gnb_logout_button").click(function() {
			$.ajax({
				type : "post",
				url : "/bookshop/member/logout.do",
				success : function(result) {
					alert("로그아웃 성공");
					document.location.reload();
				}
			});
		});
	</script>
</body>
</html>