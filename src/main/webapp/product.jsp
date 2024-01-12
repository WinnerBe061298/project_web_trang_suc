<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.List" %>
    <%@page import="model.Product" %>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Product</title>
                <%@include file="component/allcss.jsp" %>
                    <link rel="stylesheet" href="css/product.css">
            </head>

            <body>
                <%@include file="component/header.jsp" %>
                    <div class="banner">
                        <img class="w-100" src="${category.banner }" />
                    </div>
                    <div class="container">
                        <h4 class="text-uppercase w-100 border-bottom py-2">${category.name}</h4>
                        <div class="row">

                            <% List<Product> p = (List<Product>)request.getAttribute("listp");
                            NumberFormat numberFormat = NumberFormat.getNumberInstance(new Locale("vi", "VN"));
                                    for(Product s:p){%>
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
                                                <p class="card-text text-center text-dark price text-decoration-line-through"
                                                    style="margin-bottom : 0px;" id="price">
                                                    <%=numberFormat.format(s.getPrice())%> VND
                                                </p>
                                                <p class="card-text text-center text-danger price" id="price_sale">
                                                    <%=numberFormat.format(s.getPrice()-s.getSale_of()*s.getPrice() /100) %> VND
                                                </p>
                                            </div>
                                        </a>
                                    </div>
                                    <%}%>



                        </div>
                    </div>
                    <%@include file="component/footer.jsp" %>
            </body>

            </html>