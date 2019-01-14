<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
                              <input type="text" class="form-control" aria-label="...">
                              <div class="input-group-btn">
                                <button type="button" class="btn btn-info">검색</button>
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
                    <span>showing 0-10 of 30 items</span>
                  </div>
                  <div class="col-md-6">
                        <ul class="pagination pull-right">
                          <li>
                            <a href="#" aria-label="Previous">
                              <span aria-hidden="true">&laquo;</span>
                            </a>
                          </li>
                          <li class="active"><a href="#">1</a></li>
                          <li><a href="#">2</a></li>
                          <li><a href="#">3</a></li>
                          <li><a href="#">4</a></li>
                          <li><a href="#">5</a></li>
                          <li>
                            <a href="#" aria-label="Next">
                              <span aria-hidden="true">&raquo;</span>
                            </a>
                          </li>
                        </ul>
                  </div>
                </div>
              </div>
            </div>  
          </div>