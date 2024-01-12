package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.Order;
import model.OrderDetail;
import model.account;

import java.io.IOException;
import java.util.List;

import dao.Dao;

/**
 * Servlet implementation class order
 */
@WebServlet("/orderC")
public class order extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		List<Cart> cart = (List<Cart>) session.getAttribute("cart");
		
		String username = (String)session.getAttribute("username");
        if(cart != null) {
        	if (cart.size() > 0 && username != null) {
    			response.sendRedirect("payment.jsp");
    		}else {
    			response.sendRedirect("index.jsp");
    		}
    			
    		
        }else {
			response.sendRedirect("index.jsp");
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		Integer idUser = (Integer)  session.getAttribute("id");
		String total = request.getParameter("total");
		System.out.println(total);
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		
		String selectedCity = request.getParameter("city");
        String selectedDistrict = request.getParameter("district");
        String selectedWard = request.getParameter("ward");
        String house = request.getParameter("house");
        String note = request.getParameter("note");
        String Methods = request.getParameter("payment_method");
        String method = "";
        switch(Methods) {
        case "COD":
        	method = "Thanh Toán Khi Nhận Hàng";
        	break;
        case "Bank":
        	method = "Chuyển Khoản";
        	break;
        }
        
        
        long totalAmount = Long.parseLong(total);
        

        String address = house+","+selectedWard + "," + selectedDistrict +","+ selectedCity;
        
        Order ord = new Order(1,idUser,name,phone,address,email,totalAmount,note);
        Dao odao = new Dao();
        
        int orderid = odao.InsertOrderdathang(ord);
		
        List<Cart> cartItems = (List<Cart>) session.getAttribute("cart");
        for (Cart cartItem : cartItems) {
        	int proid = cartItem.getId();
        	int quantity = cartItem.getAmount();
        	int price = (int) cartItem.getPrice();
        	OrderDetail orderdetail = new OrderDetail(1,orderid,proid,quantity,price,method,"");
        	odao.InsertOrderDetaildathang(orderdetail);
    
        	
        }
        session.removeAttribute("cart");
        response.sendRedirect("managerorder");
	}
	

}
