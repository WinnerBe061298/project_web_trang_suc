package controller;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import dao.Dao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.account;

@WebServlet(urlPatterns = "/register")
public class registerController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispathcher = request.getRequestDispatcher("register.jsp");
		dispathcher.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String username = request.getParameter("username");
	    String email = request.getParameter("email");
	    String password = request.getParameter("password");
	    String repassword = request.getParameter("repassword");
	    Dao cDao = new Dao();
	    
	    
		if(!isUsernameValid(username)|| username.length()<5 || username.length() > 12 ) {
			request.setAttribute("error", "Tài khoản phải từ 5 đến 12 ký tự ");
	    	RequestDispatcher dispathcher = request.getRequestDispatcher("register.jsp");
	    	dispathcher.forward(request, response);
		}
	    else if (!isValidEmail(email)) {
	    	request.setAttribute("error", "email không đúng định dạng");
	    	RequestDispatcher dispathcher = request.getRequestDispatcher("register.jsp");
	    	dispathcher.forward(request, response);
        }
	    else if(password.length()<8) {
	    	request.setAttribute("error", "Mật Khẩu Phải 8 ký tự trở lên");
	    	RequestDispatcher dispathcher = request.getRequestDispatcher("register.jsp");
	    	dispathcher.forward(request, response);
	    }
	    else if (!password.equals(repassword)) {
	    	request.setAttribute("error", "Mật Khẩu Không Trùng Khớp");
	    	RequestDispatcher dispathcher = request.getRequestDispatcher("register.jsp");
	    	dispathcher.forward(request, response);
	    	
	    }else if(cDao.checkacc(username)==true) {
	    	request.setAttribute("error", "tài khoản đã tồn tại");
	    	RequestDispatcher dispathcher = request.getRequestDispatcher("register.jsp");
	    	dispathcher.forward(request, response);
	    }
	    	else {
	        // Passwords match, proceed with registration
	        account acc = new account(1,username, email, password,0);
	        Dao rDao = new Dao();
	        rDao.register(acc);
	        request.setAttribute("success", "Đăng Ký Thành Công");
	        RequestDispatcher dispathcher = request.getRequestDispatcher("register.jsp");
	    	dispathcher.forward(request, response);
	    }
	    
	    

	   
	}
	private boolean isValidEmail(String email) {
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
        Pattern pattern = Pattern.compile(emailRegex);
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }
	private boolean isUsernameValid(String username) {
        // Ensure that the username does not contain special characters
        String usernameRegex = "^[a-zA-Z0-9_]+$";
        Pattern pattern = Pattern.compile(usernameRegex);
        Matcher matcher = pattern.matcher(username);
        return matcher.matches();
    }
	

	


}
