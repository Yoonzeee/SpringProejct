<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록들</title>
<link rel="stylesheet" href="../resources/css/admin/main.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>

<div class="wrapper">
        <div class="wrap">
            <!-- gnv_area -->    
            <div class="top_gnb_area">
                <ul class="list">    
                    <li><a href="/bookshop/main">메인 페이지</a></li>
                    <li><a id="gnb_logout_button">로그아웃</a></li>
                    <li>고객센터</li>            
                </ul>
            </div>
            <!-- top_subject_area -->
            <div class="admin_top_wrap">
                <span>관리자 페이지</span>
                
            </div>
            <!-- contents-area -->
            <div class="admin_wrap">
                <!-- 네비영역 -->
                <div class="admin_navi_wrap" style="float:left;">
                    <ul>
                   		<lI>
                            <a class="admin_list_01" href="/bookshop/admin/listMembers">회원 관리</a>                                                 
                        </lI>
                        <lI>
                            <a class="admin_list_05" href="/bookshop/admin/listGoods">상품 관리</a>                            
                        </lI>                                                                                             
                    </ul>

                </div>
                <div class="goods_table_wrap" style="float:right;">
	                    	<table class="goods_table">
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
							<c:forEach var="item" items="${list}" varStatus="status">
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
                <div class="clearfix"></div>
            </div>
        </div>
    </div>

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