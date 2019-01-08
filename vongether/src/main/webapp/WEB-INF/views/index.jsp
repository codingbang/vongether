<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/resources/user/css/index.css">

<div class="my-container">
  <!-- main-content-box -->
	<div class="main-content-box">
	  <!-- row1 -->
		<div class="row">
		  <!-- carousel -->
			<div class="col-8">
				<div id="carouselControls" class="carousel slide" data-ride="carousel">
				  <ol class="carousel-indicators">
				    <li data-target="#carouseleControls" data-slide-to="0" class="active"></li>
				    <li data-target="#carouseleControls" data-slide-to="1"></li>
				    <li data-target="#carouselControls" data-slide-to="2"></li>
				  </ol>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img class="d-block w-100" src="http://placehold.it/1000x400" alt="First slide">
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" src="http://placehold.it/1000x400" alt="Second slide">
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" src="http://placehold.it/1000x400" alt="Third slide">
						</div>
					</div>
					<a class="carousel-control-prev" href="#carouselControls"role="button" data-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a>
					<a class="carousel-control-next" href="#carouselControls" role="button" data-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div><!-- carousel End -->
      
      <!-- user section  -->
			<div class="col-4">
				<form id="mainLoginForm" action="/" method="post">
				  <div class="col-11">
						<div class="form-group">
							<input type="email" class="form-control" id="mainId" name="id" placeholder="Enter ID">
						</div>
						<div class="form-group">
							<input type="password" class="form-control" id="mainPwd" name="pwd" placeholder="Password">
						</div>
						<div class="form-group">
							<button type="button" id="mainLoginBtn" class="btn btn-primary form-control">로그인</button>
						</div>
						<div class="form-group">
	            <button type="button" class="btn btn-secondary form-control">회원가입</button>
	          </div>
	          <div class="form-group" align="center">
	            <a href="#" class="col-5">아이디 찾기</a>
	            <span class="col-2">&nbsp;</span>
              <a href="#" class="col-5">비밀번호 찾기</a>
            </div>
				  </div>
				  <div class="col-1"></div>
				</form>
			</div><!-- user section End -->
		</div><!-- row1 End -->
		
		<!-- row2 -->
    <div id="row2" class="row col-12">
      <div class="col-8">
        <div class="row">
          <div id="noticeList5" class="col-6">
	          <div class="row titleBox">
	           <div class="col-11">
	             <label class="listTitle">공지사항</label>
	           </div>
	           <div class="col-1">
	             <a class="more-read" href="#">
	               <i class="fa fa-plus-circle"></i>
	             </a>
	           </div>
	          </div>
	          <div class="row">
	           <div class="col-1"></div>
	           <div class="col-10 line"></div>
	           <div class="col-1"></div>
	          </div>
	          <ul>
	           <li>1</li>
	           <li>2</li>
	           <li>3</li>
	           <li>4</li>
	           <li>5</li>
	          </ul>
	        </div>
	        
	        <div id="volunteerList5" class="col-6">
	          <div class="row titleBox">
             <div class="col-11">
               <label class="listTitle">모집중인 봉사</label>
             </div>
             <div class="col-1">
               <a class="more-read" href="#">
                 <i class="fa fa-plus-circle"></i>
               </a>
             </div>
            </div>
	          <ul>
             <li>1</li>
             <li>2</li>
             <li>3</li>
             <li>4</li>
             <li>5</li>
            </ul>
	          
	        </div>
        
        </div>
      </div>
      <div class="col-4"></div>
    </div>
	</div><!-- main-content-box End -->

</div>

