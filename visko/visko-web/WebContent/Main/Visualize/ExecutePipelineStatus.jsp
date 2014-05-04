<!DOCTYPE html>
<html lang="en">
<head>
	${statusBean.refreshTag}
	
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

    <div class="col-md-10 col-md-offset-1">
      <div class="container">
        <div class="row">

        <!-- PAGE INFORMAITON GOES HERE -->

<div id="content">

<h3 style="padding:0px">[VisKo Pipeline Execution]</h3>
${statusBean.message}
<br />
<br />
${statusBean.cancelButton}
</div>

		<!-- PAGE INFORMAITON GOES ABOVE -->
        </div>      
      </div>
    </div>

    <%@ include file="../includePage/footer.jsp" %>
  </body>
</html>
