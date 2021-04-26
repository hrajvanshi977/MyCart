package com.MyCart.Servlet;
import com.MyCart.Dao.UserDao;
import com.MyCart.Entities.User;
import com.MyCart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class LoginServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            //authenticating user
            UserDao ud = new UserDao(FactoryProvider.getFactory());
            User user = ud.getUserByEmailAndPassword(email, password);
            HttpSession session = request.getSession();
            String str = (String)session.getAttribute("checkout");
            if(user == null || password == null) {
                session.setAttribute("error", "Invalid Username or password");
                response.sendRedirect("signin.jsp");
                return;
            } else {
                out.println("<h1>Welcome "+user.getUserName()+"</h1>");
                
                //admin.jsp
                session.setAttribute("current_user", user);
                if(str != null) {
                    session.removeAttribute("checkout");
                    response.sendRedirect("checkout.jsp");
                }
                else if(user.getUserType().equals("admin")) {
                    response.sendRedirect("admin.jsp");
                }
                else if(user.getUserType().equals("normal")){
                    response.sendRedirect("user.jsp");
                }
                else {
                    out.println("we have not indentified user type");
                }
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
