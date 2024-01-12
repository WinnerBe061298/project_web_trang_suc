package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import dao.Dao;
@WebServlet(urlPatterns = "/admin")
public class adminHome extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		String username = (String)session.getAttribute("username");
        if (new Dao().getUserByUsername(username).getRole() != 1) {
			response.sendRedirect("index.jsp");
		}else {
			int countUser = new Dao().CountUser("user", "id");
			int CountProduct = new Dao().CountUser("product", "id");
			int CountOrder = new Dao().CountUser("`order`", "order_id");
			request.setAttribute("countUser", countUser);
			request.setAttribute("CountProduct", CountProduct);
			request.setAttribute("CountOrder", CountOrder);
			RequestDispatcher dispath = request.getRequestDispatcher("admin/admin.jsp");
			dispath.forward(request, response);
			
		}
	}
}
