<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



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
                        <li><a href="/bookshop/admin/adminMain">관리자 페이지</a></li>
                    </c:if>   
                    <li><a id="gnb_logout_button">로그아웃</a></li>
                    <li>
                        <a href="/bookshop/member/view">마이페이지</a>
                    </li>
                    <li>
                        <a href="/bookshop/member/cartList">장바구니</a>
                    </li>
                </c:if>
            </ul> 
		</div>
		<div class="top_area">
			<div class="logo_area">
				<a href="/bookshop/main"><img src="resources/image/cat.jpeg"></a>
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