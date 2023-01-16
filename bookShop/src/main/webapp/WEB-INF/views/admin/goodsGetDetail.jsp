<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<link rel="stylesheet" href="../resources/css/admin/goodsModify.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/35.4.0/classic/ckeditor.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<style type="text/css">
	#result_card img{
		max-width: 100%;
	    height: auto;
	    display: block;
	    padding: 5px;
	    margin-top: 10px;
	    margin: auto;	
	}
</style>
</head>
</head>
<body>

	<%@include file="../includes/admin/header.jsp"%>

	<div class="admin_content_wrap">
		<div class="admin_content_subject">
			<span>상품 상세</span>
		</div>
	<form id="goodsGetDetail_form" method="post">
		<div class="admin_content_main">

			<div class="form_section">
				<div class="form_section_title">
					<label>책 제목</label>
				</div>
				<div class="form_section_content">
					<input name="bookName" id="bookName" value="${goodsInfo.bookName}" />
					<input type="text" name="uid" id="uid" value="${member.uid}"/>
					<input type="hidden" name="bookId" id="bookId" value="${goodsInfo.bookId}"/>
				</div>
			</div>

			<div class="form_section">
				<div class="form_section_title">
					<label>등록 날짜</label>
				</div>
				<div class="form_section_content">
					<input name="regDate" value="${goodsInfo.regDate}" />
				</div>
			</div>

			<div class="form_section">
				<div class="form_section_title">
					<label>최근 수정 날짜</label>
				</div>
				<div class="form_section_content">
					<input name="updateDate" value="${goodsInfo.updateDate}" />
				</div>
			</div>

			<div class="form_section">
				<div class="form_section_title">
					<label>작가</label>
				</div>
				<div class="form_section_content">
					<input id="authorName_input" name="authorName" value="${goodsInfo.authorName}" readonly>

				</div>
			</div>

			<div class="form_section">
				<div class="form_section_title">
					<label>출판일</label>
				</div>
				<div class="form_section_content">
					<input name="publeYear" value="${goodsInfo.publeYear}" readonly />
				</div>
			</div>

			<div class="form_section">
				<div class="form_section_title">
					<label>출판사</label>
				</div>
				<div class="form_section_content">
					<input name="publisher" value="${goodsInfo.publisher}" readonly />
				</div>
			</div>

			<div class="form_section">
				<div class="form_section_title">
					<label>상품 가격</label>
				</div>
				<div class="form_section_content">
					<input name="bookPrice" value="${goodsInfo.bookPrice}" readonly />
				</div>
			</div>

			<div class="form_section">
				<div class="form_section_title">
					<label>상품 재고</label>
				</div>
				<div class="form_section_content">
					<input name="bookStock" value="${goodsInfo.bookStock}" readonly />
				</div>
			</div>

			<div class="form_section">
				<div class="form_section_title">
					<label>상품 할인 가격</label>
				</div>
				<div class="form_section_content">
					<input name="bookDiscount" value="${goodsInfo.bookDiscount}"
						readonly />
				</div>
			</div>

			<div class="form_section">
				<div class="form_section_title">
					<label>책 소개</label>
				</div>
				<div class="form_section_content bit">
					<textarea name="bookIntro" id="bookIntro_textarea" disabled>${goodsInfo.bookIntro}</textarea>
				</div>
			</div>

			<div class="form_section">
				<div class="form_section_title">
					<label>책 목차</label>
				</div>
				<div class="form_section_content bct">
					<textarea name="bookContents" id="bookContents_textarea" disabled>${goodsInfo.bookContents}</textarea>
				</div>
			</div>

			<div class="form_section">
            	<div class="form_section_title">
            		<label>상품 이미지</label>
            	</div>
            	<div class="form_section_content">
					<div id="uploadReslut"></div>
            	</div>
            </div>

			<div class="btn_section">
                <button id="cancelBtn" class="btn">상품 목록</button>
	            <button id="cartBtn" class="btn cart_btn">장바구니</button>
	            <button id="modifyBtn" class="btn update_btn">수정 </button>
	            <button id="deleteBtn" class="btn delete_btn">삭제</button>
	        </div> 
	</form>
		<form id="moveForm" action="/bookshop/admin/goodsManage" method="get" >
 			<input type="hidden" name="pageNum" value="${cri.pageNum}">
			<input type="hidden" name="amount" value="${cri.amount}">
			<input type="hidden" name="keyword" value="${cri.keyword}">
        </form>

	</div>


</body>


<script>

// 장바구니 버튼
$("#cartBtn").click(function() {
	
	if (${goodsInfo.bookStock} == 0) { 
		alert("품절 상품입니다️");
	} else {
		$("#goodsGetDetail_form").attr("action", "/bookshop/member/cart");
		$("#goodsGetDetail_form").submit();
		alert("장바구니에 추가되었습니다.");
	}
});


// 취소 버튼
$("#cancle_btn").click(function(){
	location.href="/bookshop/admin/adminMain"
});

// 수정 등록 버튼
$(".update_btn").on("click",function(){
	$("#enrollForm").attr("action", action="/bookshop/admin/goodsEnroll.do");
	$("#enrollForm").submit(); 
	//alert("상품 등록 완료");
});

// 삭제 버튼
$("#deleteBtn").on("click", function(e){
	e.preventDefault();
	let moveForm = $("#moveForm");
	moveForm.find("input").remove();
	moveForm.append('<input type="hidden" name="bookId" value="${goodsInfo.bookId}">');
	moveForm.attr("action", "/bookshop/admin/goodsDelete");
	moveForm.attr("method", "post");
	moveForm.submit();
});

</script>

<script>

// 목록 이동 버튼
$("#cancelBtn").on("click", function(e){
	e.preventDefault();
	$("#moveForm").submit();	
});	

// 수정 페이지 이동
$("#modifyBtn").on("click", function(e){
	e.preventDefault();
	let addInput = '<input type="hidden" name="bookId" value="${goodsInfo.bookId}">';
	$("#moveForm").append(addInput);
	$("#moveForm").attr("action", "/bookshop/admin/goodsModify");
	$("#moveForm").submit();
});

</script>

<script>

// 위지윅 적용

// 책 소개

</script>

<script>

//캘린더 위젯 사용
/* const config = {
		dateFormat: 'yy-mm-dd',
		showOn : "button",
		buttonText:"날짜 선택",
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    dayNames: ['일','월','화','수','목','금','토'],
	    dayNamesShort: ['일','월','화','수','목','금','토'],
	    dayNamesMin: ['일','월','화','수','목','금','토'],
	    yearSuffix: '년',
        changeMonth: true,
        changeYear: true
				}

$(function() {
  $( "input[name='publeYear']" ).datepicker(config);
});
 */

</script>

</html>
