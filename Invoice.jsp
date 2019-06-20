<%@page import="Connection.Connect"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>

<link href="plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<%@page import="java.sql.PreparedStatement"%>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Invoice</title>
        <link href="css/invoice.css" rel="stylesheet" type="text/css"/>
        <link href="css/invoice_1.css" rel="stylesheet" type="text/css"/>
        <link rel="icon" href="images/logo_green.png" type="image/png" sizes="16x16">   
        <link rel="stylesheet" href="invoice.css" media="all" />
    </head>



    <body>

        <header class="clearfix">
            <div id="logo">
            </div>
            <%
                Connection c = new Connect().getConnection();
                PreparedStatement paq = c.prepareStatement("select * from contactDetails");
                ResultSet rn = paq.executeQuery();
                if (rn.next()) {
            %>
            <div id="company">
                <h2 class="name">Oogans's Wear</h2>
                <div><%=rn.getString("address")%></div>
                <div><%=rn.getString("mobile")%></div>
            </div>
            <%}%>
        </header>

        <main>
            <div id="details" class="clearfix">
                <div id="client">
                    <h2 class="name"></h2>
                    <div class="address"></div>
                    <div class="email"></div>
                </div>
                <div id="invoice">

                    <h1>INVOICE </h1>
                    <div class="date">Date of Invoice: </div>
                </div>
            </div>
            <table border="0" cellspacing="0" cellpadding="0">
                <thead>
                    <tr>
                        <th class="no">#</th>
                        <th class="desc">Product Name</th>
                        <th class="unit">UNIT PRICE</th>
                        <th class="unit">DISCOUNT%</th>
                        <th class="qty">QUANTITY</th>
                        <th class="unit"> Discount Price</th>
                        <th class="total">TOTAL Price</th>
   
                    </tr>
                </thead>
                <tbody>
                    <%
int total=0;
int i=1;
                        String orderId = "";
                        orderId = request.getParameter("orderId");
                        Connection c121 = new Connect().getConnection();
                        PreparedStatement pes1 = c121.prepareStatement("SELECT * FROM orderTable  where randomNumber=? ;");
                        pes1.setString(1,orderId);

                        ResultSet rs1 = pes1.executeQuery();
                        while (rs1.next()) {
                                           int q=Integer.parseInt(rs1.getString("quantity"));
                                            int p = Integer.parseInt(rs1.getString("price"));
                                            int d = Integer.parseInt(rs1.getString("discount"));
                                            int m = p * d / 100;
                                            int amount = p - m;
                                            int f=amount*q;

                                               
                                              total=total+f;

                    %> 

                    <tr>

                        <td class="no"><%=i++%></td>
                        <td class="desc"><h3><%=rs1.getString("itemName")%></h3></td>
                        <td class="unit"><%=rs1.getString("price")%></td>
                        <td class="unit"><%=d%>%</td>
                        <td class="qty"><%=rs1.getString("quantity")%></td>
                        <td class="unit">&#8377 <%=amount%> </td>
                        <td class="total">&#8377 <%=f%></td>


                    </tr>
                    <%}%>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="3"></td>
                        <td colspan="3">SUBTOTAL</td>
                        <td>&#8377 <%=total%> </td>
                    </tr>
                    <tr>
                        <td colspan="3"></td>
                        <td colspan="3">GRAND TOTAL</td>
                        <td>&#8377 <%=total%></td>
                    </tr>
                </tfoot>
            </table>
            <h1><input type="submit" value="print" class="btn btn-primary" onClick="window.print()"/></h1>
            <br> <br>  <div id="notices">
                <div>NOTICE:</div>
                <div class="notice">Once The Order Is Dispatched You Cannot Cancel The Order.</div>
            </div>
        </main>

    <br><br> <center><div class="main col-md-10 col-md-offset-1">

            <!-- page-title start -->
            <!-- ================ -->
            <h1 class="page-title margin-top-clear text-center">Thank You!</h1>
            <div class="space"></div>
            <!-- page-title end -->
            <p class="lead text-center">Thanks to shopping in our Website</p>
            <div class="text-center"><a href="home.jsp" class="btn btn-success btn-primary btn-success"><button class="btn btn-danger">Go To Home</button></a></div>
        </div>
    </center>

    <footer>
        Invoice was created on a computer and is valid without the signature and seal.
    </footer>

</body>

</html>


