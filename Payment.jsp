<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Connection.Connect"%>
<%@page import="java.sql.Connection"%>
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
    <head>
        <title>Shop</title>
        <!-- for-mobile-apps -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Women's Fashion Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
            function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- //for-mobile-apps -->
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/fasthover.css" rel="stylesheet" type="text/css" media="all" />
        <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
        <!-- js -->
        <script src="js/jquery.min.js"></script>
        <!-- //js -->
        <!-- cart -->
        <script src="js/simpleCart.min.js"></script>
        <!-- cart -->
        <!-- for bootstrap working -->
        <script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
        <!-- //for bootstrap working -->
        <link href='//fonts.googleapis.com/css?family=Glegoo:400,700' rel='stylesheet' type='text/css'>
        <link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
        <!-- start-smooth-scrolling -->
        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                $(".scroll").click(function (event) {
                    event.preventDefault();
                    $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
                });
            });
        </script>
        <!-- //end-smooth-scrolling -->
    </head>

    <body>
        <!-- header -->

        <jsp:include page="header.jsp"></jsp:include>

            <!--header-->
            <br/>
            <br/>
            <div class="container"> 
                <h1 align="center"> <strong> CheckOut/Payment</strong></h1><hr/>
                <br/>

                <div class="agile_mail_grids">

                    <div class="col-sm-2"></div>
                    <fieldset style="border-collapse:right">
                        <form action="../Order" method="post">
                        <%
                            String email=session.getAttribute("email").toString();
                            Connection conn = new Connect().getConnection();
                            PreparedStatement ps = conn.prepareStatement("select * from checkout where email=?");
                            ps.setString(1, email);
                            ResultSet rs = ps.executeQuery();
                            if (rs.next()) {


                        %>
                        <input type="hidden" name="name" value="<%=rs.getString("name")%>">
                        <input type="hidden" name="address" value="<%=rs.getString("address")%>">
                        <input type="hidden" name="mobile" value="<%=rs.getString("mobile")%>">
                        <input type="hidden" name="country" value="<%=rs.getString("country")%>">
                        <input type="hidden" name="city" value="<%=rs.getString("city")%>">
                        <input type="hidden" name="pin" value="<%=rs.getString("pin")%>">
                      <input type="hidden" name="email" value="<%=email%>">

                        
                        <div class="col-md-6 contact-left justify-center">
                            <h3><strong>Address :</strong></h3>

                            <span><%=rs.getString("address")%></span>
                            <ul class="pull-center">
                                <li>Name :   <%=rs.getString("name")%></li>
                                <li>Mobile :   <%=rs.getString("mobile")%></li>
                                <li>Email :  <%=rs.getString("email")%></li>
                                <li>Country :   <%=rs.getString("country")%></li>
                                <li>City :    <%=rs.getString("city")%></li>
                                <li>Pin :   <%=rs.getString("Pin")%></li>

                            </ul>
                            <%}%>
                        </div>
                        

                        <div class="col-md-6 contact-left">
                            <%
                                int total = 0;
                                int g = 0;
                               
                                
                                PreparedStatement ps1 = conn.prepareStatement("select * from cart where email=?");
                                ps1.setString(1, email);
                                ResultSet rs1 = ps1.executeQuery();

                                while (rs1.next()) {

                                    int q = Integer.parseInt(rs1.getString("quantity"));
                                    int p = Integer.parseInt(rs1.getString("price"));
                                    int d = Integer.parseInt(rs1.getString("discount"));
                                    int m = p * d / 100;
                                    int amount = p - m;

                                    int f = amount * q;

                                    total = total + f;
                                 
                                }%>
                                
                                    
                            <h3 class="justify-center"><strong>Total Amount :</strong></h3>


                            <ul class=""> 
                                <li>Total :&#8377    <%=total%></li>
                               
                                

                                

                            
                                <br/>
                                <br/>

                                <h3 class="justify-center"><strong>Payment Method :</strong></h3>
                                <br/>
                                <li> Cash On Delivery: <input type="radio" checked="true"></li>

                            </ul>
                            <input type="submit"value="Place Order" class="btn btn-success"><span class="glyphicon glyphicon-menu-right" aria-hidden="true" ></span>
                        </div>
                    </form>
                </fieldset>   
                <hr/>
                <br/>
            </div>
        </div>

        <!-- footer -->
        <jsp:include page="footer.jsp"></jsp:include>
        <!-- //footer -->
    </body>
</html>
