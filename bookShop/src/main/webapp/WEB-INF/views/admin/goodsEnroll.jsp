<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<link rel="stylesheet" href="../resources/css/admin/goodsEnroll.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/35.4.0/classic/ckeditor.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<style type="text/css">
	#result_card img{
		max-width: 100%;
	    height: auto;
	    display: block;
	    padding: 5px;
	    margin-top: 10px;
	    margin: auto;	
	}
	#result_card {
		position: relative;
	}
	.imgDeleteBtn{
	    position: absolute;
	    top: 0;
	    right: 5%;
	    background-color: #ef7d7d;
	    color: wheat;
	    font-weight: 900;
	    width: 30px;
	    height: 30px;
	    border-radius: 50%;
	    line-height: 26px;
	    text-align: center;
	    border: none;
	    display: block;
	    cursor: pointer;	
	}
	
</style>

</head>
</head>
<body>

	<%@include file="../includes/admin/header.jsp"%>
	
	<div class="admin_content_wrap">
		<div class="admin_content_subject">
			<h1 style="text-align: center;">상품 등록</h1>
			<div class="admin_content_main">
                    <form  method="post" id="enrollForm">
                    
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>책 제목</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="bookName" id="bookName">
                    			</div>
                    		</div>
                    		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>작가</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="authorName" id="authorName">
                    			</div>
                    		</div>            
                    		
                    		<div class="form_section" style="float:left;">
                    			<div class="form_section_title">
                    				<label>출판일</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="publeYear" id="publeYear" autocomplete="off" readonly="readonly">
                    			</div>
                    		</div>            
                    		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>출판사</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="publisher" id="publisher">
                    			</div>
                    		</div>             
                    		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>책 카테고리</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="cateCode" id="cateCode">
                    			</div>
                    		</div>          
                    		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 가격</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="bookPrice" id="bookPrice" value="0">
                    			</div>
                    		</div>               
                    		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 재고</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="bookStock" id="bookStock" value="0">
                    			</div>
                    		</div>          
                    		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 할인가격</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="bookDiscount" id="bookDiscount" value="0">
                    			</div>
                    		</div>          		
                    		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>책 소개</label>
                    			</div>
                    			<div class="form_section_content">
                    				<textarea name="bookIntro" id="bookIntro_textarea"></textarea>
                    			</div>
                    		</div>        		
                    		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>책 목차</label>
                    			</div>
                    			<div class="form_section_content">
                    				<textarea name="bookContents" id="bookContents_textarea"></textarea>
                    			</div>
                    		</div>
                    		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 이미지</label>
                    			</div>
                    			<div class="form_section_content">
									<input type="file" id ="fileItem" name='uploadFile' style="height: 30px;">
									<div id="result_card">
										<div class="imgDeleteBtn">x</div>
										<img src="#">
									</div>
                    			</div>
                    		</div> 
                    		
                   			<div class="btn_section">
                   				<button type="button" class="cancle_btn">취 소</button>
	                    		<button type="button" class="enroll_btn">등 록</button>
	                    	</div> 
	                   </form>
               </div>  
		</div>
	</div>


</body>

<script>

/* let enrollForm = $("#enrollForm") */
	
/* 취소 버튼 */
$(".cancle_btn").click(function(){
	location.href="/bookshop/admin/adminMain"
});

/* 상품 등록 버튼 */
$(".enroll_btn").on("click",function(){
	$("#enrollForm").attr("action", action="/bookshop/admin/goodsEnroll.do");
	$("#enrollForm").submit(); 
	//alert("상품 등록 완료");
});

/* 이미지 업로드 */
$("input[type='file']").on("change", function(e){

	/* alert("test"); */
	
	let formData = new FormData();
	
	let fileInput = $('input[name="uploadFile"]');
	let fileList = fileInput[0].files;
	let fileObj = fileList[0];
	
	
	console.log("fileList : " + fileList);
	console.log("fileObj : " + fileObj);
	
	console.log("fileName : " + fileObj.name);
	console.log("fileSize : " + fileObj.size);
	console.log("fileType(MimeType) : " + fileObj.type);
	
/* 	if(!fileCheck(fileObj.name, fileObj.size)){
		return false;
	} */
	

	
	formData.append("uploadFile", fileObj);
	
	$.ajax({
			url: '/bookshop/admin/uploadAjaxAction',
	    	processData : false,
	    	contentType : false,
	    	data : formData,
	    	type : 'POST',
	    	dataType : 'json',
	    	success : function(result){
	    		console.log(result);
	    		alert("등록 가능한 이미지입니다.");
	    	},
	    	error : function(result){
	    		alert("이미지 파일이 아닙니다.");
	    	}
	});
	
});


/* var, method related with attachFile */
let regex = new RegExp("(.*?)\.(jpg|png|jpeg)$");
let maxSize = 1048576; //1MB	

function fileCheck(fileName, fileSize){

	if(fileSize >= maxSize){
		alert("파일 사이즈 초과");
		return false;
	}
		  
	if(!regex.test(fileName)){
		alert("해당 종류의 파일은 업로드할 수 없습니다.");
		return false;
	}
	
	return true;		
	
}


</script> 

<script>

// 위지윅 적용

// 책 소개 
ClassicEditor
	.create(document.querySelector('#bookIntro_textarea'))
	.catch(error=>{
		console.error(error);
	});
	
// 책 목차 
ClassicEditor
.create(document.querySelector('#bookContents_textarea'))
.catch(error=>{
	console.error(error);
});

</script>

<script>

//캘린더 위젯 사용
const config = {
		dateFormat: 'yy-mm-dd',
		showOn : "button",
		buttonText:"날짜 선택",
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    dayNames: ['일','월','화','수','목','금','토'],
	    dayNamesShort: ['일','월','화','수','목','금','토'],
	    dayNamesMin: ['일','월','화','수','목','금','토'],
	    yearSuffix: '년',
        changeMonth: true,
        changeYear: true
				}

$(function() {
  $( "input[name='publeYear']" ).datepicker(config);
});

// 이미지 출력
/* function showUploadImage(uploadResultArr){
	
	// 전달받은 데이터 검증
	if(!uploadResultArr || uploadResultArr.length == 0){return}
	
	let uploadResult = $("#uploadResult");
	
	let obj = uploadResultArr[0];
	
	let str = "";
	
	let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName);
	
	str += "<div id='result_card'>";
	str += "<img src='/display?fileName=" + fileCallPath +"'>";
	str += "<div class='imgDeleteBtn'>x</div>";
	str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
	str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
	str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";
	str += "</div>";		
	
		uploadResult.append(str);     
    
} */

</script>

</html>
