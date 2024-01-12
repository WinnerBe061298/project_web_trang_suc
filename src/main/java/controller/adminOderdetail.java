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
import model.OrderDetail;
@WebServlet(urlPatterns = "/orderdetailAdmin")
public class adminOderdetail extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String username = (String)session.getAttribute("username");
        if (new Dao().getUserByUsername(username).getRole() != 1) {
			resp.sendRedirect("index.jsp");
		}else {
			String id = req.getParameter("id");
		    List<OrderDetail> list = new Dao().getOrderDetailByIdo(id);
		    req.setAttribute("listod", list);
		RequestDispatcher dispath = req.getRequestDispatcher("admin/orderDetail.jsp");
		dispath.forward(req, resp);
	}}
}
