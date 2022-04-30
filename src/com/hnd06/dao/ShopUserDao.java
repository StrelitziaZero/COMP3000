package com.hnd06.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList; 
import java.util.List;

import com.hnd06.entity.ShopUser; 
 

public class ShopUserDao extends Dao {
	
	
	public  ShopUser getShopUser(Integer id)
	{
		try {
			ShopUser shopUser = null;
		String sql="select * from shop_User where id="+id;
		Connection conn = this.getConnection();
		Statement stmt =  conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next())
		{
			shopUser = new ShopUser();
			shopUser.setId(rs.getInt("id"));
			shopUser.setUsername(rs.getString("username")); 
			shopUser.setPassword(rs.getString("password"));
			 
		}
		rs.close(); 
		stmt.close();
		conn.close();  
		return shopUser;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public  ShopUser getShopUser(String username,String password)
	{
		try {
			ShopUser shopUser = null;
		String sql="select * from shop_User where username='"+username+"' and password='"+password+"'";
		System.out.println(sql);
		Connection conn = this.getConnection();
		Statement stmt =  conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next())
		{
			shopUser = new ShopUser();
			shopUser.setId(rs.getInt("id"));
			shopUser.setUsername(rs.getString("username")); 
			shopUser.setPassword(rs.getString("password"));
			 
		}
		rs.close(); 
		stmt.close();
		conn.close();  
		return shopUser;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public void saveShopUser(ShopUser shopUser)
	{
		try {
			
		}
		catch(Exception e)
		{
			
		}
	}
	public List<ShopUser> searchShopUser(String sql, int pageNo, int pageSize)
	{
		//sql ="select * from shopUser";
		String limit = " limit " + (pageNo -1 )* pageSize+"," + pageNo* pageSize;
		sql += limit;
		System.out.println(sql);
		try {
			 
			List<ShopUser> shopUserList = new ArrayList<ShopUser>();
			Connection conn = this.getConnection();
			Statement stmt =  conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				ShopUser shopUser = new ShopUser();
				shopUser.setId(rs.getInt("id"));
				shopUser.setUsername(rs.getString("username")); 
				shopUser.setPassword(rs.getString("password"));
				
			}
			
			rs.close(); 
			stmt.close();
			conn.close();
			return shopUserList;
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}

	 

}
