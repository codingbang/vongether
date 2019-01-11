<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	var progrmBgnde = ${vo.progrmBgnde};
	var yyyy = progrmBgnde.toString()[0] + progrmBgnde.toString()[1]
			+ progrmBgnde.toString()[2] + progrmBgnde.toString()[3];
	var mm = progrmBgnde.toString()[4] + progrmBgnde.toString()[5];
	var dd = progrmBgnde.toString()[6] + progrmBgnde.toString()[7];
	var total = yyyy.concat("-").concat(mm).concat("-").concat(dd);
</script>

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
			<div class="col-md-12">
				<div class="row">
					<h3 id="subject" style="margin:5px 5px 5px 5px;text-align: center;">${vo.progrmSj }</h3>
				</div>
			</div>
			<div class="row line" style="border-bottom: 1px solid rgba(0, 0, 0, 0.3); margin:5px 5px 5px 10px"></div>
			<div class="col-md-6">
				<div class="row"  style="margin:auto">
					<div class="col-md-12 services-inner" style="margin-top:20px">
						<div id="map" style="width: 100%; overflow: auto; margin:auto;"></div>
					</div>

				</div>
			</div>
			<div class="col-md-6">
				<aside class="sidebar" style="border-left: 1px solid rgba(0, 0, 0, 0.3);">
					<div class="row">
						<div class="col-md-12 side" style="margin : auto;">
							<ul>
								<li><i class="icon-check"></i>봉사시간 : ${vo.actBeginTm }:00 ~
									${vo.actEndTm }:00</li>
								<li><i class="icon-check"></i>봉사기간 : ${vo.progrmBgnde } ~
									${vo.progrmEndde }</li>
								<li><i class="icon-check"></i>모집기간 : ${vo.noticeBgnde} ~ ${vo.noticeEndde}</li>
								<li><i class="icon-check"></i>성인가능여부 : ${vo.adultPosblAt } </li>
								<li><i class="icon-check"></i>청소년가능여부 : ${vo.yngbgsPosblAt }</li>
								<li><i class="icon-check"></i>주관기관명 : ${vo.mnnstNm }</li>
								<li><i class="icon-check"></i>나눔주체명 : ${vo.nanmmbyNm }</li>
								<li><i class="icon-check"></i>봉사장소 : ${vo.actPlace }</li>
								<li><i class="icon-check"></i>담당자명 : ${vo.nanmmbyNmAdmn }</li>
								<li><i class="icon-check"></i>전화번호 : ${vo.telno }</li>
								<li><i class="icon-check"></i>FAX번호 : ${vo.fxnum }</li>
								<li><i class="icon-check"></i>우편번호주소 : ${vo.postAdres }</li>
								<li><i class="icon-check"></i>이메일 : ${vo.email }</li>
								<li><i class="icon-check"></i>모집상태 : ${vo.progrmSttusSe }</li>
								<li><i class="icon-check"></i>모집인원(총인원) : ${vo.rcritNmpr }</li>
							</ul>
						</div>
					</div>
				</aside>
			</div>
			<div class="col-md-12">
				<aside class="sidebar" style="border-top: 1px solid rgba(0, 0, 0, 0.3);">
					<div class="row">
						<div class="col-md-12 side">
							<i class="icon-check"></i>내용 : ${vo.progrmCn }

						</div>
					</div>
				</aside>
			</div>

		</div>

	</div>
</div>
<script>
	/* var json = (${vo});
	
	var vo = JSON.parse(json.toJSON);
	
	document.getElementById('subject').innerText = vo.MnnstNm;
	 */
</script>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=177af53ddad8864dab8498322bdb3f8a&libraries=services"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};

	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new daum.maps.Map(mapContainer, mapOption);
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	var postAdres = '${vo.postAdres }';
	geocoder.addressSearch(postAdres , function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === daum.maps.services.Status.OK) {

	        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new daum.maps.Marker({
	            map: map,
	            position: coords
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new daum.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">우편번호주소</div>'
	        });
	        infowindow.open(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
</script>
