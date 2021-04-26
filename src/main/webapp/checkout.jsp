<%-- 
    Document   : checkout.jsp
    Created on : Dec 5, 2020, 6:32:44 PM
    Author     : admin
--%>
<%
    User user = (User) session.getAttribute("current_user");
    if (user == null) {
        session.setAttribute("checkout", "0");
        session.setAttribute("error", "You are not loged in, Login First");
        response.sendRedirect("signin.jsp");
        return;
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid" style="margin-top: 70px">
            <div class="row">
                <div class="col-md-7">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center">Your Selected Items</h3>
                            <div class="cart-body">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="card">
                        <div class="card-body">
                            <form action="authorize_payment" method="post">
                                <div class="form-group">
                                    <label for="exampleInputName1">Full Name</label>
                                    <input value="<%=user.getUserName()%>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Your Name">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input value="<%=user.getUserEmail()%>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPhone">Phone</label>
                                    <input value="<%=user.getUserPhone()%>" type="text" class="form-control" id="exampleInputPhone" aria-describedby="emailHelp" placeholder="Enter Your Phone">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputAddress">Shpping Address</label>
                                    <textarea value="<%=user.getUserAddress()%>" class="form-control" placeholder="Enter Your shipping address"></textarea>
                                </div>
                                <input onload="update_cart()" type="hidden" id = "product" name="product" value="t-shirt">
                                <input onload="update_cart()" type="hidden" id = "subtotal" name="subtotal" value="10">
                                <input value="0"type="hidden" name="shipping">
                                <input value="0"type="hidden" name="tax">
                                <input onload="update_cart" type="hidden" id = "total" name="total" value="12">

                                <div class="container text-center">
                                    <button type="submit" class="btn btn-outline-success">Order Now</button>
                                </div>
                            </form>
                            <div class="container text-center mt-2">
                                <a href="index.jsp"type="submit" class="btn btn-outline-primary">Continue Shopping</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="components/common_modal.jsp" %>
    </body>
</html>
