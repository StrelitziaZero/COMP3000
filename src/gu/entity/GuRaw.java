package gu.entity;

import com.hnd06.entity.ShopUser;

public class GuRaw {

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

	
	private String name;
	private String total;
	private String purdate;
	private String exdate;
	private String exdate1;
	private String exdate2;
	private String exdate3;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getPurdate() {
		return purdate;
	}
	public void setPurdate(String purdate) {
		this.purdate = purdate;
	}
	public String getExdate() {
		return exdate;
	}
	public void setExdate(String exdate) {
		this.exdate = exdate;
	}


	
	
	public String getExdate1() {
		return exdate1;
	}
	public void setExdate1(String exdate1) {
		this.exdate1 = exdate1;
	}
	
	public String getExdate2() {
		return exdate2;
	}
	public void setExdate2(String exdate2) {
		this.exdate2 = exdate2;
	}
	
	public String getExdate3() {
		return exdate3;
	}
	public void setExdate3(String exdate3) {
		this.exdate3 = exdate3;
	}

}
