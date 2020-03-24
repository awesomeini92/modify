package shop.vo;

public class CartBean {
	private String product_cod; // 카트에 저장될 상품코드
	private String product_image; // 카트에 저장될 이미지 파일명
	private String product_name; // 카트에 저장될 상품명
	private int price; // 카트에 저장될 상품 가격
	private int qty; // 카트에 저장될 상품 수량
	
	public CartBean() {}

	public CartBean(String product_cod, String product_image, String product_name, int price, int qty) {
		super();
		this.product_cod = product_cod;
		this.product_image = product_image;
		this.product_name = product_name;
		this.price = price;
		this.qty = qty;
	}

	public String getProduct_cod() {
		return product_cod;
	}

	public void setProduct_cod(String product_cod) {
		this.product_cod = product_cod;
	}

	public String getProduct_image() {
		return product_image;
	}

	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}
}

	
	