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
public class Reply extends HttpServlet {

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
            String message= request.getParameter("message");
            String subject= request.getParameter("subject");
            System.out.println(email);
            System.out.println(subject);
            System.out.println(message);
            String status="Replied";
            
            try
            {
           
                Connection conn=new Connect().getConnection();
                PreparedStatement ps=conn.prepareStatement("select * from contactUs where email=?");
                ps.setString(1,email);
                
                ResultSet rs=ps.executeQuery();
                if(rs.next())
                {
                    
                        
                        PreparedStatement ps1= conn.prepareStatement("insert into contactquery(status,inbox,name) values(?,?,?)");
                        ps1.setString(1,status);
                        ps1.setString(2,message);
                        ps1.setString(3,rs.getString("name"));
                        int i=ps1.executeUpdate();
                        if(i>0)
                        {
                            
                        PreparedStatement ps2=conn.prepareStatement("update contactUs set reply='REPLIED',status='Replied' where email=?");
                        ps2.setString(1, email);
                        ps2.executeUpdate();
                        
                       
                        mail.Mailerr.send(email, subject, message);
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Query Replied')");
                        out.println("window.location.href='admin/dashboard.jsp'");
                        out.println("</script>");
                        }
                
                    
                    else
                    {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Problem in Sending Mail')");
                        out.println("window.location.href='admin/ReplyQuery.jsp'");
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
