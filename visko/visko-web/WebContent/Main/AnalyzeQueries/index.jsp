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
        
            <h4> Total Number of Queries Executed: -- </h4>
			<p>   - Most Popular Abstraction Requested:  -Abstraction- </p>
			<p>   - Most Popular ViewerSet Targeted -FORMAT-</p>
 			<p>   - Most Popular Input Format:-FORMAT- </p>
			<p>   - Most Popular Output Format -format-</p>
          <br>
          <h4>Frequency of pipeline Errors</h4>
          
          <br>
          <p>--GRAPH GOES HERE--</p>
          <br>
          
          <h4>Most Popular Query</h4>
          
    	      <textarea rows="4" cols="50">
				--QUERY TEXT--
			  </textarea>
			
			
      </div>      
    </div>

  </body>
</html>