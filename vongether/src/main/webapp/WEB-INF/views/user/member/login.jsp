<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">

		<!-- header -->
		<div class="login-header">
			<h2 class="form-signin-heading">BitCamp</h2>
		</div>

		<!-- form -->
		<form class="form-signin" action="login.do" method="post">
			<input type="text" class="form-control" name="mId" id="inputEmail" placeholder="아이디(이메일)" required="true">
			<input type="password" class="form-control" name="mPwd" id="inputPassword"
				placeholder="비밀번호" required="true">

			<div class="row form-btn">
				<button class="btn btn-large btn-warning" type="submit">로그인</button>
				<a href="/member/join.do" class="btn btn-large btn-default">회원가입</a>
			</div>
		</form>


		<!-- footer -->
		<div class="login-footer">
			<p>© BitCamp 2018.</p>
		</div>
	</div>
	
	<script type="text/javascript">
    
  </script>
  
</body>
</html>