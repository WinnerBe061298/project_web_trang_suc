<%@page import="dao.Dao" %>
    <%@page import="model.Category" %>
        <%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>


    <html>

    <head>
        <link rel="stylesheet" href="css/header.css">
        <%@include file="allcss.jsp" %>
    </head>

    <body>
        <div class="header container">
            <div class="row">
                <div class="hd-top d-flex justify-content-between my-1">
                    <div class="hd-top-l">
                        <a href="#" class="text-dark text-decoration-none me-2"><i
                                class="fa-regular fa-building text-danger"></i> Về
                            trang sức Toji</a>
                        <a href="" class="text-dark text-decoration-none "><i
                                class="fa-solid fa-phone text-danger"></i> 0392322055</a>
                    </div>
                    <div class="hd-top-r">
                        <div style="display: inline-block; " class="acount">
                        <% String username = (String) session.getAttribute("username");%>
                            	<% if(username != null){ %>
                            	<a href="#" class="text-dark text-decoration-none ">
                                <i class="fa-regular fa-user text-danger"></i>${username}</a>
                                <ul class="menu-account">
                                <li><a href="managerorder" class="btn">Quản lí Đơn Hàng</a></li>
                              
                                <li><a href="logout" class="btn">Đăng Xuất</a>
                              
                              
                            </ul>
                                <%}else{ %>
                            <a href="#" class="text-dark text-decoration-none ">
                                <i class="fa-regular fa-user text-danger"></i>Tài khoản</a>
                            <ul class="menu-account">
                            	
                                <li><a href="login" class="btn">Đăng nhập</a></li>
                                <li><a href="register" class="btn">Đăng ký </a></li>
                              
                            </ul>
                              <% } %>
                        </div>

                        <a href="cart.jsp" class="text-dark text-decoration-none">
                            <i class="fa-solid fa-cart-shopping text-danger"></i> Giỏ
                            hàng</a>
                    </div>

                </div>
            </div>
            <div class="row logo-t">
                <div class="logo text-center border-bottom pb-2">
                    <a href="index.jsp"><img src="asesst/logo-t.png" alt=""></a>
                </div>
                <form action="search" class="fsearch" method="get">
                                <input name="key" type="text" placeholder="Tìm kiếm sản phẩm"
                                    class="valid input px-2 py-2" required="true" id="AutoComplete">
                                <button class="btn" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
                            </form>
            </div>
            <div class="main-menu" id="main-menu">
                <ul>
                    <li><a href="">Bộ Sưu Tập</a>
                        <ul class="sub-menu">
                            <div class="sub-content container">
                                <div class="sub-left">
                                    							<% 
                                List<Category> pas = new Dao().getAllCategory();
                                    for(Category s:pas){%>
                                    <li><a href="product?id=<%=s.getId()%>">
                                            <%=s.getName()%>
                                        </a></li>
                                    <%}%>
                                </div>
                                <div class="sub-right">

                                </div>
                            </div>
                        </ul>
                    </li>
                    <!-- <li><a href="">Kim CƯơng Viên</a>
                    	 <ul class="sub-menu">
                            <div class="sub-content">
                                <div class="sub-left">
                                    
                                             <div class="item-sbmn">
                                                 <p>K&#237;nh thước</p>
                                                     <div class="lstsbmn">
                                                             <a href="" class="" title="7.0 ly - 7.9 ly"><span>7.0 ly - 7.9 ly</span></a>
                                                             <a href="" class="" title="Tr&amp;#234;n 8 ly"><span>Trên 8 ly</span></a>
                                                     </div>
                                             </div>
                                             <div class="item-sbmn">
                                                 <p>Mức gi&#225;</p>
                                                     <div class="lstsbmn">
                                                             <a href="" class="" title="D&#x1B0;&#x1EDB;i 20 tri&#x1EC7;u"><span>Dưới 20 triệu</span></a>
                                                             <a href="" class="" title="20 tri&#x1EC7;u - 50 tri&#x1EC7;u"><span>20 triệu - 50 triệu</span></a>
                                                             <a href="" class="" title="50 tri&#x1EC7;u - 200 tri&#x1EC7;u"><span>50 triệu - 200 triệu</span></a>
                                                             <a href="" class="" title="200 tri&#x1EC7;u - 400 tri&#x1EC7;u"><span>200 triệu - 400 triệu</span></a>
                                                             <a href="" class="" title="400 tri&#x1EC7;u - 1 t&#x1EF7;"><span>400 triệu - 1 tỷ</span></a>
                                                             <a href="" class="" title="T&#x1EEB; 1 t&#x1EF7; tr&#x1EDF; l&amp;#234;n"><span>Từ 1 tỷ trở lên</span></a>
                                                     </div>
                                                        
                                    
                                </div>
                                <div class="sub-right">

                                </div>
                            </div>
                        </ul>
                    </li> -->
							<% List<Category> pa = new Dao().getAllCategory();
                                    for(Category s:pa){%>
                                    <li><a href="product?id=<%=s.getId()%>">
                                            <%=s.getName()%>
                                        </a></li>
                                    <%}%>
                </ul>
            </div>
        </div>
    </body>
		
    </html>