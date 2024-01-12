package controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;
import java.util.List;

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
import model.Category;

@WebServlet(urlPatterns = "/admincategory")
@MultipartConfig(
		  fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
		  maxFileSize = 1024 * 1024 * 10,      // 10 MB
		  maxRequestSize = 1024 * 1024 * 100   // 100 MB
		)
public class CategoryAdmin extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String username = (String)session.getAttribute("username");
        if (new Dao().getUserByUsername(username).getRole() != 1) {
			resp.sendRedirect("index.jsp");
		}else {
		
		List<Category> list = new Dao().getAllCategory();
		req.setAttribute("listCate", list);
	    RequestDispatcher dispath = req.getRequestDispatcher("admin/CategoryAdmin.jsp");
	    dispath.forward(req, resp);}
	}
	@Override
	  protected void doPost(
			    HttpServletRequest request,
			    HttpServletResponse response
			  ) throws ServletException, IOException {
				    String action = request.getParameter("action");
				    System.out.println(action);
				    switch (action) {
				      case "add":
				        {
				        	insertCategory(request, response);
				          break;
				        }
				      case "delete":
				    	  deleteCategory(request, response);
				    	  break;
				      default:
				        throw new IllegalArgumentException("Unexpected value: ");
				    }
			  }
	  private void insertCategory(HttpServletRequest req, HttpServletResponse resp)
			    throws ServletException, IOException {
			    String name = req.getParameter("name");
			    String desc = req.getParameter("desc");
			    Part path = req.getPart("img");
			    String fileName = path.getSubmittedFileName();
			    InputStream fileContent = path.getInputStream();
			    System.out.println(fileName);
			    byte[] fileBytes = fileContent.readAllBytes();
			    String base64String ="data:image/jpeg;base64,"+ Base64.getEncoder().encodeToString(fileBytes);;
			    Category ca = new Category(1,name,desc,base64String);
			    new Dao().InsertCategory(ca);
			    resp.sendRedirect("admincategory");
			  }
	  private void deleteCategory(HttpServletRequest req, HttpServletResponse resp)
			    throws ServletException, IOException {
		  String idp = req.getParameter("idc");
		  new Dao().deleteCategory(idp);
		  resp.sendRedirect("admincategory");
	  }
}
