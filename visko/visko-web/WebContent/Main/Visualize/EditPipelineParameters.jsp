<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Visko</title>

    <%@ include file="../includePage/header.jsp" %>

        <!-- Bootstrap core CSS -->
    <link href="/visko-web/Main/assets/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/visko-web/Main/assets/css/sideBar.css" rel="stylesheet">
  </head>

  <body>

    <%@ page import="java.util.*" %>
    <%@ include file="../includePage/sideBar.jsp" %>

    <div class="col-md-10 col-md-offset-2">
      <div class="container">
        <div class="row">

<!-- PAGE INFORMAITON GOES HERE -->
        
	<%  
		String EditParametersForm = (String) request.getSession().getAttribute("EditParametersForm");
		out.println("<br>" + 
					EditParametersForm + 
					"<br><br><a class=\"btn btn-warning\" href=\"/visko-web/Main/Visualize/SelectPipelines.jsp\" style=\"width: 156px\">Back</a>");
	%>

<!-- PAGE INFORMAITON GOES ABOVE -->
           
        </div>      
      </div>
    </div>

    <%@ include file="../includePage/footer.jsp" %>
  </body>
</html>
