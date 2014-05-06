<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Visko</title>
    <%@ include file="../includePage/header.jsp" %>
    <%@ page import="edu.utep.trustlab.visko.web.html.*" %>
    <%@ page import="java.util.*" %>
    <%@ page import ="java.sql.*" %> 

        <!-- Bootstrap core CSS -->
    <link href="/visko-web/Main/assets/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/visko-web/Main/assets/css/sideBar.css" rel="stylesheet">

    <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>



    <style type="text/css">

    </style>


  </head>

  <body>
     
    <%@ include file="../includePage/sideBar.jsp" %>

    <div class="col-md-10 col-md-offset-1">
      <div class="container">
        <div class="row">
        
        <h3> Search Result Details</h3>
        
        <%
    	String Qid = (String) request.getSession().getAttribute("Qid");
    	String Eid = (String) request.getSession().getAttribute("Eid");
    		
    	System.out.println(":"+Qid+":"+Eid+":");

    	%>
    	
        </div> 
      </div>      
    </div>

  </body>
</html>