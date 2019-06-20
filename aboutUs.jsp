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
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script>
<!-- //end-smooth-scrolling -->
</head>
	
<body>
<!-- header -->

<jsp:include page="header.jsp"></jsp:include>

<!--header-->
<!-- banner -->
	<div class="banner10" id="home1">
		<div class="container">
			<h2>About Us</h2>
		</div>
	</div>
<!-- //banner -->

<!-- breadcrumbs -->
	<div class="breadcrumb_dress">
		<div class="container">
			<ul>
				<li><a href="index.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Home</a> <i>/</i></li>
				<li>About Us</li>
			</ul>
		</div>
	</div>
<!-- //breadcrumbs -->

<!-- about -->
	<div class="about">
		<div class="container">	
			<div class="w3ls_about_grids">
                             <%
                                  Connection conn=new Connect().getConnection();
                                  PreparedStatement ps= conn.prepareStatement("select * from aboutus");
                                  ResultSet rs= ps.executeQuery();
                                    while(rs.next())
                                    {
                                    %>
				<div class="col-md-6 w3ls_about_grid_left">
                               
					<p><%=rs.getString("aDes")%></p>
					
					
					<div class="clearfix"> </div>
				</div>
				<div class="col-md-6 w3ls_about_grid_right">
                                    <img src="../admin/images/<%=rs.getString("aImage")%>" alt=" " class="img-responsive" />
				</div>
				<div class="clearfix"> </div><%}%>
			</div>
		</div>
	</div>
<!-- //about -->

<!-- team -->
	<div class="team">
		<div class="container">
			<h3>Meet Our Team</h3>
			<div class="wthree_team_grids">
                            <%
                                PreparedStatement ps1= conn.prepareStatement("select * from team");
                                ResultSet rs1=ps1.executeQuery();
                                while(rs1.next())
                                {
                                %>
				<div class="col-md-3 wthree_team_grid">
                                    
                                <img src="../admin/images/<%=rs1.getString("image")%>" alt=" " class="img-responsive" style="width:200px;height:200px"/>
					<h4><%=rs1.getString("name")%> <span><%=rs1.getString("designation")%></span></h4>
                                                         
					<div class="agileits_social_button">
						<ul>
							<li><a href="#" class="facebook"> </a></li>
							<li><a href="#" class="twitter"> </a></li>
							<li><a href="#" class="google"> </a></li>
							<li><a href="#" class="pinterest"> </a></li>
						</ul>
					</div>
				</div>
				
				<%}%>
				
				<div class="clearfix"> </div>
				
			</div>
		</div>
	</div>
<!-- //team -->
<!-- team-bottom -->
	<div class="top-brands">
		<div class="container">
			<h3>Testimonial</h3>
			<jsp:include page="Slider.jsp"></jsp:include>
		</div>
	</div>
<!-- //team-bottom -->

<!-- footer -->
	<jsp:include page="footer.jsp"></jsp:include>
<!-- //footer -->
</body>
</html>