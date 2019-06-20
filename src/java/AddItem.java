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
public class AddItem extends HttpServlet {
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
            
            
            String category=request.getParameter("category");
            String state= request.getParameter("state");
            String price=request.getParameter("price");
            String name=request.getParameter("title");
            String stock=request.getParameter("stock");
            String discount=request.getParameter("discount");
            String season= request.getParameter("season");
            String feature=request.getParameter("feature");
            String upcoming=request.getParameter("upcoming");
            String description=request.getParameter("description");
            String status=request.getParameter("status");
            
            Part filepart=request.getPart("image");
             String photo;
              File file=new File(filepath);
                String fileName=extractFileName(filepart);
                fileName=new File(fileName).getName();
            filepart.write(filepath + File.separator + fileName);
try
{
  Connection conn= new Connect().getConnection();
  PreparedStatement ps= conn.prepareStatement("insert into item(categoryId,subCategoryId,itemName,image,price,stock,discount,season,feature,upcoming,description,itemStatus) values (?,?,?,?,?,?,?,?,?,?,?,?)");
  ps.setString(1,category);
  ps.setString(2,state);
  ps.setString(3,name);
  ps.setString(4,fileName);
  ps.setString(5,price);
  ps.setString(6, stock);
  ps.setString(7,discount);
  ps.setString(8,season);
  ps.setString(9,feature);
  ps.setString(10,upcoming);
  ps.setString(11,description);
  ps.setString(12,status);
  
  
  int i=ps.executeUpdate();
  if(i>0)
  {
      out.println("<script type=\"text/javascript\">");
                        out.println("alert('Item Added')");
                        out.println("window.location.href='admin/view_Item.jsp'");
                        out.println("</script>");

  }
  else
  {
      out.println("<script type=\"text/javascript\">");
                        out.println("alert('Problem in adding Item')");
                        out.println("window.location.href='admin/Add_Item.jsp'");
                        out.println("</script>");

  }
}
catch(Exception e){
    
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
