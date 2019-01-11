<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="/resources/user/css/index.css">
<link rel="stylesheet" href="/resources/user/css/board.css">
<script type="text/javascript">
$(document).ready(function() {

 		$(".writeCancelBtn").click(
			function(){
				alert("글작성이 취소되었습니다.");
				$("#commonForm").attr("method", "get").attr(
						"action", "/view.bit").submit();	
		}); 
		
		
 		$(".writeOKBtn").click(
			function(){
				var bTitle = $("#bTitle").val();
				var bContent = $("#bContent").val();
				console.log(bTitle);
				if(bTitle == ""){
					alert("제목을 입력하세요");
					return;
				}else if(bContent == ""){
					alert("내용을 입력하세요");
					return;
				}else{
					alert("글이 수정되었습니다");
			 		document.updateForm.action = "/board/update.do"; 
					document.updateForm.submit();
				}
		}); 
		
})
</script>
<div class="my-container">
	<!-- main-content-box -->
	<div class="main-content-box">
		<div class="container">
			<div class="row">
				<h2>
					<b>게시판</b>
				</h2>
				<div ></div>
			</div>
			<form id="updateForm" name="updateForm" method="post" action="" style="margin: 0px">
				<div class="row ">
					<input type="hidden" id="bNo" name="bNo" value="${article.bNo}"/>
					<div class="col-12">
						<input id="bTitle" name="bTitle" class="writeTitleBox" value="${article.bTitle}"/>
					</div>
					<div class="col-12" >
						<input id="bContent" name="bContent" class="writeContentBox" value="${article.bContent}"/>
					</div>
				</div>
				<div class="row writeBtnBox">
					<span class="col-offset-4 col-2 viewWriteBtn writeOKBtn">수정</span>
					<span class="col-2 viewWriteBtn writeCancelBtn">취소</span>
				</div>
			</form>
		</div>
		<!-- row1 End -->
	</div>
	<!-- main-content-box End -->

	</body>
	</html>