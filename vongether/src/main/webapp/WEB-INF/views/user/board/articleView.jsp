<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="/resources/js/board/pageBoardView.js"></script>
<link href="/resources/user/css/boardView.css" rel="stylesheet" type="text/css">
<script type="text/javascript">

</script>
<div class="container">
	<div class="row " style="padding-top: 30px; height: 90px;">
		<div class="fh5co-heading">
			<h2><b>게시판</b></h2>
		</div>
	</div>
	
	<!-- 게시판 본문부분 -->
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="boardArticleViewBox">
					<div class="col-md-12">
						<div class="col-md-12">
							<input type="hidden" id="bNo" value="${article.bNo}">
							<span class="viewTitle">${article.bTitle.replace("<","&lt;")}&nbsp;&nbsp;&nbsp;</span>
						</div>
						<div class="col-md-12">
							<span class="articleViewId">작성자 : [${article.mId}]</span>
							<div class="pull-right">
								<span class="articleViewRegdate">작성일 : ${article.bRegdate}  /</span>
								<span class="articleViewHitcount"> 조회수 : [${article.bHitcount}]</span>
							</div>
						</div>
					</div>
					<hr>
					<div class="col-md-12 articleViewContentBox">
						<span>${article.bContent}</span>
					</div>
					<div class="col-md-12">
						<div class="pull-right">
							<button id="articleUpdateBtn" type="button" class="btn btn-info">수정</button>
							<button id="articleRemoveBtn" type="button" class="btn btn-danger">삭제</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 댓글 부분 -->
	<div class="row" style="padding-top: 20px;">
		<div class="row articleViewReplyBox" >
			<div class="row col-md-12"><h4><b>Comment:</b></h4></div>
			<div class="col-md-12">
				<c:if test="${userInfo.mId!=null}">
				<div class="row">
					<div class="col-md-11">
						<input class="insertReplyBox form-control" id="replyWriteText"></input>
					</div>
					<div class="col-md-1">
						<button type="button" class="btn btn-primary" id="replyWriteBtn">작성</button>
					</div>
				</div>
				</c:if>
				<!-- <div class="col-md-12 articleReplyCountBox" id="articleReplyCountBox"></div> -->
				<div class="row" style="padding-top: 20px; padding-bottom: 20px;">
					<div class="row col-md-12" id="replyCount"></div><br>
					<div id="replyList">
						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

