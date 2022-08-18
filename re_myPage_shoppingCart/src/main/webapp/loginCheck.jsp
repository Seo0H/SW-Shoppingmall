<%@page import="java.util.Locale"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 체크</title>
</head>
<body>

<fmt:setLocale value="en_us"/>
<% 
	request.setCharacterEncoding("utf-8");
	//로그인 창에서 파라미터로 받은 값
	String userid = request.getParameter("userid");
	String password = request.getParameter("password");
	
	//DB에서 사용자 정보(아이디랑 패스워드 가져오기)(DB접속할때마다 이렇게 해줘야함.)
	String url = "jdbc:mariadb://127.0.0.1:3306/webdev";
	String user = "webmaster";
	String pwd = "1234";

	Connection con = null;
	
	//일회용
	Statement stmt1 = null;
	Statement stmt2	 = null;
	Statement stmt3 = null;
	Statement stmt4 = null;
	
	ResultSet rs1 = null;
	ResultSet rs2 = null;

	int id_count = 0;
	int pw_count = 0;
	
	LocalDateTime now = LocalDateTime.now();
	String lastLogindate = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

	//존재하는 아이디인지 확인
	String query1 = "select count(*) as id_count from tbl_Member WHERE userid='" + userid + "'";

	//패스워드가 틀렸는지 확인
	String query2 = "select count(*) as id_count from tbl_member where userid= '" + userid + "'and password='" + password + "'";
	
	//마지막 접속 시간 등록
	String qurey3 = "update tbl_member set lastLogindate = '" + lastLogindate +"' where userid = '"+ userid +"'";
	
	//마지막 접속 시간 수정
	String qurey4 = "insert into tbl_member_log(userid, lastLogindate) values('"+userid+"','"+lastLogindate+"')";
	
	try {

		Class.forName("org.mariadb.jdbc.Driver");
		con = DriverManager.getConnection(url, user, pwd);

		stmt1 = con.createStatement();
		stmt2 = con.createStatement();
		stmt3 = con.createStatement();
		stmt4 = con.createStatement();

		rs1 = stmt1.executeQuery(query1);
		rs2 = stmt2.executeQuery(query2);

		while (rs1.next()) {
			id_count = rs1.getInt("id_count");
		}
		while (rs2.next()) {
			pw_count = rs2.getInt("id_count");
		}

		//id가 0이 아니고 pw가 0 일때 => id가 존재하고 맞는 pw 가 있는 상황 => 로그인
		if (id_count != 0 && pw_count != 0) {
			
			session.setMaxInactiveInterval(3600*7); // 세션 유지기간 설정
			session.setAttribute("userid", userid); // 세션 생성
			session.setAttribute("password", password); // 세션 생성
			
			session.setAttribute("lastlogin", lastLogindate); // 세션 생성
			
			stmt3= con.createStatement();
			stmt3.executeUpdate(qurey3);

			stmt4= con.createStatement();
			stmt4.executeUpdate(qurey4);
			
			Locale locale = request.getLocale();
			String lang = locale.getLanguage();
			
			response.sendRedirect("myPage/userMain.jsp");
			
			stmt1.close();
			stmt2.close();
			stmt3.close();
			rs1.close();
			rs2.close();
			con.close();
			
			
		
		//id가 0이 아니고 pw가 0 일때 => id가 존재하고 맞는 pw 가 없는 상황 => id 없음
		} else if (id_count == 0){
			stmt1.close();
			stmt2.close();
			rs1.close();
			rs2.close();
			con.close(); %>

	<script>
		alert("사용자가 존재하지 않습니다.");
		document.location.href = 'loginTest.jsp';
	</script>
	<%
	//id가 0이 아니고 pw가 0 일때 => id가 존재하고 맞는 pw 가 없는 상황 => id 있고 pw 틀림
		} else if (id_count != 0 && pw_count == 0){
			stmt1.close();
			stmt2.close();
			rs1.close();
			rs2.close();
			con.close();
	%>
	<script>
		alert("암호가 틀립니다.");
		document.location.href = 'loginTest.jsp';
	</script>
	<%
			}
		} catch (Exception e) {
		e.printStackTrace();
	}
	%>

</body>
</html>