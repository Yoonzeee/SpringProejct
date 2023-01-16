<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<link rel="stylesheet" href="../resources/css/admin/main.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
 <script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>

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
                <span>상품 등록</span>
                
            </div>
            <!-- contents-area -->
            <!-- <div class="admin_wrap">
                네비영역
                <div class="admin_navi_wrap">
                    <ul>
                   		<lI>
                            <a class="admin_list_01" href="/bookshop/admin/listMembers">회원 관리</a>                                                 
                        </lI>
                        <lI>
                            <a class="admin_list_05" href="/bookshop/admin/listGoods">상품 관리</a>                            
                        </lI>                     
                        <lI>
                            <a class="admin_list_05" href="/bookshop/admin/adminInsertGoods">상품 등록</a>                            
                        </lI>                                                                        
                    </ul>

                </div> -->
                
                <!-- 상품등록 영역 -->
                <div class="wrapper">
					<form id="adminInsertGoods_form" method="post">
					<div class="wrap">
							<div class="subjecet">
								<!-- <span>상품 등록</span> -->
							</div>
							
							<div class="goods_sort_wrap">
								<div class="goods_sort_name">분류</div>
								<div class="goods_sort_input_box">
									<input class="goods_sort_input" id="goods_sort" name="goods_sort">
								</div>
							</div>
							
							<div class="goods_title_wrap">
								<div class="goods_title_name">책 제목</div>
								<div class="goods_title_input_box">
									<input class="goods_title_input" id="goods_title" name="goods_title">
								</div>
							</div>
					
							<div class="goods_writer_wrap">
								<div class="goods_writer_name">작가</div>
								<div class="goods_writer_input_box">
									<input class="goods_writer_input" id="goods_writer" name="goods_writer">
								</div>
							</div>
							
							<div class="goods_publisher_wrap">
								<div class="goods_publisher_name">출판사</div> 
								<div class="goods_publisher_input_box">
									<input class="goods_publisher_input" id="goods_publisher" name="goods_publisher">
								</div>
							</div>
							
							<div class="goods_price_wrap">
								<div class="goods_price_name">도서정가</div>
								<div class="goods_price_input_box">
									<input class="goods_price_input" id="goods_price" name="goods_price">
								</div>
							</div>
							
							<div class="goods_sales_price_wrap">
								<div class="goods_sales_price_name">판매가격</div>
								<div class="goods_sales_price_input_wrap">
									<div class="goods_sales_price_input_box">
										<input class="goods_sales_price_input" id="goods_sales_price" name="goods_sales_price">
									</div>
								</div>
							</div>
							
							<div class="goods_point_wrap">
								<div class="goods_point_name">상품포인트</div>
								<div class="goods_point_input_wrap">
									<div class="goods_point_input_box">
										<input class="goods_point_input" id="goods_point" name="goods_point">
									</div>
								</div>
							</div>
							
							<div class="goods_published_date_wrap">
								<div class="goods_published_date_name">출판날짜</div>
								<div class="goods_published_date_input_wrap">
									<div class="goods_published_date_input_box">
										<input class="goods_published_date_input" id="goods_published_date" name="goods_published_date">
									</div>
								</div>
							</div>
							
							<div class="goods_total_page_wrap">
								<div class="goods_total_page_name">쪽수</div>
								<div class="goods_total_page_input_wrap">
									<div class="goods_total_page_input_box">
										<input class="goods_total_page_input" id="goods_total_page" name="goods_total_page">
									</div>
								</div>
							</div>
							
							<div class="goods_isbn_wrap">
								<div class="goods_isbn_name">국제표준도서번호</div>
								<div class="goods_isbn_input_wrap">
									<div class="goods_isbn_input_box">
										<input class="goods_isbn_input" id="goods_isbn" name="goods_isbn">
									</div>
								</div>
							</div>
							
							<div class="goods_delivery_price_wrap">
								<div class="goods_delivery_price_name">배송비</div>
								<div class="goods_delivery_price_input_wrap">
									<div class="goods_delivery_price_input_box">
										<input class="goods_delivery_price_input" id="goods_delivery_price" name="goods_delivery_price">
									</div>
								</div>
							</div>
							
							<div class="goods_delivery_date_wrap">
								<div class="goods_delivery_date_name">배송일자</div>
								<div class="goods_delivery_date_input_wrap">
									<div class="goods_delivery_date_input_box">
										<input class="goods_delivery_date_input" id="goods_delivery_date" name="goods_delivery_date">
									</div>
								</div>
							</div>
							
							<div class="goods_status_wrap">
								<div class="goods_status_name">상품상태</div>
								<div class="goods_status_input_wrap">
									<div class="goods_status_input_box">
										<input class="goods_status_input" id="goods_status" name="goods_status">
									</div>
								</div>
							</div>
							
							<div class="goods_intro_wrap">
								<div class="goods_intro_name">상품소개</div>
								<div class="goods_intro_input_wrap">
									<div class="goods_intro_input_box">
										<input class="goods_intro_input" id="goods_intro" name="goods_intro">
									</div>
								</div>
							</div>
							
							<div class="goods_publisher_comment_wrap">
								<div class="goods_publisher_comment_name">출판사 소개글</div>
								<div class="goods_publisher_comment_input_wrap">
									<div class="goods_publisher_comment_input_box">
										<input class="goods_publisher_comment_input" id="goods_publisher_comment" name="goods_publisher_comment">
									</div>
								</div>
							</div>
							
							<div class="goods_recommendation_wrap">
								<div class=goods_recommendation_name">추천글</div>
								<div class="goods_recommendation_input_wrap">
									<div class="goods_recommendation_input_box">
										<input class="goods_recommendation_input" id="goods_recommendation" name="goods_recommendation">
									</div>
								</div>
							</div>
							<div>
								<form name="fileUploadForm" method="post" enctype="multipart/form-data">
									<input type="hidden" name="uid" id="uid"/><br/>
									이름 : <input type="text" name="name" id="name"/><br/>
									상품 메인 이미지 업로드 : <input type="file" name="file0" id="file0"/><br/>
									상품 상세 이미지 업로드 : <input type="file" name="file1" id="file1"/><br/>
									<input type="button" class="fileUpload_button" value="전송"/>
									<input type="reset" value="초기화"/>
								</form>
							</div>
							
							<div class="adminInsertGoods_button_wrap">
								<input type="button" class="adminInsertGoods_button" value="상품 등록하기">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	<!-- </div> -->
 
</body>

<script>
$(".fileUpload_button").click(function() {
	
	$("#fileUploadForm").attr("action", "/bookshop/admin/adminFileUpload.do");
	$("#fileUploadForm").submit(); 
	alert("상품 등록 완료");

});
</script>

<script>
$(".adminInsertGoods_button").click(function() {
	
	$("#adminInsertGoods_form").attr("action", "/bookshop/admin/adminInsertGoods.do");
	$("#adminInsertGoods_form").submit(); 
	alert("상품 등록 완료");

});
</script>

</html>