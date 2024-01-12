<%@page import="model.account"%>
    <%@page import="dao.Dao" %>
        <%@page import="model.Product" %>
            <%@page import="java.util.List" %>
                <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
                    <!DOCTYPE html>
                    <html>

                    <head>
                        <meta charset="UTF-8">
                        <title>Quản lý người dùng</title>
                        <link rel="Quản lý sản phẩm" href="admin/css/admin.css">
                    </head>

                    <body>
                        <%@include file="header.jsp" %>
                            <div id="layoutSidenav">
                                <%@include file="sidebar.jsp" %>
                                    <main>

                                        <div class="container-fluid px-4">
                                            <h1 class="mt-4">Quản lý người dùng</h1>
                                            <form class="d-flex w-50 mb-3 gap-1 flex-column" action="adminuser"
                                                method="post" >
                                                <span>Username</span>
                                                <input class="form-control " required type="text" name="username" id="username">
                                                <span>email</span>
                                                <input class="form-control " required type="text" name="email" id="email">
                                                <span>PassWord</span>
                                                <input class="form-control "  required type="text" name="pass" id="pass">
                                                <input type="text" name="action" id="action" value="add" style="display: none" />
                                                <input type="text" name="a" id="a" value="add" style="display: none" />
                                                <button type="submit" class="btn btn-success w-50">Lưu</button>
                                            </form>
                                            <div class="card mb-4">
                                                <div class="card-header">
                                                    <i class="fas fa-table me-1"></i>
                                                    Tất cả sản phẩm
                                                </div>
                                                <div class="card-body">
                                                    <table id="datatablesSimple">
                                                        <thead>
                                                            <tr>
                                                                <th>username</th>
                                                                <th>pass</th>
                                                                <th>email</th>
                                                                <th>role</th>
                                                                <th>Action</th>
                                                            </tr>
                                                        </thead>
                                                        <tfoot>
                                                            <tr>
                                                                <th>username</th>
                                                                <th>pass</th>
                                                                <th>email</th>
                                                                <th>role</th>
                                                                <th>Action</th>
                                                            </tr>
                                                        </tfoot>
                                                        <tbody>
                                                            <% List<account> listproduct = (List<account>
                                                                    )request.getAttribute("listproduct");
                                                                    for(account s:listproduct){%>
                                                                    <tr>
                                                                        <td>
                                                                            <%= s.getUsername() %>
                                                                        </td>
                                                                        <td>
                                                                            <%= s.getPassword() %>
                                                                        </td>
                                                                        <td>
                                                                            <%= s.getEmail() %>
                                                                        </td>
                                                                        <td>
                                                                            <%= s.getRole() %>
                                                                        </td>
                                                                        <td>
                                                                                <a href="edituser?id=<%= s.getId()%>" class="btn btn-warning"
                                                                                    >Sửa</a>
                                                                            <form action="adminuser" method="post">
                                                                                <input type="text" name="action"
                                                                                    id="action" value="delete"
                                                                                    style="display: none" />
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