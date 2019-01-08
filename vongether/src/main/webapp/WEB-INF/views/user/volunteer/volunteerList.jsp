<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.explanation {
	font-size: 13px;
	font-weight: bold;
}
</style>
<script src="https://unpkg.com/gijgo@1.9.11/js/gijgo.min.js" type="text/javascript"></script>
<link href="https://unpkg.com/gijgo@1.9.11/css/gijgo.min.css" rel="stylesheet" type="text/css" />

<div class="my-container">
	<!-- main-content-box -->
	<div class="main-content-box">
		<div class="row">
			<img src="/resources/user/img/tit_service.png">
			<div>
				<h3>봉사조회</h3>
				<label class="explanation">원하는 조건을 선택하여 전국 자원봉사 정보를 조회 하실 수 있습니다.</label>
			</div>
		</div>
		
		<div class="row">
			<div class="col-12">
				<div class="col-6">
					<div class="row col-12">
						<label>봉사지역</label>
					</div>
					<div class="row col-12">
						<div class="input-group">
							<select id="searchHopeArea1" name="searchHopeArea1" title="봉사지역 시/도 선택" class="custom-select">
								<option value="">전체</option>
								<option value="6110000">서울특별시</option>
								<option value="6260000">부산광역시</option>
								<option value="6270000">대구광역시</option>
								<option value="6280000">인천광역시</option>
								<option value="6290000">광주광역시</option>
								<option value="6300000">대전광역시</option>
								<option value="6310000">울산광역시</option>
								<option value="5690000">세종특별자치시</option>
								<option value="6410000">경기도</option>
								<option value="6420000">강원도</option>
								<option value="6430000">충청북도</option>
								<option value="6440000">충청남도</option>
								<option value="6450000">전라북도</option>
								<option value="6460000">전라남도</option>
								<option value="6470000">경상북도</option>
								<option value="6480000">경상남도</option>
								<option value="6500000">제주특별자치도</option>
							</select>
							
							<select id="searchHopeArea2" name="searchHopeArea2" title="봉사지역 구/군 선택" class="custom-select">
								<option value="0000000">선택</option>
								<option value="0000001">가짜강남구</option>
								<option value="0000002">가짜서초구</option>
								<option value="0000003">가짜구로구</option>
							</select>
						</div>
					</div>
				</div>
				
				<div class="col-6">
					<div class="row col-12">
						<label>봉사기간</label>
					</div>
					<div class="row col-12">
						<div class="input-group">
							<input id="datepicker1" width="276" />
							<input id="datepicker2" width="276" />
						    <script>
						        $('#datepicker1').datepicker({
						            uiLibrary: 'bootstrap4',
						           	format: 'yyyy-mm-dd'
						        });
						        $('#datepicker2').datepicker({
						            uiLibrary: 'bootstrap4',
						           	format: 'yyyy-mm-dd'
						        });
						    </script>
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-12">
				<div class="input-group">
					<input type="text" class="form-control" id="query" name="query" placeholder="검색어를 입력해주세요.">
					<button class="btn btn-outline-secondary" type="button" id="searchBtn">검색</button>
				</div>
			</div>
			
		</div>
		
		
		<div class="row">
			<div id="volunteerListDiv">
				안녕하세요 여기는 봉사 목록이 나오는 영역입니다.
				반가워요
				
			</div>
		</div>
		
		
	</div>
	<!-- main-content-box End -->
</div>

