<!-- 주문 페이지 -->
<%@page import="java.util.Arrays"%>
<%@page import="java.sql.Array"%>
<%@page import="dto.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dto.CartDTO"%>
<%@page import="dao.CartDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

request.setCharacterEncoding("UTF-8");

//String userid = (String)session.getAttribute("userid"); //접속해있는 유저 아이디
String userid= "sss1"; //test용

CartDAO.getDAO().clearCart(userid);

String[] cartid = request.getParameterValues("checkP"); // cart id(물건 종류) 받아오기
String[] q = request.getParameterValues("countInput"); //물건 수량 받아오기
System.out.println(Arrays.toString(q));
//System.out.println(Arrays.toString(q));
String[] productid = request.getParameterValues("productid"); //제품 id 받아오기
int[] quantity = new int[q.length]; //물건 수량 리스트 생성, 0초기화


ProductDTO product = new ProductDTO();
CartDTO cart = new CartDTO();

for (int i=0; i<cartid.length; i++) { //물건 종류 개수	
	quantity[i] = Integer.parseInt(q[i]);

	cart.setCartid("UUID_short()");
	cart.setUserid(userid);
	cart.setProductid(productid[i]);
	cart.setQuantitiy(quantity[i]);
	
	CartDAO.getDAO().insertCart(cart);
}



out.println("<script type='text/javascript'>");
out.println("location.href='shoppingCart.jsp'");
out.println("</script>");

%>