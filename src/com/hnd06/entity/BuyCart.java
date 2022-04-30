package com.hnd06.entity;

public class BuyCart {
	
	private Integer id; 
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	} 
	
	private ShopUser shopUser;
	private Book book;
	public ShopUser getShopUser() {
		return shopUser;
	}
	public void setShopUser(ShopUser shopUser) {
		this.shopUser = shopUser;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	
	private Integer buyNumber;
	private Double buyPrice;
	private Double buyAmt;
	public Integer getBuyNumber() {
		return buyNumber;
	}
	public void setBuyNumber(Integer buyNumber) {
		this.buyNumber = buyNumber;
	}
	public Double getBuyPrice() {
		return buyPrice;
	}
	public void setBuyPrice(Double buyPrice) {
		this.buyPrice = buyPrice;
	}
	public Double getBuyAmt() {
		return buyAmt;
	}
	public void setBuyAmt(Double buyAmt) {
		this.buyAmt = buyAmt;
	}
	
	

}
