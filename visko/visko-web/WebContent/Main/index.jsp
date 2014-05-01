<!DOCTYPE html>
<%@ page import ="java.sql.*" %>

<%
	String warning = "";

	if( request.getParameter("email") != null && request.getParameter("password") != null )
	{
        try
        {
        	Class.forName("com.mysql.jdbc.Driver");
	        Connection con = DriverManager.getConnection("jdbc:mysql://earth.cs.utep.edu/cs4311team1sp14","cs4311team1sp14","teamTBA"); 

	        String queryString = "SELECT Uemail, Upassword, Upriv FROM Users WHERE (Uemail='"+request.getParameter("email")+"' && Upassword='"+request.getParameter("password")+"');";

	        Statement stmt = con.createStatement();
	       	ResultSet rst = stmt.executeQuery(queryString);
	        
	        String e = "";
	       	String p = "";
	       	String pr = "";

	        while( rst.next() )
	        {
	        	e = rst.getString("Uemail");
	        	p = rst.getString("Upassword");
	        	pr = rst.getString("Upriv");
	        }


	        if( !e.equalsIgnoreCase("") && !p.equalsIgnoreCase("") && !pr.equalsIgnoreCase("") )
	        {
	        	session.setAttribute("email", e);
				session.setAttribute("pass", p);
				session.setAttribute("priv", pr);
				response.sendRedirect("/visko-web/Main/Home/");				
	        }
	        else
	        {
	        	warning = "<p style='color:red'>Invalid Login.</p>";
	        }
       	}
       	catch(SQLException s){
       		warning = "<p style='color:red'>Error connecting to SQL Database: "+ s.getMessage() + "</p>";
       	}
        catch(Exception e){
            warning = "<p style='color:red'>Error: " + e.getMessage() + "</p>";
        }
	}
	/* TESTING */
	/*else{
		session.setAttribute("email", "priv@gmail.com");
		session.setAttribute("pass", "123");
		session.setAttribute("priv", "2");
		response.sendRedirect("/visko-web/Main/Home/");
	}*/
	
%>

<html lang="en">
	<head>
		<style type="text/css">
	        body { background: url(assets/img/bglight.png); }
	        .hero-unit { background-color: #fff; }
	        .center { display: block; margin: 0 auto; }
	    </style>

	</head>
<body>

	<script src='http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js'></script>
    <script src='/visko-web/Main/assets/oldVersion/bootstrap.min.js'></script>
    <link href='/visko-web/Main/assets/oldVersion/bootstrap.min.css' rel='stylesheet' media='screen'>
	

	<div class='navbar navbar-fixed-top navbar-inverse'>
		<div class='navbar-inner'>
    		<div class='container'>
      			<a class='btn btn-navbar' data-toggle='collapse' data-target='.nav-collapse'>
			        <span class='icon-bar'></span>
			        <span class='icon-bar'></span>
			        <span class='icon-bar'></span>
			    </a>
      			<a class='brand'>VisKo: Open Source Visualization Knowledge</a>
      			<div class='nav-collapse collapse'>
        			<ul class='nav pull-right'>
			        <li><a href='/visko-web/Main/Registration/'>Register</a></li>
			        <li class='divider-vertical'></li>
			        <li class='dropdown'>
			            <a class='dropdown-toggle' href='#' data-toggle='dropdown'>Log In <strong class='caret'></strong></a>
            		<div class='dropdown-menu' style='padding: 15px; padding-bottom: 0px;'>
                		<form action='index.jsp' method='post'> 
                    		Username:<br /> 
                    		<input type='text' name='email' value='' /> 
                    		<br /><br /> 
		                    Password:<br /> 
		                    <input type='password' name='password' value='' /> 
		                    <br /><br /> 
		                    <div class="form-inline text-center">
		                		<input type='submit' class='btn btn-info' value='Login' /> 
		                    	<a href="/visko-web/Main/Recover/">forgot password?</a>
		                    </div>
                		</form> 
            		</div>
          			</li>
        			</ul>
     			 </div>
    		</div>
  		</div>
	</div>
		
	

	<div class="container hero-unit">

		<!-- Warning -->
	<div class="form-group">
	  <div class="text-center" for="warning">
	    <%= warning %>
	  </div> 
	</div>
		<h2>What is VisKo?</h2>

	        <p>VisKo is a framework supporting the answering of visualization queries that allow users to specify what visualizations they want generated rather that specifying how they should be generated.</p>     

	        <p><a class="btn btn-primary btn-lg" href="/visko-web/Main/Registration/" role="button">Register to get started &raquo;</a></p>
	    
	    <h2>What are the Benefits?</h2>
	          <p>VisKo can automatically figure out how to generate visualizations given only a query that specifies what visualizations are being requested. Below is a variety of different visualizations generated from a single gravity dataset, resulting from the execution of a single VisKo query.</p>
	          <p><a class="btn btn-default" href="#" role="button">Learn More &raquo;</a></p>
	        </div>
	   <div class="container">
	      <div class="col-md-12">	
			<img src="/visko-web/Main/assets/img/splash_vis.png" class="img-responsive" alt="Responsive image">
	      </div>
	    </ul>
	</div>

  </body>
</html>