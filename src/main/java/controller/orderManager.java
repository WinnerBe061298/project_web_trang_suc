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
@WebServlet(urlPatterns = "/managerorder")
public class orderManager extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Integer idUser = (Integer)  session.getAttribute("id");
		
		List<Order> list = new Dao().getOrderbyuser(Integer.toString(idUser));
		req.setAttribute("listorder", list);
		
		RequestDispatcher dispath = req.getRequestDispatcher("ordermanager.jsp");
		dispath.forward(req, resp);
	}
}
