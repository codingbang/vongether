<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
    var userEmail = "${mId}";

    alter(userEmail + "님 회원가입을 축하합니다! 이제 로그인 가능합니다");

    window.open('', '_self', '');

    self.location = '/';
  </script>
</body>
</html>