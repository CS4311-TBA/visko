	<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Visko</title>

    <%@ include file="../includePage/header.jsp" %>
    <%@ include file="../includePage/footer.jsp" %>

        <!-- Bootstrap core CSS -->
    <link href="/visko-web/Main/assets/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/visko-web/Main/assets/css/sideBar.css" rel="stylesheet">
  </head>

  <body>
     
    <%@ include file="../includePage/sideBar.jsp" %>
    <%@ page import="edu.utep.trustlab.visko.web.html.*" %>
    <%@ page import="java.util.*" %>
    <%@ page import ="java.sql.*" %>
    
   		
	
    <div class="col-md-10 col-md-offset-1">
      <div class="container">
        <div class="row">

        <!-- PAGE INFORMAITON GOES HERE -->
        <%  ResultSet queryResult = null;
    		ResultSet queryErrorResult = null;
    		ResultSet errorResult = null;
    		ResultSet countResult = null;
    		int newCount = 0;
    		Access aDB = new Access();
			queryResult = aDB.selectResultSet("Query", "*", "Qstatus IS NOT NULL;");        
        	int total = 0;
        	
        	List<String> aType = new ArrayList<String>();
        	List<String> aViewSet = new ArrayList<String>();
        	List<String> aFormat = new ArrayList<String>();
        	List<String> aString = new ArrayList<String>();
        	
        while( queryResult.next() )
          {
          	total++;
      		String Eid = aDB.selectDB("QueryError", "Eid", "Qid = '"+queryResult.getString("Qid")+"';");
      		String getAbs = queryResult.getString("Qtype");
      		String getViewSet = queryResult.getString("QviewerSet");
      		String getFormat = queryResult.getString("QtargetType");
      		String getString = queryResult.getString("Qstring");
      		
      	
      		String errorMessage;
      		
     		aType.add(getAbs);
     		aViewSet.add(getViewSet);
     		aFormat.add(getFormat);
     		aString.add(getString);
     		
          } 
          
			/**
			ResultSet nCount = null;
			
			countResult = aDB.selectResultSet("Error", "distinct Edetail", "Edetail IS NOT NULL;");

			List<Integer> errors = new ArrayList<Integer>();
			while( countResult.next()){
				nCount = aDB.selectResultSet("Error", "count(*)", "Edetail = '"+countResult.getString("Edetail")+"';");
				errors.add(nCount.getInt(1));

			}

			for(int i = 0; i < errors.size(); i++){
				System.out.println(errors.get(i));	
			}
			out.write("<input type = \"hidden\" name =\"Qid\" id = \"count\" value = '"+newCount+"'>");
			**/
          
          
          %>
          
          
          <%     
          
          for(int i = 0; i < aType.size();i++){
        	  if(aType.get(i).equals("null")){
        		  aType.remove(i);
        	  }
          }
          for(int i = 0; i < aViewSet.size();i++){
        	  if(aViewSet.get(i).equals("null")){
        		  aViewSet.remove(i);
        	  }
        	  
          }
          for(int i = 0; i < aFormat.size();i++){
        	  if(aFormat.get(i).equals("null")){
        		  aFormat.remove(i);
        	  }
        	  if(aFormat.get(i).equals("url")){
        		  aFormat.remove(i);
        	  }
          }
          
          String [] dupType = new String[aType.size()];
          String [] dupView = new String[aViewSet.size()];
          String [] dupFormat = new String[aFormat.size()];
          String [] dupString = new String[aString.size()];
          
          int popType = 0;
          int posType = 0;
          for(int i = 0; i < aType.size(); i++){
        	  
        	  System.out.println("type : " + aType.get(i));
        	  dupType[i] = aType.get(i);
        	  String temp = dupType[i];
        	  if(temp.equals(dupType[i])){
        		  popType++;
        		  posType = i;
          		}
          	}
          

          int popView = 0;
          int posView = 0;
          for(int i = 0; i < aViewSet.size(); i++){
        	  
        	  System.out.println("View : " + aViewSet.get(i));
        	  dupView[i] = aViewSet.get(i);
        	  String temp = dupView[i];
        	  if(temp.equals(dupView[i])){
        		  popView++;
        		  posView = i;
          		}
          	}


          int popFormat = 0;
          int posFormat = 0;
          for(int i = 0; i < aFormat.size(); i++){
        	  System.out.println("Format : " + aFormat.get(i));
        	  
        	  dupFormat[i] = aFormat.get(i);
        	  String temp = dupFormat[i];
        	  if(temp.equals(dupFormat[i])){
        		  popFormat++;
        		  posFormat = i;
          		}
          	}
          

          int popString = 0;
          int posString = 0;
          for(int i = 0; i < aViewSet.size(); i++){
        	  
        	  System.out.println("String : " + aString.get(i));
        	  dupString[i] = aString.get(i);
        	  String temp = dupString[i];
        	  if(temp.equals(dupString[i])){
        		  popString++;
        		  posString = i;
          		}
          	}


			%>
        
            <h4> Total Number of Queries Executed: <% out.write("-- " + total + " --"); %> </h4>
			<p>   - Most Popular Abstraction Requested:  <% out.write("-- " + dupType[posType] + " --");%> </p>
			<p>   - Most Popular ViewerSet Targeted: <% out.write("-- " + dupView[posView] + " --");  %></p>
 			<p>   - Most Popular Input Format: <% out.write("-- " + dupFormat[posFormat] + " --"); %> </p>
			<p>   - Most Popular Output Format: -- format --</p>
          <br>
          <h4>Frequency of Query Errors</h4>
          
          <br>
	    <script type="text/javascript" src="/visko-web/jquery/jquery.min.js"></script>
		<script type="text/javascript" src="/visko-web/jquery/jquery.jqplot.min.js"></script>
		<script type="text/javascript" src="/visko-web/plugins/jqplot.barRenderer.min.js"></script>
		<script type="text/javascript" src="/visko-web/plugins/jqplot.categoryAxisRenderer.min.js"></script>
		<script type="text/javascript" src="/visko-web/plugins/jqplot.pointLabels.min.js"></script>
		<link rel="stylesheet" type="text/css" hrf="/visko-web/jquery/jquery.jqplot.min.css" />

