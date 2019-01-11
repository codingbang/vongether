<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="/resources/user/css/index.css">
<link rel="stylesheet" href="/resources/user/css/board.css">
<script type="text/javascript">
$(document).ready(function() {

	/* $("#firstpage").click(
		function() {
			$('#pg').val("1");
			$('#key').val("");
			$('#word').val("");
			$("#commonForm").attr("method", "get").attr(
					"action", listpath).submit();
		}); */

	/* $(".mvpage").click(
		function() {
			$('#pg').val($(this).attr("move-page-no"));
			$("#commonForm").attr("method", "get").attr(
					"action", listpath).submit();
		}); */

	/* $("#searchBtn").click(
		function() {
			$('#pg').val('1');
			$('#key').val($('#skey').val());
			$('#word').val($('#sword').val());
			$("#commonForm").attr("method", "get").attr(
					"action", listpath).submit();
		}); */
 		$(".writeCancelBtn").click(
			function(){
				alert("글작성이 취소되었습니다.");
				$("#commonForm").attr("method", "get").attr(
						"action", "/view.bit").submit();	
		}); 
		
		
 		$(".writeOKBtn").click(
			function(){
				var writeTitleBox = $("#writeTitleBox").val();
				var writeContentBox = $("#writeContentBox").val();
				console.log(writeTitleBox);
				if(writeTitleBox == ""){
					alert("제목을 입력하세요");
					return;
				}else if(writeContentBox == ""){
					alert("내용을 입력하세요");
					return;
				}else{
					alert("글이 등록되었습니다");
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
						<input id="writeTitleBox" name="bTitle" class="writeTitleBox" value="">
							${article.bTitle}
						</input>
					</div>
					<div class="col-12" >
						<input id="writeContentBox" name="bContent" class="writeContentBox" value="">
							${article.bContent}
						</input>
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