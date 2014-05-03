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
          <script type="text/javascript" src="https://www.google.com/jsapi"></script>
          <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Year', 'Sales', 'Expenses'],
          ['2004',  1000,      400],
          ['2005',  1170,      460],
          ['2006',  660,       1120],
          ['2007',  1030,      540]
        ]);

        var options = {
          title: 'Company Performance',
          hAxis: {title: 'Year', titleTextStyle: {color: 'red'}}
        };

        var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
          <h2>This is just a template</h2>
            <p>All the information for the page will go inside this "div". SideBar and Header are already included, any other CSS should be placed into the sideBar.css file at the bottom. </p>
        </div>
      </div>      
    </div>

  </body>
</html>