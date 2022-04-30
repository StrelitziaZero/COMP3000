package gu.entity;

import java.util.Date;

public class GuChart {
	
	private Integer id;
	private String dishid;
	private String dname1;
	private Float avescore;

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getDishid() {
		return dishid;
	}
	public void setDishid(String dishid) {
		this.dishid = dishid;
	}
	public String getDname1() {
		return dname1;
	}
	public void setDname1(String dname1) {
		this.dname1 = dname1;
	}

	public Float getAvescore() {
		return avescore;
	}
	public void setAvescore(float avescore) {
		this.avescore = avescore;
	}


}
