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
import model.Order;
@WebServlet(urlPatterns = "/orderAdmin")
public class adminOrder extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String username = (String)session.getAttribute("username");
        if (new Dao().getUserByUsername(username).getRole() != 1) {
			resp.sendRedirect("index.jsp");
		}else {
		    List<Order> list = new Dao().getAllOrder();
		    req.setAttribute("list", list);
		RequestDispatcher dispath = req.getRequestDispatcher("admin/orderAdmin.jsp");
		dispath.forward(req, resp);
	}}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		delete(req, resp);
	}
	
	private void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		  String idp = req.getParameter("idp");
		  new Dao().deleteOrder(idp);
		  resp.sendRedirect("orderAdmin");}
}
