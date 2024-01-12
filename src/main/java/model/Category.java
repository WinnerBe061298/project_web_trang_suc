package model;

public class Category {
	private int id;
	private String name;
	private String desc;
	private String banner;
	public Category() {
		// TODO Auto-generated constructor stub
	}
	
	public Category(int id , String name , String desc , String banner ) {
		this.id = id;
		this.name = name;
		this.desc = desc;
		this.banner = banner;
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
	public String getBanner() {
		return banner;
	}
	public void setBanner(String banner) {
		this.banner = banner;
	}

	@Override
	public String toString() {
		return "Category [id=" + id + ", name=" + name + ", desc=" + desc + ", banner=" + banner + "]";
	}
	
}
