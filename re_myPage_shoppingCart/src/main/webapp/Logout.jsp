<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>

<%
	String userid = (String)session.getAttribute("userid");
	session.invalidate(); // 모든 세션 종료 -> 로그아웃

%>
<h1><%=userid %>님 안녕히 가세요.</h1>

</body>
</html>