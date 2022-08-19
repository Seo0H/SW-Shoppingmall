<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String session_id = (String) session.getAttribute("userid");
String log, join, mypage, shoppingCart;
if (session_id == null){
	log = "<a href=login.jsp>로그인</a>";
	join = "<a href=join.jsp>회원가입</a>";
	mypage = "<a href=login.jsp>";
	shoppingCart = "<a href=login.jsp>장바구니</a>";
}
else {
	log = "<a href=logout.jsp>로그아웃</a>"; 
	join = "<a href=update.jsp>사용자 정보 수정</a>";
	mypage = "<a href=''> ";
	shoppingCart = "<a href=http://localhost:8080/re_myPage_shoppingCart/shopC/shoppingCart.jsp>장바구니</a>";
}
%>
<style>
  header{
 	min-width : 700px;
  }
  a { text-decoration: none; color: black; }
  a:visited { text-decoration: none; }
  a:hover { text-decoration: none;}
  a:focus { text-decoration: none; }
  a:hover, a:active { text-decoration: none; }
  td{ text-align: center; padding:5px;}
</style>
<header>
<table width="75%" align="center" bgcolor="white">
	<tr>
		<td align="center"><b><%=log%></b></td>
		<td align="center"><b><%=join%></b></td>
		<td align="center"><b><a href="">전체상품</a></b></td>
		<td align="center"><b><%=shoppingCart%></b></td>
		<td align="center"><b><a herf="<%=mypage%>"> 마이페이지</a></b>
		</td>
	</tr>
</table>
</header>