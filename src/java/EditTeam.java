/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Connection.Connect;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Sanya Dhall
 */
@MultipartConfig(
fileSizeThreshold = 1024*1024*2, 
maxFileSize = 1024*1024*10,
maxRequestSize = 1024*1024*50
)
public class EditTeam extends HttpServlet {
private final String filepath="C:\\Users\\Sanya Dhall\\Documents\\NetBeansProjects\\WebApplication1\\web\\admin\\images";

 private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length()-1);
            }
        }
        return "";
    }
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
           
            
            String id=request.getParameter("id");
            
            
            String name=request.getParameter("title");
           
            String email= request.getParameter("email");
          
            String des=request.getParameter("des");
            
            String mobile= request.getParameter("mobile");
            
       
            
             Part filepart=request.getPart("image");
             
            Connection conn=new Connect().getConnection();
               
             
                 String photo;
                 File file=new File(filepath);
                String fileName=extractFileName(filepart);
                fileName=new File(fileName).getName();
              
                try
                {
                    if(filepart.getSize()>0)
             {
                filepart.write(filepath + File.separator + fileName);
                PreparedStatement ps=conn.prepareStatement("update team set name=?,designation=?,image=?,mobile=? where id=?");
                
                ps.setString(1,name);
                ps.setString(2,des);
                ps.setString(3,fileName);
                ps.setString(4,mobile);
                ps.setString(5,id);
               
           
               
                int i=ps.executeUpdate();
                if(i>0)
               {
                  out.println("<script type=\"text/javascript\">");
                out.println("alert('Team Updated Successfully!!')");
                out.println("window.location.href='admin/View_team.jsp'");
                out.println("</script>");
              
                 }
                
                 else
               {
                  out.println("<script type=\"text/javascript\">");
                out.println("alert('Error in updating!!')");
                out.println("window.location.href='admin/View_team.jsp'");
                out.println("</script>");
               }
            }
                    else
                    {
                        PreparedStatement ps1=conn.prepareStatement("update team set name=?,designation=?,mobile=? where id=?");
                        ps1.setString(1,name);
                        ps1.setString(2,des);
                        ps1.setString(3,mobile);
                        ps1.setString(4,id);
                       
                        int i=ps1.executeUpdate();
                        if(i>0)
                        {
                      out.println("<script type=\"text/javascript\">");
                      out.println("alert('Team Updated Successfully!!')");
                      out.println("window.location.href='admin/View_team.jsp'");
                      out.println("</script>");
                       
                      }
                
                      else
                      {
                      out.println("<script type=\"text/javascript\">");
                      out.println("alert('Error in updating!!')");
                      out.println("window.location.href='admin/View_team.jsp'");
                      out.println("</script>");
                      }
                     }
                }
                
                catch(SQLException e)
                { out.println(e);}
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
