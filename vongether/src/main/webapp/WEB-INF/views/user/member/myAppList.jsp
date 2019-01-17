<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<
<script type="text/javascript">
<!--
나의정보 - 봉사참여리스트
1. 리스트를 가져온다.
2. 리스트를 뿌려준다.
3. 페이징을 한다.
//-->

</script>



<div id="fh5co-blog-section">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3 text-center fh5co-heading">
				<h2>참여신청목록</h2>
				<p>
					<span>여러분의 <i class="sl-icon-heart"></i> 따뜻한 손길을 내밀어 주세요
					</span>
				</p>
			</div>
		</div>
		<c:forEach var="list" items="${list }">

			<div class="row">
				<div class="col-md-2 text-center">
					<div class="desc">${list.appNo }</div>
				</div>
				<div class="col-md-4 text-center">
					<div class="desc">${list.appName }</div>
				</div>
				<div class="col-md-2 text-center">
					<div class="desc">${list.appPlace }</div>
				</div>
				<div class="col-md-2 text-center">
					<div class="desc">${list.appBegintm }</div>
				</div>
				<div class="col-md-2 text-center">
					<div class="desc">${list.appEndtm }</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>