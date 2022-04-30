package com.hnd06.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import com.hnd06.entity.AllOrder;

public class Orders {
	
	private Integer id;
	private String orderid;
	private Date submitTime=new Date();
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public Date getSubmitTime() {
		return submitTime;
	}
	public void setSubmitTime(Date submitTime) {
		this.submitTime = submitTime;
	}
	public Double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getIsPayoff() {
		return isPayoff;
	}
	private ShopUser shopUser;
	public ShopUser getShopUser() {
		return shopUser;
	}
	public void setShopUser(ShopUser shopUser) {
		this.shopUser = shopUser;
	}
	public void setIsPayoff(Integer isPayoff) {
		this.isPayoff = isPayoff;
	}
	public Integer getIsSales() {
		return isSales;
	}
	public void setIsSales(Integer isSales) {
		this.isSales = isSales;
	}
	private Double totalPrice;
	private String content;
	private Integer isPayoff;
	private Integer isSales;
	
	private List<AllOrder> orderList = new ArrayList<AllOrder>();
	public List<AllOrder> getOrderList() {
		return orderList;
	}
	public void setOrderList(List<AllOrder> orderList) {
		this.orderList = orderList;
	}
	

}
