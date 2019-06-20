<%@page import="java.sql.ResultSet"%>
<%@page import="Connection.Connect"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Carousel de testimonios</title>
	<link rel="stylesheet" href="sss/sss.css">
	<link rel="stylesheet" href="sss/estilos.css">
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script src="sss/sss.js"></script>
        <script src="../sss/sss.js" type="text/javascript"></script>
        <script src="../sss/sss.min.js" type="text/javascript"></script>
        <link href="../sss/sss.css" rel="stylesheet" type="text/css"/>
	<script>
	    jQuery(function($){
	        $('.slider-testimonial').sss({
	        	slideShow : true,
	        	speed : 3500
	        });
	    });
	</script>
	<style>
	body{
	background-color:white;
	}
	</style>
</head>

	<div class="wrapper">
              
		<div class="slider-testimonial">
			<div class="testimonial-item">
                            
				<div class="testimonial-client">
                                    <%
                                                                            Connection conn= new Connect().getConnection();
                                                                            PreparedStatement ps= conn.prepareStatement("select * from testimonial");
                                                                            ResultSet rs= ps.executeQuery();
                                                                            
                                                                            while(rs.next())
                                                                            {
                                                                            %>
					<img src="client.png" alt="">
					<p class="client-name"><%=rs.getString("name")%></p>
				</div>
				<div class="testimonial-text">
					<p><%=rs.getString("review")%></p>
				</div><%}%>
			</div>
			
			
		</div>
	</div>
</body>
</html>