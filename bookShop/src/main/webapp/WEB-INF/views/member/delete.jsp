<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
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
				<div class="wrapper">
					<form id="delete_form" method="post">
					<div class="wrap">
							<div class="subjecet">
								<span>회원탈퇴</span>
							</div>
							<input type="hidden" class="session_uid" value="${member.uid}" id="uid" name="uid"></br>
							비밀번호: <input type="text" class="session_pwd" value="${member.pwd}" id="member_pwd" name="member_pwd"></br>
							<div class="user_wrap">
								<div class="pwd_name">비밀번호</div>
								<div class="pwd_input_box">
									<input class="pwd_input" id="pwd" name="pwd">
								</div>
							</div>
							
							<div class="delete_button_wrap">
								<input type="button" class="delete_button" value="탈퇴하기">
								<input type="button" class="back_button" value="돌아가기">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>

<script>

$(".delete_button").click(function(){
	var input_pwd = $('.pwd_input').val();
	var session_pwd = $('.session_pwd').val();
	
	if(input_pwd == session_pwd) {
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