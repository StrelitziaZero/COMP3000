package com.hnd06.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList; 
import java.util.List;

import com.hnd06.entity.Book;
import com.hnd06.entity.BuyCart;
import com.hnd06.entity.ShopUser;
 

public class BuyCartDao extends Dao {
	
	
	public  BuyCart getBuyCart(Integer id)
	{
		try {
		BuyCart buyCart = null;
		String sql="select * from buy_Cart where id="+id;
		Connection conn = this.getConnection();
		Statement stmt =  conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next())
		{ 
			buyCart = new BuyCart();
			buyCart.setId(rs.getInt("id"));
			buyCart.setBuyNumber(rs.getInt("buyNumber"));
			buyCart.setBuyPrice(rs.getDouble("BuyPrice"));
			buyCart.setBuyAmt(rs.getDouble("buyamt")); 
			Integer userid = rs.getInt("user_id");
			if(userid!=null)
			{
				 ShopUser shopUser = new ShopUserDao().getShopUser(userid);
				 buyCart.setShopUser(shopUser);
			}
			
			Integer bookid = rs.getInt("book_id");
			if(bookid!=null)
			{
				 Book book = new BookDao().getBook(bookid);
				 buyCart.setBook(book);
			}
			 
		}
		rs.close(); 
		stmt.close();
		conn.close();  
		return buyCart;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	public void saveBuyCart(BuyCart buyCart)
	{
		try {
			if(buyCart.getId()==null)
			{
				String sql="insert into buy_cart (book_id,user_id,buyNumber,buyPrice,buyAmt)";
				sql+=" values ("+buyCart.getBook().getId()+","+buyCart.getShopUser().getId()+",1,"+buyCart.getBuyPrice()+","+buyCart.getBook().getPrice()+")";
				System.out.println(sql);
				Connection conn = this.getConnection();
				Statement stmt =  conn.createStatement();
				stmt.executeUpdate(sql);
				stmt.close();
				conn.close();
				
			}
			else
			{
				
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public List<BuyCart> searchBuyCart(String sql, int pageNo, int pageSize)
	{
		//sql ="select * from buyCart";
		String limit = " limit " + (pageNo -1 )* pageSize+"," + pageNo* pageSize;
		sql += limit;
		System.out.println(sql);
		try {
			 
			List<BuyCart> buyCartList = new ArrayList<BuyCart>();
			Connection conn = this.getConnection();
			Statement stmt =  conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				BuyCart buyCart = new BuyCart();
				buyCart.setId(rs.getInt("id"));
				buyCart.setBuyNumber(rs.getInt("buyNumber"));
				buyCart.setBuyPrice(rs.getDouble("BuyPrice"));
				buyCart.setBuyAmt(rs.getDouble("buyamt")); 
				Integer userid = rs.getInt("user_id");
				if(userid!=null)
				{
					 ShopUser shopUser = new ShopUserDao().getShopUser(userid);
					 buyCart.setShopUser(shopUser);
				}
				
				Integer bookid = rs.getInt("book_id");
				if(bookid!=null)
				{
					 Book book = new BookDao().getBook(bookid);
					 buyCart.setBook(book);
				}
				
				buyCartList.add(buyCart);
				
			}
			
			rs.close(); 
			stmt.close();
			conn.close();
			return buyCartList;
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
	 

	}

}
