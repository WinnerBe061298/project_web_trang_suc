<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="model.Category" %>
    <%@page import="dao.Dao" %>
        <%@page import="model.Product" %>
            <%@page import="java.util.List" %>
                <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
                    <!DOCTYPE html>
                    <html>

                    <head>
                        <meta charset="UTF-8">
                        <title>Quản lý sản phẩm</title>
                        <link rel="Quản lý sản phẩm" href="admin/css/admin.css">
                    </head>

                    <body>
                        <%@include file="header.jsp" %>
                            <div id="layoutSidenav">
                                <%@include file="sidebar.jsp" %>
                                    <main>

                                        <div class="container-fluid px-4">
                                            <h1 class="mt-4">Quản lý sản phẩm</h1>
                                            <ol class="breadcrumb mb-4">
                                                <li class="breadcrumb-item active">product</li>
                                            </ol>
                                            <form class="d-flex w-50 mb-3 gap-1 flex-column" action="adminproduct"
                                                method="post" enctype="multipart/form-data">
                                                <span>Tên sp</span>
                                                <input class="form-control " required type="text" name="name" id="name">
                                                <span>Thông tin sản phẩm</span>
                                                <input class="form-control " required type="text" name="desc" id="desc">
                                                <div class="mb-3">
                                                    <label for="formFileDisabled" class="form-label">Chọn ảnh</label>
                                                    <input class="form-control" name="img" type="file" id="formFile">
                                                </div>
                                                <span>Loại sp</span>
                                                <select name="idCategory" class="form-select"
                                                    aria-label="Default select example">
                                                    <option value="1" selected>Chọn Loại Sản Phẩm</option>

                                                    <% List<Category> cas = new Dao().getAllCategory();
                                                    		NumberFormat numberFormat = NumberFormat.getNumberInstance(new Locale("vi", "VN"));
                                                        for(Category s:cas){%>
                                                        <option value="<%=s.getId()%>">
                                                            <%=s.getName()%>
                                                        </option>
                                                        <%}%>
                                                </select>
                                                <span>Giá sản phẩm</span>
                                                <input class="form-control " value="${listtmp.price }" required
                                                    type="text" name="price" id="price">
                                                <span>Giảm giá (ví dụ giảm 10% thì nhập 10)</span>
                                                <input class="form-control " required type="text" name="sale_of"
                                                    id="sale_of">
                                                <input type="text" name="action" id="action" value="add"
                                                    style="display: none" />
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
                                                                <th>thumbnail</th>
                                                                <th>Tên</th>
                                                                <th>Giá</th>
                                                                <th>Giảm giá</th>
                                                                <th>loại sp</th>
                                                                <th>Action</th>
                                                            </tr>
                                                        </thead>
                                                        <tfoot>
                                                            <tr>
                                                                <th>thumbnail</th>
                                                                <th>Tên</th>
                                                                <th>Giá</th>
                                                                <th>Giảm giá</th>
                                                                <th>id loại sp</th>
                                                                <th>Action</th>
                                                            </tr>
                                                        </tfoot>
                                                        <tbody>
                                                            <% List<Product> listproduct = (List<Product>
                                                                    )request.getAttribute("listproduct");
                                                                    for(Product s:listproduct){%>
                                                                    <tr>
                                                                        <td><img src="<%= s.getImg() %>"
                                                                                style="width: 100px;height: auto" />
                                                                        </td>
                                                                        <td>
                                                                            <%= s.getName() %>
                                                                        </td>
                                                                        <td>
                                                                            <%= numberFormat.format(s.getPrice()) %> VND
                                                                        </td>
                                                                        <td>
                                                                        
                                                                            <%= s.getSale_of() %>
                                                                        </td>
                                                                        <%Category loaisp = new Dao().getCategoryById(Integer.toString(s.getIdCategory()));%>
                                                                        <td>
                                                                            <%= loaisp.getName()%>
                                                                        </td>
                                                                        <td>
                                                                                <a href="editProduct?id=<%= s.getId()%>" class="btn btn-warning"
                                                                                    >Sửa</a>
                                                                            <form action="adminproduct" method="post">
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