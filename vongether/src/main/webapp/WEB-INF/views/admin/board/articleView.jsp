<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
 <div class="panel box-shadow-none content-header">
    <div class="panel-body">
      <div class="col-md-12">
          <h3 class="animated fadeInLeft">일반 게시글 관리</h3>
          <p class="animated fadeInDown">
            일반 게시글 상세
          </p>
      </div>
    </div>
</div>
<div class="col-md-12">
	<div class="col-md-12">
		<div class="panel">
			<div class="panel-heading">
			   <h3><b>${article.bTitle }</b></h3>
         <h5 class="pull-right">${article.mId }</h5>
			</div>
				<div class="panel-body">
					<div class="col-md-12">
					 <div class="col-md-12 col-sm-12 col-xs-12">
					</div>
					<div class="col-md-12 col-sm-12 col-xs-12 mail-right-content padding-0">
					  <div class="col-md-12 col-sm-12 col-xs-12 mail-right-text">
					    <p>${article.bContent }</p>
					  </div>
             <div class="col-md-12 col-sm-12 col-xs-12">
                 <span class="pull-right">${article.bRegdate }</span>
            </div>
					  <div class="col-md-12 col-sm-12 col-xs-12">
					    <hr />
					  </div>
					  
					  <div class="col-md-12 col-sm-12 col-xs-12">
              <button type="button" class="btn btn-danger pull-right">삭제</button>
            </div>
					</div>
					
					
					<div class="col-md-12 col-sm-12 col-xs-12">
            <hr />
          </div>
					<div class="col-md-12 col-sm-12 col-xs-12">
					
					댓글?
					</div>
					
					</div>
				</div>
		</div>
	</div>
</div>
