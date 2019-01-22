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
	getAppl();
	function getAppl(){
		$.ajax({
		     url : '/admin/board/appl.do',
		     method : 'POST',
		     data : null,
		     contentType : 'application/json;charset=UTF-8',
		     dataType : 'json',
		     success : function(datas) {
		    	 console.log(datas);
		    	 getApplCount(datas);
		     }
		});
	};
	function getApplCount(datas){
		console.log(datas.dayCount);
		var htmlStr = "";
		htmlStr += '<div class="col-md-4"><h3>오늘의 방문자 수 : '+datas.dayCount+'</h3></div>';
		htmlStr += '<div class="col-md-4"><h3>이번달 방문자 수 : '+datas.monthCount+'</h3></div>';
	 	$("#applCart").empty();
    	$("#applCart").append(htmlStr);
	};
	$(document).on("click","#top3SearchBtn",function(){

		var key1 =	$("#key1").val();
		var key2 =	$("#key2").val();
		var data = JSON.stringify({
			key1 : key1,
			key2 : key2
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
   	chart.config.data.labels.push(""); //라벨(x축)
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
		<div class="col-md-12 header-name">
			<h2><b>통계</b></h2>
		</div>
		<div id="applCart"><!-- 방문자수 차트 -->	</div>
		<div class="col-md-12">
			<div class="col-md-4"><!-- Top3 조건 검색 -->
				<select class="form-control1" name="key1" id="key1">
					<option value="board">게시글</option>
					<option value="reply">댓글</option>
					<option value="appl">봉사</option>
				</select>
				<select class="form-control2" name="key2" id="key2">
					<option value="day">일간</option>
					<option value="week">주간</option>
					<option value="month">월간</option>
				</select>
				<button type="button" id="top3SearchBtn" class="btn btn-primary">검색</button>
			</div>
		
			<!-- 순위 -->
			<div class="col-md-12" id="memberTop"></div>
			
			<!--  차트    -->
			<div><canvas id="myChart"></canvas></div>		
			
		</div><!-- top3차트 끝 -->
	</div>
</div>
