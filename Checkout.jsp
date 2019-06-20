
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Connection.Connect"%>
<%@page import="java.sql.Connection"%>
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
			<h2>Checkout</h2>
		</div>
	</div>
<!-- //banner -->

<!-- breadcrumbs -->
	<div class="breadcrumb_dress">
		<div class="container">
			<ul>
				<li><a href="index.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Home</a> <i>/</i></li>
				<li>Checkout</li>
			</ul>
		</div>
	</div>
<!-- //breadcrumbs -->

<!-- checkout -->
	<div class="checkout">
		<div class="container">
                         
	

			<div class="checkout-right">
				<table class="timetable_sub">
					<thead>
                                            
                                            
                                   
						<tr>
							<th>SL No.</th>
                                                        <th>Product</th>
							<th>Quantity</th>
							<th>Product Name</th>
							<th>Price</th>
							<th>Discounted Price</th>
                                                        <th>Final Price</th>
							<th>Remove</th>
						</tr>
					</thead>
                                      <%
                             int i=1;
                                            String email= session.getAttribute("email").toString();
                                            Connection conn= new Connect().getConnection();
                                            PreparedStatement ps= conn.prepareStatement("select * from cart where email=?");
                                            ps.setString(1,email);
                                            ResultSet rs=ps.executeQuery();
                                            
                                            while(rs.next())
                                            {
                                            %>  
					<tr>
						<td class="invert"><%=i++%></td>
						<td class="invert-image"><a href="SingleProduct1.jsp?id=<%=rs.getString("itemId")%>"><img src="../admin/images/<%=rs.getString("image")%>" alt=" " class="img-responsive" /></a></td>
						<td class="invert">
                                                    <form action="../UpdateQuantity" method="post">
                                                        <input type="hidden" name="id" value="<%=rs.getString("itemId")%>">
                                                        <input type="hidden" name="email" value="<%=rs.getString("email")%>">
                                                        <input type="number" name="quantity" value="<%=rs.getString("quantity")%>" min="1" max="100" > <input type="submit" class="btn btn-primary" value="+">
                                                    </form>
						</td>
						<td class="invert"><%=rs.getString("itemName")%></td>
                                                <td class="invert">&#8377 <%=rs.getString("price")%></td>
                                                
                                                  <%
                                            int q=Integer.parseInt(rs.getString("quantity"));
                                            int p = Integer.parseInt(rs.getString("price"));
                                            int d = Integer.parseInt(rs.getString("discount"));
                                            int m = p * d / 100;
                                            int amount = p - m;
                                            int f=amount*q;

                                        %>
                                                
						<td class="invert">&#8377 <%=amount%></td>
                                                 <td class="invert">&#8377 <%=f%></td>
						<td class="invert">
                                                    <div><a href="../DeleteCart?id=<%=rs.getString("itemId")%>&email=<%=email%>" class="glyphicon glyphicon-trash fa-5x">
                                                        </a>
								 </div>
                                                    
                                                    
                                                    
							</div>
							<script>$(document).ready(function(c) {
								$('.close1').on('click', function(c){
									$('.rem1').fadeOut('slow', function(c){
										$('.rem1').remove();
									});
									});	  
								});
						   </script>
						</td>
					</tr><%}%>
					
					
								<!--quantity-->
									<script>
									$('.value-plus').on('click', function(){
										var divUpd = $(this).parent().find('.value'), newVal = parseInt(divUpd.text(), 10)+1;
										divUpd.text(newVal);
									});

									$('.value-minus').on('click', function(){
										var divUpd = $(this).parent().find('.value'), newVal = parseInt(divUpd.text(), 10)-1;
										if(newVal>=1) divUpd.text(newVal);
									});
									</script>
								<!--quantity-->
				</table>
			</div>
			<div class="checkout-left">	
				<div class="checkout-left-basket">
                                    
					<ul>
                                            
                                            <%
int total=0;
                                                PreparedStatement ps1= conn.prepareStatement("select * from cart where email=?");
                                            ps1.setString(1,email);
                                            ResultSet rs1=ps1.executeQuery();
                                            
                                            while(rs1.next())
                                            {
                                            
                                                
                                          int q=Integer.parseInt(rs1.getString("quantity"));
                                            int p = Integer.parseInt(rs1.getString("price"));
                                            int d = Integer.parseInt(rs1.getString("discount"));
                                            int m = p * d / 100;
                                            int amount = p - m;
                                            int f=amount*q;

                                               
                                              total=total+f;
                                            }%>
						
						<li>Total <i>-</i> <span><%=total%></span></li>
                                                
                                                
                                                <a href="Basket.jsp"><h4>Continue to basket</h4></a>
					</ul>
				</div>
				<div class="checkout-right-basket">
					<a href="home.jsp"><span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>Continue Shopping</a>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	
	
<!-- //checkout -->

<!-- footer -->
	<jsp:include page="footer.jsp"></jsp:include>
<!-- //footer -->
</body>
</html>