<%@page import="model.Product" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>${ pr.name }</title>
            <%@include file="component/allcss.jsp" %>
                <link rel="stylesheet" href="css/detailProduct.css">
        </head>

        <body>
            <%@include file="component/header.jsp" %>
                <div class="container my-2">
                    <p><a class="text-dark" href="index.jsp">Trang chủ</a>/ ${pr.name }</p>
                    <div class="row my-2">
                        <div class="col-12 col-sm-5 text-center">
                            <img width="80%" height="auto" src="${pr.img }" />
                        </div>
                        <div class="col-7">
                            <h4 class="text-upercase">${pr.name }</h4>
                            <hr>
                            <span class="text-decoration-line-through" id="pricee">${pr.price }</span>
                            <br>
                            <%Product product=(Product) request.getAttribute("pr"); int prices=product.getPrice()
                                -product.getPrice() * product.getSale_of() /100; %>
                                <span class="text-danger fs-4 fw-bold" id="price_salee">
                                    <%=prices %>
                                </span>
                                <br>
                                <a class="btn" data-bs-toggle="collapse" href="#collapseExample" role="button"
                                    aria-expanded="false" aria-controls="collapseExample">
                                    Xem thêm thông tin sản phẩm
                                </a>
                                <div class="collapse" id="collapseExample">
                                    <div class="card card-body">
                                        ${pr.desc }
                                    </div>
                                </div>
                                <p>*Giá có thể thay đổi tùy thuộc vào kích thước và trọng lượng thực tế của sản phẩm.
                                    Vui lòng gọi 1800 1168 để được hỗ trợ.</p>
                                <hr>
                                <form action="AddtoCart?idp=${pr.id}" method="POST">
                                    <span>Số lượng :</span> <input min="1" type="number" name="number"
                                        style="width: 50px;" value="1">
                                    <hr>
                                    <div class="w-100 mt-3">

                                        <button class="btn btn-warning" type="submit">Thêm vào giỏ hàng</button>

                                    </div>
                                </form>
                        </div>
                    </div>
                    <hr>
                    <h4>${pr.name }</h4>
                    <p>msp : 1</p>
                    <hr>
                    <div class="lst-supportdtit">
                        <div class="supportdtit">
                            <div class="tl-h3spdtit">
                                <div class="img-tlh3spdt"><img
                                        src="https://trangsuc.doji.vn/html/style/images/ic-titleh3.png"
                                        alt="Cam kết chất lượng" width="39" height="46"></div>
                                <div class="txt-tlh3spdt">
                                    <h3>cam kết chất lượng</h3>
                                </div>
                            </div>
                            <div class="txt-h3spdtit">
                                <p>100% Chuẩn xác về hàm lượng vàng. Tất cả các sản phẩm trang sức của DOJI được kiểm
                                    định
                                    chặt
                                    chẽ với máy quang phổ, cam kết chuẩn xác hàm lượng vàng.</p>

                                <p>100% chuẩn xác về trọng lượng vàng.</p>

                                <p>100% sản phẩm trang sức ngọc trai đều có đầy đủ kiểm định uy tín.</p>

                                <p>Mọi sản phẩm trang sức do DOJI bán ra đều có hóa đơn (đã bao gồm các loại thuế), ghi
                                    đầy
                                    đủ
                                    thông tin về hàm lượng, trọng lượng vàng cũng như&nbsp;</p>

                            </div>
                        </div>
                        <div class="supportdtit">
                            <div class="tl-h3spdtit">
                                <div class="img-tlh3spdt"><img
                                        src="https://trangsuc.doji.vn/html/style/images/ictitlth3.png"
                                        alt="Hướng dẫn mua hàng online" width="43" height="39"></div>
                                <div class="txt-tlh3spdt">
                                    <h3>hướng dẫn mua hàng online</h3>
                                </div>
                            </div>
                            <div class="txt-h3spdtit">
                                <p>Lựa chọn sản phẩm tại các chuyên mục trên website</p>

                                <p>Thêm vào giỏ hàng.</p>

                                <p>Kiểm tra thông tin đơn hàng và đặt hàng</p>

                                <p>Kiểm tra và xác nhận đơn hàng</p>

                                <p>Đơn hàng thành công sẽ được gửi về email &amp; sms của quý khách</p>

                                <p>Xem thêm chi tiết <a href="/dich-vu-khach-hang-gt/huong-dan-dat-hang">tại đây</a></p>

                            </div>
                        </div>
                    </div>
                    <hr>
                </div>
                <%@include file="component/footer.jsp" %>
        </body>


        </html>