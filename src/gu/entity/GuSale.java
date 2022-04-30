package gu.entity;

import com.hnd06.entity.ShopUser;

public class GuSale {

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

	
	private String cname;
	private String dname;
	private String dtype;
	private String total;
	private String wtotal;
	private String waste;
	private String warning;
	private String ddtime;
	public String getCName() {
		return cname;
	}
	public void setCName(String cname) {
		this.cname = cname;
	}
	public String getDName() {
		return dname;
	}
	public void setDName(String dname) {
		this.dname = dname;
	}
	public String getDType() {
		return dtype;
	}
	public void setDType(String dtype) {
		this.dtype = dtype;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getWtotal() {
		return wtotal;
	}
	public void setWtotal(String wtotal) {
		this.wtotal = wtotal;
	}
	public String getWaste() {
		return waste;
	}
	public void setWaste(String waste) {
		this.waste = waste;
	}
	public String getWarning() {
		return warning;
	}
	public void setWarning(String warning) {
		this.warning = warning;
	}
	
	
	public String getDdtime() {
		return ddtime;
	}
	public void setDdtime(String ddtime) {
		this.ddtime = ddtime;
	}



}
