package gu.entity;

import com.hnd06.entity.ShopUser;

public class GuCom {

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
	private String score;
	private String comm;

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getComm() {
		return comm;
	}
	public void setComm(String comm) {
		this.comm = comm;
	}

}
