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

  </head>

  <body>
     
    <%@ include file="../includePage/sideBar.jsp" %>

    <div class="col-md-10 col-md-offset-2">
      <div class="container">
        <div class="row">

          <form id="changeForm" method="post" class="form-horizontal">
          <fieldset>
          

            <div class=""col-md-10 col-md-offset-2">
            

              <!-- left Sie -->
              <div class="col-md-11">
                <!-- Change Pass -->
                <h3> Add Service </h3>

                
			<%SelectionOptionsHTML o = new SelectionOptionsHTML();%>
                    <div class="row">
                      <label class="control-label" for="abs">Service Type</label>
                      <select class="form-control" name="abstraction">
                      	 	<option value="viewSet">ViewerSet</option>
                        	<option value="viewer">Viewer</option>
                         	<option value="filter">Filter</option>
                          	<option value="transformer">Transformer</option>
                          	<option value="converter">Converter</option>
                          	<option value="mapper">Mapper</option>
                      </select>
                     
                    </div>
                    
                    <div class="text-center">
                    <br>
                    <button id="addButton" name="addButton" type="submit" class="btn btn-success">Add</button>
                   </div>
              
              </div>

              <!-- right side -->
              <div class="col-md-6">
                <div class="row">
                  
                  <br><br><br>
                  

                  
                </div>
              </div>

            </div>

            <hr>

          </fieldset>
          </form>


        </div>

        
              <!-- left Side -->
              <div class="col-md-6">
                <!-- Change Pass -->
                <h3> Edit/Delete Service </h3>

			<label class="control-label" for="abs">Viewer Sets</label>
          	<div class = "row">
          		<input class = "col-md-1" type = "radio">  
          		<select class="col-md-11" name="viewerSets">
                </select>
            </div>
            
            <label class="control-label" for="abs">Viewers</label>
            <div class = "row">
          		<input class = "col-md-1" type = "radio">  
          		<select class="col-md-11" name="viewers">
                </select>
            </div>
           
            <label class="control-label" for="abs">Filters</label>
            <div class = "row">
          		<input class = "col-md-1" type = "radio">  
          		<select class="col-md-11" name="filters">
                </select>
            </div>
            
            <label class="control-label" for="abs">Transformers</label>
            <div class = "row">
          		<input class = "col-md-1" type = "radio">  
          		<select class="col-md-11" name="transformers">
                </select>
            </div>
            
            <label class="control-label" for="abs">Converters</label>
            <div class = "row">
          		<input class = "col-md-1" type = "radio">  
          		<select class="col-md-11" name="converters">
                </select>
            </div> 
            
            <label class="control-label" for="abs">Mappers</label>
            <div class = "row">
          		<input class = "col-md-1" type = "radio">  
          		<select class="col-md-11" name="mappers">
                </select>
            </div> 
            
            
            <button id="editButton" name="editButton" type="submit" class="btn btn-success">Edit</button>
            <button id="deleteButton" name="deleteButton" type="submit" class="btn btn-success">Delete</button>
        
  
    </div>

  </body>
</html>