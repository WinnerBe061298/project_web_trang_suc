<%@page import="model.Order" %>
    <%@page import="dao.Dao" %>
        <%@page import="java.util.List" %>
            <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
                <!DOCTYPE html>
                <html>

                <head>
                    <meta charset="UTF-8">
                    <title>Order Admin</title>
                    <link rel="Quản lý sản phẩm" href="admin/css/admin.css">
                </head>

                <body>
                    <%@include file="header.jsp" %>
                        <div id="layoutSidenav">
                            <%@include file="sidebar.jsp" %>
                                <main>
                                    <div class="container-fluid px-4">
                                        <h1 class="mt-4">Quản lý Đơn hàng</h1>
                                        <div class="card mb-4">
                                            <div class="card-header">
                                                <i class="fas fa-table me-1"></i>
                                                Tất cả Đơn hàng
                                            </div>
                                            <div class="card-body">
                                                <table id="datatablesSimple" class="table">
                                                    <thead>
                                                        <tr>
                                                            <th>Tên khách hàng</th>
                                                            <th>sdt</th>
                                                            <th>email</th>
                                                            <th>Tổng tiền</th>
                                                            <th>Địa chỉ giao</th>
                                                            <th>note</th>
                                                            <th>Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tfoot>
                                                        <tr>
                                                            <th>Tên khách hàng</th>
                                                            <th>sdt</th>
                                                            <th>email</th>
                                                            <th>Tổng tiền</th>
                                                            <th>Địa chỉ giao</th>
                                                            <th>note</th>
                                                            <th>Action</th>
                                                        </tr>
                                                    </tfoot>
                                                    <tbody>
                                                        <% List<Order> listo = (List<Order>
                                                                )request.getAttribute("list");
                                                                for(Order s:listo){%>
                                                                <tr>
                                                                    <td>
                                                                        <%= s.getName() %>
                                                                    </td>
                                                                    <td>
                                                                        <%= s.getPhone() %>
                                                                    </td>
                                                                    <td>

                                                                        <%= s.getEmail() %>
                                                                    </td>
                                                                    <td>
                                                                        <%= s.getTotal()%>
                                                                    </td>
                                                                    <td>
                                                                        <%= s.getAddRess()%>
                                                                    </td>
                                                                    </td>
                                                                    <td>
                                                                        <%= s.getNote()%>
                                                                    </td>
                                                                    <td>
                                                                        <a href="orderdetailAdmin?id=<%= s.getId()%>"
                                                                            class="btn btn-warning">Xem</a>
                                                                            
    	                                                                   <form action="orderAdmin" method="post">
                                                                                
                                                                                <input type="text" name="idp" id="idp"
                                                                                    value="<%= s.getId() %>"
                                                                                    style="display: none" />
                                                                                <button class="btn btn-danger"
                                                                                    type="submit">Xóa</button>
                                                                            </form>
                                                                    </td>

                                                                </tr>
                                                                <%}%>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </main>
                                <footer class="py-4 bg-light mt-auto">
                                    <div class="container-fluid px-4">
                                        <div class="d-flex align-items-center justify-content-between small">
                                            <div class="text-muted">Copyright &copy; Your Website 2023</div>
                                            <div>
                                                <a href="#">Privacy Policy</a>
                                                &middot;
                                                <a href="#">Terms &amp; Conditions</a>
                                            </div>
                                        </div>
                                    </div>
                                </footer>
                        </div>
                        </div>


                </body>

                </html>