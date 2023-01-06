<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인페이지</title>
<link rel="stylesheet" href="../resources/css/admin/main.css">
 
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
</head>
<body>
 
    <div class="wrapper">
        <div class="wrap">
            <!-- gnv_area -->    
            <div class="top_gnb_area">
                <ul class="list">    
                    <li><a href="/bookshop/main">메인 페이지</a></li>
                    <li><a id="gnb_logout_button2">로그아웃</a></li>
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
                   		<lI>
                            <a class="admin_list_01" href="/bookshop/admin/listMembers">회원 목록</a>                        
                        </lI> 
                        <lI>
                            <a class="admin_list_02">회원 관리</a>                            
                        </lI>  
                        <li >
                            <a class="admin_list_03">상품 등록</a>
                        </li>
                        <li>
                            <a class="admin_list_04">상품 목록</a>
                        </li>
                        <lI>
                            <a class="admin_list_05">상품 관리</a>                            
                        </lI>                                                                                             
                    </ul>
<!-- 
                    <div class="admin_list_01">
                        <a>상품 관리</a>
                    </div>                     -->

                </div>
                <div class="admin_content_wrap">
                    <div>관리자 페이지 입니다.</div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
 
</body>

<script>
$(".gnb_logout_button2").click(function() {
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
