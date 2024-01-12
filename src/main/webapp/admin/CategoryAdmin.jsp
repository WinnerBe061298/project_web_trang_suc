<%@page import="java.text.NumberFormat.Style"%>
<%@page import="model.Category" %>
    <%@page import="java.util.List" %>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>Insert title here</title>
            </head>

            <body>
                <%@include file="header.jsp" %>
                    <div id="layoutSidenav">
                        <%@include file="sidebar.jsp" %>
                            <main>
                                <div class="container-fluid px-4">
                                    <h1 class="mt-4">Quản lý loại sản phẩm</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item active">product</li>
                                    </ol>
                                    <form class="d-flex w-50 mb-3 gap-1 flex-column" action="admincategory"
                                        method="post" enctype="multipart/form-data">
                                        <span>Tên</span>
                                        <input class="form-control " required type="text" name="name" id="name">
                                        <span>Thông tin chi tiết</span>
                                        <input class="form-control " required type="text" name="desc" id="desc">
                                        <div class="mb-3">
                                            <label for="formFileDisabled" class="form-label">banner</label>
                                            <input class="form-control" name="img" type="file" id="formFile">
                                        </div>
                                        <input type="text" name="action" id="action" value="add" style="display: none"  />
                                        <button type="submit" class="btn btn-success w-50">Lưu</button>
                                    </form>
                                    <div class="card mb-4">
                                        <div class="card-header">
                                            <i class="fas fa-table me-1"></i>
                                            Tất loại sản phẩm
                                        </div>
                                        <div class="card-body">
                                            <table id="datatablesSimple">
                                                <thead>
                                                    <tr>
                                                        <th>Tên</th>
                                                        <th>Chi tiết</th>
                                                        <th style="width: 0.887147% !important;">Banner</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tfoot>
                                                    <tr>
                                                        <th>Tên</th>
                                                        <th>Chi tiết</th>
                                                        <th>Banner</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </tfoot>
                                                <tbody>
                                                    <% List<Category> list = (List<Category>)request.getAttribute("listCate");
                                                            for(Category s:list){ %>
                                                            <tr>
                                                                <td>
                                                                    <%= s.getName() %>
                                                                </td>
                                                                <td>
                                                                    <%= s.getDesc() %>
                                                                </td>
                                                                <td>
                                                                    <img src="<%= s.getBanner() %>" style="max-width: 400px;" />
                                                                </td>

                                                                <td >
                                                                    <a href="editcategory?id=<%= s.getId()%>"
                                                                        class="btn btn-warning">Sửa</a>
                                                                    <form action="admincategory" method="post">
                                                                        <input type="text" name="action" id="action"
                                                                            value="delete" style="display: none" />
                                                                        <input type="text" name="idc" id="idc"
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