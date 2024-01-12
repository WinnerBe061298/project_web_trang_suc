<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="model.Cart"%>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Thanh toán</title>
        <link rel="stylesheet" href="css/payment.css">
    </head>

    <body>
        <%@include file="component/header.jsp" %>
            <div class="container my-2">
                <div class=" col-12 row my-2">

                    <div class="col-8">
                        <form action="order" method="post" >
                            <div class="title-2">
                                <h2>Thông tin người mua</h2>
  <% 
                    List<Cart> cartItems = (List<Cart>)session.getAttribute("cart");
                long totalAmount = 0;
                for (Cart cartItem : cartItems) {
                        	double itemTotal = cartItem.getPrice() * cartItem.getAmount();
                            totalAmount += itemTotal; }%>
                                <div class="formw-inf">
                                    <div class="input-group flex-nowrap">
                                    	<input type="hidden" name="total" value="<%=(long)totalAmount%>">
                                        <span class="input-group-text" id="addon-wrapping" >Họ Tên</span>
                                        <input type="text" class="form-control" placeholder="" name="name" aria-label="Username"
                                            aria-describedby="addon-wrapping" required>
                                    </div>
                                    <div class="input-group flex-nowrap mt-3">
                                        <span class="input-group-text" id="addon-wrapping">Số Điện Thoại</span>
                                        <input type="text" class="form-control" placeholder="" aria-label="phone" name="phone"
                                            aria-describedby="addon-wrapping" required>
                                    </div>
                                    <div class="input-group flex-nowrap mt-3">
                                        <span class="input-group-text" id="addon-wrapping">Email</span>
                                        <input type="text" class="form-control" placeholder="" aria-label="email" name="email"
                                            aria-describedby="addon-wrapping" required>
                                    </div>
                                </div>
                                <h2 class="mt-4">Chọn hình thức nhận hàng</h2>


                                <div class="btn btn-danger w-100 mb-3">Nhận Hàng trực tiếp</div>
                                <div class="row mb-3" style="margin-left:0">
                                    <select class="form-select form-select-sm " id="city" name="city" aria-label=".form-select-sm"
                                        style="width:33% !important" required>
                                        <option value="" selected>Chọn tỉnh thành</option>
                                    </select>

                                    <select class="form-select form-select-sm  " id="district" name="district"
                                        aria-label=".form-select-sm" style="width:33% !important" required>
                                        <option value="" selected>Chọn quận huyện</option>
                                    </select>

                                    <select class="form-select form-select-sm " id="ward" name="ward" aria-label=".form-select-sm"
                                        style="width:33% !important;" required>
                                        <option value="" selected>Chọn phường xã</option>
                                    </select>

                                </div>
                                <div class="input-group flex-nowrap mt-3">

                                    <input type="text" class="form-control" placeholder="Nhập Địa Chỉ(số nhà , đường (xóm))"
                                        aria-label="Address" name="house" aria-describedby="addon-wrapping" required>
                                </div>
                                <h2 class="mt-4">Chọn hình thức thanh toán</h2>
                                <div class="form_payment" id="payment">
                                    <ul class="payment_methods mb20">
                                        <li class="item-payment ">
                                            <div class="w100">
                                                <input type="radio" id="payment_method_cod" name="payment_method"
                                                    value="COD" required checked="true">
                                                <label for="payment_method_cod" class="ml15 color-default fw-bold">
                                                    Trả tiền mặt khi nhận hàng (COD)
                                                </label>
                                            </div>
                                            <!-- <div class="w100">
                                                <input type="radio" id="payment_method_bacs" name="payment_method"
                                                    value="Bank" required>
                                                <label for="payment_method_bacs" class="ml15 color-default fw-bold">
                                                    Chuyển khoản ngân hàng
                                                </label>
                                            </div> -->
                                        </li>
                                    </ul>

                                    <p>Thông tin cá nhân của bạn sẽ được sử dụng để xử lý đơn hàng và cho các mục đích
                                        cụ
                                        thể khác đã được mô tả trong <a href="#" class="color-default">chính sách riêng
                                            tư</a> của chúng tôi.</p>
                                </div>
                                <h5 class="mt-4"> Quý Khách có thể để lại lời nhắn</h5>
                                <textarea id="note" class="valid" name="note"></textarea>
                                <div class="w-100 text-center">
                                    <button type="submit" name="btn-submit"
                                        class="btn btn-primary border-0 bg-default mb20" style="padding: 7px 150px">Đặt
                                        hàng</button>
                                </div>
                            </div>
                        </form>
                    </div>


                    <div class="col-4">
                        <p>Thông tin Đơn Hàng</p>
                      
                <%
               	totalAmount = 0;
                    if (cartItems != null && !cartItems.isEmpty()) {
                        for (Cart cartItem : cartItems) {
                        	double itemTotal = cartItem.getPrice() * cartItem.getAmount();
                            totalAmount += itemTotal; 
                            
                %>
                        <div class="deltai-product row" >
                            <div class="img col-3"><img
                                    src="<%=cartItem.getUrlImg() %>"
                                    alt="" style="width: -webkit-fill-available;">
                            </div>
                            <div class="name-product col-9">
                                <p>Tên : <%=cartItem.getName()%></p>
                                
                                <p>Số Lượng : <%=cartItem.getAmount()%> </p>
                            </div>

                        </div>
                        <div class="price mt-3">
                            <p>Giá Tiền: <span><%=(int)cartItem.getPrice()%> VND</span></p>
                            <p>Thành tiền: <span><%=(long)cartItem.getPrice()*cartItem.getAmount() %> VND</span></p>
                        </div>
                       <%}} %>
                       <p class="price">Tổng Tiền <SPAN><%=(long)totalAmount  %> VND</SPAN> </p>>
                    </div>

                </div>
            </div>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
            <script>
                var citis = document.getElementById("city");
                var districts = document.getElementById("district");
                var wards = document.getElementById("ward");
                var Parameter = {
                    url: "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json",
                    method: "GET",
                    responseType: "application/json",
                };
                var promise = axios(Parameter);
                promise.then(function (result) {
                    renderCity(result.data);
                });

                function renderCity(data) {
                    for (const x of data) {
                        citis.options[citis.options.length] = new Option(x.Name, x.Name);
                    }
                    citis.onchange = function () {
                        district.length = 1;
                        ward.length = 1;
                        if (this.value != "") {
                            const result = data.filter(n => n.Name === this.value);

                            for (const k of result[0].Districts) {
                                district.options[district.options.length] = new Option(k.Name, k.Name);
                            }
                        }
                    };
                    district.onchange = function () {
                        ward.length = 1;
                        const dataCity = data.filter((n) => n.Name === citis.value);
                        if (this.value != "") {
                            const dataWards = dataCity[0].Districts.filter(n => n.Name === this.value)[0].Wards;

                            for (const w of dataWards) {
                                wards.options[wards.options.length] = new Option(w.Name, w.Name);
                            }
                        }
                    };
                }
            </script>
    </body>

    </html>