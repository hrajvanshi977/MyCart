<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register us</title>
        <%@include file = "components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file = "components/navbar.jsp" %>
        <div class="container-fluid" style="margin-top: 70px">
            <div class="row mt-5">
                <div class = "col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-header custom-bg text-white">
                            <%@include file = "components/success_message.jsp" %>
                            <%@include file = "components/error_message.jsp" %>
                            <div class="container text-center">
                                <span class="fa fa-user-circle-o text-white" style = "font-size: 40px; color:darkslategray ;"></span>
                            </div>
                            <h4 class="text-center my-3">Register Here</h4>
                        </div>
                        <div class="card-body px-4">
                            <form action = "RegisterServlet" method = "post">
                                <div class="form-group">
                                    <label for="exampleInputUserName">Username</label>
                                    <input name = "user_name" type="text" class="form-control" id="exampleInputUserName" aria-describedby="userNameHelp" placeholder="Enter username">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name = "user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name ="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPhone">Phone</label>
                                    <input name = "user_phone" type="text" class="form-control" id="exampleInputPhone" placeholder="Phone">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputAdress">Address</label>
                                    <input name = "user_address" type="text" class="form-control" id="exampleInputAdress" placeholder="Enter your address">
                                </div>
                                <div class ="container text-center mt-3">
                                    <button type="submit" class="btn btn-outline-primary">Submit</button>
                                    <button type="submit" class="btn btn-outline-warning">Reset</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                            
                            <%@include file = "components/common_modal.jsp"%>
    </body>
</html>
