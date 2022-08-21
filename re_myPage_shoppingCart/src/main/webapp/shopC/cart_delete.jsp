<%-- 장바구니 선택삭제 --%>
<%@page import="java.io.Console"%>
<%@page import="dto.CartDTO"%>
<%@page import="dao.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");	
	
  //문제: getParameter값이 안받아와짐
	String[] checkP=request.getParameterValues("checkP");
	if(checkP != null){
		String[] cart = checkP[0].split(",");
		for(int i = 0;i<cart.length;i++){
			CartDAO.getDAO().deleteCart(cart[i]);
		}
	}
	
	
	out.println("<script type='text/javascript'>");	
	out.println("location.href= 'shoppingCart.jsp;'");
	out.println("</script>");	
	
%>