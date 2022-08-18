package dto;

public class CartDTO {
	private String cartid; //카트 아이디
	private int productid; //제품 아이디
	private String userid; //유저 아이디
	private int vality; // 유용성(내역유효=1, 내역삭제=2)
	private int quantitiy; //수량

	
	public CartDTO(){ //생성자
		
	}
	
	public CartDTO(String cartid, int productid, String userid, int vality, int quantitiy) {
		super();
		this.cartid = cartid;
		this.productid = productid;
		this.userid = userid;
		this.vality = vality;
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

	public int getVality() {
		return vality;
	}

	public void setVality(int vality) {
		this.vality = vality;
	}

	public int getQuantitiy() {
		return quantitiy;
	}

	public void setQuantitiy(int quantitiy) {
		this.quantitiy = quantitiy;
	}

	public int getProductid() {
		return productid;
	}

	public void setProductid(int productid) {
		this.productid = productid;
	}
	
	
	
	
}
