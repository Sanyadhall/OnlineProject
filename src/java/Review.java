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
public class Review extends HttpServlet {

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
           String name=request.getParameter("name");
            System.out.println(name);
            
           String email=request.getParameter("email");
            System.out.println(email);
            int flag=1;
           String rating=request.getParameter("selected_rating");
            System.out.println(rating);
           String review=request.getParameter("review");
            System.out.println(review);
           
                  try
                  {
                      
                      Connection conn= new Connect().getConnection();
                      PreparedStatement ps=conn.prepareStatement("select email from testimonial where email=?");
                       ps.setString(1, email);
                   ResultSet rs= ps.executeQuery();
                
                if(rs.next())
                {
                   
                   
                       PreparedStatement ps1=conn.prepareStatement("update testimonial set rating=?,review=? where email=?");
                       ps1.setString(1, rating);
                       ps1.setString(2, review);
                       ps1.setString(3, email);
                              int i=ps1.executeUpdate();
                       if(i>0)
                       {
                           out.println("<script type=\"text/javascript\">");
                           out.println("alert('Testimonial Updated!!')");
                           out.println("window.location.href='front/home.jsp'");
                           out.println("</script>");
                       }
                }
                    else if(flag==1)
                    {
                      PreparedStatement ps2=conn.prepareStatement("insert into testimonial(name,email,rating,review) values(?,?,?,?)");
                      ps2.setString(1,name);
                      ps2.setString(2,email);
                      ps2.setString(3,rating);
                      ps2.setString(4,review);
                      
                      int i=ps2.executeUpdate();
                      if(i>0)
                      {out.println("<script type=\"text/javascript\">");
                        out.println("alert('Testimonial Added')");
                        out.println("window.location.href='front/home.jsp'");
                        out.println("</script>");
                          
                      }
                      else
                      {
                          out.println("<script type=\"text/javascript\">");
                        out.println("alert('Problem in adding Testimonial')");
                        out.println("window.location.href='front/Testimonial.jsp'");
                        out.println("</script>");
                      }
                      
                  }
                
                  }
                  
                  catch(Exception e)
                  {
                      e.printStackTrace();
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
