package model;

public class Order {
	private int id;
	private int userId;
	private String name;
	private String phone;
	private String addRess;
	private String email;
	private long total;
	private String note;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddRess() {
		return addRess;
	}
	public void setAddRess(String addRess) {
		this.addRess = addRess;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public long getTotal() {
		return total;
	}
	public void setTotal(long total) {
		this.total = total;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public Order(int id, int userId, String name, String phone, String addRess, String email, long total, String note) {
		super();
		this.id = id;
		this.userId = userId;
		this.name = name;
		this.phone = phone;
		this.addRess = addRess;
		this.email = email;
		this.total = total;
		this.note = note;
	}
	@Override
	public String toString() {
		return "Order [id=" + id + ", userId=" + userId + ", name=" + name + ", phone=" + phone + ", addRess=" + addRess
				+ ", email=" + email + ", total=" + total + ", note=" + note + "]";
	}
	
	
	
}
