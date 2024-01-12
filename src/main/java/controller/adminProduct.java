package controller;

import dao.Dao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;
import java.util.List;

import model.Category;
import model.Product;

@WebServlet(urlPatterns = "/adminproduct")
@MultipartConfig(
		  fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
		  maxFileSize = 1024 * 1024 * 10,      // 10 MB
		  maxRequestSize = 1024 * 1024 * 100   // 100 MB
		)
public class adminProduct extends HttpServlet {

  protected void doPost(
    HttpServletRequest request,
    HttpServletResponse response
  ) throws ServletException, IOException {
	    String action = request.getParameter("action");
	    System.out.println(action);
	    switch (action) {
	      case "add":
	        {
	        	insertProduct(request,response);
	          break;
	        }
	      case "delete":
	    	  deleteProduct(request,response);
	    	  break;
	      default:
	        throw new IllegalArgumentException("Unexpected value: ");
	    }
  }

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, IOException {
		HttpSession session = req.getSession();
		String username = (String)session.getAttribute("username");
      if (new Dao().getUserByUsername(username).getRole() != 1) {
			resp.sendRedirect("index.jsp");
		}else {
    showProduct(req, resp);}
  }

  private void insertProduct(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, IOException {
    String name = req.getParameter("name");
    String desc = req.getParameter("desc");

    int idCategory = Integer.parseInt(req.getParameter("idCategory"));
    int price = Integer.parseInt(req.getParameter("price"));
    int sale_of = Integer.parseInt(req.getParameter("sale_of"));
    Part path = req.getPart("img");
    String fileName = path.getSubmittedFileName();
    InputStream fileContent = path.getInputStream();
    System.out.println(fileName);
    byte[] fileBytes = fileContent.readAllBytes();
    String base64String = Base64.getEncoder().encodeToString(fileBytes);;
    Product p = new Product(1, name, desc,"data:image/jpeg;base64,"+ base64String, idCategory, price, sale_of);
    new Dao().InsertProduct(p);
    resp.sendRedirect("adminproduct");
  }
  private void deleteProduct(HttpServletRequest req, HttpServletResponse resp)
		    throws ServletException, IOException {
	  String idp = req.getParameter("idp");
	  new Dao().deleteProduct(idp);
	  resp.sendRedirect("adminproduct");
  }
  private void showProduct(
    HttpServletRequest request,
    HttpServletResponse response
  ) throws ServletException, IOException {
    List<Product> listProduct = new Dao().getAllProduct();
    request.setAttribute("listproduct", listProduct);
    RequestDispatcher dispath = request.getRequestDispatcher(
      "admin/productAdmin.jsp"
    );
    dispath.forward(request, response);
  }
}
