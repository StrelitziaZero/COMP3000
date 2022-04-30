package gu.database;

import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import gu.entity.Function;

public class MainpageDatabase extends Dao {
	
	//Get database information and output
	public  Function getFunction(Integer id)
	{
		//Catch exception
		try {
		Function function = new Function();
		String sql="select * from function1 where id="+id;
		Connection conn = this.getConnection();
		Statement stmt =  conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next())
		{
			function.setId(rs.getInt("id"));	
			function.setPic(rs.getString("picture"));
			function.setFunctionName(rs.getString("functionname"));
			
			
		}
		rs.close(); 
		stmt.close();
		conn.close();  
		return function;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	public void saveFunction(Function function)
	{
		try {
			
		}
		catch(Exception e)
		{
			
		}
	}
	
	
	public List<Function> searchFunction(String sql, int pageNo, int pageSize)
	{
		//Specify the initial number of pages and the maximum number of pages
		
		String limit = " limit " + (pageNo -1 )* pageSize+"," + pageNo* pageSize;
		sql += limit;
		System.out.println(sql);
		try {
			
			//Create an array of stored information
			List<Function> functionList = new ArrayList<Function>();
			Connection conn = this.getConnection();
			Statement stmt =  conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			//Get information in a loop
			while(rs.next())
			{
				Function function = new Function();
				function.setId(rs.getInt("id"));
				function.setPic(rs.getString("picture"));
				function.setFunctionName(rs.getString("functionname"));
				
				functionList.add(function);
				
			}
			
			rs.close(); 
			stmt.close();
			conn.close();
			return functionList;
		//close connection
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}


	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		MainpageDatabase mainpageDatabase = new MainpageDatabase();
		String sql = "select * from function1";
		List<Function> list = mainpageDatabase.searchFunction(sql, 1, 10);
		

	}

}
