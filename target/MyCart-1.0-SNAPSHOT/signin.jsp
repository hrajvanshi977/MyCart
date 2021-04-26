
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign in</title>
        <%@include file = "components/common_css_js.jsp" %>
        <%@include file = "components/navbar.jsp"%>
    </head>
    <body>
        <div class = "container-fluid" style="margin-top: 80px">
            <div class = "row mt-5">
                <div class = "col-md-5 offset-md-3">
                    <div class = "card">
                        <div class="card-header custom-bg text-white">
                            <h4 class="text-center mt-2">Sign in</h4>
                        </div>
                        <div class="card-body px-4">
                            <%@include file="components/error_message.jsp" %>
                            <%@include file="components/success_message.jsp" %>
                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name = "email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name = "password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <div class="container text-center">
                                    <button type="submit" class="btn btn-primary custom-bg text-white">Submit</button>
                                </div>
                                <div class="container text-center mt-3"><label class="text-center">New User? <a href="register.jsp"> Sign Up!</a></label></div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                            
                            <%@include file = "components/common_modal.jsp"%>
    </body>
</html>
