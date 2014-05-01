<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="/visko-web/Main/assets/ico/favicon.ico">
  </head>
  
 <%@ page import="edu.utep.trustlab.visko.web.*" %>

	<!-- Bootstrap core CSS -->
    <link href="/visko-web/Main/assets/css/bootstrap.min.css" rel="stylesheet">

	<%
	//check session variables are set
	/*
	if( session.getAttribute("email") != null &&
		session.getAttribute("pass") != null )
	{
		*/
		
		
	if( session.getAttribute("user") != null )
	{
		User curUser = (User)session.getAttribute("user");	
		out.println(   
					"<div class=\"navbar navbar-inverse navbar-fixed-top\" role=\"navigation\">" +
				      "<div class=\"container-fluid\"> " +
				        "<div class=\"navbar-header\"> " +
				          "<button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\".navbar-collapse\">" +
				            "<span class=\"sr-only\">Toggle navigation</span>" +
				            "<span class=\"icon-bar\"></span> " +
				            "<span class=\"icon-bar\"></span> "+
				            "<span class=\"icon-bar\"></span>" +
				          "</button>" +
				          "<a class=\"navbar-brand\" href='/visko-web/Main/Home/'>VisKo</a>" +
				        "</div>" +
				        "<div class=\"navbar-collapse collapse\">"+
				          "<form action='/visko-web/Main/logOut.jsp' class=\"navbar-form navbar-right\" role=\"form\"> "+
					    "<button type=\"submit\" class=\"btn btn-success\">Logout</button>"+
					  "</form>" +
					  "<p class=\"navbar-text navbar-right\">Welcome <a href=\"/visko-web/Main/ConfigureAccount/\" class=\"navbar-link\">" + curUser.getEmail() +"</a></p>" +
				        "</div>"+
				      "</div>"+
				    "</div>"

			);
	}
	else{
		response.sendRedirect( "/visko-web/Main/" );
	}
							
	%>
</html>