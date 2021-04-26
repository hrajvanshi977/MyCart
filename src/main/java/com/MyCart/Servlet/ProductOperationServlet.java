package com.MyCart.Servlet;

import com.MyCart.Entities.Category;
import com.MyCart.Dao.CategoryDao;
import com.MyCart.Dao.ProductDao;
import com.MyCart.Entities.Product;
import com.MyCart.helper.FactoryProvider;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;


@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String op = request.getParameter("operation");
            if (op.trim().equals("addCategory")) {
                String cTitle = (String) request.getParameter("ctitle");
                String cDescription = (String) request.getParameter("cdescription");
                
                Category cat = new Category(cTitle, cDescription);
                CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
                
                int catId = cDao.saveCategory(cat);
                HttpSession session = request.getSession();
                session.setAttribute("message", "Category Added Successfully!");
                response.sendRedirect("admin.jsp");
                return;
            } else if (op.trim().equals("addProduct")) {
                String pName = (String)request.getParameter("pname");
                int pPrice = Integer.parseInt((String)request.getParameter("pprice"));
                int pDiscount = Integer.parseInt((String)request.getParameter("pdiscount"));
                int pQuantity = Integer.parseInt((String)request.getParameter("pquantity"));
                String pDescription = (String)request.getParameter("pdescription");
                Category category = new CategoryDao(FactoryProvider.getFactory()).getCategoryById(Integer.parseInt(request.getParameter("catId")));
                Part part = request.getPart("ppic");
                String pImage = part.getSubmittedFileName();
                Product product = new Product(pName, pDescription, pImage, pPrice, pDiscount, pQuantity, category);
                
                ProductDao pDao = new ProductDao(FactoryProvider.getFactory()); 
                 pDao.saveProduct(product);
                //  pic upload
                //  find out the path where we want to upload the photo
                String path = (String)request.getRealPath("images")+File.separator + "products"+ File.separator + part.getSubmittedFileName();
                //image upload
                
                try {
                    FileOutputStream fos = new FileOutputStream(path);
                    InputStream is = part.getInputStream();
    //                reading data
                    byte[] data = new byte[is.available()];
                    is.read(data);
    //                writing data
                    fos.write(data);
                    fos.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                HttpSession session = request.getSession();
                session.setAttribute("message", "Product Added Successfully!");
                response.sendRedirect("admin.jsp");
                return;
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
