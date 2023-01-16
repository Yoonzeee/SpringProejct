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
		<!-- header -->
		<%@include file="includes/main/header.jsp"%> 
		
		<!-- footer -->
		<%@include file="includes/admin/footer.jsp"%> 

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