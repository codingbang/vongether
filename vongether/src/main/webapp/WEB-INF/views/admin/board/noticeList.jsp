<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
$(function(){
	
	
	$(document).on("click", "#searchBtn", function(){
		console.log($("#keyword").val());
		var jsonData = {
			pageNo : 1,
			keyword : $("#keyword").val()
		};
		getNoticeList(jsonData);
	});
	
	
	$(document).on("click", ".mvpage", function(){
		var jsonData = {
			pageNo : $(this).attr("move-page-no"),
			keyword : $("#keyword").val()
		};
		
		getNoticeList(jsonData);
		
	});
	
	function getNoticeList(jsonParam) {
    	$.ajax({
    		url : "/admin/board/ajaxnoticelist.do",
    		dataType : "json",
    		data : jsonParam,
    		contentType: "application/json; charset=UTF-8",
    		method : "GET",
    	    success : function(data) {
    	    	makeNoticeList(data);
    	    }
    	});
    }
	
	function makeNoticeList(data) {
		var htmlStr = '';
		
		if (data != null) {
			
			for (var i = 0; i < data.noticeList.length; i++) {
				htmlStr += '<tr>';
				htmlStr += '	 <td><input type="checkbox" class="icheck" name="checkbox1" /></td>';
				htmlStr += '	 <td>' + data.noticeList[i].bNo + '</td>';
				htmlStr += '	 <td><a href="/admin/board/view.do?bNo=' + data.noticeList[i].bTitle + '">' + data.noticeList[i].bTitle + '</a></td>';
				htmlStr += '	 <td>' + data.noticeList[i].mId + '</td>';
				htmlStr += '	 <td>' + data.noticeList[i].bRegdate + '</td>';
				htmlStr += '	 <td>' + data.noticeList[i].bHitcount + '</td>';
				htmlStr += '	 <td>' + data.noticeList[i].rCount + '</td>';
				htmlStr += '<tr>';
			}
			
			$("#articleListTBody").empty();
	    	$("#articleListTBody").append(htmlStr);
			
	    	
	    	var htmlStr2 = "";
	        
	        
	        if (data.pagination.curRange != 1 || data.pagination.curPage != 1) {
	        	htmlStr2 += '<li><button type="button" class="btn mvpage"  move-page-no="1">&laquo;</button></li>';
           		htmlStr2 += '<li><button type="button" class="btn mvpage"  move-page-no="'+ data.pagination.prevPage +'">&lt;</button></li>';
			} else {
				htmlStr2 += '<li><button type="button" class="btn mvpage" disabled  move-page-no="1">&laquo;</button></li>';
           		htmlStr2 += '<li><button type="button" class="btn mvpage" disabled  move-page-no="'+ data.pagination.prevPage +'">&lt;</button></li>';
			}
	        
	        for (var nowPage = data.pagination.startPage; nowPage <= data.pagination.endPage; nowPage++) {
	        	if (nowPage == data.pagination.curPage) {
	        		htmlStr2 += '<li><button type="button" class="btn btn-primary mvpage"  move-page-no="'+ nowPage +'">'+ nowPage +'</button></li>';
				}else if(nowPage != data.pagination.curPage) {
					htmlStr2 += '<li><button type="button" class="btn btn-default mvpage"  move-page-no="'+ nowPage +'">'+ nowPage +'</button></li>';
				}
	        }
	        
	        if (data.pagination.curRange != data.pagination.totalPage && data.pagination.totalPage > 0) {
	        	htmlStr2 += '<li><button type="button" class="btn mvpage"  move-page-no="'+ data.pagination.nextPage +'">&gt;</button></li>';
           		htmlStr2 += '<li><button type="button" class="btn mvpage"  move-page-no="'+ data.pagination.totalPage +'">&raquo;</button></li>';
			} else {
				htmlStr2 += '<li><button type="button" class="btn mvpage" disabled  move-page-no="'+ data.pagination.nextPage +'">&gt;</button></li>';
           		htmlStr2 += '<li><button type="button" class="btn mvpage" disabled  move-page-no='+ data.pagination.totalPage +'">&raquo;</button></li>';
			}
	        
	        $('.pagination').empty();
	        $('.pagination').append(htmlStr2);         
		}
	};
	
});




