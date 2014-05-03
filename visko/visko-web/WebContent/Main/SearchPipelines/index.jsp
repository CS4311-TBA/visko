<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Visko - Search Pipelines</title>
    <%@ include file="../includePage/header.jsp" %>
    <%@ page import="edu.utep.trustlab.visko.web.html.*" %>
    <%@ page import="java.util.*" %>     

        <!-- Bootstrap core CSS -->
    <link href="/visko-web/Main/assets/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/visko-web/Main/assets/css/sideBar.css" rel="stylesheet">

    <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>



    <style type="text/css">

    </style>

    <script>
      $(function() {
        $( "#startDate" ).datepicker();
        $("#endDate").datepicker();
      });
    </script>


  </head>

  <body>
     
    <%@ include file="../includePage/sideBar.jsp" %>

    <div class="col-md-10 col-md-offset-2">
      <div class="container">
        <div class="row">

          <form id="changeForm" method="post" class="form-horizontal">
          <fieldset>
          

            <div class="row">
            

              <!-- left Sie -->
              <div class="col-md-6">
                <!-- Change Pass -->
                <h3> Pipeline Search Criteria </h3>

                
			<% 
            SelectionOptionsHTML o = new SelectionOptionsHTML(); 
            String [] options = (o.getViskoViews()).split(" "); 
            List<String> abstractions = new ArrayList<String>();  
            for(int i = 0; i < options.length; i++)
            {
              abstractions.add(options[i]);
            }
            String abstrString = "";
            for(int i = 0; i < abstractions.size(); i++){
            	if(abstractions.get(i).contains("1D_")){
           			abstrString = abstractions.get(i).substring(abstractions.get(i).indexOf("1D_"),abstractions.get(i).length());
           			abstractions.set(i, abstrString);
            	}else if(abstractions.get(i).contains("2D_")){
                    abstrString = abstractions.get(i).substring(abstractions.get(i).indexOf("2D_"),abstractions.get(i).length());
                    abstractions.set(i, abstrString);
            	}else if(abstractions.get(i).contains("3D_")){
	              	abstrString = abstractions.get(i).substring(abstractions.get(i).indexOf("3D_"),abstractions.get(i).length());
              		abstractions.set(i, abstrString);
            	}
            }//end for loop
          %>
                    <div class="row">
                      <label class="control-label" for="abs">Abstraction</label>
                      <select class="form-control" name="abstraction">
                        
                        <%for (int i = 0; i < abstractions.size(); i++){
                        						out.write( "<option>" + abstractions.get(i) + "</option>");
                        						
                        						}%>
                      </select>

                      <label class="control-label" for="inURL">Input URL</label>
                      <select class="form-control" name="inputURL">
                        <option value="test">test</option>
                      </select>

                      <label class="control-label" for="viewerSet">Viewer Set</label>
                      <select class="form-control" name="viewerSet">
                        <option value="test"><%=o.getViewerSets()%></option>
                      </select>

                      <label class="control-label" for="sourceFormat">Source Format</label>
                      <select class="form-control" name="sourceFormat">
                        <option value="test"><%=o.getFormats()%></option>
                      </select>

                      <label class="control-label" for="sourceType">Source Type</label>
                      <select class="form-control" name="sourceType">
                        <option value="test"><%=o.getTypes()%></option>
                      </select>

                    </div>
              
              </div>

              <!-- right side -->
              <div class="col-md-6">
                <div class="row">
                  
                  <br><br><br>
                  
                  <div class="text-center">
                    <label class="control-label" for="date">Date Range</label>
                  </div>


                  <div class="row">
                    <div class="col-md-6">
                      <label for="date-picker-1" class="control-label">Start Date</label>
                      <input id="startDate" type="text" class="form-control" />
                    </div>

                    <div class="col-md-6">
                      <label for="date-picker-2" class="control-label">End Date</label>
                      <input id="endDate" type="text" class="form-control" />
                    </div>
                  </div>

                  <br><br>

                  <label class="control-label" for="targetFormat">Target Format</label>
                  <select class="form-control" name="targetFormat">
                    <option value="test"><%=o.getFormats()%></option>
                  </select>

                  <label class="control-label" for="targetType">Target Type</label>
                  <select class="form-control" name="targetType">
                    <option value="test"><%=o.getTypes()%></option>
                  </select>

				  <label class="control-label" for="error">Error</label>
	              <select class="form-control" name="targetType">
	              	<option value="errorsAndSuccess">Errors And Successes</option>
	              	<option value="serviceExecution">Service Execution Error</option>
	              	<option value="timeoutError">Timeout Error</option>
	              	<option value="inputDataError">Input Data Error</option>
	              	<option value="anyError">Any Error</option>
	              </select>
	              
	              
                  <div class="text-center">
                    <br>
                    <button id="searchButton" name="searchButton" type="submit" class="btn btn-success">Search</button>
                   </div>
                </div>
              </div>

            </div>

            <hr>

          </fieldset>
          </form>


        </div>

        <div class="row">

          <div>
			<br>
			<label for="results">Results</label>
			<table style="border:1px solid black;border-collapse:collapse;" >
			<tr>
			
			  <tr>
				  <th bgcolor="#B4CDCD" style="border:1px solid black;padding:15px;">ID</th>
				  	
				  <th bgcolor="#B4CDCD" style="border:1px solid black;padding:15px;">Submitted By User</th> 
				  <th bgcolor="#B4CDCD" style="border:1px solid black;padding:15px;">Data Executed</th>
				  <th bgcolor="#B4CDCD" style="border:1px solid black;padding:15px;">Error</th>
				  <th bgcolor="#B4CDCD" style="border:1px solid black;padding:15px;">Result</th>
			 </tr>
			 
			</table>
           </div>
        </div>
      </div>      
    </div>

  </body>
</html>