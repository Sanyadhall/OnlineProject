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
        <title>Women's Fashion a Ecommerce Online Shopping Category Flat Bootstrap Responsive Website Template | Dresses :: w3layouts</title>
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
        <!-- banner -->
        <div class="banner1" id="home1">
            <div class="container">
                <h2>trendy fashion dresses<span>up to</span> 30% <i>Discount</i></h2>
            </div>
        </div>
        <!-- //banner -->
        <!-- breadcrumbs -->
        <div class="breadcrumb_dress">
            <div class="container">
                <ul>
                    <li><a href="home.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Home</a></li>
                    <li></li>
                </ul>
            </div>
        </div>
        <!-- //breadcrumbs -->

        <!-- dresses -->
        <div class="dresses">
            <div class="container">
                <div class="w3ls_dresses_grids">
                    <div class="col-md-4 w3ls_dresses_grid_left">
                        <div class="w3ls_dresses_grid_left_grid">
                            <h3>Categories</h3>
                            <div class="w3ls_dresses_grid_left_grid_sub">
                                <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                                    <div class="panel panel-default">
                                        <div class="panel-heading" role="tab" id="headingOne">
                                            <h4 class="panel-title asd">
                                                <a class="pa_italic" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span><i class="glyphicon glyphicon-minus" aria-hidden="true"></i>New Arrivals
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                                            <div class="panel-body panel_text">
                                                <ul>
                                                    <li><a href="dresses.jsp">Dresses</a></li>
                                                    <li><a href="sweaters.jsp">Sweaters</a></li>
                                                    <li><a href="skirts.jsp">Shorts & Skirts</a></li>
                                                    <li><a href="jeans.jsp">Jeans</a></li>
                                                    <li><a href="shirts.jsp">Shirts</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading" role="tab" id="headingTwo">
                                            <h4 class="panel-title asd">
                                                <a class="pa_italic collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span><i class="glyphicon glyphicon-minus" aria-hidden="true"></i>Foot Wear
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                                            <div class="panel-body panel_text">
                                                <ul>
                                                    <li><a href="sandals.jsp">Flats</a></li>
                                                    <li><a href="sandals.jsp">Sandals</a></li>
                                                    <li><a href="sandals.jsp">Boots</a></li>
                                                    <li><a href="sandals.jsp">Heals</a></li>
                                                    <li><a href="sandals.jsp">Shirts</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <ul class="panel_bottom">
                                    <li><a href="products.jsp">Summer Store</a></li>
                                    <li><a href="dresses.jsp">New In Clothing</a></li>
                                    <li><a href="sandals.jsp">New In Shoes</a></li>
                                    <li><a href="products.jsp">Latest Watches</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="w3ls_dresses_grid_left_grid">
                            <h3>Color</h3>
                            <div class="w3ls_dresses_grid_left_grid_sub">
                                <div class="ecommerce_color">
                                    <ul>
                                        <li><a href="#"><i></i> Red(5)</a></li>
                                        <li><a href="#"><i></i> Brown(2)</a></li>
                                        <li><a href="#"><i></i> Yellow(3)</a></li>
                                        <li><a href="#"><i></i> Violet(6)</a></li>
                                        <li><a href="#"><i></i> Orange(2)</a></li>
                                        <li><a href="#"><i></i> Blue(1)</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="w3ls_dresses_grid_left_grid">
                            <h3>Size</h3>
                            <div class="w3ls_dresses_grid_left_grid_sub">
                                <div class="ecommerce_color ecommerce_size">
                                    <ul>
                                        <li><a href="#">Medium</a></li>
                                        <li><a href="#">Large</a></li>
                                        <li><a href="#">Extra Large</a></li>
                                        <li><a href="#">Small</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="w3ls_dresses_grid_left_grid">
                            <div class="dresses_img_hover">
                                <img src="images/47.jpg" alt=" " class="img-responsive" />
                                <div class="dresses_img_hover_pos">
                                    <h4>For Kids <span>20%</span><i>Discount</i></h4>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8 w3ls_dresses_grid_right">
                        <div class="col-md-6 w3ls_dresses_grid_right_left">
                            <div class="w3ls_dresses_grid_right_grid1">
                                <img src="images/48.jpg" alt=" " class="img-responsive" />
                                <div class="w3ls_dresses_grid_right_grid1_pos">
                                    <h3>Printed <span>Cotton</span> Top</h3>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 w3ls_dresses_grid_right_left">
                            <div class="w3ls_dresses_grid_right_grid1">
                                <img src="images/49.jpg" alt=" " class="img-responsive" />
                                <div class="w3ls_dresses_grid_right_grid1_pos1">
                                    <h3>Printed Blue <span>Cotton</span> Jeans</h3>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"> </div>

                        <div class="w3ls_dresses_grid_right_grid2">
                            <div class="w3ls_dresses_grid_right_grid2_left">
                                <h3>Showing Results: 0-1</h3>
                            </div>
                            <div class="w3ls_dresses_grid_right_grid2_right">
                                <select name="select_item" class="select_item">
                                    <option selected="selected">Default sorting</option>
                                    <option>Sort by popularity</option>
                                    <option>Sort by average rating</option>
                                    <option>Sort by newness</option>
                                    <option>Sort by price: low to high</option>
                                    <option>Sort by price: high to low</option>
                                </select>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="w3ls_dresses_grid_right_grid3">
    <%

            String sId = request.getParameter("sId");
            Connection conn = new Connect().getConnection();
            PreparedStatement ps = conn.prepareStatement("select * from item where subCategoryId=?");
            ps.setString(1, sId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
        %>

                            <div class="col-md-4 agileinfo_new_products_grid agileinfo_new_products_grid_dresses">
                                <div class="agile_ecommerce_tab_left dresses_grid">
                                    <div class="hs-wrapper hs-wrapper2">
                                        <img src="../admin/images/<%=rs.getString("image")%>" alt="Image not Available" class="img-responsive" />

                                        <div class="w3_hs_bottom w3_hs_bottom_sub1">
                                            <ul>
                                                <li>
                                                    <a href="SingleProduct.jsp?id=<%=rs.getString("itemId")%>"class="glyphicon glyphicon-eye-open tooltips" title="Quick View" aria-hidden="true"><span ></span></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                        <h5><a href="SingleProduct.jsp?id=<%=rs.getString("itemId")%>"><%=rs.getString("itemName")%></a></h5>
                                    <div class="simpleCart_shelfItem">

                                        <%

                                            int p = Integer.parseInt(rs.getString("price"));
                                            int d = Integer.parseInt(rs.getString("discount"));
                                            int m = p * d / 100;
                                            int amount = p - m;

                                        %>
                                        <p><span> &#8377 <%=rs.getString("price")%></span> <i class="item_price">&#8377 <%=amount%></i></p>
                                        <p><a class="item_add" href="#">Add to cart</a></p>
                                    </div>
                                    <div class="dresses_grid_pos">
                                        <h6><%=rs.getString("discount")%> %</h6>
                                    </div>
                                </div>
                            </div>
<%}%>

                            <div class="clearfix"> </div>
                        </div>



                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
        </div>
        <div class="w3l_related_products">
            <div class="container">
                <h3>Related Products</h3>
                <ul id="flexiselDemo2">			
                    <li>
                        <div class="w3l_related_products_grid">
                            <div class="agile_ecommerce_tab_left dresses_grid">
                                <div class="hs-wrapper hs-wrapper3">
                                    <img src="images/31.jpg" alt=" " class="img-responsive">
                                    <img src="images/32.jpg" alt=" " class="img-responsive">
                                    <img src="images/33.jpg" alt=" " class="img-responsive">
                                    <img src="images/34.jpg" alt=" " class="img-responsive">
                                    <img src="images/31.jpg" alt=" " class="img-responsive">
                                    <img src="images/32.jpg" alt=" " class="img-responsive">
                                    <img src="images/33.jpg" alt=" " class="img-responsive">
                                    <img src="images/34.jpg" alt=" " class="img-responsive">
                                    <div class="w3_hs_bottom">
                                        <div class="flex_ecommerce">
                                            <a href="#" data-toggle="modal" data-target="#myModal6"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
                                        </div>
                                    </div>
                                </div>
                                <h5><a href="single.jsp">Sweater</a></h5>
                                <div class="simpleCart_shelfItem">
                                    <p class="flexisel_ecommerce_cart"><span>$312</span> <i class="item_price">$212</i></p>
                                    <p><a class="item_add" href="#">Add to cart</a></p>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="w3l_related_products_grid">
                            <div class="agile_ecommerce_tab_left dresses_grid">
                                <div class="hs-wrapper hs-wrapper3">
                                    <img src="images/32.jpg" alt=" " class="img-responsive" />
                                    <img src="images/31.jpg" alt=" " class="img-responsive" />
                                    <img src="images/33.jpg" alt=" " class="img-responsive" />
                                    <img src="images/34.jpg" alt=" " class="img-responsive" />
                                    <img src="images/31.jpg" alt=" " class="img-responsive" />
                                    <img src="images/32.jpg" alt=" " class="img-responsive" />
                                    <img src="images/33.jpg" alt=" " class="img-responsive" />
                                    <img src="images/34.jpg" alt=" " class="img-responsive" />
                                    <div class="w3_hs_bottom">
                                        <div class="flex_ecommerce">
                                            <a href="#" data-toggle="modal" data-target="#myModal6"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
                                        </div>
                                    </div>
                                </div>
                                <h5><a href="single.jsp">Sweater</a></h5>
                                <div class="simpleCart_shelfItem">
                                    <p class="flexisel_ecommerce_cart"><span>$432</span> <i class="item_price">$323</i></p>
                                    <p><a class="item_add" href="#">Add to cart</a></p>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="w3l_related_products_grid">
                            <div class="agile_ecommerce_tab_left dresses_grid">
                                <div class="hs-wrapper hs-wrapper3">
                                    <img src="images/34.jpg" alt=" " class="img-responsive" />
                                    <img src="images/37.jpg" alt=" " class="img-responsive" />
                                    <img src="images/30.jpg" alt=" " class="img-responsive" />
                                    <img src="images/36.jpg" alt=" " class="img-responsive" />
                                    <img src="images/37.jpg" alt=" " class="img-responsive" />
                                    <img src="images/30.jpg" alt=" " class="img-responsive" />
                                    <img src="images/36.jpg" alt=" " class="img-responsive" />
                                    <img src="images/38.jpg" alt=" " class="img-responsive" />
                                    <div class="w3_hs_bottom">
                                        <div class="flex_ecommerce">
                                            <a href="#" data-toggle="modal" data-target="#myModal6"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
                                        </div>
                                    </div>
                                </div>
                                <h5><a href="single.jsp">Sweater</a></h5>
                                <div class="simpleCart_shelfItem">
                                    <p class="flexisel_ecommerce_cart"><span>$323</span> <i class="item_price">$310</i></p>
                                    <p><a class="item_add" href="#">Add to cart</a></p>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="w3l_related_products_grid">
                            <div class="agile_ecommerce_tab_left dresses_grid">
                                <div class="hs-wrapper hs-wrapper3">
                                    <img src="images/55.jpg" alt=" " class="img-responsive" />
                                    <img src="images/34.jpg" alt=" " class="img-responsive" />
                                    <img src="images/30.jpg" alt=" " class="img-responsive" />
                                    <img src="images/36.jpg" alt=" " class="img-responsive" />
                                    <img src="images/37.jpg" alt=" " class="img-responsive" />
                                    <img src="images/30.jpg" alt=" " class="img-responsive" />
                                    <img src="images/36.jpg" alt=" " class="img-responsive" />
                                    <img src="images/38.jpg" alt=" " class="img-responsive" />
                                    <div class="w3_hs_bottom">
                                        <div class="flex_ecommerce">
                                            <a href="#" data-toggle="modal" data-target="#myModal6"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
                                        </div>
                                    </div>
                                </div>
                                <h5><a href="single.jsp">Sweater</a></h5>
                                <div class="simpleCart_shelfItem">
                                    <p class="flexisel_ecommerce_cart"><span>$256</span> <i class="item_price">$200</i></p>
                                    <p><a class="item_add" href="#">Add to cart</a></p>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
                <script type="text/javascript">
                    $(window).load(function () {
                        $("#flexiselDemo2").flexisel({
                            visibleItems: 4,
                            animationSpeed: 1000,
                            autoPlay: true,
                            autoPlaySpeed: 3000,
                            pauseOnHover: true,
                            enableResponsiveBreakpoints: true,
                            responsiveBreakpoints: {
                                portrait: {
                                    changePoint: 480,
                                    visibleItems: 1
                                },
                                landscape: {
                                    changePoint: 640,
                                    visibleItems: 2
                                },
                                tablet: {
                                    changePoint: 768,
                                    visibleItems: 3
                                }
                            }
                        });

                    });
                </script>
                <script type="text/javascript" src="js/jquery.flexisel.js"></script>
            </div>
        </div>
        <!-- //dresses -->
     
        <!-- footer -->
        <jsp:include page="footer.jsp"></jsp:include>
        <!-- //footer -->
    </body>
</html>