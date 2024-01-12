package controller;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.Product;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import dao.Dao;

@WebServlet(urlPatterns = "/Cart")
public class AddtoCart extends HttpServlet {
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.sendRedirect("cart.jsp");
	
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idp = request.getParameter("idp");
		String number = request.getParameter("number");
		Product pr = new Dao().getProuductById(idp);
		
		
		 HttpSession session = request.getSession();
		 
		 List<Cart> cart = (List<Cart>) session.getAttribute("cart");
	        if (cart == null) {
	            cart = new ArrayList<>();
	            session.setAttribute("cart", cart);
	        }
	        
	        
	       if(idp != null) {
	    	 addItemToCart(cart, pr, idp,Integer.parseInt(number));
	        response.sendRedirect("cart.jsp");
	       }

	      
	        
	        String action = request.getParameter("action");
	        if ("Xóa".equals(action)) {
	           
	            String productId = request.getParameter("productId");
	            
	           
	            removeProductFromCart(productId, request);

	            
	            response.sendRedirect("cart.jsp");
	        }
	        String subtract = request.getParameter("subtract");
	        if ("-".equals(subtract)) {
	        	 String productId = request.getParameter("productId");
	        	 Product pru = new Dao().getProuductById(productId);
		           
	        	 subtractItemToCart(cart, pru, productId);
	            
	            response.sendRedirect("cart.jsp");
	        }
	        String add = request.getParameter("add");
	        if ("+".equals(add)) {
	        	 String productId = request.getParameter("productId");
	        	 Product pru = new Dao().getProuductById(productId);
		           
	        	 addItemToCart(cart, pru, productId,1);
	            
	            response.sendRedirect("cart.jsp");
	        }
	        
	        
	        	

		
	}
	   private void addItemToCart(List<Cart> cart, Product product, String productId ,int amount) {
	        int ipd = Integer.parseInt(productId);
	        boolean productExists = false;

	        for (Cart item : cart) {
	            if (item.getId() == ipd) {
	                item.setAmount(item.getAmount() + amount);
	                productExists = true;
	                break;
	            }
	        }

	        if (!productExists) {
	            double price = product.getPrice() - (product.getPrice() * product.getSale_of() / 100);
	            Cart newItem = new Cart(ipd, product.getName(), amount, price, product.getImg());
	            cart.add(newItem);
	        }
	    }
	   private void subtractItemToCart(List<Cart> cart, Product product, String productId) {
	        int ipd = Integer.parseInt(productId);
	        boolean productExists = false;

	        for (Cart item : cart) {
	        	if(item.getAmount()==1) {
	        		item.setAmount(item.getAmount() - 0);
	        	}else if
	            (item.getId() == ipd) {
	                item.setAmount(item.getAmount() - 1);
	                productExists = true;
	                break;
	            }
	        }

	       
	    }
	private void removeProductFromCart(String productId, HttpServletRequest request)  {
        HttpSession session = request.getSession();
        List<Cart> cart = (List<Cart>) session.getAttribute("cart");

        if (cart != null) {
            
            for (Iterator<Cart> iterator = cart.iterator(); iterator.hasNext();) {
                Cart cartItem = iterator.next();
                if (String.valueOf(cartItem.getId()).equals(productId)) {
                    iterator.remove();
                    
                    
                    break; 
                }
            }
        }
    }

}
