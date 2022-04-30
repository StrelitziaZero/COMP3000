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
import gu.entity.GuSale;
//import jdk.nashorn.internal.ir.RuntimeNode.Request;



public class GuSaleDB extends Dao{
	
	
	public void saveGuDish(GuDish guDish)
	{
		try {
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	//Get database information and output
	public List<GuSale> searchGuSale(String sql, int pageNo, int pageSize)
	{
		//Specify the initial number of pages and the maximum number of pages
		
		String limit = " limit " + (pageNo -1 )* pageSize+"," + pageNo* pageSize;
		sql += limit;
		System.out.println(sql);
		//Catch exception
		try { 
			//Create an array of stored information
			List<GuSale> guSaleList = new ArrayList<GuSale>();
			//Create a database connection
			Connection conn = this.getConnection();
			Statement stmt =  conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			//Get information in a loop
			while(rs.next())
			{
				GuSale guSale = new GuSale();
				guSale.setId(rs.getInt("id"));
				guSale.setDName(rs.getString("dname"));
				guSale.setCName(rs.getString("cname"));
				guSale.setDType(rs.getString("dtype")); 
				guSale.setTotal(rs.getString("total")); 
				guSale.setWtotal(rs.getString("wtotal")); 
				guSale.setWaste(rs.getString("waste")); 
				guSale.setWarning(rs.getString("warning")); 
				guSale.setDdtime(rs.getString("ddtime")); 
				guSaleList.add(guSale);
				
			}
			//close connection
			rs.close(); 
			stmt.close();
			conn.close();
			return guSaleList;
			
		}
		//Throw an exception
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}

	//update sales information
	public  GuSale  updateDname(String upid,String updname)
	{

		try {
		String sql="update sale set Dname='"+updname+"' where ID='"+upid+"';";
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
	
	public  GuSale  updateCname(String upid,String upCname)
	{
		try {
		String sql="update sale set  Cname='"+upCname+"' where ID='"+upid+"';";
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
	
	public  GuSale  updateDtype(String upid,String upDtype)
	{
		try {
		String sql="update sale set Dtype='"+upDtype+"' where ID='"+upid+"';";
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
	
	public  GuSale  updatetotal(String upid, String uptotal)
	{
		if(uptotal=="") {
			
		}
		else {
		try {
		String sql="update sale set total='"+uptotal+"' where ID='"+upid+"';";
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

	//add sales information
	public  GuSale  addGuSale(String idd,String wnumber)
	{
		try {
			int x=0,y=0;
		x=Integer.parseInt(idd);
		y=Integer.parseInt(wnumber);
		String z="Serious Waste";
		String z2="Steerable Waste";
		String sql="INSERT INTO `sale` (dname,cname,dtype,total,wtotal,waste,warning,ddtime) select Dname,Cname,Dtype,total,'"+y+"',round(('"+y+"'/total)*100,2),if(round(('"+y+"'/total)*100,2)<20,'"+z2+"','"+z+"'),dtime from dish where dish.id="+idd;
		//sql+=" values ('"+Dname+"','"+Cname+"','"+Dtype+"','"+total+"')";
		//String sql="INSERT INTO `sale` (dname,cname,dtype,total,wtotal,waste,warning,ddtime) select Dname,Cname,Dtype,total,'"+y+"',(y/total)*100,if((y/total)*100<20,'Steerable Waste','Serious Waste'),dtime from dish where dish.id="+idd;
		
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
	
	//delete sales information
	public  GuSale  deleteGuSale(String delete)
	{
		
		try {
		String sql="delete from sale where ID="+delete;
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
		GuSaleDB guSaleDB = new GuSaleDB();
		String sql = "select * from sale";
		List<GuSale> list = guSaleDB.searchGuSale(sql, 1, 10);

	}
	
	

}
