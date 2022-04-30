package com.hnd06.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList; 
import java.util.List;

import com.hnd06.entity.BookClass; 
 

public class BookClassDao extends Dao {
	
	
	public  BookClass getBookClass(Integer id)
	{
		try {
			BookClass bookclass = null;
		String sql="select * from bookclass where id="+id;
		Connection conn = this.getConnection();
		Statement stmt =  conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next())
		{
			bookclass = new BookClass();
			bookclass.setId(rs.getInt("id"));
			bookclass.setClassName(rs.getString("ClassName"));  
			 
		}
		rs.close(); 
		stmt.close();
		conn.close();  
		return bookclass;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	public void saveBookClass(BookClass bookclass)
	{
		try {
			
		}
		catch(Exception e)
		{
			
		}
	}
	public List<BookClass> searchBookClass(String sql, int pageNo, int pageSize)
	{
		//sql ="select * from bookclass";
		String limit = " limit " + (pageNo -1 )* pageSize+"," + pageNo* pageSize;
		sql += limit;
		System.out.println(sql);
		try {
			 
			List<BookClass> bookclassList = new ArrayList<BookClass>();
			Connection conn = this.getConnection();
			Statement stmt =  conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				BookClass bookclass = new BookClass();
				bookclass.setId(rs.getInt("id"));
				bookclass.setClassName(rs.getString("ClassName")); 
				 
				
			}
			
			rs.close(); 
			stmt.close();
			conn.close();
			return bookclassList;
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}

	 

}
