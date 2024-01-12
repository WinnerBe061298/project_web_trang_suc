package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;

import java.io.IOException;
import java.util.List;

import dao.Dao;

@WebServlet(urlPatterns = "/search")
public class serachController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String key = request.getParameter("key");
		request.setAttribute("key", key);
		List<Product> listProduct = new Dao().searchProduct(key);
		request.setAttribute("size", listProduct.size());
		request.setAttribute("sp", listProduct);
		RequestDispatcher dispath = request.getRequestDispatcher("search.jsp");
		dispath.forward(request, response);
	}



}
