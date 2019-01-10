<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<header id="fh5co-header" role="banner">
	<div class="container">
		<div class="header-inner">
			<h1><i class="sl-icon-heart"></i><a href="/">봉사어때?</a></h1>
			<nav role="navigation">
				<ul>
					<li><a class="active" href="/">Home</a></li>
					<li><a href="#">About</a></li>
					<li><a href="/volunteer/list.do">Volunteer</a></li>
					<li><a href="/board/list.do">Community</a></li>
					<c:choose>
				        <c:when test="${userInfo != null }">
				        	<li><a href="/member/logout.do">LOGOUT</a></li>
							<li><a href="/member/mypage.do">MYPAGE</a></li>
				        </c:when>
				        <c:otherwise>
				        	<li><a href="/member/login.do">LOGIN</a></li>
							<li><a href="/member/join.do">JOIN</a></li>
				        </c:otherwise>
				    </c:choose>
				</ul>
			</nav>
		</div>
	</div>
</header>