</script>

 <div class="panel box-shadow-none content-header">
                  <div class="panel-body">
                    <div class="col-md-12">
                        <h3 class="animated fadeInLeft">공지사항 관리</h3>
                        <p class="animated fadeInDown">
                          공지사항 목록
                        </p>
                    </div>
                  </div>
              </div>

            <div class="col-md-12 top-20 padding-0">
              <div class="col-md-12">
                <div class="panel">
                  <div class="panel-body">
                  <div class="col-md-12 padding-0" style="padding-bottom:20px;">
                    <div class="col-md-6" style="padding-left:10px;">
                        <input type="checkbox" class="icheck pull-left" name="checkbox1"/>
                        <input class="btn btn-danger pull-left" type="button" value="삭제">
                    </div>
                    <div class="col-md-6">
                         <div class="col-lg-12">
                            <div class="input-group">
                              <input type="text" class="form-control" id="keyword" aria-label="...">
                              <div class="input-group-btn">
                                <button id="searchBtn" type="button" class="btn btn-info">검색</button>
                              </div><!-- /btn-group -->
                            </div><!-- /input-group -->
                          </div><!-- /.col-lg-6 -->
                    </div>
                 </div>
                  <div class="responsive-table">
                      
                    <table class="table table-striped table-bordered" width="100%" cellspacing="0">
                    <colgroup>
		                  <col width="3%">
		                  <col width="4%">
		                  <col width="*">
		                  <col width="15%">
		                  <col width="10%">
		                  <col width="6%">
		                  <col width="6%">
		                  <col width="15%">
		                </colgroup>
                    <thead>
                      <tr>
                        <th><input type="checkbox" class="icheck" name="checkbox1" /></th>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>조회수</th>
                        <th>댓글수</th>
                      </tr>
                    </thead>
                    <tbody id="articleListTBody">
                      <c:forEach var="notice" items="${noticeList }">
                        <tr>
                          <td><input type="checkbox" class="icheck" name="checkbox1" /></td>
                          <td>${notice.bNo }</td>
                          <td><a href="/admin/board/view.do?bNo=${notice.bNo }">${notice.bTitle }</a></td>
                          <td>${notice.mId}</td>
                          <td>${notice.bRegdate }</td>
                          <td>${notice.bHitcount }</td>
                          <td>${notice.rCount }</td>
                      </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                  </div>
                  <div class="col-md-6" style="padding-top:20px;">
                    <span>total ${pagination.listCnt } items</span>
                  </div>
                  <div class="col-md-6">
                        <ul class="pagination pull-right">
                       	<c:if test="${pagination.curPage==1}">
                       		<li><button type="button" class="btn mvpage" disabled  move-page-no="1">&laquo;</button></li>
                       		<li><button type="button" class="btn mvpage" disabled  move-page-no="${pagination.prevPage}">&lt;</button></li>
		          		</c:if>
		          		<c:if test="${pagination.curPage!=1}">
		          			<li><button type="button" class="btn mvpage"  move-page-no="1">&laquo;</button></li>
                       		<li><button type="button" class="btn mvpage"  move-page-no="${pagination.prevPage}">&lt;</button></li>
		          		</c:if>
		          		<c:forEach  var="nowPage" begin="${pagination.startPage}" end="${pagination.endPage}">
			          		<c:if test="${pagination.curPage==nowPage}">
			          			<li><button type="button" class="btn btn-primary mvpage"  move-page-no="${nowPage }">${nowPage }</button></li>
		         			</c:if>
			          		<c:if test="${pagination.curPage!=nowPage}">
			          			<li><button type="button" class="btn btn-default mvpage"  move-page-no="${nowPage }">${nowPage }</button></li>
		         			</c:if>
		         		</c:forEach>
		         		<c:if test="${pagination.curPage!=pagination.endPage}">
		         			<li><button type="button" class="btn mvpage"  move-page-no="${pagination.nextPage}">&gt;</button></li>
                       		<li><button type="button" class="btn mvpage"  move-page-no="${pagination.endPage}">&raquo;</button></li>
		          		</c:if>
		          		<c:if test="${pagination.curPage==pagination.endPage}">
		          			<li><button type="button" class="btn mvpage" disabled  move-page-no="${pagination.nextPage}">&gt;</button></li>
                       		<li><button type="button" class="btn mvpage" disabled  move-page-no="${pagination.endPage}">&raquo;</button></li>
		          		</c:if>
                        </ul>
                  </div>
                </div>
              </div>
            </div>  
          </div>