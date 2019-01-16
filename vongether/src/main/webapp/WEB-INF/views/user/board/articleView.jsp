<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="/resources/user/css/index.css">
<link rel="stylesheet" href="/resources/user/css/board.css">
<script type="text/javascript">

$(document).ready(function() {
	var bNo = $("#bNo").val();
	var data = {
		bNo: bNo
	};
	getReplyList(data);
	$(".articleViewUpdateBtn").click(
		function(){
			location.href="/board/update.do?bNo="+bNo;
		}		
	);
	$(".articleViewRemoveBtn").click(
		function(){
			location.href="/board/delete.do?bNo="+bNo;
		}		
	);
	$(document).on("click","#insertReplyBtn",
		function(){
			var data2 = JSON.stringify({ 
							rContent: $("#insertReplyBox").val(), 
							bNo: $("#bNo").val()
						});
			console.log(data2);
			$.ajax({
	    		url : "/reply/write.do",
	    		dataType : "json",
	    		data : data2,
	    		contentType: "application/json; charset=UTF-8",
	    		method : "POST",
	    	    success : function(data2) {
	    	    	if(data2 == -1){
	    	    		alert("로그인하세요.");
	    	    	}else{
	    	    		getReplyList(data2);
	    	    	}
	    	    }
	    	});
		}
	);
	function getReplyList(data){
		$.ajax({
    		url : "/reply/list.do",
    		dataType : "json",
    		data : data,
    		contentType: "application/json; charset=UTF-8",
    		method : "GET",
    	    success : function(data2) {
    	    	makeReplyList(data2.selectReplyList); 
    	    	getReplyCount(data2.totalReplyCount);
    	    }
    	});		
	};

	function getReplyCount(data) {
		var htmlStr = "";
		htmlStr += "<div>댓글 수 : "+data+"</div>";
		
		$("#articleReplyCountBox").empty();
    	$("#articleReplyCountBox").append(htmlStr);
	}
	function makeReplyList(data) {
		var htmlStr = "";
		for(var i=0;i<data.length;i++){
			htmlStr += "<div class='col-12 articleReplyViewBox'>";
			htmlStr += "	<div class='col-12 articleReplyViewHeaderBox'>";
			htmlStr += "		<input type='hidden' id='rNo' value='"+data[i].rNo+"'>";
			htmlStr += "		<span class='replyId'>"+data[i].mId+"</span>";
			htmlStr += "		<span class='replyRegdate'>"+data[i].rRegdate+"</span>";
			htmlStr += "		<div class='articleViewTitleRightBox' id='updateFormBtnBox1"+data[i].rNo+"' rNo='"+data[i].rNo+"'>";
			htmlStr += "			<span class='replyViewUpdateFormBtn'>수정</span>";
			htmlStr += "			<span class='replyViewRemoveBtn'>삭제</span>";
			htmlStr += "		</div>";
			htmlStr += "		<div class='articleViewTitleRightBox' id='updateFormBtnBox1"+data[i].rNo+"' rNo='"+data[i].rNo+"'>";
			htmlStr += "			<span class='replyViewUpdateBtn'>수정</span>";
			htmlStr += "			<span class='replyViewRemoveBtn'>취소</span>";
			htmlStr += "		</div>";
			htmlStr += "	</div>";
			htmlStr += "	<div class='col-12'>";
			htmlStr += "		<span class='replyContent' id='rContent"+data[i].rNo+"'>"+data[i].rContent+"</span>";
			htmlStr += "		<input class='replyContentUpdateBox' id='rContentUpdate"+data[i].rNo+"' value='"+data[i].rContent+"'/>";
			//htmlStr += "		<input class='replyContentUpdate' id='rContentUpdate"+data[i].rNo+"' value='"+data[i].rContent+"'/>";
			htmlStr += "	</div>";
			htmlStr += "</div>";
		}
	 	$("#articleReplyListBox").empty();
    	$("#articleReplyListBox").append(htmlStr);
	}
	$(document).on("click",".replyViewUpdateBtn",
		function(){
			var rNo = $(this).parent().attr("rNo");
			var	rContent = $("#rContentUpdate"+rNo).val();
			var data2 = JSON.stringify({
				bNo : bNo,
				rNo : rNo,
				rContent : rContent
			})
			$.ajax({
				url : "/reply/update.do",
	    		dataType : "json",
	    		data : data2,
	    		contentType: "application/json; charset=UTF-8",
	    		method : "PUT",
	    	    success : function(data) {
	    	    	getReplyList(data); 
	    	    }
			});		 
		}
	)
	$(document).on("click",".replyViewUpdateFormBtn",function(){
		var rNo = $(this).parent().attr("rNo");
		
		alert("수정 버튼 클릭");
		alert("rNo : "+rNo);
		/*
		$("#updateFormBtnBox1"+bNo).css('display','none');
		$("#updateFormBtnBox2"+bNo).css('display','');
		$("#replyViewUpdateBtn").css('display','inline');
		$("#replyViewRemoveBtn").css('display','none');
		$("#replyViewCancleBtn").css('display','inline');
		$("#replyContent").css('display','none');
		$("#replyContentUpdate").css('display','inline'); 
		*/
	});
	$(document).on("click",".replyViewRemoveBtn",function(){
		var rNo = $(this).parent().attr("rNo");
		$.ajax({
		     url : '/reply/delete.do/'+bNo+"/"+rNo,
		     method : 'DELETE',
		     contentType : 'application/json;charset=UTF-8',
		     dataType : 'json',
		     success : function(data2) {
		    	 getReplyList(data2);
		     }
		});
	});
})
</script>
<div class="my-container">
	<!-- main-content-box -->
	<div class="main-content-box">
		<div class="container">
			<div class="row">
				<h2>
					<b class="testing">게시판</b>
				</h2>
				<div ></div>
			</div>

			<div class="row boardArticleViewBox">
				<div class="col-12 articleViewTitleBox">
					<input type="hidden" id="bNo" value="${article.bNo }">
					<span style="">${article.bTitle}</span>
					<span class="articleViewId">${article.mId}</span>
					<div class="articleViewTitleRightBox">
						<span class="articleViewRegdate">${article.bRegdate}</span>
						<span class="articleViewHitcount">조회수 ${article.bHitcount}</span>
						<span class="articleViewUpdateBtn">수정</span>
						<span class="articleViewRemoveBtn">삭제</span>
					</div>
				</div>
				<div class="col-md-12 articleViewContentBox">
					<span>${article.bContent}</span>
				</div>
				<div class="col-md-12 articleViewReplyBox" ><!-- 댓글 row -->
					<div class="col-12 articleReplyCountBox" id="articleReplyCountBox"></div>
					<div class="col-10">
						<input class="insertReplyBox" id="insertReplyBox"></input>
					</div>
					<button type="button" class="btn btn-primary" id="insertReplyBtn">작성</button>
					<div class="col-12 articleReplyWriteBox"><!-- 댓글 작성 -->
						<div></div>
						<div></div>
					</div><!-- 댓글 작성 끝 -->
					<div id="articleReplyListBox"><!-- 댓글 목록 -->
						<div>
						</div>
					</div> <!-- 댓글 목록 끝 -->
				</div>
			</div>
		</div>
		<!-- row1 End -->
	</div>
	<!-- main-content-box End -->
	</body>
	</html>