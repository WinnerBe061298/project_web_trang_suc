<%@page import="model.Product" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <%@include file="component/allcss.jsp" %>
                <title>Tìm kiếm</title>
                <style>
                    a {
                        text-decoration: none !important;
                    }
                </style>
        </head>
        <%List<Product> sp = (List<Product>)request.getAttribute("sp"); %>

                <body>
                    <%@include file="component/header.jsp" %>
                        <div class="container">
                            <span class="my-3"><a href="index.jsp">Trang chủ</a> / Tìm kiếm</span>
                            <h4 class="text-center text-uppercase">Có ${size} kết quả với từ khóa ${key }</h4>
                            <div class="row">
                                <% for(Product s:sp){%>
                                    <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6 col-6">
                                        <a href="productDetail?idp=<%= s.getId()%>"
                                            class="card cusor my-3 shadow rounded-3" style="cursor: pointer;">
                                            <div
                                                class="sale_of position-absolute rounded-circle text-center text-white">
                                                <p>-<%= s.getSale_of() %>%</p>
                                            </div>
                                            <img src="<%=s.getImg()%>" class="card-img-top rounded-3" alt="...">
                                            <div class="card-body rounded-3">
                                                <h5 class="card-title text-center text-dark">
                                                    <%=s.getName()%>
                                                </h5>
                                                <p class="card-text text-center text-dark text-decoration-line-through"
                                                    style="margin-bottom : 0px;">
                                                    <%=s.getPrice()%> VND
                                                </p>
                                                <p class="card-text text-center text-danger">
                                                    <%=s.getPrice()-s.getSale_of()*s.getPrice() /100 %> VND
                                                </p>
                                            </div>
                                        </a>
                                    </div>
                                    <%}%>
                            </div>
                        </div>
                </body>

        </html>