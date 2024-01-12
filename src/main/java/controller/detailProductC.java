package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;

import java.io.IOException;

import dao.Dao;

@WebServlet(urlPatterns = "/productDetail")
public class detailProductC extends HttpServlet {
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idp = request.getParameter("idp");
		Product pr = new Dao().getProuductById(idp);
		request.setAttribute("pr", pr);
		RequestDispatcher dispath = request.getRequestDispatcher("detailProduct.jsp");
		dispath.forward(request, response);
	}

}
