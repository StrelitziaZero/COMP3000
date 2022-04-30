package gu.database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.TimeZone;

import javax.swing.JOptionPane;

import com.hnd06.dao.ShopUserDao;
import com.hnd06.entity.ShopUser;

import gu.entity.GuAr;
import gu.entity.GuDish;
import gu.entity.GuPersonal;

public class GuDishDB extends Dao{
	
	
	public void saveGuDish(GuDish guDish)
	{
		try {
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	//search database information and output
	public List<GuDish> searchchaGuDish(String search,String every,String searchvalue,String every2)
	{
		String sup;
		//Determine the SQL statement that should be used by the data type passed
		
		if((searchvalue==null&&search==null)||(searchvalue==""&&search=="")) {
			 sup="";
		}
		else if(searchvalue==null||searchvalue=="") {
			sup=" where "+every2+"='"+search+"' ";
		}
		else if(search==null||search=="") {
			sup=" where "+every+"='"+searchvalue+"'";
		}
		else {
			sup = " where "+every2+"='"+search+"' and "+every+"='"+searchvalue+"'";
		}
		String sql = "select * from dish "+sup+"";
		//Specify the initial number of pages and the maximum number of pages
		
		int pageNo=1;
		int pageSize=15;
		String limit = " limit " + (pageNo -1 )* pageSize+"," + pageNo* pageSize;
		sql += limit;
		System.out.println(sql);
		//Catch exception
		try {
			//Create an array of stored information
			List<GuDish> guDishList = new ArrayList<GuDish>();
			//Create a database connection
			Connection conn = this.getConnection();
			Statement stmt =  conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			//Get information in a loop
			while(rs.next())
			{
				GuDish guDish = new GuDish();
				guDish.setId(rs.getInt("id"));
				guDish.setDName(rs.getString("Dname"));
				guDish.setCName(rs.getString("Cname"));
				guDish.setDType(rs.getString("Dtype")); 
				guDish.setTotal(rs.getString("total")); 
				guDish.setDtime(rs.getString("dtime")); 
				guDish.setPrice(rs.getString("price")); 
				guDishList.add(guDish);
				
			}
			//close connection
			rs.close(); 
			stmt.close();
			conn.close();
			return guDishList;
			
		}
		//Throw an exception
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	//Get database information and output
	public List<GuDish> searchGuDish(String sql, int pageNo, int pageSize)
	{
		String limit = " limit " + (pageNo -1 )* pageSize+"," + pageNo* pageSize;
		sql += limit;
		System.out.println(sql);
		try {
			 
			List<GuDish> guDishList = new ArrayList<GuDish>();
			Connection conn = this.getConnection();
			Statement stmt =  conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				GuDish guDish = new GuDish();
				guDish.setId(rs.getInt("id"));
				guDish.setDName(rs.getString("Dname"));
				guDish.setCName(rs.getString("Cname"));
				guDish.setDType(rs.getString("Dtype")); 
				guDish.setTotal(rs.getString("total")); 
				guDish.setDtime(rs.getString("dtime")); 
				guDish.setPrice(rs.getString("price")); 
				guDishList.add(guDish);
				
			}
			
			rs.close(); 
			stmt.close();
			conn.close();
			return guDishList;
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}

	//modify dishes information
	public  GuDish  updateDname(String upid,String upDname)
	{

		try {
		String sql="update dish set Dname='"+upDname+"' where ID='"+upid+"';";
		System.out.println(sql);
		Connection conn = this.getConnection();
		Statement stmt =  conn.createStatement();
		
		stmt.executeUpdate(sql);
		sql="";
		stmt.close();
		conn.close();  
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public  GuDish  updatePrice(String upid,String upprice)
	{

		try {
		String sql="update dish set price='"+upprice+"' where ID='"+upid+"';";
		System.out.println(sql);
		Connection conn = this.getConnection();
		Statement stmt =  conn.createStatement();
		
		stmt.executeUpdate(sql);
		sql="";
		stmt.close();
		conn.close();  
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	

	
	public  GuDish  updateCname(String upid,String upCname)
	{
		try {
		String sql="update dish set Cname='"+upCname+"' where ID='"+upid+"';";
		System.out.println(sql);
		Connection conn = this.getConnection();
		Statement stmt =  conn.createStatement();
		
		stmt.executeUpdate(sql);
		sql="";
		stmt.close();
		conn.close();  
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public  GuDish  updateDtype(String upid,String upDtype)
	{
		try {
		String sql="update dish set Dtype='"+upDtype+"' where ID='"+upid+"';";
		System.out.println(sql);
		Connection conn = this.getConnection();
		Statement stmt =  conn.createStatement();
		
		stmt.executeUpdate(sql);
		sql="";
		stmt.close();
		conn.close();  
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public  GuDish  updatetotal(String upid, String uptotal)
	{
		if(uptotal=="") {
			
		}
		else {
		try {
		String sql="update dish set total='"+uptotal+"' where ID='"+upid+"';";
		System.out.println(sql);
		Connection conn = this.getConnection();
		Statement stmt =  conn.createStatement();
		
		stmt.executeUpdate(sql);
		sql="";
		stmt.close();
		conn.close();  
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		}
		return null;
		
	}

//add dishes information
	public  GuDish  addGuDish(String Dname,String addprice,String Cname,String Dtype,String total)
	{
		try {
			//Get current time
			Calendar cal=Calendar.getInstance(TimeZone.getTimeZone("GMT+08:00"));
			int year=cal.get(Calendar.YEAR);
			int month=cal.get(Calendar.MONTH)+1;
			int day=cal.get(Calendar.DAY_OF_MONTH);
			int hour=cal.get(Calendar.HOUR_OF_DAY);
			int minute=cal.get(Calendar.MINUTE);
		//Merging time information strings	
		String tt=year+"-"+month+"-"+day+"-"+hour+":"+minute;
		String sql="insert into dish (Dname,price,Cname,Dtype,total,dtime)";
		sql+=" values ('"+Dname+"','"+addprice+"','"+Cname+"','"+Dtype+"','"+total+"','"+tt+"')";
		System.out.println(sql);
		//Connect to the database
		Connection conn = this.getConnection();
		Statement stmt =  conn.createStatement();
		stmt.executeUpdate(sql);
		sql="";
		//Disconnect the database
		stmt.close();
		conn.close();  
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	//delete dishes information
	public  GuDish  deleteGuDish(String delete)
	{
		
		try {
		String sql="delete from dish where ID="+delete;
		System.out.println(sql);
		Connection conn = this.getConnection();
		Statement stmt =  conn.createStatement();
		stmt.executeUpdate(sql);
		sql="";
		stmt.close();
		conn.close();  
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}	
		return null;
	}
	
	public  int  Datetime()
	{
		Calendar cal=Calendar.getInstance();
		int year=cal.get(Calendar.YEAR);
		return year;
	}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		GuDishDB guDishDB = new GuDishDB();
		String sql = "select * from dish";
		List<GuDish> list = guDishDB.searchGuDish(sql, 1, 10);

	}
	
	

}
