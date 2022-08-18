<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
</head>

<body>

<h1>회원 정보</h1>
<%
	String userid = (String)session.getAttribute("userid");

	request.setCharacterEncoding("utf-8");
	if(userid == null) {response.sendRedirect("index.jsp");}
	
	String username = "";
	String password ="";
	String telno = "";
	String age = "";
	String adress = "";
	String sex = "";

	//DB에서 사용자 정보
	String url = "jdbc:mariadb://127.0.0.1:3306/webdev";
	String uid = "webmaster";
	String pwd = "1234";
	String query = "select userid, username, password, telno, email, age, adress,sex from tbl_member where userid ='" + userid + "'";
	
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try {

		Class.forName("org.mariadb.jdbc.Driver");
		con = DriverManager.getConnection(url, uid, pwd);
		stmt = con.createStatement();
		rs = stmt.executeQuery(query); // 쿼리문 실행 코드

		while (rs.next()) { //행이 있는지 없는지 bool값 반환
			username = rs.getString("username");
			password = rs.getString("password");
			telno = rs.getString("telno");
			age = rs.getString("age");
			adress = rs.getString("adress");
			sex = rs.getString("sex");
			
			stmt.close();
			con.close();
			rs.close();

		}

	} catch (Exception e) {
		e.printStackTrace();
	}
	
%>
<ul>
	<li><a> 아이디: <%=userid %> </a></li>
	<li><a> 비밀번호: <%=password %> </a></li>
	<li><a> 이름: <%=username %></a></li>
	<li><a> 나이: <%=age %></a></li>
	<li><a> 성별: <%=sex %></a></li>
	<li><a> 주소: <%=adress %></a></li>
</ul>

<a href= "userMain.jsp"> 메인페이지로 이동 </a>
</body>
</html>