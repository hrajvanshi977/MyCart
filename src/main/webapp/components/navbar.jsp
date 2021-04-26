<%@page import="com.MyCart.Entities.User"%>
<%
    User user1 = (User) session.getAttribute("current_user");
%>
<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-light custom-bg">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">MyCart</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Categories
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                </li>
            </ul>

            <ul class = "navbar-nav ml-auto ">
                
                 <li class="nav-item active">
                     <a class="nav-link" href="#!" data-toggle="modal" data-target="#cart"><i class="fa  fa-cart-plus" style="font-size: 25px; color: antiquewhite"></i><span class="cart-items ml-1" style="font-size: 11px"></span></a>
                </li>
                <%
                    if (user1 == null) {
                %>
                <li class="nav-item active">
                    <a class="nav-link" href="signin.jsp">Sign in</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="register.jsp">Register</a>
                </li><!-- comment -->
                <%
                } else {
                %>
                <li class="nav-item active">
                    <a class="nav-link" href="<%if(user1.getUserType().equals("admin")) out.print("admin.jsp");
                                                 else out.print("user.jsp");%>"><%=user1.getUserName()%></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="LogoutServlet">Logout</a>
                </li>
                <%
                    }
                %>

            </ul>
        </div>
    </div>
</nav>