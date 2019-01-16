<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.viewTitle {
	font-size: 25px;
	font-weight: bold;
}
.articleViewContentBox {
	min-height: 400px;
	border: 1px solid;
}
.replyRow {
	padding-bottom: 5px;
	border-top: 1px solid;
}
</style>
<script type="text/javascript">

$(document).ready(function() {
	
	var bNo = $("#bNo").val();
	var data = {
		bNo: bNo
	};
	//초기 댓글 목록 가져오기
	getReplyList(data);
	
	//게시글 수정
	$("#articleUpdateBtn").click(
		function(){
			location.href="/board/update.do?bNo="+bNo;
		}		
	);
	
	//게시글 삭제
	$("#articleUpdateBtn").click(
		function(){
			location.href="/board/delete.do?bNo="+bNo;
		}		
	);
	
	//댓글작성
	$(document).on("click","#replyWriteBtn",
		function(){
			var data2 = JSON.stringify({ 
							rContent: $("#replyWriteText").val(), 
							bNo: $("#bNo").val()
						});
			
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
	    	    		$("#replyWriteText").val("");
	    	    	}
	    	    }
	    	});
		}
	);
	
	//댓글 가져오는 함수
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
	
	//댓글 개수 가져오는 함수
	function getReplyCount(data) {
		var htmlStr = "";
		htmlStr += '댓글수 ['+data+']';
		
		$("#replyCount").empty();
    	$("#replyCount").append(htmlStr);
	}
	
	//댓글 리스트 HTML 만드는 함수
	function makeReplyList(data) {
		var htmlStr = "";
		
		for(var i=0;i<data.length;i++){
			htmlStr += '<div class="row replyRow">';
			htmlStr += '	<div class="col-md-12">';
			htmlStr += '		<div class="col-md-4">';
			htmlStr += '			<span class="col-md-7"><b>'+data[i].mId+'</b></span>';
			htmlStr += '			<span class="col-md-5"><small>'+data[i].rRegdate+'</small></span>';
			htmlStr += '		</div>';
			htmlStr += '		<div class="col-md-6">';
			htmlStr += 				data[i].rContent;
			htmlStr += '		</div>';
			htmlStr += '		<div class="col-md-2">';
			htmlStr += '			<a href="#" class="replyModifyBtn" replyNo="'+data[i].rNo+'">수정</a>';
			htmlStr += '			<a href="#" class="replyRemoveBtn" replyNo="'+data[i].rNo+'">삭제</a>';
			htmlStr += '		</div>';
			htmlStr += '	</div>';
			htmlStr += '	<div class="col-md-12" style="display: none;">';
			htmlStr += '		<div id="div_'+data[i].rNo+'" class="row">';
			htmlStr += '			<div class="col-md-10">';
			htmlStr += '				<textarea class="form-control" style="resize: none;" rows="2">'+data[i].rContent+'</textarea>';
			htmlStr += '			</div>';
			htmlStr += '			<div class="col-md-2" style="margin-top: 20px;">';
			htmlStr += '				<a href="#" class="replyUpdateBtn" style="color: #337ab7;">수정</a>';
			htmlStr += '				<a href="#" class="replyCancelBtn" style="color: #337ab7;">취소</a>';
			htmlStr += '			</div>';
			htmlStr += '		</div>';
			htmlStr += '	</div>';
			htmlStr += '</div>';
				
		}
		
		
	 	$("#replyList").empty();
    	$("#replyList").append(htmlStr);
	}
	
	
	
	//댓글 최종 수정
	$(document).on("click",".replyUpdateBtn",
		function(){
			var rNo = $(this).parent().parent().attr("id").substring(4);
			var	rContent = $("#div_"+rNo).children().eq(0).children().first().val();
			
			var data2 = JSON.stringify({
				bNo : bNo,
				rNo : rNo,
				rContent : rContent
			});
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
			return false;
		}
	);
	
	
	//댓글 수정 폼 보이는 이벤트
	$(document).on("click",".replyModifyBtn",function(){
		var rNo = $(this).attr("replyNo");
		$("#div_"+rNo).parent().css("display", "");
		$("#div_"+rNo).children().eq(0).children().first().focus();
		return false;
	});
	
	//댓글 수정 폼 숨기는 이벤트
	$(document).on("click",".replyCancelBtn",function(){
		var rNo = $(this).parent().parent().attr("id").substring(4);
		$("#div_"+rNo).parent().css("display", "none");
		return false;
	});
	
	//댓글 삭제 이벤트
	$(document).on("click",".replyRemoveBtn",function(){
		var rNo = $(this).attr("replyNo");
		$.ajax({
		     url : '/reply/delete.do/'+bNo+"/"+rNo,
		     method : 'DELETE',
		     contentType : 'application/json;charset=UTF-8',
		     dataType : 'json',
		     success : function(data2) {
		    	 getReplyList(data2);
		     }
		});
		return false;
	});
	
	
	
})
</script>





<div class="container">
	<div class="row" style="padding-top: 30px;">
		<div class="col-md-6 col-md-offset-3 text-center fh5co-heading">
			<h2>게시판</h2>
			<p><span>상세 게시글</span></p>
		</div>
	</div>
	
	<!-- 게시판 본문부분 -->
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="boardArticleViewBox">
					<div class="col-md-12">
						<div class="col-md-4">
							<input type="hidden" id="bNo" value="${article.bNo }">
							<span class="viewTitle">${article.bTitle}&nbsp;&nbsp;&nbsp;</span>
							<span class="articleViewId">작성자[${article.mId}]</span>
							
						</div>
						<div class="col-md-offset-5 col-md-3">
							<div class="pull-right">
								<span class="articleViewRegdate">${article.bRegdate}</span>
								<span class="articleViewHitcount">조회수[${article.bHitcount}]</span>
							</div>
						</div>
					</div>
					<hr>
					<div class="col-md-12 articleViewContentBox">
						<span>${article.bContent}</span>
					</div>
					<div class="col-md-12">
						<div class="pull-right">
							<button id="articleUpdateBtn"type="button" class="btn btn-info">수정</button>
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
				<div class="row">
					<div class="col-md-11">
						<input class="insertReplyBox form-control" id="replyWriteText"></input>
					</div>
					<div class="col-md-1">
						<button type="button" class="btn btn-primary" id="replyWriteBtn">작성</button>
					</div>
				</div>
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

