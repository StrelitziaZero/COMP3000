package gu.database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList; 
import java.util.List;

import gu.entity.ShopUser; 
 

public class ShopUserDao extends Dao {
	
	
	public  String chose(String ccc)
	{
		try {
			 
		return ccc;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public  int ggetShopUser(String username,String password)
	{

		int a=0;
			
			int x;
			if(username=="mik"&&password=="ack") {
				x=1;
			}
			else {
				x=0;
			}


		return x;
		

	}
	
	//Check the correctness of the input information
	public  ShopUser getShopUser(String username,String password,String cc)
	{
		//Catch exception
		try {
		int a=0;
		//Reset the container
		ShopUser shopUser = null;
		String sql="select * from "+cc+" where username='"+username+"' and password='"+password+"'";
		System.out.println(sql);
		//Create a database connection
		Connection conn = this.getConnection();
		Statement stmt =  conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		//Get information in a loop
		while(rs.next())
		{
			shopUser = new ShopUser();
			shopUser.setId(rs.getInt("id"));
			shopUser.setUsername(rs.getString("username")); 
			shopUser.setPassword(rs.getString("password"));
			Object x;
			if(cc=="a") {
				x=null;
			}
			else {
				x=1;
			}
		}
		//close connection
		rs.close(); 
		stmt.close();
		conn.close();  
		//Returns the value in the container
		return shopUser;
		}
		//Throw an exception
		catch(Exception e)
		{

			e.printStackTrace();

		}
		//Returns value is null
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
