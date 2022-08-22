package dto;

public class CartDTO {
	private String cartid; //카트 아이디
	private String userid; //유저 아이디
	private String productid; //제품 아이디
	private int quantitiy; //수량

	
	public CartDTO(){ //생성자
		
	}
	
	public CartDTO(String cartid, String productid, String userid, int quantitiy) {
		super();
		this.cartid = cartid;
		this.productid = productid;
		this.userid = userid;
		this.quantitiy = quantitiy;
	}

	public String getCartid() {
		return cartid;
	}

	public void setCartid(String cartid) {
		this.cartid = cartid;	
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	
	public int getQuantitiy() {
		return quantitiy;
	}

	public void setQuantitiy(int quantitiy) {
		this.quantitiy = quantitiy;
	}

	public String getProductid() {
		return productid;
	}

	public void setProductid(String productid) {
		this.productid = productid;
	}
	
	
	
	
}
