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
import java.sql.ResultSet;
import java.util.Date;
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
                 fileSizeThreshold = 1024 * 1024 * 2,
                 maxFileSize = 1024 * 1024 * 10,
                 maxRequestSize = 1024 * 1024 * 50
)
public class Cart extends HttpServlet {

    private final String filepath = "C:\\Users\\Sanya Dhall\\Documents\\NetBeansProjects\\WebApplication1\\web\\admin\\images";

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
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
                     throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            String email = request.getParameter("email");
            System.out.println("EMAIL" + email);
            String pin = request.getParameter("pin");
            System.out.println("Pin" + pin);
            String id = request.getParameter("id");
            System.out.println("Item Id" + id);
            String itemName = request.getParameter("itemName");
            System.out.println("itemName" + itemName);
            String price = request.getParameter("price");
            System.out.println("Price" + price);
            String discount = request.getParameter("discount");
            System.out.println("Discount" + discount);
            String quantity = request.getParameter("quantity");
            int a = Integer.parseInt(quantity);
            System.out.println("Quantity" + quantity);
            String image = request.getParameter("image");
            System.out.println("image" + image);

            try {
                Connection conn = new Connect().getConnection();
                PreparedStatement ps = conn.prepareStatement("select * from cart where itemId=? and email=?");
                ps.setString(1, id);
                ps.setString(2, email);

                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    if (rs.getString("itemId").equals(id)) {
                        int q = rs.getInt("quantity");
                        int q1 = q + a;
                        if (q <= 99)
                        {
                            PreparedStatement ps2 = conn.prepareStatement("update cart set quantity=? where itemId=? and email=?");
                            ps2.setInt(1, q1);
                            ps2.setString(2, id);
                            ps2.setString(3, email);
                            int i = ps2.executeUpdate();
                            if (i > 0) {
                                out.println("<script type=\"text/javascript\">");
                                out.println("alert('Cart Updated!!')");
                                out.println("window.location.href='front/Checkout.jsp?id=" + id + "&pin=" + pin + "&email=" + email + "'");
                                out.println("</script>");
                            } else {
                                out.println("<script type=\"text/javascript\">");
                                out.println("alert('Problem in updating Cart')");
                                out.println("window.location.href='front/SingleProduct1.jsp?id=" + id + "&pin=" + pin + "'");
                                out.println("</script>");
                            }
                        }
                        else if(q>=99) {
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('Quntity should not Exceed 100')");
                            out.println("window.location.href='front/SingleProduct1.jsp?id=" + id + "&pin=" + pin + "'");
                            out.println("</script>");
                        }

                    }
                } else {
                    PreparedStatement ps1 = conn.prepareStatement("insert into cart(itemId,itemName,price,discount,date,image,pin,email,quantity)values(?,?,?,?,CURDATE(),?,?,?,?)");
                    ps1.setString(1, id);
                    ps1.setString(2, itemName);
                    ps1.setString(3, price);
                    ps1.setString(4, discount);
                    ps1.setString(5, image);
                    ps1.setString(6, pin);
                    ps1.setString(7, email);
                    ps1.setString(8, quantity);

                    int i = ps1.executeUpdate();
                    if (i > 0) {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Item Added To Cart!!')");
                        out.println("window.location.href='front/Checkout.jsp?id=" + id + "&pin=" + pin + "&email=" + email + "'");
                        out.println("</script>");
                    } else {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Problem In Adding Item Please Try Again!!')");
                        out.println("window.location.href='front/SingleProduct1.jsp?id=" + id + "&pin=" + pin + "'");
                        out.println("</script>");
                    }
                }
            } catch (Exception e) {
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
