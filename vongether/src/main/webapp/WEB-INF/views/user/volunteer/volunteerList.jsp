<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.explanation {
	font-size: 13px;
	font-weight: bold;
}

</style>
<script src="https://unpkg.com/gijgo@1.9.11/js/gijgo.min.js" type="text/javascript"></script>
<link href="https://unpkg.com/gijgo@1.9.11/css/gijgo.min.css" rel="stylesheet" type="text/css" />

<script>
$(function(){
    $('#progrmBgnde').datepicker({
        uiLibrary: 'bootstrap4',
       	format: 'yyyy-mm-dd'
    });
    $('#progrmEndde').datepicker({
        uiLibrary: 'bootstrap4',
       	format: 'yyyy-mm-dd'
    });
    
    var jsonData = {
    	progrmBgnde	: '',
    	progrmEndde : '',
    	pageNo	: '',
    	keyword	: '',
    	schCateGu	: '',
    	schSido	: '',
    	schSign1 : ''
	};
    
    
    getVolunteerList(jsonData);
    
    $(document).on("change", "#schSido", function(){
    	var str = $("#schSido option:selected").text();
    	var htmlStr = "";
    	if (str == '전체') {
    		htmlStr += '<option value="">선택</option>';
    		$("#schSign1").empty();
	    	$("#schSign1").append(htmlStr);
		} else {
	    	$.ajax({
	    		url : "/volunteer/ajaxGugun.do",
	    		dataType : "json",
	    		data : {
	        		param : str
	        	},
	    		contentType: "application/json; charset=UTF-8",
	    		method : "GET",
	    	    success : function(data) {
	    	    	
	    	    	htmlStr += '<option value="">선택</option>';
	    	    	
	    	    	for (var i = 0; i < data.length; i++) {
	    	    		htmlStr += '<option value="' + data[i].gugunCd +'">' + data[i].gugunNm +'</option>';
					}
	    	    	$("#schSign1").empty();
	    	    	$("#schSign1").append(htmlStr);
	    	    }
	    	});
		}
    	
    	
    });
    
    $(document).on("click", "#searchBtn", function(){
    	var progrmBgnde = $("#progrmBgnde").val().replace(/-/g, "");
    	var progrmEndde = $("#progrmEndde").val().replace(/-/g, "");
    	var pageNo = $("#pageNo").val();
    	var keyword = $("#keyword").val();
    	var schCateGu = $("#schCateGu option:selected").val();
    	var schSido = $("#schSido option:selected").val();
    	var schSign1 = $("#schSign1 option:selected").val();
    	
    	//schSign1 : schSign1
    	jsonData = {
   			progrmBgnde	: progrmBgnde,
   	    	progrmEndde : progrmEndde,
   	    	pageNo : pageNo,
   	    	keyword : keyword,
   	    	schCateGu : schCateGu,
   	    	schSido	: schSido,
   	    	schSign1 : schSign1
    	}
    	
    	if (progrmBgnde != '' && progrmEndde == '' || progrmBgnde == '' && progrmEndde != '') {
    		alert("봉사기간 검색 조건을 확인 해주세요.");
		} else if (Number(progrmBgnde) > Number(progrmEndde)) {
    		alert("봉사종료일자 보다 봉사시작일자가 더 느립니다.");
		} else {
	    	getVolunteerList(jsonData);
		}
    	
    });
  
    
    
    function getVolunteerList(jsonParam) {
    	$.ajax({
    		url : "/volunteer/ajaxlist.do",
    		dataType : "json",
    		data : jsonParam,
    		contentType: "application/json; charset=UTF-8",
    		method : "GET",
    	    success : function(data) {
    	    	makeVolunteerList(data);
    	    }
    	});
    }

	function makeVolunteerList(data) {
		var htmlStr = "";

		if (data != null) {
			for (var i = 0; i < data.length; i++) {
				var state = data[i].progrmSttusSe;
				var stateString;
				if (state == 1) {
					stateString = '모집대기';
				} else if(state == 2) {
					stateString = '모집중';
				} else {
					stateString = '모집완료';
				}
	    		htmlStr += '<tr>';
	    		htmlStr += '	<td class="nanmmby_nm">';
	    		htmlStr += '		<span>' + data[i].nanmmbyNm + '</span>';
	    		htmlStr += '	</td>';
	    		htmlStr += '	<td class="volunteer_title">';
	    		htmlStr += '		<div class="vol_tit">';
	    		htmlStr += '			<a id="' + data[i].progrmRegistNo + '" title="' + data[i].progrmSj + '" href="#">';
	    		htmlStr += '				<span>' + data[i].progrmSj + '</span>';
	    		htmlStr += '			</a>';
	    		htmlStr += '		</div>';
	    		htmlStr += '	</td>';
	    		htmlStr += '	<td class="company_info">';
	    		htmlStr += '		<p>' + data[i].progrmBgnde + ' ~  ' + data[i].progrmEndde + '</p>';
	    		htmlStr += '	</td>';
	    		htmlStr += '	 <td class="support_info">';
	    		htmlStr += '		<p>' + stateString + '</p>';
	    		htmlStr += '	</td>';
	    		htmlStr += '</tr>';
	    	}
		}
    	$("#volunteerListBody").empty();
    	$("#volunteerListBody").append(htmlStr);
	}
			
});
</script>

