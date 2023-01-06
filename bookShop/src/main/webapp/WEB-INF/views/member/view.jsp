<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
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
				<form id="join_form" method="post">
	<div class="wrap">
			<div class="subjecet">
				<span>마이 페이지</span>
			</div>
			
			<div class="uid_wrap">
				<div class="uid_name">아이디</div>
				<div class="uid_input_box">
					<input class="uid_input" id="uid" name="uid" value="${member.uid}" readonly>
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
				<div class ="address_input_2_wrap">
					<div class="address_input_2_box">
						<input class="address_input_2" id="address2" name="address2" value="${member.address2}" readonly>
					</div>
				</div>
				<div class ="address_input_3_wrap">
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
	</div>
</div>


</body>
</html>