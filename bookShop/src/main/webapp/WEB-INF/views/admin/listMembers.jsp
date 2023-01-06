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
                    <li><a id="gnb_logout_button1">로그아웃</a></li>
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
                <div class="admin_navi_wrap">
                    <ul>
                        <li >
                            <a class="admin_list_01">상품 등록</a>
                        </li>
                        <li>
                            <a class="admin_list_02">상품 목록</a>
                        </li>
                       <lI>
                            <a class="admin_list_03" href="/bookshop/admin/listMembers">회원 목록</a>                        
                        </lI> 
<!--                         <lI>
                            <a class="admin_list_04">작가 관리</a>                            
                        </lI> -->
                        <lI>
                            <a class="admin_list_05">회원 관리</a>                            
                        </lI>                                                                                             
                    </ul>
<!-- 
                    <div class="admin_list_01">
                        <a>상품 관리</a>
                    </div>
                     -->
                </div>
                <div class="admin_content_wrap">
                    <table>
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
									<c:if test="${memberBean.available eq 1}">
										<td>로그인 가능</td>
									</c:if>
									<c:if test="${memberBean.available eq 0}">
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
$("#gnb_logout_button1").click(function() {
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

</html>