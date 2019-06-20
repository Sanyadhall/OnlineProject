<%@page import="Connection.Connect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
<title>Women's Fashion a Ecommerce Online Shopping Category Flat Bootstrap Responsive Website Template | Home :: w3layouts</title>
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
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script>
<!-- //end-smooth-scrolling -->
</head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop</title>
    </head>
    <body>
        <!-- footer -->
	<div class="footer">
		<div class="container">
			<div class="w3_footer_grids">
				<div class="col-md-3 w3_footer_grid">
					<h3>Contact</h3>
					<p>Duis aute irure dolor in reprehenderit in voluptate velit esse.</p>
					<ul class="address">
						<li><i class="glyphicon glyphicon-map-marker" aria-hidden="true"></i>1234k Avenue, 4th block, <span>New York City.</span></li>
						<li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i><a href="mailto:info@example.com">info@example.com</a></li>
						<li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>+1234 567 567</li>
					</ul>
				</div>
				<div class="col-md-3 w3_footer_grid">
					<h3>Information</h3>
					<ul class="info"> 
						<li><a href="aboutUs.jsp">About Us</a></li>
						<li><a href="mail.jsp">Contact Us</a></li>
						
						<li><a href="faq.jsp">FAQ's</a></li>
						<li><a href="Product.jsp">Special Products</a></li>
					</ul>
				</div>
				<div class="col-md-3 w3_footer_grid"> 
                                   

					<h3>Category</h3>
                                         <%
                                            Connection conn = new Connect().getConnection();
                                            PreparedStatement ps1 = conn.prepareStatement("select * from category");
                                            ResultSet rs1 = ps1.executeQuery();
                                            while (rs1.next()) {
                                        %>
                                       
					<ul class="info"> 
						<li><a href="Product.jsp?id<%=rs1.getString("categoryId")%>"><%=rs1.getString("CategoryName")%></a></li>
						
					</ul><%}
%>
				</div>
				<div class="col-md-3 w3_footer_grid">
					<h3>Profile</h3>
					<ul class="info"> 
						<li><a href="products.jsp">Summer Store</a></li>
                                                 <%
                            if (session.getAttribute("email") == null) {
                        %>
						<li><a href="Login.jsp">My Cart</a></li>
                                                <%}
                                                else
{
%>
                                                <li><a href="Checkout.jsp">My Cart</a></li>
                                                <%}%>
					</ul>
					<h4>Follow Us</h4>
					<div class="agileits_social_button">
						<ul>
							<li><a href="www.facebook.com" class="facebook"> </a></li>
							<li><a href="www.twitter.com" class="twitter"> </a></li>
							<li><a href="www.google.com" class="google"> </a></li>
							<li><a href="www.pinterest.com" class="pinterest"> </a></li>
						</ul>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
		<div class="footer-copy">
			<div class="footer-copy1">
				<div class="footer-copy-pos">
					<a href="#home1" class="scroll"><img src="images/arrow.png" alt=" " class="img-responsive" /></a>
				</div>
			</div>
			<div class="container">
				<p>&copy; 2019 Oogan's Wear. All rights reserved | Design by <a href="">Diction Technology</a></p>
			</div>
		</div>
	</div>
<!-- //footer -->



    </body>
</html>
