<%@page import="model.OrderDetail" %>
    <%@page import="model.Product" %>
        <%@page import="model.Order" %>
            <%@page import="model.Cart" %>
                <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
                    <!DOCTYPE html>
                    <html>

                    <head>
                        <meta charset="UTF-8">
                        <title>Quản lý đơn hàng</title>
                    </head>

                    <body>
                        <%@include file="component/header.jsp" %>
                            <div class="container">
                                <h3 class="text-center fw-bold text-uppercase">Đơn hàng đã đặt</h3>
                                <% List<Order> listo = (List<Order>) request.getAttribute("listorder");
                                        if (listo != null && !listo.isEmpty()) {
                                        for (Order Itemo : listo) {
                                        List<OrderDetail> listod = new
                                            Dao().getOrderDetailByIdo(Integer.toString(Itemo.getId()));%>
                                            <hr class="mt-5" style="color:red;height:4px">
                                            <p ><span>Tên khách hàng :</span>
                                                <%=Itemo.getName()%>
                                            </p>
                                            <p>Số điện thoại : <%=Itemo.getPhone()%>
                                            </p>
                                            <p>Email : <%=Itemo.getEmail()%>
                                            </p>
                                            <p>Địa chỉ giao : <%=Itemo.getAddRess()%>
                                            </p>
                                            <p>Tổng : <%=Itemo.getTotal()%> VND</p>
                                            <table class="table mb-3" <%=Itemo.getId()%> >
                                                <thead>
                                                    <tr class="text-center">
                                                        <th scope="col" class="text-muted fw-normal">Hình ảnh</th>
                                                        <th scope="col" class="text-muted fw-normal">Tên sản phẩm</th>
                                                        <th scope="col" class="text-muted fw-normal">Đơn giá</th>
                                                        <th scope="col" class="text-muted fw-normal">Số lượng</th>
                                                        <th scope="col" class="text-muted fw-normal">Tổng giá</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%for (OrderDetail odt : listod){ Product p=new
                                                        Dao().getProuductById(Integer.toString(odt.getIdp()));%>
                                                        <tr class="text-center desktopItemCart"
                                                            style="vertical-align: middle;">
                                                            <td scope="row"><img src="<%=p.getImg() %>" alt="hình ảnh"
                                                                    style="width: 120px; height: 120px;" /></td>
                                                            <td class="text-muted fw-normal">
                                                                <p class='mt-1'>
                                                                    <%=p.getName()%>
                                                                </p>
                                                            </td>
                                                            <td class="fw-bold dongia">
                                                                <%=(int)odt.getPrice() %> VND
                                                            </td>
                                                            <td>
                                                                <div class="d-flex justify-content-center">
                                                                    <input
                                                                        class='inputNumCart text-center border-0 bg-light'
                                                                        value="<%=odt.getQuantity() %>" type="text"
                                                                        min="0" disabled />
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <%=(int)odt.getPrice()*odt.getQuantity() %> VND
                                                            </td>
                                                        </tr>
                                                        <% } %>
                                                    </tbody>
                                                    </table>            
                                       <% }} %>
                                               
                            </div>
                            <%@include file="component/footer.jsp" %>
                    </body>

                    </html>