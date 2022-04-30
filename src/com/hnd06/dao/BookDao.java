package com.hnd06.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList; 
import java.util.List;

import com.hnd06.entity.Book;
import com.hnd06.entity.BookClass;
 

public class BookDao extends Dao {
	public  Book getBook(Integer id)
	{
		try {
		Book book = new Book();
		String sql="select * from book where id="+id;
		Connection conn = this.getConnection();
		Statement stmt =  conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next())
		{
			
			book.setId(rs.getInt("id"));
			book.setAuthor(rs.getString("author"));
			book.setPublish(rs.getString("publish"));
			book.setPic(rs.getString("picture"));
			book.setBookName(rs.getString("bookname"));
			book.setBookNo(rs.getString("bookno"));
			book.setContent(rs.getString("Content"));
			book.setPrice(rs.getDouble("Price"));
			Integer bookCls = rs.getInt("bookClass");
			if(bookCls!=null)
			{
				BookClass bookClass = new BookClassDao().getBookClass(bookCls);
				book.setBookClass(bookClass);
			}
		}
		rs.close(); 
		stmt.close();
		conn.close();  
		return book;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	public void saveBook(Book book)
	{
		try {
			
		}
		catch(Exception e)
		{
			
		}
	}
	public List<Book> searchBook(String sql, int pageNo, int pageSize)
	{
		String limit = " limit " + (pageNo -1 )* pageSize+"," + pageNo* pageSize;
		sql += limit;
		System.out.println(sql);
		try {
			
			 
			List<Book> bookList = new ArrayList<Book>();
			Connection conn = this.getConnection();
			Statement stmt =  conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				Book book = new Book();
				book.setId(rs.getInt("id"));
				book.setAuthor(rs.getString("author"));
				book.setPublish(rs.getString("publish"));
				book.setPic(rs.getString("picture"));
				book.setBookName(rs.getString("bookname"));
				book.setBookNo(rs.getString("bookno"));
				book.setContent(rs.getString("Content"));
				book.setPrice(rs.getDouble("Price"));
				Integer bookCls = rs.getInt("bookClass");
				if(bookCls!=null)
				{
					String sql1 = "select * from bookclass where id="+bookCls;
					Connection conn1 = this.getConnection();
					Statement stmt1 =  conn1.createStatement();
					ResultSet rs1 = stmt1.executeQuery(sql1);
					while(rs1.next())
					{
						BookClass bookClass=new BookClass();
						bookClass.setId(rs1.getInt("id"));
						bookClass.setClassName(rs1.getString("className"));
						book.setBookClass(bookClass);
					}
					rs1.close();
					stmt1.close();
					conn1.close();
					
				}
				
				bookList.add(book);
				
			}
			
			rs.close(); 
			stmt.close();
			conn.close();
			return bookList;
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		BookDao bookDao = new BookDao();
		String sql = "select * from book";
		List<Book> list = bookDao.searchBook(sql, 1, 10);
		for(Book book:list)
		{
			System.out.println(book.getBookClass().getClassName());
			
		}

	}

}
