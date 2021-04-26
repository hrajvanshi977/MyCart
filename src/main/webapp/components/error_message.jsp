<%
    String a = (String) session.getAttribute("error");
    if (a != null) {
 %>
<div class="alert alert-danger alert-success fade show" role="alert">
    <strong><%= a%></strong> 
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<%
}
session.removeAttribute("error");
%>