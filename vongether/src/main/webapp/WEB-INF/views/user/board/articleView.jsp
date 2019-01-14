<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="/resources/user/css/index.css">
<link rel="stylesheet" href="/resources/user/css/board.css">
<script type="text/javascript">

$(document).ready(function() {
		$(".articleViewUpdateBtn").click(
			function(){
				var bNo = $("#bNo").val();
				location.href="/board/update.do?bNo="+bNo;
			}		
		);
		$(".articleViewRemoveBtn").click(
			function(){
				var bNo = $("#bNo").val();
				location.href="/board/delete.do?bNo="+bNo;
			}		
		);
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

			<div class="row ">
				<div class="col-12 articleViewTitleBox">
					<input type="hidden" id="bNo" value="${article.bNo }">
					<span style="">${article.bTitle}</span>
					<span class="articleViewId">
						${article.mId}
					</span>
					<div class="articleViewTitleRightBox" >
						<span class="articleViewRegdate" >
							${article.bRegdate}
						</span>
						<span  class="articleViewHitcount">
							조회수 ${article.bHitcount} 
						</span>
						<span class="articleViewUpdateBtn" >
							수정
						</span>
						<span class="articleViewRemoveBtn" >
							삭제
						</span>
					</div>
				</div>
				
				<div class="col-12 articleViewContentBox">
					<span>${article.bContent}</span>
				</div>
				<div class="col-12 articleViewReplyBox">
					
				</div>
			</div>

			<div class="row">
				
			</div>
		</div>
		<!-- row1 End -->
	</div>
	<!-- main-content-box End -->

	</body>
	</html>