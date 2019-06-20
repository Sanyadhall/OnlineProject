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
public class AddPin1 extends HttpServlet {

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
           int flag=1;
            
            String pin= request.getParameter("pin");
            
            
            try
            {
               
                Connection conn= new Connect().getConnection();
                PreparedStatement ps=conn.prepareStatement("select * from pin where pin=?");
                ps.setString(1,pin);
                ResultSet rs=ps.executeQuery();
                if(rs.next())
                {
                    if(rs.getString("pin").equals(pin))
                    {
                        
                    out.println("<script type=\"text/javascript\">");
                        out.println("alert('Pin Already Exists')");
                        out.println("window.location.href='admin/subAddPin.jsp'");
                        out.println("</script>");
                    }
                    
                }
                else if(flag==1)
                {
                    
                
                PreparedStatement ps1= conn.prepareStatement("insert into pin(pin) values(?)");
                ps1.setString(1,pin);
                
                int i=ps1.executeUpdate();
                if(i>0)
                {
                    out.println("<script type=\"text/javascript\">");
                        out.println("alert('Pin Added')");
                        out.println("window.location.href='admin/subview_Pin.jsp'");
                        out.println("</script>");

                }
                else
                {
                    out.println("<script type=\"text/javascript\">");
                        out.println("alert('Problem in Adding Pin')");
                        out.println("window.location.href='admin/subAddPin.jsp'");
                        out.println("</script>");

               
            }
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
