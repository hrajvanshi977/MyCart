<%@page import="com.MyCart.Entities.Product"%>
<%@page import="com.MyCart.Entities.Product"%>
<%@page import="com.MyCart.Dao.ProductDao"%>
<%@page import="com.MyCart.Dao.UserDao"%>
<%@page import="java.util.List"%>
<%@page import="com.MyCart.Entities.Category"%>
<%@page import="com.MyCart.helper.FactoryProvider"%>
<%@page import="com.MyCart.Dao.CategoryDao"%>
<%@page import="com.MyCart.Entities.User"%>
<%

    User user = (User) session.getAttribute("current_user");
    if (user == null) {
        session.setAttribute("error", "you are not logged in, Login first!");
        session.removeAttribute("current_user");
        response.sendRedirect("signin.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("error", "you are not an Admin, Do not access this page.");
            session.removeAttribute("current_user");
            response.sendRedirect("signin.jsp");
            return;
        }
    }
%>

<!--all Dao objects-->
<%
    UserDao userDao = new UserDao(FactoryProvider.getFactory());
    ProductDao productDao = new ProductDao(FactoryProvider.getFactory());
    CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>admin</title>
        <%@include file="components/common_css_js.jsp"%>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container admin" style="margin-top: 80px">

            <!--message  start -->
            <div class="container mt-3">
                <%@include file="components/success_message.jsp"%>
            </div>
            <!--message end-->

            <div class="row mt-5">
                <!--//first column-->
                <div class="col-md-4">   
                    <div class="card" data-toggle="tooltip" data-placement="bottom" title="Number Of Users">
                        <div class="card-body text-center">
                            <div class="container text-center mt-3">
                                <img src="images/users.png" alt="alt" style="width: 100px"/>
                                <h1><%=userDao.getNumberOfUsers()%></h1>
                                <p class="text-primary">Users</p>
                            </div>
                        </div>
                    </div>
                </div>



                <!--second column-->
                <div class="col-md-4">   
                    <div class="card" data-toggle="tooltip" data-placement="bottom" title="Number Of Products">
                        <div class="card-body text-center">
                            <div class="container text-center mt-3">
                                <img src="images/product.png" alt="alt" style="width: 100px"/>

                                <%
                                    List<Product> pList = productDao.getProducts();
                                    int productNumber = 0;

                                    if (pList != null) {
                                        productNumber = pList.size();
                                    }
                                %>
                                <h1><%=productNumber%></h1>
                                <p class="text-primary">Products</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!--//third column-->
                <div class="col-md-4">  
                    <div class="card" data-toggle="tooltip" data-placement="bottom" title="Number Of Categories">
                        <div class="card-body text-center">
                            <div class="container text-center mt-3">
                                <img src="images/list.png" alt="alt" style="width: 100px"/>

                                <%
                                    List<Category> catagoryList = categoryDao.getCategories();
                                    int categoryNumbers = 0;
                                    if (catagoryList != null) {
                                        categoryNumbers = catagoryList.size();
                                    }
                                %>
                                <h1><%= categoryNumbers%></h1>
                                <p class="text-primary">Categories</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt-5">

                <!--next row-->
                <div class="col-md-6">   
                    <div class="card">
                        <div class="container text-center mt-3" data-toggle = "modal" data-target = "#add-product-modal">
                            <img src="images/add.png" alt="alt" style="width: 100px"/>
                            <p class="text-primary">Add Product</p>
                        </div>
                    </div>
                </div>

                <!--second column-->
                <div class="col-md-6">   
                    <div class="card">
                        <div class="container text-center mt-3" data-toggle = "modal" data-target = "#add-category-modal">
                            <img src="images/addcat.png" alt="alt" style="width: 100px"/>
                            <p class="text-primary">Add Category</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!--Add Product Modal-->
        <div class="modal fade" id="add-product-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Add Products</h5>
                        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="operation" value="addProduct">
                        <div class="modal-body">
                            <div class="form-group">
                                <lable>Name</lable>
                                <input type ="text" class="form-control mt-1" placeholder="Enter Product Name" name="pname" required="please fill the name">
                            </div>
                            <div class="form-group">
                                <lable>Price</lable>
                                <input type ="text" class="form-control mt-1" placeholder="Enter Product price" name="pprice">
                            </div>
                            <div class="form-group">
                                <lable>Discount</lable>
                                <input type ="text" class="form-control mt-1" placeholder="Enter Product Discount" name="pdiscount">
                            </div>
                            <div class="form-group">
                                <lable>Quantity</lable>
                                <input type ="text" class="form-control mt-1" placeholder="Enter Product Quantity" name="pquantity">
                            </div>
                            <div class="form-group">
                                <lable>Description</lable>
                                <textarea style="height: 100px" class="form-control mt-1" placeholder="Enter Product Description" name = "pdescription"></textarea>
                            </div>
                            <div class="form-group">
                                <lable>Category</lable>

                                <%
                                    //cDao is defined above
                                    List<Category> list = categoryDao.getCategories();
                                %>
                                <select class="form-control mt-2" name="catId" id="">
                                    <option value="">Select One</option>
                                    <%
                                        for (Category cat : list) {
                                    %>
                                    <option value="<%=cat.getCategoryId()%>"><%=cat.getCategoryTitle()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <lable for="pPic">Picture</lable>
                                <input type ="file" id="pPic" class="form-control mt-1" name = "ppic" required="">
                            </div>
                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add</button>
                                <button type="button" class="btn btn-outline-danger" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!--End of add product modal-->


        <!--Add Category Modal-->
        <div class="modal fade" id="add-category-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Add Category</h5>
                        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="operation" value="addCategory">
                        <div class="modal-body">
                            <div class="form-group">
                                <lable>Title</lable>
                                <input type ="text" class="form-control mt-1" placeholder="Enter Category Title" name="ctitle">
                            </div>
                            <div class="form-group">
                                <lable>Description</lable>
                                <textarea style="height: 150px" type ="text" class="form-control mt-1" placeholder="Enter Product Description" name = "cdescription"></textarea>
                            </div>
                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add</button>
                                <button type="button" class="btn btn-outline-danger" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!--End of Add Category Modal-->

        <%@include file = "components/common_modal.jsp"%>
        <script>
                    $(function () {
                        $('[data-toggle="tooltip"]').tooltip()
                    })
        </script><!-- comment -->
    </body>
</html>
