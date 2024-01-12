package controller;

import java.io.IOException;
import java.util.List;

import dao.Dao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.account;
@WebServlet(urlPatterns = "/adminuser")
public class adminUser extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String username = (String)session.getAttribute("username");
        if (new Dao().getUserByUsername(username).getRole() != 1) {
			resp.sendRedirect("index.jsp");
		}else {
		
	    List<account> listProduct = new Dao().getAllUser();
	    req.setAttribute("listproduct", listProduct);
		RequestDispatcher dispath = req.getRequestDispatcher("admin/AdminUser.jsp" );
	    dispath.forward(req, resp);}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
	    System.out.println(action);
	    switch (action) {
	      case "add":
	        {
	        register(req, resp);
	        break;
	        }
	      case "delete":
	    	  delete(req, resp);
	    	  break;
	      default:
	        throw new IllegalArgumentException("Unexpected value: ");
	    }
	}
	private void register(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    String username = req.getParameter("username");
	    String email = req.getParameter("email");
	    String password = req.getParameter("pass");
	    account acc = new account(1,username, email, password,0);
	    new Dao().register(acc);
	    resp.sendRedirect("adminuser");
	}
	private void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		  String idp = req.getParameter("idp");
		  new Dao().deleteUser(idp);
		  resp.sendRedirect("adminuser");
	
	}
}
