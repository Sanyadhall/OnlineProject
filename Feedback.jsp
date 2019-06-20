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
        <div class="newsletter">
            <div class="container">
                <div class="col-md-6 w3agile_newsletter_left">
                    <h3>LEAVE YOUR FEEDBACK HERE</h3>
                    <p>Write Us Freely  :)</p>
                </div>
                <div class="col-md-2 pull-right">
                    <%
                        if (session.getAttribute("email") == null) {
                    %>	

                    <a href="Login.jsp" class="btn btn-info btn-group-lg">GIVE FEEDBACK</a>
                    <%} else {%>
                    <a href="Testimonial.jsp" class="btn btn-info btn-group-lg">GIVE FEEDBACK</a>
                    <%}%>

                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
    </body>
</html>
