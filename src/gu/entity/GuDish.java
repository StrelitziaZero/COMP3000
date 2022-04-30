package gu.entity;

import com.hnd06.entity.ShopUser;

public class GuDish {

	private Integer id; 
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	} 
	
	public ShopUser shopUser;
	
	public ShopUser getShopUser() {
		return shopUser;
	}
	public void setShopUser(ShopUser shopUser) {
		this.shopUser = shopUser;
	}

	
	private String Cname;
	private String Dname;
	private String Dtype;
	private String total;
	private String dtime;
	private String price;
	public String getCName() {
		return Cname;
	}
	public void setCName(String Cname) {
		this.Cname = Cname;
	}
	public String getDName() {
		return Dname;
	}
	public void setDName(String Dname) {
		this.Dname = Dname;
	}
	public String getDType() {
		return Dtype;
	}
	public void setDType(String Dtype) {
		this.Dtype = Dtype;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	
	
	public String getDtime() {
		return dtime;
	}
	public void setDtime(String dtime) {
		this.dtime = dtime;
	}
	
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}

}
