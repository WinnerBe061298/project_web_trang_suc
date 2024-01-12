package controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;

import dao.Dao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.Category;

@MultipartConfig(
		  fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
		  maxFileSize = 1024 * 1024 * 10,      // 10 MB
		  maxRequestSize = 1024 * 1024 * 100   // 100 MB
		)
@WebServlet(urlPatterns = "/editcategory")
public class editCategory extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id= request.getParameter("id");
		Category tpm = new Dao().getCategoryById(id);
		request.setAttribute("ptmp", tpm);
		RequestDispatcher dispath = request.getRequestDispatcher("admin/editCategory.jsp" );
	    dispath.forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
	    String desc = req.getParameter("desc");
	    Part path = req.getPart("img");
	    String id= req.getParameter("idp");
		Category tpm = new Dao().getCategoryById(id);
	    String base64String = tpm.getBanner ();
	    
	    String fileName = path.getSubmittedFileName();
	    System.out.println(fileName);
	    if (!fileName.isEmpty()) {
	    	System.out.println("file trong");
		    InputStream fileContent = path.getInputStream();
		    byte[] fileBytes = fileContent.readAllBytes();
		    base64String = "data:image/jpeg;base64,"+ Base64.getEncoder().encodeToString(fileBytes);;
		}	    
	    Category ca = new Category(Integer.parseInt(id),name,desc,base64String);
	    new Dao().editCategory(ca);
	    resp.sendRedirect("admincategory");
	}
	
}
