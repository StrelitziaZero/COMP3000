package gu.database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.TimeZone;

import com.hnd06.dao.ShopUserDao;
import com.hnd06.entity.ShopUser;

import gu.entity.GuPersonal;
import gu.entity.GuRaw;



public class GuSalesDB extends Dao{
	
	//Get database information and output,cross query
	public List<GuRaw> searchchaGuSales(String search,String every,String searchvalue,String every2)
	{
		//get the time information
		Calendar cal=Calendar.getInstance(TimeZone.getTimeZone("GMT+08:00"));
		int year=cal.get(Calendar.YEAR);
		int month=cal.get(Calendar.MONTH)+1;
		int day=cal.get(Calendar.DAY_OF_MONTH);
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
	    String sql = "  select ID,name,total,purdate,exdate,exdate1,exdate2 ,if(exdate<"+year+"&&exdate1<"+month+"&&exdate2<"+day+",'"+"Past Due"+"','"+"normal"+"') as exdate3 from sales "+sup+"";
	  //Specify the initial number of pages and the maximum number of pages
		
		
		int pageNo=1;
		int pageSize=15;
		String limit = " limit " + (pageNo -1 )* pageSize+"," + pageNo* pageSize;
		sql += limit;
		System.out.println(sql);
		//Catch exception
		try {
			//Create an array of stored information
			List<GuRaw> guSalesList = new ArrayList<GuRaw>();
			//Create a database connection
			Connection conn = this.getConnection();
			Statement stmt =  conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			//Get information in a loop
			while(rs.next())
			{
				GuRaw guSales = new GuRaw();
				guSales.setId(rs.getInt("id"));
				guSales.setName(rs.getString("name"));
				guSales.setTotal(rs.getString("total"));
				guSales.setPurdate(rs.getString("purdate")); 
				guSales.setExdate(rs.getString("exdate")); 
				guSales.setExdate1(rs.getString("exdate1"));
				guSales.setExdate2(rs.getString("exdate2"));
				guSales.setExdate3(rs.getString("exdate3"));
				guSalesList.add(guSales);
			}
			//close connection
			rs.close(); 
			stmt.close();
			conn.close();
			return guSalesList;
			
		}
		//Throw an exception
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	

	//Get database information and output
	public List<GuRaw> searchGuSales(String sql, int pageNo, int pageSize)
	{
		System.out.println(sql);
		try {
			 
			List<GuRaw> guSalesList = new ArrayList<GuRaw>();
			Connection conn = this.getConnection();
			Statement stmt =  conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				GuRaw guSales = new GuRaw();
				guSales.setId(rs.getInt("id"));
				guSales.setName(rs.getString("name"));
				guSales.setTotal(rs.getString("total"));
				guSales.setPurdate(rs.getString("purdate")); 
				guSales.setExdate(rs.getString("exdate")); 
				guSales.setExdate1(rs.getString("exdate1")); 
				guSales.setExdate2(rs.getString("exdate2")); 
				guSales.setExdate3(rs.getString("exdate3")); 
				guSalesList.add(guSales);
				
			}
			
			rs.close(); 
			stmt.close();
			conn.close();
			return guSalesList;
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	

	//update raw materials information
	public  GuRaw  updatename(String upid,String upname)
	{

		try {
		String sql="update sales set name='"+upname+"' where ID='"+upid+"';";
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
	
	public  GuRaw  updatetotal(String upid,String uptotal)
	{
		try {
		String sql="update sales set  total='"+uptotal+"' where ID='"+upid+"';";
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
	
	public  GuRaw  updatepurdate(String upid,String uppurdate)
	{
		try {
		String sql="update sales set purdate='"+uppurdate+"' where ID='"+upid+"';";
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
	
	public  GuRaw updateexdate(String upid, String upexdate)
	{
		try {
		String sql="update sales set  exdate='"+upexdate+"' where ID='"+upid+"';";
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
	
	public  GuRaw updateexdate1(String upid, String upexdate)
	{
		try {
		String sql="update sales set  exdate1='"+upexdate+"' where ID='"+upid+"';";
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
	
	public  GuRaw updateexdate2(String upid, String upexdate)
	{
		try {
		String sql="update sales set  exdate2='"+upexdate+"' where ID='"+upid+"';";
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

	//add and calculate raw materials information
	public  GuRaw  addGuSales(String name,String total,String exdate)
	{
		try {
			//get the time information
			Calendar cal=Calendar.getInstance(TimeZone.getTimeZone("GMT+08:00"));
			int year=cal.get(Calendar.YEAR);
			int month=cal.get(Calendar.MONTH)+1;
			int day=cal.get(Calendar.DAY_OF_MONTH);
			int x,days=0,z,realdays=0,realmonth=0,realyears=0,m=0,y=0,alldays=0,pastdays=0;
			int remaindays=0,realmaindays=0;
			
			//Determine whether the number of days this year is 365 or 366
			if(year%4==0&&year%100!=0||year%400==0) {
				y=366;
			}
			else {
				y=365;
			}
			
			// Calculate the total number of days in the month after this year,check
			for(int i=1;i<month;i++) {
			if(year%4==0&&year%100!=0||year%400==0) {
				if((i==1)||(i==3)||(i==5)||(i==7)||(i==8)||(i==10)||(i==12)) {
					pastdays+=31;
				}
				else if(i==2){
					pastdays+=29;
				}
				else {
					pastdays+=30;
				}
			}
			else {
				if((i==1)||(i==3)||(i==5)||(i==7)||(i==8)||(i==10)||(i==12)) {
					pastdays+=31;
				}
				else if(i==2){
					pastdays+=28;
				}
				else {
					pastdays+=30;
				}
			}
			}
			
			
			x=Integer.parseInt(exdate);
			alldays=x+day;
			
			//Calculate actual date
			if(alldays<=(y-pastdays)) {

					for(int i=month;i<=12;i++) {
						if((i==1)||(i==3)||(i==5)||(i==7)||(i==8)||(i==10)||(i==12)) {
							if(alldays<=31) {
								realmonth=i;
								break;
							}
							alldays-=31;
						}
						else if(i==2){
							if(year%4==0&&year%100!=0||year%400==0) {
								if(alldays<=29) {
									realmonth=i;
									break;
								}
								alldays-=29;
							}
							else {
								if(alldays<=28) {
									realmonth=i;
									break;
								}
								alldays-=28;
							}
							
						}
						else{
							if(alldays<=30) {
								realmonth=i;
								break;
							}
							alldays-=30;
						}
					}
					realdays=alldays;
					realyears=year;		
			}
			else {
				alldays+=pastdays;
				for(int i=year;i<=3000;i++) {
					if(i%4==0&&i%100!=0||i%400==0) {
						if(alldays<=366) {
							realyears=i;
							break;
						}
						alldays-=366;
					}
					else {
						if(alldays<=365) {
							realyears=i;
							break;
						}
						alldays-=365;
					}
				}
					for(int i=1;i<=12;i++) {
						if((i==1)||(i==3)||(i==5)||(i==7)||(i==8)||(i==10)||(i==12)) {
							if(alldays<=31) {
								realmonth=i;
								break;
							}
							alldays-=31;
						}
						else if(i==2){
							if(realyears%4==0 && realyears%100!=0 || realyears%400==0) {
								if(alldays<=29) {
									realmonth=i;
									break;
								}
								alldays-=29;
							}
							else {
								if(alldays<=28) {
									realmonth=i;
									break;
								}
								alldays-=28;
							}
						}
						else{
							if(alldays<=30) {
								realmonth=i;
								break;
							}
							alldays-=30;
						}
					}
					realdays=alldays;
			}
			
//				x=Integer.parseInt(upexdate);
//				days=x+day;
//			if(days>m) {
//				int alldays,months,allmonth;
//				realdays=days%30;//余数
//				alldays=days-realdays;//要被除以的天数
//				months=alldays/30;//天数转结的月数
//				allmonth=months+month;
//				days=realdays;
//				if(allmonth>12) {
//					int years,Dmonth;
//					realmonth=allmonth%12;//余数
//					Dmonth=allmonth-realmonth;//要被除的月数
//					years=Dmonth/12;
//					realyears=years+year;
//				}
//				else {
//					realyears=year;
//					realmonth=allmonth;
//				}
//			}
//			else {
//				realdays=days;
//				realyears=year;
//				realmonth=month;
//			}
			String realdate;
			String tt=year+"-"+month+"-"+day;
			realdate=String.valueOf(realyears)+"-"+String.valueOf(realmonth)+"-"+String.valueOf(realdays);
		String sql="insert into sales (name,total,purdate,exdate,exdate1,exdate2)";
		sql+=" values ('"+name+"','"+total+"','"+tt+"','"+realyears+"','"+realmonth+"','"+realdays+"')";
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
	
	//delete
	public  GuRaw  deleteGuSales(String delete)
	{
		try {

		String sql="delete from sales where ID="+delete;
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

		GuSalesDB guPersonalDB = new GuSalesDB();
		String sql = "select * from sales";
		List<GuRaw> list = guPersonalDB.searchGuSales(sql, 1, 10);

	}
	
	

}
