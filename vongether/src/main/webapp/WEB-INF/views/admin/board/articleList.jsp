<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>

$(function(){
	
	//체크박스 모두 체크
	$(document).on("click", ".allCheck", function(){
		if( $("input[name=checkbox1]").is(':checked') ){
			$("input[name=checkbox2]").prop("checked", true);
		}else {
			$("input[name=checkbox2]").prop("checked", false);
		}
	});
	
	
	//체크 박스를 이용한 다중삭제처리
	$(document).on("click", "#articleDelBtn", function(){
		var checkRow = "";
		$( "input[name='checkbox2']:checked" ).each (function (){
			checkRow = checkRow + $(this).val()+"," ;
		});
		checkRow = checkRow.substring(0,checkRow.lastIndexOf( ",")); //맨끝 콤마 지우기
		
		if(checkRow == ''){
			alert("삭제할 대상을 선택하세요.");
			return false;
		}
		var checkData = { "checkRow" : checkRow };
		
		//true : 삭제 비동기 처리 후 목록 다시 불러오기
		if(confirm("정보를 삭제 하시겠습니까?")){
			//삭제 ajax처리
			$.ajax({
				url : "/admin/board/boarddelete.do",
				data : JSON.stringify(checkData),
				method : "POST",
				dataType : "json",
				contentType: "application/json; charset=UTF-8",
		        success : function(data) {
		        	if(data.isSuccess == true) {
			        	alert(data.msg);
			        	var jsonData = {
			    				pageNo : 1,
			    				keyword : $("#keyword").val(),
			    				searchType : $("#searchType option:selected").val()
		    			};
		    			getArticleList(jsonData);
		    			$(".allCheck").prop("checked", false);
		        	}
		        },
		        error : function(jqXHR) {
		        	console.log("error :"+ jqXHR.status);
		        }
		     });
		}
	});
	
	
	
	
	//체크 박스를 이용한 다중삭제 취소처리
	$(document).on("click", "#articleDelCancelBtn", function(){
		var checkRow = "";
		$( "input[name='checkbox2']:checked" ).each (function (){
			checkRow = checkRow + $(this).val()+"," ;
		});
		checkRow = checkRow.substring(0,checkRow.lastIndexOf( ","));
		
		if(checkRow == ''){
			alert("취소할 대상을 선택하세요.");
			return false;
		}
		var checkData = { "checkRow" : checkRow };
		
		//true : 삭제취소 비동기 처리 후 목록 다시 불러오기
		if(confirm("정보를 삭제취소 하시겠습니까?")){
			$.ajax({
				url : "/admin/board/deletecancel.do",
				data : JSON.stringify(checkData),
				method : "POST",
				dataType : "json",
				contentType: "application/json; charset=UTF-8",
		        success : function(data) {
		        	if(data.isSuccess == true) {
			        	alert(data.msg);
			        	var jsonData = {
			    				pageNo : 1,
			    				keyword : $("#keyword").val(),
			    				searchType : $("#searchType option:selected").val()
		    			};
		    			getArticleList(jsonData);
		    			$(".allCheck").prop("checked", false);
		        	}
		        },
		        error : function(jqXHR) {
		        	console.log("error :"+ jqXHR.status);
		        }
		     });
		}
	});




	//검색 처리 이벤트
	$(document).on("click", "#searchBtn", function(){
		var keyword = $("#keyword").val();
		var searchType = $("#searchType option:selected").val();
		console.log(searchType);
		
		var jsonData = {
			pageNo : 1,
			keyword : keyword,
			searchType : searchType
		};
		getArticleList(jsonData);
	});
	
	
	//페이지 이동 이벤트
	$(document).on("click", ".mvpage", function(){
		var jsonData = {
			pageNo : $(this).attr("move-page-no"),
			keyword : $("#keyword").val(),
			searchType : $("#searchType option:selected").val()
		};
		
		getArticleList(jsonData);
		
	});
	
	
	//글 목록을 가져오는 함수
	function getArticleList(jsonParam) {
    	$.ajax({
    		url : "/admin/board/ajaxarticlelist.do",
    		dataType : "json",
    		data : jsonParam,
    		contentType: "application/json; charset=UTF-8",
    		method : "GET",
    	    success : function(data) {
    	    	makeArticleList(data);
    	    }
    	});
    }
	
	//ajax를 통해 가져온 글 목록 데이터로
	//HTML을 이용해 화면에 표시해주는 함수
	function makeArticleList(data) {
		var htmlStr = '';
		
		if (data != null) {
			
			for (var i = 0; i < data.articleList.length; i++) {
				var delDateHTML = "";
				var delYNHTML = "";
				
				if (data.articleList[i].bDeldate == null) {
					delDateHTML = '	 <td></td>';
				}else {
					delDateHTML = '	 <td>' + data.articleList[i].bDeldate + '</td>';
				}
				
				if (data.articleList[i].bDelYN == null || data.articleList[i].bDelYN == 0) {
					delYNHTML = '	 <td style="color: blue;">게시</td>';
				} else {
					delYNHTML = '	 <td style="color: red;">삭제</td>';
				}
				
				htmlStr += '<tr>';
				htmlStr += '	 <td><input type="checkbox" class="icheck" name="checkbox2" value="'+data.articleList[i].bNo+'"/></td>';
				htmlStr += '	 <td>' + data.articleList[i].bNo + '</td>';
				htmlStr += '	 <td><a href="/admin/board/view.do?bNo=' + data.articleList[i].bTitle + '">' + data.articleList[i].bTitle + '</a></td>';
				htmlStr += '	 <td>' + data.articleList[i].mId + '</td>';
				htmlStr += '	 <td>' + data.articleList[i].bRegdate + '</td>';
				htmlStr += '	 <td>' + data.articleList[i].bHitcount + '</td>';
				htmlStr += '	 <td>' + data.articleList[i].rCount + '</td>';
				htmlStr += delYNHTML;
				htmlStr += delDateHTML;
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
	        
	        var htmlStr3 = '';
	        var pageOfStart = (data.pagination.curPage-1) * (data.pagination.pageSize)+1;
	        var pageOfLast = data.pagination.curPage * data.pagination.pageSize;
	        
	        if (data.pagination.curPage != data.pagination.totalPage && data.pagination.totalPage > 0) {
	        	htmlStr2 += '<li><button type="button" class="btn mvpage"  move-page-no="'+ data.pagination.nextPage +'">&gt;</button></li>';
           		htmlStr2 += '<li><button type="button" class="btn mvpage"  move-page-no="'+ data.pagination.totalPage +'">&raquo;</button></li>';
           		
			} else {
				htmlStr2 += '<li><button type="button" class="btn mvpage" disabled  move-page-no="'+ data.pagination.nextPage +'">&gt;</button></li>';
           		htmlStr2 += '<li><button type="button" class="btn mvpage" disabled  move-page-no="'+ data.pagination.totalPage +'">&raquo;</button></li>';
           		
           		pageOfLast = data.pagination.listCnt;
			}
	        htmlStr3 = 'showing '+ pageOfStart + ' - '+ pageOfLast +' of '+ data.pagination.listCnt + ' items'  ;
	        
	        $('#pageItems').empty();
	        $('#pageItems').append(htmlStr3);
	        $('.pagination').empty();
	        $('.pagination').append(htmlStr2);         
		}
	};
	
});

</script>

 <div class="panel box-shadow-none content-header">
                  <div class="panel-body">
                    <div class="col-md-12">
                        <h3 class="animated fadeInLeft">일반 게시글 관리</h3>
                        <p class="animated fadeInDown">
                          일반 게시글 목록
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
                        <input type="checkbox" class="icheck allCheck pull-left" name="checkbox1"/>
                        <input id="articleDelBtn" class="btn btn-danger pull-left" type="button" value="삭제">
                        <input id="articleDelCancelBtn"class="btn btn-warning pull-left" type="button" value="삭제취소">
                    </div>
                    <div class="col-md-6">
                   		<div class="form-group">
	                    	<div class="col-lg-4">
                         		<select id="searchType" class="select2-A form-control">
	                        		<option value="">선택</option>
	                        		<option value="all">전체</option>
	                        		<option value="title">제목</option>
	                        		<option value="content">내용</option>
	                        		<option value="writer">작성자</option>
	                        		<option value="tnc">제목+내용</option>
                    			</select>
	                    	</div>
	                    	<div class="col-lg-6">
								<input id="keyword" type="text" class="form-control" aria-label="...">
	                    	</div>
	                    	<div class="col-lg-2">
	                            <button id="searchBtn" type="button" class="btn btn-info form-control">검색</button>
	                    	</div>
                       	</div>
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
		                  <col width="5%">
		                  <col width="5%">
		                  <col width="7%">
		                  <col width="10%">
		                </colgroup>
                    <thead>
                      <tr>
                        <th><input type="checkbox" class="icheck allCheck" name="checkbox1" /></th>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>조회수</th>
                        <th>댓글수</th>
                        <th>삭제여부</th>
                        <th>삭제일</th>
                      </tr>
                    </thead>
                    <tbody id="articleListTBody">
                      <c:forEach var="article" items="${articleList }">
                        <tr>
                          <td><input type="checkbox" class="icheck" name="checkbox2" value="${article.bNo }"/></td>
                          <td>${article.bNo }</td>
                          <td><a href="/admin/board/view.do?bNo=${article.bNo }">${article.bTitle }</a></td>
                          <td>${article.mId}</td>
                          <td>${article.bRegdate }</td>
                          <td>${article.bHitcount }</td>
                          <td>${article.rCount }</td>
                          <c:choose>
	                          <c:when test="${null eq article.bDelYN || article.bDelYN eq 0}">
		                          <td style="color: blue;">게시</td>
	                          </c:when>
	                          <c:otherwise>
	                          	  <td style="color: red;">삭제</td>
	                          </c:otherwise>
                          </c:choose>
                          <c:choose>
	                          <c:when test="${null eq article.bDeldate}">
		                          <td></td>
	                          </c:when>
	                          <c:otherwise>
	                          	  <td>${article.bDeldate }</td>
	                          </c:otherwise>
                          </c:choose>
                      </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                  </div>
                  <div class="col-md-6" style="padding-top:20px;">
                    <span id="pageItems">showing ${(pagination.curPage-1) * pagination.pageSize +1} - ${pagination.curPage * pagination.pageSize} of ${pagination.listCnt} items</span>
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