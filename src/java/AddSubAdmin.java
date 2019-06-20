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
public class AddSubAdmin extends HttpServlet {

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
           String title= request.getParameter("title");
           String email= request.getParameter("email");
           String password=request.getParameter("password");
           String status=request.getParameter("status");
           String mobile=request.getParameter("mobile");
               Part filepart=request.getPart("image");
             String photo;
              File file=new File(filepath);
                String fileName=extractFileName(filepart);
                fileName=new File(fileName).getName();
            filepart.write(filepath + File.separator + fileName);
           
           try
           {
               Connection conn= new Connect().getConnection();
               PreparedStatement ps= conn.prepareStatement("insert into subadmin(subAdminName,subAdminPassword,subAdminStatus,subAdminEmail,image,mobile) values(?,?,?,?,?,?)");
               ps.setString(1,title);
               ps.setString(2,password);
               ps.setString(3,status);
               ps.setString(4,email);
               ps.setString(5,fileName);
               ps.setString(6,mobile);
                
               
               int i=ps.executeUpdate();
               if(i>0)
               {
                   out.println("<script type=\"text/javascript\">");
                        out.println("alert('SubAdmin Added')");
                        out.println("window.location.href='admin/view_subadmin.jsp'");
                        out.println("</script>");

               }
               else
               {
                   out.println("<script type=\"text/javascript\">");
                        out.println("alert('Problem in adding SubAdmin')");
                        out.println("window.location.href='add_subadmin.jsp'");
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
