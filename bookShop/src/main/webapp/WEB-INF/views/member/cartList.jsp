<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<link rel="stylesheet" href="resources/css/main.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>

	<!-- header -->
	<%@include file="../includes/main/header.jsp"%>

	${cartList}
	<div class="goods_table_wrap" style="float: right;">
		<table class="goods_table" style="width: 100%;">
			<thead>
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>핸드폰번호</th>
					<th>이메일</th>
					<th>우편번호</th>
					<th>주소</th>
					<th>상세주소</th>
					<th>가입날짜</th>
					<th>로그인가능여부</th>
					<th>탈퇴관리</th>
					<th>로그인관리</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${cartList}" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td>${item.bookId}</td>
						<td>${item.bookName}</td>
						<td>${item.authorName}</td>
						<td>${item.publisher}</td>
						<td>${item.bookPrice}</td>
						<td>${item.bookDiscount}</td>
						<td><a href="/MyProject/admin/adminOrder?uid=${item.bookId}">구매하기</a></td>
						<td><a href="/MyProject/admin/adminCartDelete?uid=${item.bookId}">장바구니 삭제</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<%-- <div class="content_area">
		<form id="join_form" method="post">
			<div class="wrap">
				<div class="subjecet">
					<span>장바구니</span>
				</div>

				<div class="uid_wrap">
					<div class="uid_name">아이디</div>
					<div class="uid_input_box">
						<input class="uid_input" id="uid" name="uid" value="${cartList.bookId}"
							readonly>
					</div>
				</div>

				<div class="user_wrap">
					<div class="user_name">책 제목</div>
					<div class="user_input_box">
						<input class="user_input" id="name" name="name"
							value="${cartList.bookName}" readonly>
					</div>
				</div>

				<div class="mail_wrap">
					<div class="mail_name">작가</div>
					<div class="mail_input_box">
						<input class="mail_input" id="email" name="email"
							value="${cartList.authorName}" readonly>
					</div>
				</div>

				<div class="phone_wrap">
					<div class="phone_name">출판사</div>
					<div class="phone_input_box">
						<input class="phone_input" id="phone" name="phone"
							value="${cartList.publisher}" readonly>
					</div>
				</div>

				<div class="address_wrap">
					<div class="address_name">정가</div>
					<div class="address_input_1_wrap">
						<div class="address_input_1_box">
							<input class="address_input_1" id="address1" name="address1"
								value="${cartList.bookPrice}" readonly>
						</div>
					</div>
					<div class="address_name">판매 금액</div>
					<div class="address_input_2_wrap">
						<div class="address_input_2_box">
							<input class="address_input_2" id="address2" name="address2"
								value="${cartList.bookDiscount}" readonly>
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
	</div> --%>

	<!-- footer -->
	<%@include file="../includes/admin/footer.jsp"%>



	<script>
$("#gnb_logout_button").click(function() {
	$.ajax({
		type : "post",
		url : "/bookshop/member/logout.do",
		success : function(result){
			alert("로그아웃 성공");
			document.location.reload();
		}
	});
});
</script>
</body>
</html>