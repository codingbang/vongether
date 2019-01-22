<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

<style>
.header-name{
	padding-top : 20px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	
	$(document).on("click","#searchBtn",function(){

		var skey1 =	$("#skey1").val();
		var skey2 =	$("#skey2").val();
		var data = JSON.stringify({
			skey1 : skey1,
			skey2 : skey2
		});
		$.ajax({
		     url : '/admin/board/top3.do',
		     method : 'POST',
		     data : data,
		     contentType : 'application/json;charset=UTF-8',
		     dataType : 'json',
		     success : function(datas) {
		    	 getTopMember(datas);
		    	 getChart(datas);
		     }
		});
	});
	function getTopMember(datas){
		var htmlStr = "";
		for(var i=0;i<datas.length;i++){
			htmlStr += '<div class="col-md-1">'+(i+1)+'등 </div>';
			if(datas[i].counter==0){
				htmlStr += '<div class="col-md-11" > 없습니다. </div>';
			}else{
				htmlStr += '<div class="col-md-3" id="howMushBtn">'+datas[i].m_id+'님</div>';
				htmlStr += '<div class="col-md-8">'+datas[i].counter+'번</div>';
			}
		}

	 	$("#memberTop").empty();
    	$("#memberTop").append(htmlStr);
	};
	var ctx = document.getElementById('myChart').getContext('2d');
	var chart = new Chart(ctx, {
	    type: 'bar',//형태 : line, bar, pie 
	    options: {}
	});
   	chart.config.data.labels.push("통계"); //라벨(x축)
	 function getChart(datas){ 
		for(var i=0;i<datas.length;i++){//데이터 없을시 아이디 삭제
			if(datas[i].counter==0){
				datas[i].m_id ="-"
			}
		}
		for (var i = 0; i < datas.length; i++) {
			chart.data.datasets.pop();//데이터 삭제(팝)
		}
		for (var i = 0; i < datas.length; i++) { 
	    	chart.data.datasets.push({label:datas[i].m_id, data: [datas[i].counter]}); //데이터 생성(푸시)
		} 
		chart.update();
	 }; 
})
</script>
<div class="container">
	<div class="row " style="">
		<div class="cal-md-12 header-name">
			<h2><b>통계</b></h2>
		</div>
		<div class="cal-md-12">
			<select class="form-control1" name="key1" id="skey1">
				<option value="board">게시글</option>
				<option value="reply">댓글</option>
				<option value="appl">신청</option>
			</select>
			<select class="form-control2" name="key2" id="skey2">
				<option value="day">일간</option>
				<option value="week">주간</option>
				<option value="month">월간</option>
			</select>
			<button type="button" id="searchBtn" class="btn btn-primary">검색</button>
		</div>
		<div id="memberTop"></div>
		<!--  차트    -->
		<div>
			<canvas id="myChart"></canvas> 
		</div>		
		<!--  차트   -->
	</div>
</div>
