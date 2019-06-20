/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Connection.Connect;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sanya Dhall
 */
public class ForgetPassword extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
                     throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
          
            String email=request.getParameter("email");
            
            
            try
            {
           
                Connection conn=new Connect().getConnection();
                PreparedStatement ps=conn.prepareStatement("select * from admin where email=?");
                ps.setString(1,email);
                 ps.setString(1, email);
                ResultSet rs=ps.executeQuery();
                if(rs.next())
                {
                    if(rs.getString("email").equals(email))
                    {
                        
                        String sub="Forgot Password";
                        String pass= "Your Password is" +rs.getString("password")+ " .";
                        mail.Mailerr.send(email, sub, pass);
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Mail is Sent To Your Email Address')");
                        out.println("window.location.href='admin/index.jsp'");
                        out.println("</script>");
                    }
                    else
                    {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Problem in Sending Mail')");
                        out.println("window.location.href='admin/index.jsp'");
                        out.println("</script>");
                        
                    }
                }
                else
                {
                    out.println("<script type=\"text/javascript\">");
                        out.println("alert('Invalid Email')");
                        out.println("window.location.href='admin/index.jsp'");
                        out.println("</script>");
                }
            }
            catch(Exception e)
            {
               out.println(e);
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
