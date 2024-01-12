<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="css/footer.css">
    </head>

    <body>
        <div class="footer mt-3 border-top " style="background-color: #f5f5f5;">
            <div class="container">
                <div class="top-footer py-2 border-bottom">
                    <div class="logo-tft">
                        <a href="index.jsp" title="Trang sức DOJI">
                            <img alt="Trang sức DOJI" src="asesst/logo-t.png" width="207" height="75">
                        </a>
                    </div>
                    <div class="hl-tft">
                        <p class="lazyed"><i class="fa-solid fa-phone text-danger"></i>hotline:<a class="text-dark"
                                href="tel:18001168" title="18001168"> 0392322055</a></p>
                    </div>
                    <div class="htpp-tft lazyed"><a class="text-dark" href="#" title="Hệ thống phân phối"><i
                                class="fa-regular fa-building text-danger"></i> Hệ thống phân
                            phối</a></div>
                </div>
                <div class="mt-2 d-flex justify-content-between contact-detail">
                    <div class="address">
                        <h5 class="text-danger">LIÊN HỆ</h5>
                        <p>Tập đoàn VBĐQ DOJI</p>
                        <p>Địa chỉ: 182 Lê Duẩn, Bến Thủy, </p>
                        <p>Thành phố Vinh, Nghệ An</p>
                    </div>
                    <div class="for-me">
                        <h5 class="text-danger">VỀ CHÚNG TÔI</h5>
                        <p>Về trang sức DOJI</p>
                        <p>Dịch vụ khách hàng</p>
                        <p>Kinh doanh bán sỉ</p>
                    </div>
                    <div class="service">
                        <h5 class="text-danger">DỊCH VỤ KHÁCH HÀNG</h5>
                        <p>Hướng dẫn đặt hàng</p>
                        <p>Phương thức thanh toán</p>
                        <p>Chính sách & bảo hành</p>
                    </div>
                </div>
            </div>
        </div>
    </body>
	<script type="text/javascript">

        var price = Number(document.getElementById("pricee").innerHTML);
        document.getElementById("pricee").innerHTML = price.toLocaleString() + " VND";
        var price_sale = Number(document.getElementById("price_salee").innerHTML);
        document.getElementById("price_salee").innerHTML = price_sale.toLocaleString() + " VND";

    </script> 

    </html>