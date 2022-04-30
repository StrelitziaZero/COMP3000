package gu.database;

import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import gu.entity.GuChart;


public class GuChartDB extends Dao {

	public void saveFunction(GuChart function)
	{
		try {
			
		}
		catch(Exception e)
		{
			
		}
	}
	
	//Get database information and output
	public List<GuChart> searchChart(String sql, int pageNo, int pageSize)
	{
		//Specify the initial number of pages and the maximum number of pages
		String limit = " limit " + (pageNo -1 )* pageSize+"," + pageNo* pageSize;
		sql += limit;
		System.out.println(sql);
		
		//Catch exception
		try {
			//Create an array of stored information
			List<GuChart> functionList = new ArrayList<GuChart>();
			//Create a database connection
			Connection conn = this.getConnection();
			Statement stmt =  conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			//Get information in a loop
			while(rs.next())
			{
				GuChart function = new GuChart();
				function.setId(rs.getInt("id"));
				function.setDishid(rs.getString("dishid"));
				function.setDname1(rs.getString("dname1"));
				function.setAvescore(rs.getFloat("avescore"));
				functionList.add(function);
				
			}
			//close connection
			rs.close(); 
			stmt.close();
			conn.close();
			return functionList;
			
		}
		//Throw an exception
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}




}
