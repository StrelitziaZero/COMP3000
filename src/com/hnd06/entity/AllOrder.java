package com.hnd06.entity;
import com.hnd06.entity.Book;
import com.hnd06.entity.Orders;

public class AllOrder {
	
	private Integer id;
	private Orders orders;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Orders getOrders() {
		return orders;
	}
	public void setOrders(Orders orders) {
		this.orders = orders;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public Double getAmount() {
		return amount;
	}
	public void setAmount(Double amount) {
		this.amount = amount;
	}
	private Book book;
	private Double amount;

}
