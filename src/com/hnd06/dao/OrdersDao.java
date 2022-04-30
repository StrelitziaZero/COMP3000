package com.hnd06.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.hnd06.entity.AllOrder;
import com.hnd06.entity.Book;
import com.hnd06.entity.Orders;
import com.hnd06.entity.ShopUser;

public class OrdersDao extends Dao {
	
	public Orders  getOrders(Integer id)
	{
		try
		{
			Orders orders = null;
			String sql="select * from orders where id="+id;
			Connection conn = this.getConnection();
			Statement stmt =  conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				orders = new Orders();
				orders.setId(rs.getInt("id"));
				orders.setIsPayoff(rs.getInt("isPayoff"));
				orders.setOrderid(rs.getString("orderid"));
				orders.setSubmitTime(rs.getDate("SubmitTime"));
				orders.setTotalPrice(rs.getDouble("totalPrice"));
				Integer userId = rs.getInt("userId");
				if(userId!=null)
				{
					 ShopUser shopUser = new ShopUserDao().getShopUser(userId);
					 orders.setShopUser(shopUser);					
				} 
				 sql="select * from allorder where orderid='"+orders.getOrderid()+"'";
				 Connection conn1 = this.getConnection();
					Statement stmt1 =  conn1.createStatement();
					ResultSet rs1 = stmt1.executeQuery(sql);
					while(rs1.next())
					{
						AllOrder allOrder=new AllOrder();
						allOrder.setId(rs1.getInt("id"));
						allOrder.setAmount(rs1.getDouble("amount"));
						allOrder.setOrders(orders);
						Integer bookid = rs1.getInt("bookNo");
						Book book = new BookDao().getBook(bookid);
						allOrder.setBook(book);
						 
						orders.getOrderList().add(allOrder);
					}
					rs1.close();
					stmt1.close();
					conn1.close();
			}
			
			rs.close(); 
			stmt.close();
			conn.close();
			return orders;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public List<Orders> searchOrders(String sql, int pageNo, int pageSize)
	{
		String limit = " limit " + (pageNo -1 )* pageSize+"," + pageNo* pageSize;
		sql += limit;
		System.out.println(sql);
		try {
			 
			List<Orders> ordersList = new ArrayList<Orders>();
			Connection conn = this.getConnection();
			Statement stmt =  conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				Orders orders = new Orders();
				orders.setId(rs.getInt("id"));
				orders.setIsPayoff(rs.getInt("isPayoff"));
				orders.setOrderid(rs.getString("orderid"));
				orders.setSubmitTime(rs.getDate("SubmitTime"));
				orders.setTotalPrice(rs.getDouble("totalPrice"));
				Integer userId = rs.getInt("userId");
				if(userId!=null)
				{
					 ShopUser shopUser = new ShopUserDao().getShopUser(userId);
					 orders.setShopUser(shopUser);					
				}
				
				ordersList.add(orders);
				
			}
			
			rs.close(); 
			stmt.close();
			conn.close();
			return ordersList;
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public void saveOrders(Orders orders)
	{
		try {
			String sql="";
			Connection conn = this.getConnection();
			conn.setAutoCommit(false);
			Statement stmt =  conn.createStatement();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			if(orders.getId()==null)
			{
				sql = "insert into orders (userid,orderid,totalPrice,isPayoff,isSales,submitTime) values ("+orders.getShopUser().getId()+",'"+orders.getOrderid()+"',"+orders.getTotalPrice()+","+orders.getIsPayoff()+","+orders.getIsSales()+",'"+sf.format(orders.getSubmitTime())+"')";
				System.out.println(sql);
				stmt.executeUpdate(sql);
 
				for(AllOrder orderDetail:orders.getOrderList())
				{
					sql = "insert into allorder (orderid,bookno,amount) values ('"+orders.getOrderid()+"',"+orderDetail.getBook().getId()+","+orderDetail.getAmount()+")";
					System.out.println(sql);
					stmt.executeUpdate(sql);
				}
			}
			else
			{
				//sql="update orders set buyNumber="+orders.getBuyNumber()+", buyPrice="+orders.getBuyPrice()+",buyAmt="+orders.getBuyAmt()+" where id="+orders.getId();
			}
			
			
			
			conn.commit();
			stmt.close();
			conn.close();			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
