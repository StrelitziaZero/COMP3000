<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.hnd06.entity.Book,com.hnd06.entity.ShopUser,com.hnd06.entity.BuyCart,com.hnd06.dao.BookDao,com.hnd06.dao.BuyCartDao,java.util.List" %>
    
<%@ include file="/common/header.jsp" %>



<%

ShopUser shopUser =(ShopUser) session.getAttribute("user");
if(shopUser==null)
{
	response.sendRedirect("login.jsp");
	return;
}

String id = request.getParameter("id");


BuyCart buyCart = new BuyCart();
Book book = new BookDao().getBook(Integer.parseInt(id));
buyCart.setShopUser(shopUser); 
buyCart.setBook(book);

new BuyCartDao().saveBuyCart(buyCart);

response.sendRedirect("buycart.jsp");



%>




<%@ include file="/common/footer.jsp" %> 