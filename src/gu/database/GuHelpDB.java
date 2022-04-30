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
import gu.entity.GuHelp;
import gu.entity.GuPersonal;
import gu.entity.GuSale;
//import jdk.nashorn.internal.ir.RuntimeNode.Request;



public class GuHelpDB extends Dao{
	
	
	public void saveGuHelp(GuHelp guHelp)
	{
		try {
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	//Get database information and output
	public List<GuHelp> searchGuHelp(String sql, int pageNo, int pageSize)
	{
		//Specify the initial number of pages and the maximum number of pages
		
		String limit = " limit " + (pageNo -1 )* pageSize+"," + pageNo* pageSize;
		sql += limit;
		System.out.println(sql);
		//Catch exception
		try { 
			//Create an array of stored information
			List<GuHelp> guHelpList = new ArrayList<GuHelp>();
			//Create a database connection
			Connection conn = this.getConnection();
			Statement stmt =  conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			//Get information in a loop
			while(rs.next())
			{
				GuHelp guHelp = new GuHelp();
				guHelp.setId(rs.getInt("id"));
				guHelp.setHelpinfo(rs.getString("helpinfo"));
				guHelpList.add(guHelp);
				
			}
			//close connection
			rs.close(); 
			stmt.close();
			conn.close();
			return guHelpList;
			
		}
		//Throw an exception
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}

	
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		GuHelpDB guHelpDB = new GuHelpDB();
		String sql = "select * from ghelp";
		List<GuHelp> list = guHelpDB.searchGuHelp(sql, 1, 10);

	}
	
	

}
