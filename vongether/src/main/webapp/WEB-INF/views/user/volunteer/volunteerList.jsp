<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://unpkg.com/gijgo@1.9.11/js/gijgo.min.js" type="text/javascript"></script>
<link href="https://unpkg.com/gijgo@1.9.11/css/gijgo.min.css" rel="stylesheet" type="text/css" />
<style>
#searchSection{
	padding-bottom: 80px;
}
.line {
	border-bottom: 3px solid black;
}

.red {
	color: red;
}

.blue {
	color: blue;
}

.orange {
	color: orange;
}

</style>
<script>
$(function(){
    $('#progrmBgnde').datepicker({
        uiLibrary: 'bootstrap3',
       	format: 'yyyy-mm-dd'
    });
    $('#progrmEndde').datepicker({
        uiLibrary: 'bootstrap3',
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
				var color;
				
				
				if (i%3 == 0) {
					htmlStr += '<div class="row">';
				}
				htmlStr += '<div class="col-md-4 text-center">';
				htmlStr += '	<div class="blog-inner">';
				htmlStr += '		<div class="desc">';
				htmlStr += '			<h4><b><a id="' + data[i].progrmRegistNo + '" href="./detail.do?num='+data[i].progrmRegistNo+'">' + data[i].progrmSj + '</a></b></h4>';
				htmlStr += '			<p>' + data[i].nanmmbyNm + '</p>';
				htmlStr += '			<p>' + data[i].progrmBgnde + ' ~  ' + data[i].progrmEndde + '</p>';
				
				
				if (state == 1) {
					stateString = '모집대기';
					color = 'orange';
				} else if(state == 2) {
					stateString = '모집중';
					color = 'blue';
				} else {
					stateString = '모집완료';
					color = 'red';
				}
				
				htmlStr += '			<p class="'+ color +'">' + stateString + '</p>';
				htmlStr += '			<p><a href="#" class="btn btn-primary btn-outline with-arrow" program-code="' + data[i].progrmRegistNo + '">Read More<i class="icon-arrow-right"></i></a></p>';
				htmlStr += '		</div>';
				htmlStr += '	</div>';
				htmlStr += '</div>';
				
				
				if (i%3 == 2) {
					htmlStr += '</div>';
				}
				
				var stat = $(".stat_"+data[i].progrmSttusSe);
				if (state == 1) {
					stat.css("color","orange");
				} else if(state == 2) {
					stat.css("color","green");
				} else {
					stat.css("color","red");
				}

	    	}
		}
    	$("#volunteerListDiv").empty();
    	$("#volunteerListDiv").append(htmlStr);
	}
			
});
</script>




<div id="fh5co-blog-section">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3 text-center fh5co-heading">
				<h2>봉사참여</h2>
				<p><span>여러분의 <i class="sl-icon-heart"></i> 따뜻한 손길을 내밀어 주세요</span></p>
			</div>
		</div>
		<div class="row line"></div>
		<div id="searchSection" class="col-md-12 col-sm-12 col-sm-push-0 col-xs-12 col-xs-push-0">
			<div class="row">
				<div class="row"><label for="searchHopeArea1">봉사지역</label></div>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<select id="schSido" title="봉사지역 시/도 선택" class="form-control">
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
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<select id="schSign1" title="봉사지역 구/군 선택" class="form-control">
								<option value="">선택</option>
							</select>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="row"><label for="searchTermArea">봉사기간</label></div>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<input id="progrmBgnde" class="form-control" width="550"/>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<input id="progrmEndde" class="form-control" width="550"/>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="row"><label for="searchKeyArea">검색내용</label></div>
				<div class="row">
					<div class="col-md-2">
						<div class="form-group">
							<select id="schCateGu" class="form-control">
								<option value="all">전체</option>
								<option value="progrmCn">내용</option>
								<option value="prormSj">제목</option>
							</select>
						</div>
					</div>
					<div class="col-md-9">
						<div class="form-group">
							<input type="text" class="form-control" id="keyword" name="query" placeholder="검색어를 입력해주세요.">
						</div>
					</div>
					<div class="col-md-1">
						<div class="form-group">
							<input id="searchBtn" value="검색" class="btn btn-primary btn-bg" type="button" width="100">
						</div>
					</div>
				</div>
			</div>
			<div class="row line"></div>
		</div>
		<div class="row">
			<div id="volunteerListDiv">
		
			</div>
		</div>
		
		<input type="hidden" id="pageNo" value="1">
	</div>
</div>

