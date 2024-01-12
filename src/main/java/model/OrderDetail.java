package model;

public class OrderDetail {
	private int id;
	private int orderId;
	private int idp;
	private int quantity;
	private int price;
	private String payment;
	private String Status;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getIdp() {
		return idp;
	}
	public void setIdp(int idp) {
		this.idp = idp;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	@Override
	public String toString() {
		return "OrderDetail [id=" + id + ", orderId=" + orderId + ", idp=" + idp + ", quantity=" + quantity + ", price="
				+ price + ", payment=" + payment + ", Status=" + Status + "]";
	}
	public OrderDetail(int id, int orderId, int idp, int quantity, int price, String payment, String status) {
		super();
		this.id = id;
		this.orderId = orderId;
		this.idp = idp;
		this.quantity = quantity;
		this.price = price;
		this.payment = payment;
		Status = status;
	}
	
}
