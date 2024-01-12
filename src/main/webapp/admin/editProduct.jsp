<%@page import="model.Product"%>
<%@page import="dao.Dao" %>
    <%@page import="model.Category" %>
        <%@page import="java.util.List" %>
            <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
                <!DOCTYPE html>
                <html>

                <head>
                    <meta charset="UTF-8">
                    <title>Sửa</title>
                </head>

                <body>
                    <%@include file="header.jsp" %>
                        <div id="layoutSidenav">
                            <%@include file="sidebar.jsp" %>
                                <main class="w-100 h-100 d-flex justify-content-center align-items-center">


                                    <form class="d-flex w-50 mb-3 gap-1 flex-column" action="editproduct" method="post"
                                        enctype="multipart/form-data">
                                        <input class="form-control " required value="${ptmp.id }" type="text"
                                            name="idp" id="idp" style="display: none"/>
                                        <span>Tên sp</span>
                                        <input class="form-control " required value="${ptmp.name }" type="text"
                                            name="name" id="name">
                                        <span>Thông tin sản phẩm</span>
                                        <input class="form-control " required value="${ptmp.desc }" type="text"
                                            name="desc" id="desc">
                                        <div class="mb-3">
                                            <label for="formFileDisabled" class="form-label">Chọn ảnh</label>
                                            <input class="form-control" name="img" type="file"
                                                id="formFile">
                                        </div>
                                        <% Product product = (Product)request.getAttribute("ptmp");
                                        Category casp = new Dao().getCategoryById(Integer.toString(product.getIdCategory()));%>
                                        <span>Loại sp</span>
                                        <select name="idCategory" class="form-select"
                                            aria-label="Default select example">
                                            <option value="${ptmp.idCategory }" selected><%= casp.getName() %></option>
                                            <% List<Category> cas = new Dao().getAllCategory();
                                                for(Category s:cas){%>
                                                <option value="<%=s.getId()%>">
                                                    <%=s.getName()%>
                                                </option>
                                                <%}%>
                                        </select>
                                        <span>Giá sản phẩm</span>
                                        <input class="form-control " value="${ptmp.price }" required type="text"
                                            name="price" id="price">
                                        <span>Giảm giá (ví dụ giảm 10% thì nhập 10)</span>
                                        <input class="form-control " required type="text" value="${ptmp.sale_of }"
                                            name="sale_of" id="sale_of">
                                        <button type="submit" class="btn btn-success w-50">Lưu</button>
                                    </form>

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