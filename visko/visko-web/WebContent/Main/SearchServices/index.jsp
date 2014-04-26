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
     
    <%@ include file="../includePage/sideBar.jsp" %>

    <div class="col-md-10 col-md-offset-2">
      <div class="container">
        <div class="row">

        <!-- PAGE INFORMAITON GOES HERE -->




          <h1><%= request.getRequestURI() %></h1>
            <p>This is where all the page information goes</p>
          <br>
          <h2>This is just a template</h2>
            <p>All the information for the page will go inside this "div". SideBar and Header are already included, any other CSS should be placed into the sideBar.css file at the bottom. </p>
        </div>
      </div>      
    </div>

  </body>
</html>