<div id="chart1" style="height:600px;width:800px; ">
<script type="text/javascript">
         $(document).ready(function(){
	var c1 = $("#count").val()
    var s1 = [10, 0, 00, 0];
    var s2 = [0, 0, 0, 0];
    var s3 = [0, 0, 0, 0];
    // Can specify a custom tick Array.
    // Ticks should match up one for each y value (category) in the series.
    var ticks = [' ', ' ', ' ', '   '];
     
    var plot1 = $.jqplot('chart1', [s1, s2, s3], {
        // The "seriesDefaults" option is an options object that will
        // be applied to all series in the chart.
        seriesDefaults:{
            renderer:$.jqplot.BarRenderer,
            rendererOptions: {fillToZero: true}
        },
    
        // Custom labels for the series are specified with the "label"
        // option on the series option.  Here a series option object
        // is specified for each series.
        series:[
            {label:' '},
            {label:' '},
            {label:' '}
        ],
        // Show the legend and put it outside the grid, but inside the
        // plot container, shrinking the grid to accomodate the legend.
        // A value of "outside" would not shrink the grid and allow
        // the legend to overflow the container.
        legend: {
            show: true,
            placement: 'outsideGrid'
        },
        axes: {
            // Use a category axis on the x axis and use our custom ticks.
            xaxis: {
                renderer: $.jqplot.CategoryAxisRenderer,
                ticks: ticks
            },
            // Pad the y axis just a little so bars can get close to, but
            // not touch, the grid boundaries.  1.2 is the default padding.
            yaxis: {
                pad: 1.05,
                tickOptions: {formatString: '%d'}
            }
        }
    });
});</script>
</div>
          <br>
          
          <h4>Most Popular Query</h4>
          
          
          
    	      <textarea rows="10" cols="150">
				<% out.write(dupString[posString]);%>
			  </textarea>
			
			
      </div>      
    </div>

  </body>
</html>