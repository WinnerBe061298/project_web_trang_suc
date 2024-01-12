package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.Product;

import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;

import dao.Dao;
@MultipartConfig(
		  fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
		  maxFileSize = 1024 * 1024 * 10,      // 10 MB
		  maxRequestSize = 1024 * 1024 * 100   // 100 MB
		)
@WebServlet(urlPatterns = "/editproduct")
public class editProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id= request.getParameter("id");
		Product tpm = new Dao().getProuductById(id);
		request.setAttribute("ptmp", tpm);
		RequestDispatcher dispath = request.getRequestDispatcher("admin/editProduct.jsp" );
	    dispath.forward(request, response);
	}

@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
	    String desc = req.getParameter("desc");
	    String id= req.getParameter("idp");
		Product tpm = new Dao().getProuductById(id);
	    String base64String = tpm.getImg();
	    int idCategory = Integer.parseInt(req.getParameter("idCategory"));
	    int price = Integer.parseInt(req.getParameter("price"));
	    int sale_of = Integer.parseInt(req.getParameter("sale_of"));
	    Part path = req.getPart("img");
	    String fileName = path.getSubmittedFileName();
	    System.out.println(fileName);
	    if (!fileName.isEmpty()) {
	    	System.out.println("file trong");
		    InputStream fileContent = path.getInputStream();
		    byte[] fileBytes = fileContent.readAllBytes();
		    base64String = "data:image/jpeg;base64,"+ Base64.getEncoder().encodeToString(fileBytes);;
		}
	    
	    Product p = new Product(Integer.parseInt(id), name, desc, base64String, idCategory, price, sale_of);
	    new Dao().editProduct(p);
	    resp.sendRedirect("adminproduct");
	}

}
