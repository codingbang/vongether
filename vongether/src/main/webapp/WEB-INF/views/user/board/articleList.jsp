<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/resources/user/css/index.css">

<script type="text/javascript">
$(document).ready(function() {
	$(".posting").click(
			function(){
				$("#bNo").val($(this).attr("b-no"));
				$("#commonForm").attr("method", "get").attr(
						"action", "/board/view.do").submit();	
		});
	$(".writeBtn").click(
		function(){
			location.href="/board/write.do";
		}		
	);
	$("#searchBtn").click(
		function() {
			$('#key').val($('#skey').val());
			$('#word').val($('#sword').val());
			$("#searchForm").attr("method", "get").attr(
					"action", "/board/list.do").submit();
		}
	); 
	
	$(".testtest").click(
		function(){
			/* $("#pageNo").val($(this).attr("b-no")); */
			/* var text = $('#pageNo').val(); */
			var test = {
				pageNo: '2'
			};
			getAjaxList(test);
		}
	); 
	function getAjaxList(test){
		$.ajax({
    		url : "/board/listAjax.do",
    		dataType : "json",
    		data : test,
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
			htmlStr += "  <td><a href='/board/view.do?bNo="+data[i].bNo+"'>"+data[i].bTitle+"</a></td>";
			<%-- htmlStr += "  <td class="posting" b-no="${list.bNo}"><a href="/board/view.do?bNo=${list.bNo}">${list.bTitle}</a></td>"; --%>
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
			htmlStr += "<button type='button' class='btn' pageNo='"+1+"'>&laquo;</button>";
			htmlStr += " <button type='button' class='btn' pageNo='"+data.prevPage+"'>&lt;</button>";
		}else{
			htmlStr += "<button type='button' class='btn' disabled pageNo='"+1+"'>&laquo;</button>";
			htmlStr += " <button type='button' class='btn' disabled pageNo='"+data.prevPage+"'>&lt;</button>";
		}
		for(var i=data.startPage;i<data.curRange;i++){
			if(data.curPage==i){
				htmlStr += "<button type='button' class='btn btn-primary'>"+i+"</button>";
			}else{
				htmlStr += "<button type='button' class='btn btn-default'>"+i+"</button>";
			}
		}
		if(data.curPage!=data.endPage){
			htmlStr += " <button type='button' class='btn' pageNo='"+data.nextPage+"'>&gt;</button>";
			htmlStr += "<button type='button' class='btn' pageNo='"+data.endPage+"'>&raquo;</button>";
		}else{
			htmlStr += " <button type='button' class='btn' disabled pageNo='"+data.nextPage+"'>&gt;</button>";
			htmlStr += "<button type='button' class='btn' disabled pageNo='"+data.endPage+"'>&raquo;</button>";
		}
	 	$("#pagination").empty();
    	$("#pagination").append(htmlStr); 
    	
	}
    
   
    
    
    
	
})
</script>
<div class="my-container">
  <!-- main-content-box -->
	<div class="main-content-box">
		<div class="container">
		    <div class="row">
        		<h2 class="testtest"><b>게시판</b></h2>
			</div>
			
			<div class="row">
			  <div class="col-12">
	        <table class="table table-list-search">
	             <thead>
	                 <tr>
	                     <th>번호</th>
	                     <th>제목</th>
	                     <th>작성자</th>
	                     <th>작성일</th>
	                     <th>조회수</th>
	                     <th>댓글</th>
	                 </tr>
	             </thead>
	             <tbody id="boardList">
	             <c:forEach var="list" items="${selectBoardList}">
						<tr>
	                     <td>${list.bNo}</td>
	                     <td><a href="/board/view.do?bNo=${list.bNo}">${list.bTitle}</a></td>
	                     <%-- <td class="posting" b-no="${list.bNo}"><a href="/board/view.do?bNo=${list.bNo}">${list.bTitle}</a></td> --%>
	                     <td>${list.mId}</td>
	                     <td>${list.bRegdate}</td>
	                     <td>${list.bHitcount}</td>
	                     <td>${list.rCount}</td>
	                 </tr>
			     </c:forEach>
	             </tbody>
	         </table>
			  </div>
      </div>
      <div class="row">
        <div class="col-1"></div>
        <div class="col-11">
	        <button type="button" class="btn btn-primary float-right writeBtn">글작성</button>
        </div>
      </div>
      
      <div class="row">
        <div class="col-3"></div>
        <div class="col-6" align="center">
          <div id="pagination">
          		<%-- <c:if test="curPage==1">
	          		<button type='button' class='btn' disabled pageNo='1'>&raquo;</button>";
    	      		<button type='button' class='btn' disabled pageNo='${data.prevPage}'>&raquo;</button>";
          		</c:if>
          		<c:if test="curPage!=1">
	          		<button type='button' class='btn' pageNo='${}'>&raquo;</button>";
    	      		<button type='button' class='btn' pageNo='${}'>&raquo;</button>";
          		</c:if>
          		<c:forEach  var="i" begin="${pagination.startPage}" end="${pagination.curRange}">
	          		<button type='button' class='btn' pageNo='i'>i</button>";
          		</c:forEach>
          		<c:if test="curPage!=${pagination.endPage}">
        	  		<button type='button' class='btn' pageNo='${data.endPage}'>&raquo;</button>";
       	   			<button type='button' class='btn' pageNo='${data.endPage}'>&raquo;</button>";
          		</c:if>
          		<c:if test="curPage==${pagination.endPage}">
          			<button type='button' class='btn' disabled pageNo='"+data.endPage+"'>&raquo;</button>";
          			<button type='button' class='btn' disabled pageNo='"+data.endPage+"'>&raquo;</button>";
          		</c:if> --%>
          </div>
        </div>
        <div class="col-3"></div>
      </div>
      
      <div class="row">
        <div class="col-4"></div>
        <div class="col-2">
          <div class="input-group">
            <!-- 검색 조건 -->
            <select class="custom-select" name="key" id="skey">
              <option value="">제목+내용</option>
              <option value="content">내용</option>
              <option value="title">제목</option>
              <option value="id">아이디</option>
            </select>
          </div>
        </div>
        <div class="col-3">
          <div class="input-group">
            <input type="text" class="form-control" name="word" id="sword" placeholder="검색내용">
            <div class="input-group-append">
              <button type="button" id="searchBtn" class="btn btn-primary">검색</button>
            </div>
            <!-- 검색 조건 끝 -->
          </div>
        </div>
      </div>
      <div class="col-4"></div>
		</div><!-- row1 End -->
	</div><!-- main-content-box End -->

</div>

