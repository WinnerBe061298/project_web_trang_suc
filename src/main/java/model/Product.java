package model;

public class Product {
	private int id;
	private String name;
	private String desc;
	private String img;
	private int idCategory;
	private int price;
	private int sale_of;
	public Product() {
		// TODO Auto-generated constructor stub
	}

    public Product(int id, String name, String desc, String img, int idCategory, int price, int sale_of) {
        this.id = id;
        this.name = name;
        this.desc = desc;
        this.img = img;
        this.idCategory = idCategory;
        this.price = price;
        this.sale_of = sale_of;
    }
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
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getIdCategory() {
		return idCategory;
	}
	public void setIdCategory(int idCategory) {
		this.idCategory = idCategory;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSale_of() {
		return sale_of;
	}
	public void setSale_of(int sale_of) {
		this.sale_of = sale_of;
	}
	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", desc=" + desc + ", img=" + img + ", idCategory=" + idCategory
				+ ", price=" + price + ", sale_of=" + sale_of + "]";
	}
	
}
