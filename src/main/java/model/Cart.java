package model;

public class Cart  {
	private int id ;
	private String urlImg;
	private String name ;
	public String getUrlImg() {
		return urlImg;
	}
	public void setUrlImg(String urlImg) {
		this.urlImg = urlImg;
	}
	private int amount ;
	private double price;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Cart() {
		super();
	}
	public Cart(int id, String name, int amount, double price,String urlImg) {
		super();
		this.id = id;
		this.name = name;
		this.amount = amount;
		this.price = price;
		this.urlImg = urlImg;
		
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	private int total;
	@Override
	public String toString() {
		return "Cart [id=" + id + ", urlImg=" + urlImg + ", name=" + name + ", amount=" + amount + ", price=" + price
				+ ", total=" + total + "]";
	}
	
}
