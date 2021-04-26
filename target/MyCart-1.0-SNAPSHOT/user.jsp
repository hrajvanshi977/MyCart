<%@page import="com.MyCart.Entities.User"%>
<%
    User user = (User) session.getAttribute("current_user");
    if (user == null) {
        session.setAttribute("error", "You are not loged in, Login First");
        response.sendRedirect("signin.jsp");
        return;
    } else {
        if (user.getUserType().equals("admin")) {
            session.setAttribute("error", "you are not a user, Do not access this page.");
            response.sendRedirect("signin.jsp");
            return;
        }
    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <h1>This is user panel!</h1>
           <%@include file = "components/common_modal.jsp"%>
    </body>
</html>