<div class="my-container">
	<!-- main-content-box -->
	<div class="main-content-box">
	
		<!-- 봉사조회(헤더) -->
		<div class="row">
			<img src="/resources/user/img/tit_service.png">
			<div>
				<h3>봉사조회</h3>
				<label class="explanation">원하는 조건을 선택하여 전국 자원봉사 정보를 조회 하실 수 있습니다.</label>
			</div>
		</div>
		
		
		<div class="row">
		
			<div class="row col-12">
				<div class="col-6 form-group">
					<div class="row"><label for="searchHopeArea1">봉사지역</label></div>
					<div class="row">
						<div class="col-6">
							<select id="schSido" title="봉사지역 시/도 선택" class="custom-select">
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
						</div>
						<div class="col-6">
							<select id="schSign1" title="봉사지역 구/군 선택" class="custom-select">
								<option value="">선택</option>
							</select>
						</div>
					</div>
				</div>
				
				
				<div class="col-6 form-group">
					<div class="row">봉사기간</div>
					<div class="row">
						<div class="col-5">
							<input id="progrmBgnde" width="280" />
						</div>
						<div class="col-1" align="center">
							~
						</div>
						<div class="col-5">
							<input id="progrmEndde" width="280" />
						</div>
					</div>
				</div>
			</div>
		
			<div class="row col-12">
				<div class="col-12 form-group">
					<div class="row">봉사제목</div>
					<div class="row">
						<select id="schCateGu" class="custom-select">
							<option value="all">전체</option>
							<option value="progrmCn">내용</option>
							<option value="prormSj">제목</option>
						</select>
						
						<input type="text" class="form-control" id="keyword" name="query" placeholder="검색어를 입력해주세요.">
					</div>
				</div>
			</div>
			
			<div class="row col-12" align="center">
				<div class="col-12 form-group btn-container">
					<button class="btn btn-outline-primary btn-lg" type="button" id="searchBtn">검색</button>
				</div>
			</div>
			
			<input type="hidden" id="pageNo" value="1">
			
		
		</div>
		
		
		<div class="row col-12">
			<div class="col-12">
			
				<table summary="봉사 리스트">
			        <colgroup>
			            <col width="15%">
			            <col width="*">
			            <col width="10%">
			            <col width="10%">
			        </colgroup>
        			<thead>
				        <tr>
				            <th scope="col">지역</th>
				            <th scope="col">제목</th>
				            <th scope="col">봉사기간</th>
				            <th scope="col">모집상태</th>
				        </tr>
        			</thead>
        			<tbody id="volunteerListBody">
        				<tr>
        					<td class="nanmmby_nm">
       							<span>경기도 의정부시</span>
    						</td>
    						<td class="volunteer_info">
						        <div class="vol_tit">
						         	<a id="programcode11" title="[OO요양원] 어르신 활동보조 및 프로그램 진행보조" href="#">
						         		<span>[OO요양원] 어르신 활동보조 및 프로그램 진행보조</span>
						         	</a>
						        </div>
						    </td>
						    <td class="company_info">
	                            <p>2018-10-10 ~  2019-01-09</p>
		                    </td>
		                    <td class="support_info">
						       	<p>모집중</p>
						    </td>
    					</tr>
					</tbody>
    			</table>
			</div>
		</div>
		
		
	</div>
	<!-- main-content-box End -->
</div>

