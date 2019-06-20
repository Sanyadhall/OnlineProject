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
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
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
        <style>
            .btn-secondary {
  background-color: #aa66cc;
}
.btn-secondary:hover, .btn-secondary:focus {
  background-color: #b579d2 !important;
  color: #fff;
}
.btn-secondary.active {
  background-color: #773399 !important;
}
.btn-secondary.active:hover {
  color: #fff;
}
.btn-secondary.active:focus {
  color: #fff;
}
        </style>
        
        <!-- //end-smooth-scrolling -->
    </head>
    <!------ Include the above in your HEAD tag ---------->
    <body>
        
        <br/>
        <br/>
        <br/>
        <div class="container">
  <div class="row">
                <div class="w3l_logo">
                    <h1><a href="">Oogan's Wear<span>Not Your Regular Fashion</span></a></h1>
            
                </div>
  </div>
            <br/>
            <br/>
            <div class="row">
            <header>
  
                <ul  class="nav navbar-nav">
                    <li><a href="home.jsp" class="act"><b>Back To Home</b></a></li>
                    <li><a href="Checkout.jsp"><b>My Cart</b></a></li>
                    
                    <li><a href="Checkout.jsp" class=""> <b>Order History</b></a></li>
                    <li><a href="Testimonial.jsp" class=""><b>Give FeedBack Here</b></a></li>
                </ul>
            </header>
            </div>

            <hr/>
            <br/>
            <div class="row">
               
                <div class="panel panel-default">
                    
                    <hr/>
                    <br/>
                    <%

                        String email = session.getAttribute("email").toString();
                        Connection conn = new Connect().getConnection();
                        PreparedStatement ps = conn.prepareStatement("select * from user where email=?");
                        ps.setString(1, email);
                        ResultSet rs = ps.executeQuery();

                        if (rs.next()) {
                    %>
                    <div class="panel-body">
                        <div class="col-md-4 col-xs-12 col-sm-6 col-lg-4">
                            <img alt="User Pic" src="images/<%=rs.getString("image")%>"style="height:260px;width:260px" id="profile-image1" class="img-circle img-responsive"> 


                        </div>
                        <div class="col-md-8 col-xs-12 col-sm-6 col-lg-8" >
                            <div class="container" >
                                <h2><%=rs.getString("fname")%></h2>
                              


                            </div>
                            <hr>
                            <ul class="container details" >

                                <li><p><span class="glyphicon glyphicon-envelope one" style="width:50px;"></span><%=rs.getString("email")%></p></li>
                                <li><p><span class="glyphicon glyphicon-phone one" style="width:50px;"></span><b><%=rs.getString("mobile")%></b></p></li>
                            </ul>
                            <hr/>

                       <a href=""class="btn btn-lg btn-primary glyphicon glyphicon-pencil" tile="Change Password"> ChangePassword</a>
                       <a href="UserLogout.jsp" class="btn btn-lg btn-warning glyphicon glyphicon-off" title="Logout"> Logout</a>
                       <a href="EditProfile.jsp"class="btn btn-lg btn-secondary glyphicon glyphicon-scissors" style="color:whitesmoke" title="Edit Your Profile"> EditProfile</a>



                        </div>
                    </div>
                          
                </div>
                </div><%}%>
                  <hr/>
            </div>
            
        </div>
            
        <!-- footer -->
        <jsp:include page="footer.jsp"></jsp:include>
        <!-- //footer -->

    </body>
</html>