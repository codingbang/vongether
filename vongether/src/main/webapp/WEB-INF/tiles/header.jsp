<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
  .nav-bg {
    background-color: #08468C;
  }
  .nav-bg > a{
    color: #FFFFFF;
  }
  .navbar-nav > li > a {
    color: #FFFFFF;
  }
  .header-member > a {
    color: #FFFFFF;
  }
  .raise:hover,
	.raise:focus {
	  box-shadow: 0 0.5em 0.5em -0.4em var(--hover);
	  transform: translateY(-0.25em);
	}
	.header-btn {  
    background-color: transparent;
    border: 1px solid #FFF;
    margin: auto;
    color: #FFF;
    cursor: pointer;
  }

</style>
<nav class="navbar navbar-expand-lg nav-bg">
  <a class="navbar-brand" href="#">봉사어때</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link raise" href="/">홈</a>
      </li>
      <li class="nav-item">
        <a class="nav-link raise" href="#">소개</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle raise" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          봉사참여
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="/volunteer/list.do">참여가능한 봉사목록</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link raise" href="#">커뮤니티</a>
      </li>
      
    </ul>
    <c:choose>
        <c:when test="${userInfo != null }">
        <form class="header-member">
            <a href="/member/logout.do" class="raise btn btn-small btn-line btn-approve header-btn">로그아웃</a>
            <a href="#" class="raise btn btn-small btn-line btn-approve header-btn">마이페이지</a>
        </form>
        </c:when>
        <c:otherwise>
        <form class="header-member">
            <a href="/member/login.do" class="raise btn btn-small btn-line btn-approve header-btn">로그인</a>
            <a href="/member/join.do" class="raise btn btn-small btn-line btn-approve header-btn">회원가입</a>
        </form>
        </c:otherwise>
    </c:choose>
    
    
  </div>
</nav>
