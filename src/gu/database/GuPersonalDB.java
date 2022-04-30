package gu.database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.swing.JOptionPane;

import com.hnd06.dao.ShopUserDao;
import com.hnd06.entity.ShopUser;

import gu.entity.GuDish;
import gu.entity.GuPersonal;
//import jdk.nashorn.internal.ir.RuntimeNode.Request;



public class GuPersonalDB extends Dao{
	
	//Cross query
	public List<GuPersonal> searchchaGuPersonal(String search,String every,String searchvalue,String every2)
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
		String sql = "select * from personal "+sup+"";
		//Specify the initial number of pages and the maximum number of pages
		
		int pageNo=1;
		int pageSize=15;
		String limit = " limit " + (pageNo -1 )* pageSize+"," + pageNo* pageSize;
		sql += limit;
		System.out.println(sql);
		//Catch exception
		try {
			//Create an array of stored information
			List<GuPersonal> guPersonalList = new ArrayList<GuPersonal>();
			//Create a database connection
			Connection conn = this.getConnection();
			Statement stmt =  conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			//Get information in a loop
			while(rs.next())
			{
				GuPersonal guPersonal = new GuPersonal();
				guPersonal.setId(rs.getInt("id"));
				guPersonal.setName(rs.getString("name"));
				guPersonal.setAddress(rs.getString("address"));
				guPersonal.setJob(rs.getString("job")); 
				guPersonal.setSalary(rs.getString("salary")); 
				guPersonalList.add(guPersonal);
				
			}
			//close connection
			rs.close(); 
			stmt.close();
			conn.close();
			return guPersonalList;
			
		}
		//Throw an exception
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	

	
	public void saveGuPersonal(GuPersonal guPersonal)
	{
		try {
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	//Get database information and output
	public List<GuPersonal> searchGuPersonal(String sql, int pageNo, int pageSize)
	{
		String limit = " limit " + (pageNo -1 )* pageSize+"," + pageNo* pageSize;
		sql += limit;
		System.out.println(sql);
		try {
			 
			List<GuPersonal> guPersonalList = new ArrayList<GuPersonal>();
			Connection conn = this.getConnection();
			Statement stmt =  conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				GuPersonal guPersonal = new GuPersonal();
				guPersonal.setId(rs.getInt("id"));
				guPersonal.setName(rs.getString("name"));
				guPersonal.setAddress(rs.getString("address"));
				guPersonal.setJob(rs.getString("job")); 
				guPersonal.setSalary(rs.getString("salary")); 
				
				guPersonalList.add(guPersonal);
				
			}
			
			rs.close(); 
			stmt.close();
			conn.close();
			return guPersonalList;
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	

	//modify staff information
	public  GuPersonal  updatename(String upid,String upname)
	{
		try {
		String sql="update personal set name='"+upname+"' where ID='"+upid+"';";
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
	
	public  GuPersonal  updateaddress(String upid,String upaddress)
	{
		try {
		String sql="update personal set  address='"+upaddress+"' where ID='"+upid+"';";
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
	
	public  GuPersonal  updatejob(String upid,String upjob)
	{
		try {
		String sql="update personal set job='"+upjob+"' where ID='"+upid+"';";
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
	
	public  GuPersonal  updatesalary(String upid, String upsalary)
	{
		if(upsalary=="") {
			
		}
		else {
		try {
		String sql="update personal set  salary='"+upsalary+"' where ID='"+upid+"';";
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

	//Get database information and output
	public  GuPersonal  ggetGuPersonal(String name1,String address1,String job1,String salary1)
	{
		try {
		String sql="insert into personal (name,address,job,salary)";
		sql+=" values ('"+name1+"','"+address1+"','"+job1+"','"+salary1+"')";
		System.out.println(sql);
		Connection conn = this.getConnection();
		Statement stmt =  conn.createStatement();
		
		stmt.executeUpdate(sql);
		sql="";
		stmt.close();
		conn.close();  
		name1=address1=job1=salary1="";
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	//delete staff information
	public  GuPersonal  deleteGuPersonal(String delete)
	{
		
		try {
		String sql="delete from personal where ID="+delete;
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
		GuPersonalDB guPersonalDB = new GuPersonalDB();
		String sql = "select * from personal";
		List<GuPersonal> list = guPersonalDB.searchGuPersonal(sql, 1, 10);

	}
	
	

}
