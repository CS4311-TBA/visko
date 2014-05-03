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
        
            <h4> Total Number of Pipelines Executed: -- </h4>
			<p>   - Most Popular Abstraction Generated:  -Abstraction- </p>
			<p>   - Most Popular Output Format Targeted -FORMAT-</p>
 			<p>   - Most Popular Input Format:-FORMAT- </p>
			<p>   - Most Popular Output Format -format-</p>
          <br>
          <h4>Frequency of pipeline Errors</h4>
          
          <br>
          <p>--GRAPH GOES HERE--</p>
          <br>
          
          <!-- table for the results -->
          <h4>Most Popular Pipeline</h4>
          <table style="border:1px solid black;border-collapse:collapse;" >
			<tr>
			
			  <tr>
				  <th bgcolor="#B4CDCD" style="border:1px solid black;padding:15px;">ID</th>	
				  <th bgcolor="#B4CDCD" style="border:1px solid black;padding:15px;">Abstraction</th> 
				  <th bgcolor="#B4CDCD" style="border:1px solid black;padding:15px;">Output Format</th>
				  
			 </tr>
			 
			</table>
			
			<br>
			<br>
			
			<!-- accordians for the results -->
          <div class="panel-group" id="accordion">
            <div class="panel panel-default">
              <div class="panel-heading">
                <h4 data-toggle="collapse" data-parent="#accordion" href="#1D" class="panel-title">
                  Service 1
                </h4>
              </div>
              
              <p>test</p>
              <p>test</p>
            </div>
            </div>
            
             <div class="panel-group" id="accordion">
            <div class="panel panel-default">
              <div class="panel-heading">
                <h4 data-toggle="collapse" data-parent="#accordion" href="#1D" class="panel-title">
                  Service 2
                </h4>
                
              </div>
              <p>test</p>
              <p>test</p>
            </div>
            </div>
            
             <div class="panel-group" id="accordion">
            <div class="panel panel-default">
              <div class="panel-heading">
                <h4 data-toggle="collapse" data-parent="#accordion" href="#1D" class="panel-title">
                  Service 3
                </h4>
              </div>
              
              <p>test</p>
              <p>test</p>
            </div>
            </div>
      </div>      
    </div>

  </body>
</html>