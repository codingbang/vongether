<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/resources/user/css/index.css">

<div class="my-container">
  <!-- main-content-box -->
	<div class="main-content-box">
		<div class="container">
		
		  <div class="row">
        <h2><b>게시판</b></h2>
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
	             <tbody>
	                 <tr>
	                     <td>1</td>
	                     <td>제목이 짧은 제목</td>
	                     <td>OK</td>
	                     <td>15:21</td>
	                     <td>123</td>
	                     <td>7</td>
	                 </tr>
	                 <tr>
	                     <td>2</td>
	                     <td>제목이 길고 긴 제목</td>
	                     <td>admin</td>
	                     <td>11-20</td>
	                     <td>456</td>
	                     <td>7</td>
	                 </tr>
	                 <tr>
	                     <td>3</td>
	                     <td>제목이 길고 길며 더 긴 제목</td>
	                     <td>user</td>
	                     <td>2018-12-31</td>
	                     <td>789</td>
	                     <td>7</td>
	                 </tr>
	             </tbody>
	         </table>
			  </div>
      </div>
      
      <div class="row">
        <div class="col-1"></div>
        <div class="col-11">
	        <button type="button" class="btn btn-primary float-right">글작성</button>
        </div>
      </div>
      
      <div class="row">
        <div class="col-3"></div>
        <div class="col-6" align="center">
          <div id="pagination">
            <button type="button" class="btn">&laquo;</button>
            <button type="button" class="btn btn-primary">1</button>
            <button type="button" class="btn btn-default">2</button>
            <button type="button" class="btn btn-default">3</button>
            <button type="button" class="btn">&raquo;</button>
          </div>
        </div>
        <div class="col-3"></div>
      </div>
      
      <div class="row">
        <div class="col-4"></div>
        <div class="col-2">
          <div class="input-group">
            <select class="custom-select">
              <option>전체검색</option>
              <option>제목</option>
              <option>내용</option>
              <option>제목+내용</option>
            </select>
          </div>
        </div>
        <div class="col-3">
          <div class="input-group">
            <input type="text" class="form-control" placeholder="검색내용">
            <div class="input-group-append">
              <button type="button" id="searchBtn" class="btn btn-primary">검색</button>
            </div>
          </div>
        </div>
      </div>
      <div class="col-4"></div>
		</div><!-- row1 End -->
	</div><!-- main-content-box End -->

</div>

