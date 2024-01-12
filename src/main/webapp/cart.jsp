<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="model.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@include file="component/allcss.jsp" %>
    <title>Giỏ hàng</title>
    <link rel="stylesheet" href="css/cart.css">
</head>

<body>
    <%@include file="component/header.jsp" %>
    <div class="container">
        <h4 class="text-uppercase w-100 border-bottom py-2">Giỏ hàng</h4>
        <table class="table">
            <thead>
                <tr class="text-center">
                    <th scope="col" class="text-muted fw-normal">Hình ảnh</th>
                    <th scope="col" class="text-muted fw-normal">Tên sản phẩm</th>
                    <th scope="col" class="text-muted fw-normal">Đơn giá</th>
                    <th scope="col" class="text-muted fw-normal">Số lượng</th>
                    <th scope="col" class="text-muted fw-normal">Tổng giá</th>
                    <th scope="col" class="text-muted fw-normal">Xóa</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<Cart> cartItems = (List<Cart>)session.getAttribute("cart");
                NumberFormat numberFormat = NumberFormat.getNumberInstance(new Locale("vi", "VN"));

                long totalAmount = 0;

                    if (cartItems != null && !cartItems.isEmpty()) {
                        for (Cart cartItem : cartItems) {
                        	double itemTotal = cartItem.getPrice() * cartItem.getAmount();
                            totalAmount += itemTotal; 
                            
                %>
                            <tr class="text-center desktopItemCart" style="vertical-align: middle;">
                                <td scope="row"><img src="<%=cartItem.getUrlImg() %>" alt="hình ảnh"
                                        style="width: 120px; height: 120px;" /></td> 
                                <td class="text-muted fw-normal">
                                    <p class='mt-1'><%=cartItem.getName()%></p>
                                </td>
                                <td class="fw-bold dongia price"><%=numberFormat.format((int)cartItem.getPrice()) %> VND</td>
                                <td>
                                <div class="d-flex justify-content-center">
                                	<form action="Cart" method="post">
                                
                                <input name="productId" value="<%=cartItem.getId()%>" class="d-none">
                               <input class='btn fw-bold fs-5 btn-light' name="subtract" type="submit" value="-">
                               
                                </form>
                                <input class='inputNumCart text-center border-0 bg-light' value="<%=cartItem.getAmount() %>" type="text" min="0" disabled />
                                <form action="Cart" method="post">
                                
                                    <input name="productId" value="<%=cartItem.getId()%>" class="d-none">
                                   <input class='btn fw-bold fs-5 btn-light' name="add" type="submit" value="+">
                                   
                                    </form>
                                    </div>
                                    
                                </td>
                               <td><%=numberFormat.format((long)cartItem.getPrice()*cartItem.getAmount()) %> VND</td>
                               
                                <td><form action="Cart" method="post">
                                
                                <input name="productId" value="<%=cartItem.getId() %>" class="d-none">
                                <input type="submit" name="action" class="btn btn-danger" value="Xóa">
                               </form></td>
                            </tr>
                <%
                        }
                    } else {
                %>
                        <tr>
                            <td colspan="6" class="text-center">Giỏ hàng trống.</td>
                        </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <div class="text-end mt-3">
            <strong>Tổng đơn hàng: <%=numberFormat.format((long)totalAmount)  %> VND</strong>
        </div>
        
        <a href="index.jsp">Tiếp tục mua hàng</a>
       
                <a href="<% if(username != null){ %>order<%} else { %>login <%} %>" class="btn btn-primary" style="float :right">Thanh Toán </a>
       
    </div>
</body>

</html>
