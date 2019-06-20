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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sanya Dhall
 */
public class EditCategory extends HttpServlet {

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
           
            String id= request.getParameter("id");
            String title=request.getParameter("title");
            String status=request.getParameter("status");
         
            
            
            try
            {
                Connection conn= new Connect().getConnection();
                PreparedStatement ps= conn.prepareStatement("update category set categoryName=?, categoryStatus=? where categoryId=?");
                ps.setString(1,title);
                ps.setString(2,status);
                ps.setString(3,id);
                
                int i=ps.executeUpdate();
                
                if(i>0)
                {
                    
                    PreparedStatement ps1=conn.prepareStatement("update subcategory set subCategoryStatus=? where categoryId=?");
                    ps1.setString(1,status);
                    ps1.setString(2,id);
                    ps1.executeUpdate();
                    
                    PreparedStatement ps2=conn.prepareStatement("update item set itemStatus=? where categoryId=?");
                    ps2.setString(1,status);
                    ps2.setString(2,id);
                    ps2.executeUpdate();
                    
                    out.println("<script type=\"text/javascript\">");
                        out.println("alert('Category Updated')");
                        out.println("window.location.href='admin/view_Category.jsp'");
                        out.println("</script>");

            }
                else
                {
                    out.println("<script type=\"text/javascript\">");
                        out.println("alert('Problem in updating')");
                        out.println("window.location.href='admin/view_Category.jsp'");
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
