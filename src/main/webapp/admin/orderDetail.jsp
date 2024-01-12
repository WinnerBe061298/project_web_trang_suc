
        <%@page import="model.OrderDetail"%>
<%@page import="model.Product"%>
<%@page import="dao.Dao"%>
<%@page import="model.Category"%>

<%@page import="java.util.List" %>
            <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
                <!DOCTYPE html>
                <html>

                <head>
                    <meta charset="UTF-8">
                    <title>Chi tiết đơn hàng </title>
                </head>

                <body>
                    <%@include file="header.jsp" %>
                        <div id="layoutSidenav">
                            <%@include file="sidebar.jsp" %>
                                <main>
                                <div class="card mb-4">
                                                <div class="card-header">
                                                    <i class="fas fa-table me-1"></i>
                                                    Tất cả sản phẩm
                                                </div>
                                                <div class="card-body">
                                                    <table id="datatablesSimple">
                                                        <thead>
                                                            <tr>
                                                                <th>thumbnail</th>
                                                                <th>Tên</th>
                                                                <th>Đơn giá</th>
                                                                <th>Số lượng</th>
                                                                <th>Tổng tiền</th>
                                                            </tr>
                                                        </thead>
                                                        <tfoot>
                                                            <tr>
                                                                <th>thumbnail</th>
                                                                <th>Tên</th>
                                                                <th>Đơn giá</th>
                                                                <th>Số lượng</th>
                                                                <th>Tổng tiền</th>
                                                            </tr>
                                                        </tfoot>
                                                        <tbody>
                                                            <% List<OrderDetail> listproduct = (List<OrderDetail>
                                                                    )request.getAttribute("listod");
                                                                    for(OrderDetail s:listproduct){
                                                                    Product p =new Dao().getProuductById(Integer.toString(s.getIdp()));
                                                                    %>
                                                                    <tr>
                                                                        <td><img src="<%= p.getImg() %>"
                                                                                style="width: 100px;height: auto" />
                                                                        </td>
                                                                        <td>
                                                                            <%= p.getName() %>
                                                                        </td>
                                                                        <td>
                                                                            <%= s.getPrice() %>VND
                                                                        </td>
                                                                        <td>
                                                                        
                                                                            <%= s.getQuantity() %>
                                                                        </td>
                                                                        <td>
                                                                            <%= s.getPrice()*s.getQuantity()%> VND
                                                                        </td>
                                                                    </tr>
                                                                    <%}%>
                                                        </tbody>
                                                    </table>
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
                        
                </body>

                </html>