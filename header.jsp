<%-- 
    Document   : header
    Created on : 3 May, 2019, 3:17:52 PM
    Author     : Cuteepoo_pc
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Connection.Connect"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <!-- js -->
        <script src="js/jquery.min.js"></script>
        <!-- //js -->
        <!-- countdown -->
        <link rel="stylesheet" href="css/jquery.countdown.css" />
        <!-- //countdown -->
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

        <div class="header">
            <div class="container">
                <div class="w3l_login">

                </div>
                <div class="w3l_logo">
                    <h1><a href="home.jsp">Oogan's Wear<span>Not Your Regular Fashion</span></a></h1>
                </div>
                <%

                    if (session.getAttribute("email") != null) {

                %>
                <div class="cart box_1">
                    <a href="Checkout.jsp">
                        <div class="total">
                            <span class="glyphicon glyphicon-cart"></span></div>
                        <img src="images/bag.png" alt="" />
                    </a>

                    <div class="clearfix"> </div>
                </div><%}%>	
                <div class="clearfix"> </div>
            </div>
        </div>
        <div class="navigation">
            <div class="container">
                <nav class="navbar navbar-default">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header nav_2">
                        <button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div> 
                    <div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="home.jsp" class="act">Home</a></li>	
                            <!-- Mega Menu -->
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Products <b class="caret"></b></a>
                                <ul class="dropdown-menu multi-column columns-3">
                                    <div class="row">
                               
                                        <div class="row_selected">
         <%
                                            Connection conn = new Connect().getConnection();
                                            PreparedStatement ps1 = conn.prepareStatement("select * from category");
                                            ResultSet rs1 = ps1.executeQuery();
                                            while (rs1.next()) {
                                        %>

                                            <div class="col-sm-4">
                                                <ul class="multi-column-dropdown">
                                                    <h6><%=rs1.getString("categoryName")%></h6>
                                                    <%

                                                PreparedStatement ps2 = conn.prepareStatement("select * from subCategory where categoryId=?");
                                                ps2.setString(1, rs1.getString("categoryId"));
                                                ResultSet rs2 = ps2.executeQuery();
                                                while (rs2.next()) {
                                                    
                                                    %>

                                                    <li><a href="Product.jsp?sId=<%=rs2.getString("subCategoryId")%>&cId=<%=rs1.getString("categoryId")%>"><%=rs2.getString("subCategoryName")%></a></li>
<%
    }
%>
                                                </ul>
                                            </div>
                                                    <%}
                                            %>
                                                    
                                        </div>
                                    </div>                      


                                    <div class="clearfix"></div>
                                </ul>
                            </li>




                            <li><a href="aboutUs.jsp">About Us</a></li>

                            <li><a href="mail.jsp">Mail Us</a></li>

                            <%
                                if (session.getAttribute("email") == null) {

                            %>
                            <li> <a href="Login.jsp" data-target="#myModal88"><span>Sign In</span></a>
                            </li> <%} else {

                                String email = session.getAttribute("email").toString();

                                PreparedStatement ps = conn.prepareStatement("select * from user where email=?");
                                ps.setString(1, email);
                                ResultSet rs = ps.executeQuery();
                                if (rs.next()) {%> 

                            <li > <a href=""  class="dropdown-toggle" data-toggle="dropdown"><span  ><strong> Hey, <%=rs.getString("fname")%> <b class="caret"> </b></strong></span></a>

                                <ul class="dropdown-menu pull-right">

                                    <li><a href="UserDashboard.jsp"><span>View Profile</span></a></li>
                                    <li><a href="UserLogout.jsp">Logout</a></li>

                                </ul>

                            </li>

                            <%}

                                }
                            %>
                        </ul>
                    </div>
                </nav>
            </div>

        </div>
    </div>
</div>
</body>
</html>
