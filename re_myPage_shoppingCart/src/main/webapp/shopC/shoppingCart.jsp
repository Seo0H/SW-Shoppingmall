<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="dao.CartDAO"%>
<%@ page import="dao.ProductDAO"%>
<%@ page import="dto.CartDTO"%>
<%@ page import="dto.ProductDTO"%>
<%-- <jsp:useBean id="productDAO" class="dto.ProductDTO" />
<jsp:useBean id="cartDAO" class="dto.CartDTO" />
 --%>
 

<%
//String userid = (String)session.getAttribute("userid");
String userid = "sss1";
List<CartDTO> cartList = CartDAO.getDAO().selectAllCartList(userid);
List<ProductDTO> productList = new ArrayList<ProductDTO>();
List<Integer> qtyList = new ArrayList<Integer>();

for (CartDTO cart : cartList) {
	String productid = cart.getProductid();
	ProductDTO product = ProductDAO.getDAO().selectProduct(productid);
	productList.add(product);
	qtyList.add(cart.getQuantitiy());

}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>

<body>
	<%@include file="/top.jsp"%>
	<h1>Shopping cart</h1>
	<br>
	<h2>상품 목록</h2>
	<br>
	<!-- 있으면 목록 출력, 없으면 비어있음 표시 -->
	<%
	//if(cartList.isEmty()) {
	if (cartList.isEmpty()) {
	%>
	<div class="emty">
		<a>장바구니가 비어 있습니다.</a>
	</div>
	<%
	} else {
	%>
	<form id = "cartForm" class="cartTable" method="post" action = "cart_submit.jsp">
		<div class="cartlist">
			<table border="1">
				<tr>
					<th><input type="checkbox" id="allCheck" name="allcheck"></th>
					<th>상품명</th>
					<th>수량</th>
					<th>개당 가격</th>
					<th>전체 가격</th>
				</tr>
				<%
				/* 장바구니에 담긴 제품 수에 따라 장바구니 칸 수 증가 */
				int i = 0;
				for (; i < productList.size(); i++) {
				%>

				<tr>
					<td><input type="checkbox" name="checkP" value="<%=cartList.get(i).getCartid()%>" class="check"> 
					<input type="hidden" name="productid" value="<%=productList.get(i).getProductID()%>">
					</td>
					<td><input type="button" id="name<%=i%>" class="name" value="<%=productList.get(i).getPrname()%>"></td>
					<td id="quantity<%=i%>" class="quantity">
					<span class="count-box">
							<button type="button" name="countBtn" class="upBtn">🔼</button> 
							<input type="text" class="countInput" id="quantity" <%=i%> name="countInput" 
								value="<%=qtyList.get(i)%>" readonly="readonly" style="width: 20px; border: none;">
							<button type="button" name="countBtn" class="downBtn">🔽</button>
					</span>
					</td>
					<td><input id="price<%=i%>" class="price" name="price" value="<%=productList.get(i).getPrice()%>" readonly="readonly"></td>
					<td><input id="total<%=i%>" class="total" value="<%=(productList.get(i).getPrice() * qtyList.get(i))%>" name="total" readonly="readonly"></td>
				</tr>
				<%
				}
				%>
				<tr>
					<td colspan="4">결제예정금액</td>
					<td><input id="selectedTotal" readonly="readonly" value="0"></td>
				</tr>
			</table>

			<br>
			<div class="removeBtn">
				<button type="button" id="removeSelectBtn" class="textAndBtn">선택상품 삭제</button>
				<button type="button" id="removeAllBtn">장바구니 비우기</button>
			</div>

			<br>
			<div class="basket_btn">
				<input type="submit" id="submitAllBin" class="submitAllBtn" value="주문하기">
			</div>
		</div>
	</form>
	<%
	}
	%>
	
	<a href="http://localhost:8080/re_myPage_shoppingCart/myPage/userMain.jsp"> 메인페이지로 이동 </a>
	<%@include file="/footer.jsp"%>

	<script>

	$(document).ready(function(){
	  //selectedTotal
		var total=Number(0);
		  <%
		  for(int j=0;j<productList.size();j++){%>
			total += Number(document.getElementsByName("total")[<%=j%>].value);
		  <%}%>
		  $('#selectedTotal').val(total);
	});
	
	$(document).ready(function() {
		//수량 증가-감소 버튼
		$(document).on('click','button[name="countBtn"]',function(e){
			e.stopPropagation();
			e.preventDefault(); //버블 방지
			let countBox = $(this).closest('.count-box'); //가장 가까운 (위에서 아래로) 체크박스
			let row = countBox.closest('tr');//가장 가까운 (위에서 아래로) tr(row)
			let countInput = countBox.find('input[name=countInput]');//가장 가까운 체크박스를 찾은 곳에서 name이 countInput인 값을 찾아라
			let count = parseInt(countInput.val());
			let price = row.find('input[name=price]').val();
			let totalInput = row.find('input[name=total]');
			
			//upBtn 일 경우
			if($(this).hasClass("upBtn")){
				count++

			//downBtn 일 경우
			} else{
				count--;
				if (count < 1) return;				
			}
			countInput.val(count);
			totalInput.val(count * price);
			var total = Number(0);
			<% for(int j=0; j<productList.size(); j++){ %>
				total += Number(document.getElementsByName("total")[<%=j%>].value);
			<%}%>
			$('#selectedTotal').val(total); //#아이디 선택자
			
			
		});
		
		//전체 체크
		$(document).on('change', '#allCheck', function(e) {
			let checkItem = $("input[name=checkP]");
			if($(this).prop("checked")) {
				checkItem.prop("checked",true);
				} else {
					checkItem.prop("checked",false);	
				}
			});
			let checkItem = $("input[name=checkP]");
			$("#allCheck").prop("checked",true);
			checkItem.prop("checked",true);
		
		//개별 체크
		//체크박스가 선택되어 있는 부분의 전체 가격의 합계
		$(document).on('change','input[name=checkP]', function(e) {
			let totalPrice = $("#selectedTotal"); // 장바구니 물건 종류별 금액 경로
			totalPrice = parseInt(totalPrice.val());//장바구니 물건 종류별 금액 number
			console.log(typeof totalPrice);
			
			let countInput  = $('input:checkbox[name="countInput"]');
			let count = countInput.val();
			console.log(count);
			
			
			
			//let p_totalPrice = parseInt($("#total").val());
			//let countBox = $(this).closest('.count-box'); // checkbox가 변한 위치의 가장 가까운 체크박스
			//let count = countBox.find('input[name=countInput]').val(); // countinput -> 물건 개수
			//let count = countInput.val();
			//totalPrice = parseInt(document.getElementById("sum").val(count));
			//let val = document.getElementById('input[name="checkP"]').checked; //체크박스 확인	
			
			
			/* console.log(result);
			if($(this).prop("checked")) {
				p_totalPrice += result;
				} else {
					p_totalPrice -= result;
				} */
			
			//document.getElementById("sum").value = totalPrice;
					
			//totalPrice.empty();
			//totalPrice.html(p_totalPrice);
					
			});
		
			//개별 선택 삭제
			 $("#removeSelectBtn").click(function() {
	    	 let userid = "userid";
	    	 let selectedItemArr = $('input[name="checkP"]:checked').map(function () {
	    		    return this.value; 
	    	 }).get();  
	    	 
	    	 console.log(userid);
	    	 console.log(selectedItemArr);
	    	 
	         if(window.confirm("선택 상품을 삭제하시겠습니까?")) {
	            location.href="cart_delete.jsp";
	         }
    });   
			//전체 선택 삭제
			 $("#removeAllBtn").click(function() {
			      if(window.confirm("장바구니를 비우시겠습니까?")) {
			         location.href="cart_clear.jsp";
			      }
			}); 
			
			//주문하기
			 $("#submitAllBin").click(function() {
			      if(window.confirm("주문하시겠습니까?")) {
			         location.href="cart_submit.jsp";
			      }
			}); 
			
			
	});
		


	//개별 체크
	
	//개별 선택 삭제
	//전체 선택 삭제

</script>
</body>
</html>