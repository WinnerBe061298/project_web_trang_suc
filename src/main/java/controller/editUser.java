package controller;

import java.io.IOException;
import dao.Dao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.account;
@WebServlet(urlPatterns = "/edituser")
public class editUser  extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id= req.getParameter("id");
		account tpm = new Dao().getUserById(id);
		req.setAttribute("ptmp", tpm);
		RequestDispatcher dispath = req.getRequestDispatcher("admin/editUser.jsp" );
	    dispath.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
	    String pass = req.getParameter("pass");
	    String email = req.getParameter("email");
	    String role = req.getParameter("role");
	    String id= req.getParameter("idp");
	    account acc = new account(Integer.parseInt(id),username,pass,email,Integer.parseInt(role));
	    
	    new Dao().editUser(acc);
	    resp.sendRedirect("adminuser");
	}
}
