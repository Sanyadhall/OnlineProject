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
public class Order extends HttpServlet {

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

            String mobile = request.getParameter("mobile");
            String address = request.getParameter("address");
            String country = request.getParameter("country");
            String city = request.getParameter("city");
            String pin = request.getParameter("pin");
            String email = request.getParameter("email");
            String name = request.getParameter("name");
            int randomPIN = (int) (Math.random() * 90000) + 10000;
            String val = "" + randomPIN;
            System.out.println(val);
            String status = "Pending";
            String Body = "<h2>Details Of Your Order</h2><br><table border=\"2\" width=\"6\" cellspacing=\"4\" cellpadding=\"4\"><thead style=\"color:#003366;font-family:Helvetica;background-color:cornsilk;\"><tr><td>Order Id</td><td>Name</td><td>Email</td><td>Address</td><td>Product Name</td><td>quantity</td><td>Price</td><td>Discount</td><td>Discount Price</td></tr></thead><tbody>";

            try {
                int g = 0;
                int total = 0;
                Connection conn = new Connect().getConnection();
                PreparedStatement ps1 = conn.prepareStatement("select * from cart where email=?");
                ps1.setString(1, email);
                System.out.println(ps1);
                ResultSet rs = ps1.executeQuery();

                System.out.println(rs);
                while (rs.next()) {
                    System.out.println("Before adding order");
                    int q = Integer.parseInt(rs.getString("quantity"));
                    int p = Integer.parseInt(rs.getString("price"));
                    int d = Integer.parseInt(rs.getString("discount"));
                    int m = p * d / 100;
                    int amount = p - m;

                    int f = amount * q;

                    total = total + f;
                  
                 
                    PreparedStatement ps = conn.prepareStatement("insert into orderTable (name,mobile,address,pin,country,city,price,discountPrice,email,itemId,quantity,itemName,randomNumber,status,discount,date) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,CURDATE())");
                    ps.setString(1, name);
                    ps.setString(2, mobile);
                    ps.setString(3, address);
                    ps.setString(4, pin);
                    ps.setString(5, country);
                    ps.setString(6, city);
                    ps.setInt(7, p);
                    ps.setInt(8, amount);
                    
                    ps.setString(9, email);
                    ps.setString(10, rs.getString("itemId"));
                    ps.setInt(11, q);
                    ps.setString(12, rs.getString("itemName"));
                    ps.setString(13, val);
                    ps.setString(14, status);
                    ps.setInt(15,d);
                    ps.executeUpdate();

                    PreparedStatement ps2 = conn.prepareStatement("delete from cart where email=?");
                    ps2.setString(1, email);
                    ps2.executeUpdate();
                }
                System.out.println("After Adding Order");
                PreparedStatement ps3 = conn.prepareStatement("select * from ordertable where email=?");
                ps3.setString(1, email);

                ResultSet rs3 = ps3.executeQuery();

                System.out.println(ps3);
                System.out.println(rs3);
                while (rs3.next()) {
                    System.out.println("hello");
                    Body = Body + "<tr><td>" + val + "</td><td>" + rs3.getString("name") + "</td><td>" + rs3.getString("email") + "</td><td>" + rs3.getString("address") + "</td><td>" + rs3.getString("itemName") + "</td><td>" + rs3.getString("quantity") + "</td><td>" + rs3.getString("price") + "</td><td>"+ rs3.getString("discount") +"%"+ "</td><td>"+ rs3.getString("discountPrice") + "</td></tr>";

                    //Body=Body+"</tbody></table>";
                    System.out.println(Body);
                    out.println("<script type=\"text/javascript\">");

                    out.println("location='front/Invoice.jsp?orderId=" + val + "'");
                    out.println("</script>");
                }
                     System.out.println("I am here after order set");
                //String Body = "<h2>Details Of Your Order</h2><br><table border=\"2\" width=\"6\" cellspacing=\"4\" cellpadding=\"4\"><thead style=\"color:#003366;font-family:Helvetica;background-color:cornsilk;\"><tr><td>Order Id</td><td>Name</td><td>Email</td><td>Address</td><td>Product Name</td><td>Product Code</td><td>quantity</td><td>Price</td><td>Discount</td><td>Discount Price</td><td>Payment Mode</td><td>Total Amount</td></tr></thead><tbody><tr><td>" + random1 + "</td><td>" + name1 + "</td><td>" + email12 + "</td><td>" + Add + "</td><td>" + Pname1 + "</td><td>" + pco + "</td><td>" + quty + "</td><td>" + price12 + "</td><td>" + dis + "</td><td>" + dprice2 + "</td><td>" + payment1 + "</td><td>" + tott + "</td></tr></tbody></table>";
                String subject = "Your Order " + val + " Has Been Confirmed";
                mail.Mailerr.send(email, subject, Body);
                String EmailRe = null;
                PreparedStatement p1 = conn.prepareStatement("select * from admin");
                ResultSet rs0 = p1.executeQuery();

                System.out.println(rs0);
                if (rs0.next()) {
                    System.out.println("Hello2");
                    EmailRe = rs0.getString("email");

                }
                String subject12 = "New Order " + val + "";
                mail.Mailerr.send(EmailRe, subject12, Body);

                out.println("<script type=\"text/javascript\">");

                out.println("window.location.href='front/Invoice.jsp?orderId=" + val + "'");
                out.println("</script>");

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
