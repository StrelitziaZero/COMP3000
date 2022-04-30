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
import gu.entity.GuCom;
import gu.entity.GuDish;
import gu.entity.GuPersonal;
//import jdk.nashorn.internal.ir.RuntimeNode.Request;



public class GuComDB extends Dao{
	
	
	public void saveGuDish(GuDish guDish)
	{
		try {
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	//Cross query
	public List<GuCom> searchchaGuCom(String search,String every,String searchvalue,String every2)
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
		String sql = "select * from comment "+sup+"";
		//Specify the initial number of pages and the maximum number of pages
		
		int pageNo=1;
		int pageSize=15;
		String limit = " limit " + (pageNo -1 )* pageSize+"," + pageNo* pageSize;
		sql += limit;
		System.out.println(sql);
		//Catch exception
		try {
			//Create an array of stored information
			List<GuCom> guComList = new ArrayList<GuCom>();
			//Create a database connection
			Connection conn = this.getConnection();
			Statement stmt =  conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			//Get information in a loop
			while(rs.next())
			{
				GuCom guCom = new GuCom();
				guCom.setId(rs.getInt("id"));
				guCom.setName(rs.getString("name"));
				guCom.setScore(rs.getString("score"));
				guCom.setComm(rs.getString("comm"));  
				guComList.add(guCom);
				
			}
			//close connection
			rs.close(); 
			stmt.close();
			conn.close();
			return guComList;
			
		}
		//Throw an exception
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	
	public List<GuCom> searchGuCom(String sql, int pageNo, int pageSize)
	{
		String limit = " limit " + (pageNo -1 )* pageSize+"," + pageNo* pageSize;
		sql += limit;
		System.out.println(sql);
		try {
			 
			List<GuCom> guComList = new ArrayList<GuCom>();
			Connection conn = this.getConnection();
			Statement stmt =  conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				GuCom guCom = new GuCom();
				guCom.setId(rs.getInt("id"));
				guCom.setName(rs.getString("name"));
				guCom.setScore(rs.getString("score"));
				guCom.setComm(rs.getString("comm")); 

				guComList.add(guCom);
				
			}
			
			rs.close(); 
			stmt.close();
			conn.close();
			return guComList;
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}


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

//Add comment information
	public  GuCom  addGuCom(String id,String score,String comm)
	{
		try {
			//GuPersonal guPersonal = null;
	
		String sql="INSERT INTO `comment` (name,score,comm) select Dname,'"+score+"','"+comm+"' from dish where dish.id="+id;

		System.out.println(sql);
		Connection conn = this.getConnection();
		Statement stmt =  conn.createStatement();
		
		stmt.executeUpdate(sql);
		sql="";
		stmt.close();
		conn.close();  
		id=score=comm="";
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		//return guPersonal;
		return null;
	}
	//delete 
	public  GuCom  deleteGuCom(String delete)
	{
		
		try {
		String sql="delete from comment where ID="+delete;
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

	
	
//	public static void main(String[] args) {
//		// TODO Auto-generated method stub
//		GuComDB guDishDB = new GuComDB();
//		String sql = "select * from dish";
//		List<GuDish> list = guDishDB.searchGuDish(sql, 1, 10);
//
//	}
	
	

}
