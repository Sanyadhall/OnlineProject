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
maxRequestSize = 1024*1024*50)



public class EditItem1 extends HttpServlet {
private final String filepath="C:\\Users\\Sanya Dhall\\Documents\\NetBeansProjects\\WebApplication1\\web\\admin\\images";
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    
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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
                     throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            Part filepart=request.getPart("image");
             
            Connection conn=new Connect().getConnection();
                String id=request.getParameter("id");
                String name=request.getParameter("title");
                String price=request.getParameter("price");
                String stock=request.getParameter("stock");
                String discount=request.getParameter("discount");
                String season=request.getParameter("season");
                String feature=request.getParameter("feature");
                String upcoming= request.getParameter("upcoming");
                String description = request.getParameter("description");
                String status=request.getParameter("status");
                String photo;
                File file=new File(filepath);
                String fileName=extractFileName(filepart);
                fileName=new File(fileName).getName();
              
                try
                {
                    if(filepart.getSize()>0)
             {
                filepart.write(filepath + File.separator + fileName);
  PreparedStatement ps= conn.prepareStatement("update item set itemName=?,image=?,price=?,stock=?,discount=?,season=?,feature=?,upcoming=?,description=?,itemStatus=? where itemId=?");
  
  ps.setString(1,name);
  ps.setString(2,fileName);
  ps.setString(3,price);
  ps.setString(4, stock);
  ps.setString(5,discount);
  ps.setString(6,season);
  ps.setString(7,feature);
  ps.setString(8,upcoming);
  ps.setString(9,description);
  ps.setString(10,status);
  ps.setString(11, id);
               
                int i=ps.executeUpdate();
                if(i>0)
               {
                  out.println("<script type=\"text/javascript\">");
                out.println("alert('Item Updated Successfully!!')");
                out.println("window.location.href='admin/subview_Item.jsp'");
                out.println("</script>");
                //response.sendRedirect("./view_Banner.jsp");
                 }
                
                 else
               {
                  out.println("<script type=\"text/javascript\">");
                out.println("alert('Error in updating!!')");
                out.println("window.location.href='admin/subeditItemDetails.jsp'");
                out.println("</script>");
               }
            }
                    else
                    {
  PreparedStatement ps1= conn.prepareStatement("update item set itemName=?,price=?,stock=?,discount=?,season=?,feature=?,upcoming=?,description=?,itemStatus=? where itemId=?");
 
  ps1.setString(1,name);
 
  ps1.setString(2,price);
  ps1.setString(3, stock);
  ps1.setString(4,discount);
  ps1.setString(5,season);
  ps1.setString(6,feature);
  ps1.setString(7,upcoming);
  ps1.setString(8,description);
  ps1.setString(9,status);
  ps1.setString(10, id);
                       
                        int i=ps1.executeUpdate();
                        if(i>0)
                        {
                      out.println("<script type=\"text/javascript\">");
                      out.println("alert('Item Updated Successfully!!')");
                      out.println("window.location.href='admin/subview_Item.jsp'");
                      out.println("</script>");
                       //response.sendRedirect("./view_Banner.jsp");
                      }
                
                      else
                      {
                      out.println("<script type=\"text/javascript\">");
                      out.println("alert('Error in updating!!')");
                      out.println("window.location.href='admin/subeditItemDetails.jsp'");
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
