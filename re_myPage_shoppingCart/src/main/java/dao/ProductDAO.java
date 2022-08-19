package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dto.ProductDTO;

public class ProductDAO {
	private static ProductDAO _dao;
	
	public ProductDAO() {
		
	}
	
	static {
		_dao = new ProductDAO();
	}
	
	public static ProductDAO getDAO() {
		return _dao;
	}
	
	String url = "jdbc:mariadb://127.0.0.1:3306/webdev";
	String user = "webmaster";
	String pwd = "1234";
	
	
	public ProductDTO selectProduct(String productid) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProductDTO product = null;
		
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(url, user, pwd);
			
			String sql = "select * from product where productid = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, productid);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				product = new ProductDTO();
				product.setProductID(rs.getString("productid"));
				product.setPrname(rs.getString("prname"));
				product.setPrice(rs.getInt("price"));
				product.setInventory(rs.getInt("inventory"));
				product.setExplanatino(rs.getString("Explanation"));
			}
			
			pstmt.close();
			con.close();
			
			
		} catch (Exception e) {
			System.out.println("product 테이블 insert 오류 => " + e.getMessage());
		}
		return product;
		
	}
	

}
