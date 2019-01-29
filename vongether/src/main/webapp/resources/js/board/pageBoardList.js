$(document).ready(function() {
	var login = '${userInfo.mId}';
	var key = $('#skey').val();
	var word = $('#sword').val();
	var pageNo = 1;
	$(".writeBtn").click(function(){
		if(login==null||login==""){
			swal("로그인 하세욧!","너는 로긴하게 될 것이야~","error");
		}else{
			location.href="/board/write.do";
		}
	});
	$("#searchBtn").click(
		function() {
			key = $('#skey').val();
			word = $('#sword').val();
			var data2 = {
					key : key,
					word : word,
					pageNo : pageNo
			}
			$.ajax({
				url : "/board/listAjax.do",
	    		dataType : "json",
	    		data : data2,
	    		contentType: "application/json; charset=UTF-8",
	    		method : "GET",
	    	    success : function(data) {
	    	    	makeVolunteerList(data.listAjaxArticle);
	    	    	makePageList(data.pagination);
	    	    }
			});
			/* $('#key').val($('#skey').val());
			$('#word').val($('#sword').val());
			$("#searchForm").attr("method", "get").attr(
					"action", "/board/list.do").submit(); */
		}
	); 
	
	$(document).on("click",".navigation-btn",
		function(){
			$('#pageNo').val($(this).attr("pageNo"));
			pageNo = $('#pageNo').val();
			var data = {
				key : key,
				word :word,
				pageNo: pageNo
			};
			getAjaxList(data);
		}
	); 
   function getAjaxList(data){
		$.ajax({
    		url : "/board/listAjax.do",
    		dataType : "json",
    		data : data,
    		contentType: "application/json; charset=UTF-8",
    		method : "GET",
    	    success : function(data) {
    	    	makeVolunteerList(data.listAjaxArticle);
    	    	makePageList(data.pagination);
    	    }
    	});		
	};
	function makeVolunteerList(data) {
		var htmlStr = "";

		for(var i=0;i<data.length;i++){
			htmlStr += "<tr>";
			htmlStr += "  <td>"+data[i].bNo+"</td>";
			htmlStr += "  <td><a href='/board/view.do?bNo="+data[i].bNo+"'>"+data[i].bTitle.replace('<','&lt;')+"</a></td>";
			htmlStr += "  <td><span>"+data[i].mId+"</span></td>";
			htmlStr += "  <td>"+data[i].bRegdate+"</td>";
			htmlStr += "  <td>"+data[i].bHitcount+"</td>";
			htmlStr += "  <td>"+data[i].rCount+"</td>";
			htmlStr += "</tr>";
		}
	 	$("#boardList").empty();
    	$("#boardList").append(htmlStr);
	}
	function makePageList(data) {
		var htmlStr = "";
		if(data.curPage!=1){
			htmlStr += "<button type='button' class='btn navigation-btn' pageNo='"+1+"'>&laquo;</button>";
			htmlStr += "<button type='button' class='btn navigation-btn' pageNo='"+data.prevPage+"'>&lt;</button>";
		}else{
			htmlStr += "<button type='button' class='btn' disabled pageNo='"+1+"'>&laquo;</button>";
			htmlStr += "<button type='button' class='btn' disabled pageNo='"+data.prevPage+"'>&lt;</button>";
		}
		for(var i=data.startPage;i<data.endPage+1;i++){
			if(data.curPage==i){
				htmlStr += "<button type='button' class='btn btn-primary' pageNo='"+i+"'>"+i+"</button>";
			}else{
				htmlStr += "<button type='button' class='btn btn-default navigation-btn' pageNo='"+i+"'>"+i+"</button>";
			}
		}
		if(data.curPage!=data.totalPage){
			htmlStr += "<button type='button' class='btn navigation-btn' pageNo='"+data.nextPage+"'>&gt;</button>";
			htmlStr += "<button type='button' class='btn navigation-btn' pageNo='"+data.totalPage+"'>&raquo;</button>";
		}else{
			htmlStr += "<button type='button' class='btn' disabled pageNo='"+data.nextPage+"'>&gt;</button>";
			htmlStr += "<button type='button' class='btn' disabled pageNo='"+data.totalPage+"'>&raquo;</button>";
		}
	 	$("#pagination").empty();
    	$("#pagination").append(htmlStr); 
    	
	}
	
});