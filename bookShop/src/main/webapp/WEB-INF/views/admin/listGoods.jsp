<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록들</title>
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
                <span>상품 목록</span>
                
            </div>
            <!-- contents-area -->
            <div class="admin_wrap">
                <!-- 네비영역 -->
                <div class="admin_navi_wrap">
                    <ul>
                   		<lI>
                            <a class="admin_list_01" href="/bookshop/admin/listMembers">회원 관리</a>                                                 
                        </lI>
                        <lI>
                            <a class="admin_list_05" href="/bookshop/admin/listGoods">상품 관리</a>                            
                        </lI>                                                                                             
                    </ul>

                </div>
                   <div class="goods_table_wrap">
	                    	<table class="goods_table" id="foo_table">
	                    		<thead>
	                    			<tr>
										<td class="th_column_1">상품 번호</td>
	                    				<td class="th_column_2">종류</td>
	                    				<td class="th_column_3">제목</td>
	                    				<td class="th_column_4">저자</td>
	                    				<td class="th_column_5">출판사</td>
	                    				<td class="th_column_6">가격</td>
	                    				<td class="th_column_7">할인된가격</td>
	                    				<td class="th_column_8">적립포인트</td>
	                    			</tr>
	                    		</thead>	
	                    		<c:forEach var="item" items="${goodsList}" varStatus="status">
	                    		<tr>
	                    			<td>${status.count}</td>
									<td>${item.goods_sort}</td>
									<td>${item.goods_title}</td>
									<td>${item.goods_writer}</td>
									<td>${item.goods_publisher}</td>
									<td>${item.goods_price}</td>
									<td>${item.goods_sales_price}</td>
									<td>${item.goods_point}</td>
	                    		</tr>
	                    		</c:forEach>
	                    	</table>
                	</div>
                	
                	<!-- 검색 영역 -->
                	<div class="search_wrap">
                		<form id="searchForm" action="/admin/goodsManage" method="get">
                			<div class="search_input">
                    			<input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
                    			<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
                    			<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
                    			<input type="hidden" name="type" value="G">
                    			<button class='btn search_btn'>검 색</button>                				
                			</div>
                		</form>
                	</div>
                	
                	<!-- 페이지 이름 인터페이스 영역 -->
                	<div class="pageMaker_wrap" id="paging">
                		<ul class="pageMaker">
                			
                			<%-- <!-- 이전 버튼 -->
                			<c:if test="${pageMaker.prev }">
                				<li class="pageMaker_btn prev">
                					<a href="${pageMaker.pageStart -1}">이전</a>
                				</li>
                			</c:if>
                			
                			<!-- 페이지 번호 -->
                			<c:forEach begin="${pageMaker.pageStart }" end="${pageMaker.pageEnd }" var="num">
                				<li class="pageMaker_btn ${pageMaker.cri.pageNum == num ? 'active':''}">
                					<a href="${num}">${num}</a>
                				</li>	
                			</c:forEach>
                		
	                    	<!-- 다음 버튼 -->
	                    	<c:if test="${pageMaker.next}">
	                    		<li class="pageMaker_btn next">
	                    			<a href="${pageMaker.pageEnd + 1 }">다음</a>
	                    		</li>
	                    	</c:if> --%>
	                    	
	                    	<c:forEach begin="${param.beginPage}" end="${param.endPage}" step="1" var="index">
							    <c:choose>
							        <c:when test="${param.page==index}">
							            ${index}
							        </c:when>
							        <c:otherwise>
							            <a href="${action}?page=${index}">${index}</a>
							        </c:otherwise>
							    </c:choose>
							</c:forEach>
							<c:if test="${param.next}">
							    <a href="${action}?page=${param.endPage+1}">next</a>
							</c:if>
	                    	
	                    </ul>
                	</div>
                	

                	
                	<form id="moveForm" action="/admin/goodsManage" method="get" >
 						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
						<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
                	</form>

                   
                </div>
                <div class="clearfix">
                </div>
            </div>
        </div>
 
</body>

<script>
    jQuery(function($){
        $("#foo-table").DataTable({
        	// 표시 건수를 10건 단위로 설정
        	lengthMenu: [ 10, 20, 30, 40, 50 ],

        	// 기본 표시 건수를 50건으로 설정
        	displayLength: 50, 
        	scrollX: true,
        	scrollY: 200,
        	columnDefs: [
        		{ targets: 0, visible: false },
        		{ targets: 1, width: 100 }
        	]
        });
        
    });
</script>

<script>
$("#gnb_logout_button2").click(function() {
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