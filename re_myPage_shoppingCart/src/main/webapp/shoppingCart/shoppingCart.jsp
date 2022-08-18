<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.CartDAO" %>
<%@ page import="dto.CartDTO" %>

    
<%
String userid = (String)session.getAttribute("userid");
List<CartDTO> cartList = CartDAO.getDAO().selectAllCartList(userid);
List<Integer> qList = new ArrayList<Integer>();

for (CartDTO cart : cartList) {
	String productid = cart.getProductid();
	qList.add(cart.getQuantitiy());
	
}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
</head>

<body>
<h1>Shopping cart</h1><br>
<h2>상품 목록</h2><br>
<!-- 있으면 목록 출력, 없으면 비어있음 표시 -->
<%
	//if(cartList.isEmty()) {
	if(cartList.isEmpty()){
%>
	<div class = "emty">
	<a>장바구니가 비어 있습니다.</a>
	</div>
<%
	}else{ %>
<form> <!-- 자바빈즈, db에서 쇼핑 카트 목록 가져오는 tag 삽입 -->
	<div class="cartlist">
		<table border ="1">
			<tr>
				<th>✔</th>
				<th>상품명</th>
				<th>수량</th>
				<th>개당 가격</th>
				<th>전체 가격</th>
			</tr>
			<%
			int i = 0;
			for (;i<10;i++){ /* 임의로 정한 10 */
			%>
			<tr>

				<td>
					<input type="checkbox" name = "checkB"> 
				</td>
				
				<td> <input type="button"> </td>
				<td id="quantity<%=i %>" class="quantity">
					<span class="count count-box">
						<button type="button" name="countBtn" class="upBtn"> 🔼</button>
						<input type="text" class="countInput" id="quantity"<%=i %> style="width: 20px; border: none;">
						<button type="button" name="downBtn" class="upBtn"> 🔽 </button>
					</span>
				</td>
				<td>
					<input id="price<%=i %>" class="price" name="price" value=""readonly="readonly">
				</td>
				</tr>
				<tr>
				<td>
					<input id="total<%=i %>" class="total"
					value="" name="total" readonly="readonly">
				</td>
				</tr>
			<%} %>
		</table>
		
		<br>
		<div class="removeBtn">
			<button type="button" id="removeSelectBtn" class="textAndBtn"> 선택상품 삭제</button>
			<button type="button" id="removeAllBtn" > 장바구니 비우기</button>
		</div>
		</div>
		<br>
		<div class="basket_btn">
			<input type="submit" id="submitAllBin" class = "submitAllBtn" value="주문하기">
		</div>
</form>
<%} %>


<a href="http://localhost:8080/SW_MINIPJ_SEOPART_/myPage/myPage_main_study.jsp"> 메인페이지로 이동 </a>

</body>
</html>