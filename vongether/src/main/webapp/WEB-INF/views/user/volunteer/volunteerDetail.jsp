<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
${vo}

<div id="fh5co-page">
	<div id="fh5co-main-services-section">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-offset-3 text-center fh5co-heading">
					<h2>봉사상세정보</h2>
					<p>
						<span>여러분의 <i class="sl-icon-heart"></i>따뜻한 손길을 내밀어 주세요
						</span>
					</p>
				</div>
			</div>
			<div class="col-md-6">
				<div class="row">
					<div class="col-md-12 services-inner">
						<div id="map" style="width: 100%; overflow: auto"></div>
					</div>

				</div>
			</div>
			<div class="col-md-6">
				<aside class="sidebar">
					<div class="row">
						<div class="col-md-12 side">
							<h3 id="subject"></h3>
							<ul>
								<li><i class="icon-check"></i><a href="#">Web Design</a></li>
								<li><i class="icon-check"></i><a href="#">Branding
										&amp; Identity</a></li>
								<li><i class="icon-check"></i><a href="#">Free HTML5</a></li>
								<li><i class="icon-check"></i><a href="#">HandCrafted
										Templates</a></li>
								<li><i class="icon-check"></i><a href="#">Free
										Bootstrap Template</a></li>
								<li><i class="icon-check"></i><a href="#">Free HTML5
										Template</a></li>
								<li><i class="icon-check"></i><a href="#">Free HTML5
										&amp; CSS3 Template</a></li>
								<li><i class="icon-check"></i><a href="#">HandCrafted
										Templates</a></li>
							</ul>

						</div>
					</div>
				</aside>
			</div>
			<div class="col-md-12">
					<aside class="sidebar">
						<div class="row">
							<div class="col-md-12 side">
								<i class="icon-check"></i>봉사개요
								
							</div>							
						</div>
					</aside>
				</div>
			
		</div>

	</div>
</div>
<script>
	var json = ${vo};
	
	var vo = JSON.parse(json.toJSON);
	
	document.getElementById('subject').innerText = vo.MnnstNm;
	
</script>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=177af53ddad8864dab8498322bdb3f8a"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};

	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new daum.maps.Map(mapContainer, mapOption);
</script>
