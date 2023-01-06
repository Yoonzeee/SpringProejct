<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome BookShop</title>
<link rel="stylesheet" href="resources/css/main.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>

<div class="wrapper">
	<div class="wrap">
		<div class="top_gnb_area">
			<ul class="list">
				<c:if test = "${member == null}">		<!-- 로그인 X -->
 					<li >
                    	<a href="/bookshop/member/login">로그인</a>
                	</li>
                	<li>
                    	<a href="/bookshop/member/join">회원가입</a>
               	 	</li>
    			</c:if>
    			<c:if test="${member != null}">       <!-- 로그인 O -->          
    				<c:if test="${member.admin == 1 }">
                        <li><a href="/bookshop/admin/main">관리자 페이지</a></li>
                    </c:if>   
                    <li><a id="gnb_logout_button">로그아웃</a></li>
                    <li>
                        <a href="/bookshop/member/view">마이페이지</a>
                    </li>
                    <li>
                        찜하기
                    </li>
                </c:if>
            </ul> 
		</div>
		<div class="top_area">
			<div class="logo_area">
				<h1>logo area</h1>
			</div>
			<div class="search_area">
				<h1>Search area</h1>
			</div>
			<div class="login_area">
				
				 <!-- 로그인 하지 않은 상태 -->
                <c:if test = "${member == null }">
                    <div class="login_button"><a href="/bookshop/member/login">로그인</a></div>
                    <span><a href="/bookshop/member/join">회원가입</a></span>                
                </c:if>   
                
                <!-- 로그인한 상태 -->
                <c:if test="${ member != null }">
                    <div class="login_success_area">
                    	</br>
                        <span>아이디 : ${member.uid}</span>
                        <span>이름 : ${member.name}</span>
                    </div>
                </c:if>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="navi_bar_area">
			<h1>navi area</h1>
		</div>
		<div class="content_area">
			<h1>content area</h1>
		</div>
	</div>
</div>

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