<%@page import="com.MyCart.Entities.Category"%>
<%@page import="com.MyCart.Dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.MyCart.Entities.Product"%>
<%@page import="com.MyCart.Dao.ProductDao"%>
<%@page import="com.MyCart.helper.*, org.hibernate.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MyCart-Home</title>
        <%@include file = "components/common_css_js.jsp" %>
        <%@include file = "components/navbar.jsp"%>
    </head>
    <body>
        <div class="container-fluid" style="margin-top: 70px">
            <div class="row">
                <!--for categories-->
                <div class="col-md-2">
                    <div class="list-group">

                        <% String string = (String) request.getParameter("category");
                        %>
                        <a href="index.jsp?category=-1" class="list-group-item list-group-item-action <%if (string == null || string.trim().equals("-1")) {
                                out.println("active");
                            }%>>">All Products</a>
                        <%
                            int cid = 0;
                            if (string != null) {
                                cid = Integer.parseInt(string.trim());
                            }
                            CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                            List<Category> list = cdao.getCategories();
                            for (Category cat : list) {
                        %>
                        <a href="index.jsp?category=<%=cat.getCategoryId()%>" class="list-group-item list-group-item-action <%if (cid == cat.getCategoryId()) {
                                out.println("active");
                            }%>"><%=cat.getCategoryTitle()%></a>
                        <%
                            }
                        %>
                    </div>
                </div>

                <div class="col-md-10">
                    <!--show products-->

                    <div class="row mt-4">

                        <!--product column-->
                        <div class="col-md-12">
                            <div class="card-columns">
                                <%
                                    ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
                                    List<Product> pList = null;

                                    if (string == null || cid == -1) {
                                        pList = pdao.getProducts();
                                    } else {
                                        pList = pdao.getProductsByCategoryId(cid);
                                    }

                                    for (Product product : pList) {
                                %>
                                <!--product card-->
                                <div class="card product-card">

                                    <div class="container text-center">
                                        <img src="images/products/<%=product.getProductPic()%>" style="max-height: 270px; max-width: 100%; width: auto" class="card-img-top m-2" alt="...">
                                    </div>
                                    <div class="card-body">
                                        <h5 class="card-title mt-4"><%=product.getProductName()%></h5>
                                        <p class="card-text"><%=Helper.getTenWords(product.getProductDescription()) + ". . ."%></p>
                                    </div>
                                    <div class="card-footer">
                                        <h4 class="text-center">&#x20B9;<%=product.getPriceAfterDiscount()%>/-   <span class="text-secondary" style="font-size: 15px!important; ">&#x20B9;<%= product.getProductPrice()%>, <%= product.getProductDiscount()%>% off</span></h4>
                                        <div class="container text-center">
                                            <button class="btn custom-bg text-white" onclick="add_to_cart(<%=product.getProductId()%>, '<%=product.getProductName()%>',<%=product.getPriceAfterDiscount()%>)"> Add to cart</button>
                                            <button class="btn btn-outline-success"> Buy now</button>
                                        </div>
                                    </div>
                                </div>
                                <br>
                                <%
                                    }
                                    if (pList.size() == 0) {
                                %>
                                <h1>Sorry, No Products :(</h1>
                                <%
                                    }
                                %>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </div>
        <%@include file = "components/common_modal.jsp"%>
    </body>
</html>
