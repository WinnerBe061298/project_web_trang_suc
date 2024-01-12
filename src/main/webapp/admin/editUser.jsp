
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
									<form class="d-flex w-50 mb-3 gap-1 flex-column" action="edituser" method="post">
                                        <input class="form-control " required value="${ptmp.id }" type="text"
                                            name="idp" id="idp" style="display: none"/>
                                        <span>username </span>
                                        <input class="form-control " required value="${ptmp.username }" type="text"
                                            name="username" id="username">
                                        <span>email </span>
                                        <input class="form-control " required value="${ptmp.email }" type="text"
                                            name="email" id="email">
                                        <span>pass </span>
                                        <input class="form-control " required value="${ptmp.password }" type="text"
                                            name="pass" id="pass">  
                                        <span>role (user =0 , admin = 1)</span>
                                        <input class="form-control " required value="${ptmp.role }" type="text"
                                            name="role" id="role">
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