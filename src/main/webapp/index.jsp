<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <%@include file="component/allcss.jsp" %>
            <title>HOME</title>
    </head>
    <body>
        <%@include file="component/header.jsp" %>
            <hr />
            <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
                        class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                        aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                        aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="asesst/1920x703.png" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="asesst/2-banner-trang-chu-2.jpg" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="asesst/drop-of-light-banner.jpg" class="d-block w-100" alt="...">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                    data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                    data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
            ${a}
            <div class="container my-3">
                <hr />
                <h3 class="fw-bold text-dark text-uppercase text-center">Sản phẩm mới</h3>
                <div class="row">

                    <% List<Product> np = new Dao().getNewProduct();
                    NumberFormat numberFormat = NumberFormat.getNumberInstance(new Locale("vi", "VN"));

                            for(Product s:np){%>
                            <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6 col-6">
                                <a href="productDetail?idp=<%= s.getId()%>" class="card cusor my-3 shadow rounded-3"
                                    style="cursor: pointer;">
                                    <div class="sale_of position-absolute rounded-circle text-center text-white">
                                        <p>-<%= s.getSale_of() %>%</p>
                                    </div>
                                    <img src="<%=s.getImg()%>" class="card-img-top rounded-3" alt="...">
                                    <div class="card-body rounded-3">
                                        <h5 class="card-title text-center text-dark">
                                            <%=s.getName()%>
                                        </h5>
                                        <p class="card-text text-center text-dark text-decoration-line-through price"
                                            style="margin-bottom : 0px;" id="price" >
                                            <%=numberFormat.format(s.getPrice())%>VND
                                        </p>
                                        <p class="card-text text-center text-danger price" id="price_sale" >
                                            <%=numberFormat.format(s.getPrice()-s.getSale_of()*s.getPrice() /100 )%> VND
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