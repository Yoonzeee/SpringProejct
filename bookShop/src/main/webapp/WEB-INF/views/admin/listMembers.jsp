<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록들</title>
<link rel="stylesheet" href="../resources/css/admin/main.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>

<style></style>

<body>

	<%@include file="../includes/admin/header.jsp"%>

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
				<c:forEach var="item" items="${listMap}" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td>${item.uid}</td>
						<td>${item.name}</td>
						<td>${item.phone}</td>
						<td>${item.email}</td>
						<td>${item.address1}</td>
						<td>${item.address2}</td>
						<td>${item.address3}</td>
						<td>${item.joinDate}</td>
						<c:if test="${item.available eq 1}">
							<td>로그인 가능</td>
						</c:if>
						<c:if test="${item.available eq 0}">
							<td>로그인 불가능</td>
						</c:if>
						<td><a href="/MyProject/member/adminDelete?uid=${item.uid}">탈퇴</a></td>
						<td><a href="/MyProject/member/adminLogin?uid=${item.uid}">관리</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<!-- 검색 영역 -->
                    <div class="search_wrap">
                    	<form id="searchForm" action="/admin/authorManage" method="get">
                    		<div class="search_input">
                    			<input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
                    			<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
                    			<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
                    			<button class='btn search_btn'>검 색</button>
                    		</div>
                    	</form>
                    </div> 

	<%@include file="../includes/admin/footer.jsp"%>
</body>

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


let searchForm = $('#searchForm');
let moveForm = $('#moveForm');

/* 작거 검색 버튼 동작 */
$("#searchForm button").on("click", function(e){
	
	e.preventDefault();
	
	/* 검색 키워드 유효성 검사 */
	if(!searchForm.find("input[name='keyword']").val()){
		alert("키워드를 입력하십시오");
		return false;
	}
	
	searchForm.find("input[name='pageNum']").val("1");
	
	searchForm.submit();
	
});


/* 페이지 이동 버튼 */
$(".pageMaker_btn a").on("click", function(e){
	
	e.preventDefault();
	
	moveForm.find("input[name='pageNum']").val($(this).attr("href"));
	
	moveForm.submit();
	
});
</script>

</html>