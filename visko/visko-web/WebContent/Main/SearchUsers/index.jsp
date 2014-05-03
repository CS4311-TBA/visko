<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Visko</title>

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
                <h3> User Search Criteria </h3>

                
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

                      <label class="control-label" for="userEmail">User Email</label>
                      <select class="form-control" name="inputURL">
                        <option value="test">-EMAIL-</option>
                      </select>

                      <label class="control-label" for="viewerSet">First Name</label>
                      <select class="form-control" name="viewerSet">
                        <option value="test">-FIRST-</option>
                      </select>

                      <label class="control-label" for="sourceFormat">Last Name</label>
                      <select class="form-control" name="sourceFormat">
                        <option value="test">-LAST NAME-</option>
                      </select>

                      <label class="control-label" for="sourceType">Affiliation</label>
                      <select class="form-control" name="sourceType">
                        <option value="test">UTEP</option>
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

                  <label class="control-label" for="targetFormat">Account Status</label>
                  <select class="form-control" name="targetFormat">
                    <option value="test">-STATUS-</option>
                  </select>


                  <div class="text-center">
                    <br>
                    <button id="submitButton" name="submitButton" type="submit" class="btn btn-success">Submit</button>
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
				  <th bgcolor="#B4CDCD" style="border:1px solid black;padding:15px;">Date Joined</th>
				  <th bgcolor="#B4CDCD" style="border:1px solid black;padding:15px;">Account Status</th> 
				  <th bgcolor="#B4CDCD" style="border:1px solid black;padding:15px;">First Name</th>
				  <th bgcolor="#B4CDCD" style="border:1px solid black;padding:15px;">Last Name</th>
				  <th bgcolor="#B4CDCD" style="border:1px solid black;padding:15px;">Affiliation</th>
				  
			 </tr>
			 
			</table>
           </div>
        

        </div>
      </div>      
    </div>

  </body>
</html>