package com.hnd06.dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import com.mysql.jdbc.Driver;
public class Dao {
	String url="jdbc:mysql://localhost:3306/bookstore?useSSL=false";
	String username="root";
	String password="123456";
	public Connection getConnection()
	{
		try {
			//鍔犺浇椹卞姩
			Class.forName("com.mysql.cj.jdbc.Driver");		
			//鑾峰緱鏁版嵁搴撹繛鎺�
			//杩炴帴涓层�佺敤鎴峰悕銆佸瘑鐮� 			 
			return DriverManager.getConnection(url,username,password);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}

	public static void main(String[] args) {
		
		try {
		//鍔犺浇椹卞姩
		Class.forName("com.mysql.cj.jdbc.Driver");		
		//鑾峰緱鏁版嵁搴撹繛鎺�
		//杩炴帴涓层�佺敤鎴峰悕銆佸瘑鐮�
		String url="jdbc:mysql://localhost:3306/bookstore?useSSL=false";
		String username="root";
		String password="123456";
		Connection conn = DriverManager.getConnection(url,username,password);
				
		//鎿嶄綔鏁版嵁搴�
		Statement stmt = conn.createStatement();
		String sql="select id, area_name from area";
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next())
		{
			System.out.println(rs.getLong(1) + "    "+ rs.getString(2));
		}
		
		//鍏抽棴杩炴帴
		rs.close();
		stmt.close();
		conn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

	}

}
