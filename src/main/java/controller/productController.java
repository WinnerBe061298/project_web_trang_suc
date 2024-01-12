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
import model.Category;
import model.Product;

@WebServlet(urlPatterns = "/product")
public class productController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String idCategory = req.getParameter("id");
		Category category = new Dao().getCategoryById(idCategory);
		req.setAttribute("category", category);
		List<Product> listProduct = new Dao().getProductbyCategory(idCategory);
		req.setAttribute("listp", listProduct);
		RequestDispatcher dispathcher = req.getRequestDispatcher("product.jsp");
		dispathcher.forward(req, resp);
	}
       
    
}
