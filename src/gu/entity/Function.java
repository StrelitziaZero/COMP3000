package gu.entity;

import java.util.Date;

public class Function {
	
	private Integer id;
	private String functionName;
	private String bookNo;
	
	private String pic;
	private String author;
	private String publish;
	
	private Double price;
	private Date regTime;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getFunctionName() {
		return functionName;
	}
	public void setFunctionName(String functionName) {
		this.functionName = functionName;
	}

	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}

	private String content;
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	

}
