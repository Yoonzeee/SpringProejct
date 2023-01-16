<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>goodsManage</title>
<link rel="stylesheet" href="../resources/css/admin/goodsManage.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>

	<%@include file="../includes/admin/header.jsp"%>

	<div class="goods_table_wrap" style="float: right;">
		<table class="goods_table" style="width: 100%;">
			<thead>
				<tr>
					<th>상품 번호</th>
					<th>상품 이름</th>
					<th>작가 이름</th>
					<th>출판사</th>
					<th>재고</th>
					<th>등록날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${goodsList}" var="goodsList" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td>
							<a class="move" href='<c:out value="${goodsList.bookId}"/>'>
								<c:out value="${goodsList.bookName}"></c:out>
							</a>
						</td>
						<td><c:out value="${goodsList.authorName}"></c:out></td>
						<td><c:out value="${goodsList.publisher}"></c:out></td>
						<td><c:out value="${goodsList.bookStock}"></c:out></td>
						<td><fmt:formatDate value="${goodsList.regDate}"
								pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<!-- 검색 영역 -->
	<div class="search_wrap">
		<form id="searchForm" action="/admin/goodsManage" method="get">
			<div class="search_input">
				<input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"></c:out>'> 
				<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum}"></c:out>'>
				<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
				<input type="hidden" name="type" value="G">
				<button class='btn search_btn'>검 색</button>
			</div>
		</form>
	</div>

	<!-- 페이지 이름 인터페이스 영역 -->
	<div class="pageMaker_wrap">
		<ul class="pageMaker">

			<!-- 이전 버튼 -->
			<c:if test="${pageMaker.prev }">
				<li class="pageMaker_btn prev"><a
					href="${pageMaker.pageStart -1}">이전</a></li>
			</c:if>

			<!-- 페이지 번호 -->
			<c:forEach begin="${pageMaker.pageStart }"
				end="${pageMaker.pageEnd }" var="num">
				<li
					class="pageMaker_btn ${pageMaker.cri.pageNum == num ? 'active':''}">
					<a href="${num}">${num}</a>
				</li>
			</c:forEach>

			<!-- 다음 버튼 -->
			<c:if test="${pageMaker.next}">
				<li class="pageMaker_btn next"><a
					href="${pageMaker.pageEnd + 1 }">다음</a></li>
			</c:if>
		</ul>
	</div>

	<form id="moveForm" action="/admin/goodsManage" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
	</form>


	<%@include file="../includes/admin/footer.jsp"%>

</body>

<script>

let searchForm = $('#searchForm');
let moveForm = $('#moveForm');

// 작가 검색 버튼 동작
/* $("#searchForm button").on("click", function(e){
	
	e.preventDefault();
	
	// 검색 키워드 유효성 검사
	if(!searchForm.find("input[name='keyword']").val()){
		alert("키워드를 입력하십시오");
		return false;
	}
	
	searchForm.find("input[name='pageNum']").val("1");
	
	searchForm.submit();
	
});
 */

// 페이지 이동 버튼
/* $(".pageMaker_btn a").on("click", function(e){
	
	e.preventDefault();
	
	moveForm.find("input[name='pageNum']").val($(this).attr("href"));
	
	moveForm.submit();
	
}); */

// 상품 조회 페이지
$(".move").on("click", function(e){
	
	e.preventDefault();
	
	moveForm.append("<input type='hidden' name='bookId' value='"+$(this).attr("href") + "'>");
	moveForm.attr("action", "/bookshop/admin//goodsGetDetail");
	moveForm.submit();
	
	
});

</script>

</html>