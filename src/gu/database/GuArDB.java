package gu.database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.TimeZone;

import gu.entity.GuAr;
import gu.entity.GuDish;
import gu.entity.ShopUser; 
 

public class GuArDB extends Dao {
	
	
	//Confirm the correctness of the username and password from the front end
	public  ShopUser getShopUser(Integer id)
	{
		//Catch exception
		try {
			ShopUser shopUser = null;
		String sql="select * from shop_User where id="+id;
		//Create a database connection
		Connection conn = this.getConnection();
		Statement stmt =  conn.createStatement();
		//Create rolling data
		ResultSet rs = stmt.executeQuery(sql);
		//Get information in a loop
		while(rs.next())
		{
			shopUser = new ShopUser();
			shopUser.setId(rs.getInt("id"));
			shopUser.setUsername(rs.getString("username")); 
			shopUser.setPassword(rs.getString("password"));
			 
		}
		//close connection
		rs.close(); 
		stmt.close();
		conn.close();  
		return shopUser;
		}
		//Throw an exception
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	//search the correctness of the username and password from the front end
	public  ShopUser getShopUser(String username,String password,String cc)
	{
		try {
			ShopUser shopUser = null;
		String sql="select * from "+cc+" where username='"+username+"' and password='"+password+"'";
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
	
	//search method
	public List<GuAr> searchGuAr(String sql, int pageNo, int pageSize)
	{
		//Specify the initial number of pages and the maximum number of pages
		String limit = " limit " + (pageNo -1 )* pageSize+"," + pageNo* pageSize;
		sql += limit;
		System.out.println(sql);
		try {
			//Create an array of stored information
			List<GuAr> guArList = new ArrayList<GuAr>();
			Connection conn = this.getConnection();
			Statement stmt =  conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				GuAr guAr = new GuAr();
				guAr.setId(rs.getInt("id"));
				guAr.setUsername(rs.getString("username"));
				guAr.setPassword(rs.getString("password"));
				guAr.setNames(rs.getString("names")); 
				guAr.setSex(rs.getString("sex")); 
				guAr.setAddress(rs.getString("address")); 
				guAr.setPhone(rs.getString("phone")); 
				guArList.add(guAr);
				
			}
			rs.close(); 
			stmt.close();
			conn.close();
			return guArList;
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	//User Cross query
	public List<GuAr> searchuGuAr(String search,String every,String searchvalue,String every2)
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
		String sql = "select * from shop_userr "+sup+"";
		int pageNo=1;
		int pageSize=15;
		String limit = " limit " + (pageNo -1 )* pageSize+"," + pageNo* pageSize;
		sql += limit;
		System.out.println(sql);
		try {
			 
			List<GuAr> guArList = new ArrayList<GuAr>();
			Connection conn = this.getConnection();
			Statement stmt =  conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				GuAr guAr = new GuAr();
				guAr.setId(rs.getInt("id"));
				guAr.setUsername(rs.getString("username"));
				guAr.setPassword(rs.getString("password"));
				guAr.setNames(rs.getString("names")); 
				guAr.setSex(rs.getString("sex")); 
				guAr.setAddress(rs.getString("address")); 
				guAr.setPhone(rs.getString("phone")); 
				guArList.add(guAr);
				
			}
			rs.close(); 
			stmt.close();
			conn.close();
			return guArList;
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	//Modify Personal Information
	public List<GuAr> searchmy(String search,String type)
	{
		String sql = "select * from "+type+" where UserName='"+search+"' ";
		int pageNo=1;
		int pageSize=15;
		String limit = " limit " + (pageNo -1 )* pageSize+"," + pageNo* pageSize;
		sql += limit;
		System.out.println(sql);
		try {
			 
			List<GuAr> guArList = new ArrayList<GuAr>();
			Connection conn = this.getConnection();
			Statement stmt =  conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				GuAr guAr = new GuAr();
				guAr.setId(rs.getInt("id"));
				guAr.setUsername(rs.getString("username"));
				guAr.setPassword(rs.getString("password"));
				guAr.setNames(rs.getString("names")); 
				guAr.setSex(rs.getString("sex")); 
				guAr.setAddress(rs.getString("address")); 
				guAr.setPhone(rs.getString("phone")); 
				guArList.add(guAr);
				
			}
			rs.close(); 
			stmt.close();
			conn.close();
			return guArList;
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	//Admin Cross query
	public List<GuAr> searchaGuAr(String search,String every,String searchvalue,String every2)
	{
		String sup;
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
		String sql = "select * from shop_user "+sup+"";
		int pageNo=1;
		int pageSize=15;
		String limit = " limit " + (pageNo -1 )* pageSize+"," + pageNo* pageSize;
		sql += limit;
		System.out.println(sql);
		try {
			 
			List<GuAr> guArList = new ArrayList<GuAr>();
			Connection conn = this.getConnection();
			Statement stmt =  conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				GuAr guAr = new GuAr();
				guAr.setId(rs.getInt("id"));
				guAr.setUsername(rs.getString("username"));
				guAr.setPassword(rs.getString("password"));
				guAr.setNames(rs.getString("names")); 
				guAr.setSex(rs.getString("sex")); 
				guAr.setAddress(rs.getString("address")); 
				guAr.setPhone(rs.getString("phone")); 
				guArList.add(guAr);
				
			}
			rs.close(); 
			stmt.close();
			conn.close();
			return guArList;
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	//When adding information, avoid duplication of information
	public  String  pan(String username,String abc,String id)
	{
		try {
			String sql="update "+abc+" set UserName='"+username+"' where id='"+id+"'  ";
			//sql+=" values ('"+username+"')";
			System.out.println(sql);
			Connection conn = this.getConnection();
			Statement stmt =  conn.createStatement();
			stmt.executeUpdate(sql);
			sql="";
			stmt.close();
			conn.close();  
			return "a";
			}
			catch(Exception e)
			{
				e.printStackTrace();
				return "b";
			}
	}
	//When modify information, avoid duplication of information
	public  String  pan2(String username,String password,String names,String sex,String address,String phone,String abc)
	{
		try {
		String sql="insert into "+abc+" (username,password,names,sex,address,phone)";
		sql+=" values ('"+username+"','"+password+"','"+names+"','"+sex+"','"+address+"','"+phone+"')";
		System.out.println(sql);
		Connection conn = this.getConnection();
		Statement stmt =  conn.createStatement();
		stmt.executeUpdate(sql);
		sql="";
		stmt.close();
		conn.close();  
		return "a";
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return "b";
		}
	}
	
	//add information method
	public  GuAr  addGuAr(String username,String password,String names,String sex,String address,String phone,String abc)
	{
		try {
		String sql="insert into "+abc+" (username,password,names,sex,address,phone)";
		sql+=" values ('"+username+"','"+password+"','"+names+"','"+sex+"','"+address+"','"+phone+"')";
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
	
	//Delete method for user
	public  GuAr  deleteGuAr(String delete)
	{
		
		try {
		String sql="delete from shop_userr where ID="+delete;
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
	
	//Delete method for admin
	public  GuAr  deleteGuArAd(String delete)
	{
		
		try {
		String sql="delete from shop_user where ID="+delete;
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
	
	

	//User username Update
	public  GuAr  updateausernameA(String upid,String upusername)
	{

		try {
		String sql="update shop_user set UserName='"+upusername+"' where id='"+upid+"';";
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
	
	public  GuAr  updatepasswordA(String upid,String uppassword)
	{

		try {
		String sql="update shop_user set PassWord='"+uppassword+"' where id='"+upid+"';";
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
	
	public  GuAr  updatenameA(String upid,String upname)
	{

		try {
		String sql="update shop_user set Names='"+upname+"' where id='"+upid+"';";
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
	
	public  GuAr  updatesexA(String upid,String upsex)
	{

		try {
		String sql="update shop_user set Sex='"+upsex+"' where id='"+upid+"';";
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
	

	public  GuAr  updateaddressA(String upid,String upaddress)
	{

		try {
		String sql="update shop_user set Address='"+upaddress+"' where id='"+upid+"';";
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
	
	
	public  GuAr  updatephoneA(String upid,String upphone)
	{

		try {
		String sql="update shop_user set Phone='"+upphone+"' where id='"+upid+"';";
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
	
	//How to modify personal information
	public  GuAr  cupdateusername(String upusername,String type)
	{

		try {
		String sql="update "+type+" set UserName='"+upusername+"' ;";
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
	
	public  GuAr  cupdatepassword(String upid,String uppassword,String type)
	{

		try {
		String sql="update "+type+" set PassWord='"+uppassword+"' where UserName='"+upid+"';";
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
	
	public  GuAr  cupdatename(String upid,String upname,String type)
	{

		try {
		String sql="update "+type+" set Names='"+upname+"' where UserName='"+upid+"';";
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
	
	public  GuAr  cupdatesex(String upid,String upsex,String type)
	{

		try {
		String sql="update "+type+" set Sex='"+upsex+"' where UserName='"+upid+"';";
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
	

	public  GuAr  cupdateaddress(String upid,String upaddress,String type)
	{

		try {
		String sql="update "+type+" set Address='"+upaddress+"' where UserName='"+upid+"';";
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
	
	
	public  GuAr  cupdatephone(String upid,String upphone,String type)
	{

		try {
		String sql="update "+type+" set Phone='"+upphone+"' where UserName='"+upid+"';";
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
	

	//Modified method
	public  GuAr  updateusername(String upid,String upusername)
	{

		try {
		String sql="update shop_userr set UserName='"+upusername+"' where id='"+upid+"';";
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
	
	public  GuAr  updatepassword(String upid,String uppassword)
	{

		try {
		String sql="update shop_userr set PassWord='"+uppassword+"' where id='"+upid+"';";
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
	
	public  GuAr  updatename(String upid,String upname)
	{

		try {
		String sql="update shop_userr set Names='"+upname+"' where id='"+upid+"';";
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
	
	public  GuAr  updatesex(String upid,String upsex)
	{

		try {
		String sql="update shop_userr set Sex='"+upsex+"' where id='"+upid+"';";
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
	

	public  GuAr  updateaddress(String upid,String upaddress)
	{

		try {
		String sql="update shop_userr set Address='"+upaddress+"' where id='"+upid+"';";
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
	
	
	public  GuAr  updatephone(String upid,String upphone)
	{

		try {
		String sql="update shop_userr set Phone='"+upphone+"' where id='"+upid+"';";
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
	

	 

}
