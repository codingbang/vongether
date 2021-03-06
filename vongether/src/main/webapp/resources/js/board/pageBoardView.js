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
	$("#articleRemoveBtn").click(function(){
		swal({
			  title: "글을 삭제하시겠습니까?",
			  text: "너의 글은 살아남지 못할것이다!",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
				location.href="/board/delete.do?bNo="+bNo;
			  } else {
			    swal("게시글 : 사..살았다...");
			  }
			});
	});
	
	//댓글작성
	$(document).on("click","#replyWriteBtn",
		function(){
			var data2 = JSON.stringify({ 
							rContent: $("#replyWriteText").val(), 
							bNo: $("#bNo").val()
						});
			if('${userInfo.mId}'==null || '${userInfo.mId}' == ""){
				swal("로그인 하세욧!","너는 로긴하게 될 것이야~","error");
			}else if($("#replyWriteText").val().trim() == ""){
				swal("내용을 입력하세요!","내용이 없도다~","error");
			}else{
				swal("댓글을 쓰고싶다고???","바~로~ 처리해쥬징!","success");
			$.ajax({
	    		url : "/reply.do",
	    		dataType : "json",
	    		data : data2,
	    		contentType: "application/json; charset=UTF-8",
	    		method : "POST",
	    	    success : function(data2) {
    	    		getReplyList(data2);
    	    		$("#replyWriteText").val("");
	    	    }
	    	});
			}
		}
	);
	
	//댓글 가져오는 함수
	function getReplyList(data){
		$.ajax({
    		url : "/reply.do",
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
			if(!('${userInfo.mId}'==null)&&(data[i].mId == '${userInfo.mId}')){
				htmlStr += '		<div class="col-md-offset-6 col-md-2" id="div2_'+data[i].rNo+'">';
				htmlStr += '			<a href="#" class="replyModifyBtn" replyNo="'+data[i].rNo+'">수정</a>';
				htmlStr += '			<a href="#" class="replyRemoveBtn" replyNo="'+data[i].rNo+'">삭제</a>';
				htmlStr += '		</div>';
			}
			htmlStr += '		<div class="col-md-12">';
			htmlStr += 				data[i].rContent;
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
				url : "/reply.do",
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
		$(".replyModifyBtn").css({"pointer-events":"none"},{"cursor":"default"});
		$("#div_"+rNo).parent().css("display", "");
		$("#div2_"+rNo).parent().css("display", "none");
		$("#div_"+rNo).children().eq(0).children().first().focus();
		return false;
	});
	
	//댓글 수정 폼 숨기는 이벤트
	$(document).on("click",".replyCancelBtn",function(){
		$(".replyModifyBtn").css({"pointer-events":""},{"cursor":""});
		var rNo = $(this).parent().parent().attr("id").substring(4);
		$("#div_"+rNo).parent().css("display", "none");
		$("#div2_"+rNo).parent().css("display", "");
		return false;
	});
	
	//댓글 삭제 이벤트
	$(document).on("click",".replyRemoveBtn",function(){
		var rNo = $(this).attr("replyNo");
		swal({
			  title: "댓글을 삭제하시겠습니까?",
			  text: "너의 글은 살아남지 못할것이다!",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
				$.ajax({
				     url : '/reply.do/'+bNo+"/"+rNo,
				     method : 'DELETE',
				     contentType : 'application/json;charset=UTF-8',
				     dataType : 'json',
				     success : function(data2) {
				    	 if(data2.success == "Y"){
				    		 swal("성공적으로 처리되었습니다.");
					    	 getReplyList(data);
				    	 }else{
				    		 swal("으딜 감히 로그인 부터 하라그 로크만.");
				    	 }
				     }
				});
			  } else {
			    swal("댓글 : 사..살았다...");
			  }
		});
		return false;
	});
	
});