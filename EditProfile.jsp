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
<br/>
<div class="col-sm-3"></div>
                    <div class="register col-sm-6">
                        <h1 align="center"> <strong>Edit Profile</strong></h1>
                        <hr/>
                          <%
            String email=session.getAttribute("email").toString();
          Connection conn= new Connect().getConnection();
          PreparedStatement ps= conn.prepareStatement("select * from user where email=?");
          ps.setString(1,email);
          ResultSet rs= ps.executeQuery();
          if(rs.next());
          {
            %>
            <form action="../EditUserProfile" method="post" enctype="Multipart/form-data">
                            <table class="table table-bordered">
                                
                            <input name="id" type="hidden" value="<%=rs.getString("id")%>">
                            <input name="name" placeholder="Name" type="text" required="" value="<%=rs.getString("fname")%>">						
                            <input name="email" placeholder="Email Address" type="text" readOnly="true" value="<%=rs.getString("email")%>">
                            <input name="mobile" placeholder="Mobile Phone" maxlength="10" pattern="[6-9][0-9]{9}" type="text" required="" value="<%=rs.getString("mobile")%>">
                            <input name="image" placeholder="Image" type="file">						

                            <div class="sign-up">
                                <input type="submit" value="Submit"/>
                            </div>
                            </table>
                        </form>
                        <hr/>
                        <br/>
                        <br/>
                         <%}%>
                    </div>

            <!-- footer -->
        <jsp:include page="footer.jsp"></jsp:include>
        <!-- //footer -->
    </body>
</html>
