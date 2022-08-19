package dto;

public class ProductDTO {
	private String productID; // 상품 아이디
	private String prname; // 상품 이름
	private int price; //가격
	private int inventory; //재고
	private String explanatino; //상품 설명

	public ProductDTO() {
		
	}
	
	public ProductDTO(String productID, String prname, int price, int inventory, String explanatino) {
		super();
		this.productID = productID;
		this.prname = prname;
		this.price = price;
		this.inventory = inventory;
		this.explanatino = explanatino;
	}
	
	public String getProductID() {
		return productID;
	}
	public void setProductID(String productID) {
		this.productID = productID;
	}
	public String getPrname() {
		return prname;
	}
	public void setPrname(String prname) {
		this.prname = prname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getInventory() {
		return inventory;
	}
	public void setInventory(int inventory) {
		this.inventory = inventory;
	}
	public String getExplanatino() {
		return explanatino;
	}
	public void setExplanatino(String explanatino) {
		this.explanatino = explanatino;
	}
}

