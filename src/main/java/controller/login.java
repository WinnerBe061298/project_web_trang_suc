package controller;

import dao.Dao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.account;

import java.io.IOException;

@WebServlet(urlPatterns = "/loginuser")
public class login extends HttpServlet {

  protected void doGet(
    HttpServletRequest request,
    HttpServletResponse response
  ) throws ServletException, IOException {
    RequestDispatcher dispathcher = request.getRequestDispatcher("login.jsp");

    dispathcher.forward(request, response);
  }

  /**
   * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
   */
  protected void doPost(
    HttpServletRequest request,
    HttpServletResponse response
  ) throws ServletException, IOException {
    String username = request.getParameter("username");

    String password = request.getParameter("password");

    Dao cDao = new Dao();

    if (cDao.login(username, password) == false) {
      request.setAttribute("error", "tài khoản hoặc mật khẩu không chính xác");
      RequestDispatcher dispathcher = request.getRequestDispatcher("login.jsp");
      dispathcher.forward(request, response);
      System.out.println("sai");
    } else {
     account a = cDao.getUserByUsername(username);
     
      // Passwords match, proceed with registration
      HttpSession session = request.getSession();
      session.setAttribute("username", a.getUsername());
      session.setAttribute("id", a.getId());
      

      request.setAttribute("success", "Đăng Nhập Thành Công");
      if (a.getRole() == 1) {
        response.sendRedirect("admin");
       
      } else {
        response.sendRedirect("index.jsp");
      }
    }
  }
}
