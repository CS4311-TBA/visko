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
    
    <script type="text/javascript">
    
    $( document ).ready(function() {
    	
    	
    	
		$("#queryText").on('keyup paste', function() {
			
			 var element = this;
			setTimeout(function () {
				var queryString = $(element).val();
				 $.post("/visko-web/ViskoServletManager",{query:queryString},
				          function(result) {
				                //alert("Data Loaded: " + result);
				           if( result == "true" )
		            		{
		            			$("#warning").html( "<p style='color:green'>Query is valid.</p>");
		            			$("#submitButton").attr("disabled",false);
		            		}
		            		else
		            		{
		            			$("#warning").html( "<p style='color:red'>Invalid query.</p>" );
		            			$("#submitButton").attr("disabled",true);
		            		}
				         });
				/*
				$.ajax({
					type: "POST", 
		            url : '/visko-web/ViskoServletManager',
		            dataType : 'text',
		            data : "query="+queryString,
		            cache : false, // guarantees jsp is always called
		            success: function(result)
		            {
		            	alert("RESULT: " + result);
		            	if( result == "true" )
		            	{
		            		$("#warning").html( "<p style='color:green'>Query is valid.</p>");	
		            	}
		            	else
		            	{
		            		$("#warning").html( "<p style='color:red'>Invalid query.</p>" );
		            	}
		            }
		       });
				*/
				
			}, 0);
			
			
			
			
		});
		
		
		
    });
    
    </script>
  </head>

  <body>

    <%@ page import="edu.utep.trustlab.visko.web.html.*" %>
    <%@ page import="java.util.*" %>     
    <%@ include file="../includePage/sideBar.jsp" %>

    <div class="col-md-10 col-md-offset-2">
      <div class="container">
        <div class="row">

        <!-- PAGE INFORMAITON GOES HERE -->

          <h3>Option 1</h3>

          <div>
            <form action="/visko-web/ViskoServletManager">
              <input type="hidden" name="requestType" value="new-execute-query" />  
              <table style="width: 1023px; ">
                <tr>
                  <td colspan="2"><h2>VisKo  Query</h2></td>
                </tr>
                <tr>
                  <td style="width: 996px; " colspan="2" align="right">
                    <textarea style="width: 989px; height: 200px;" id="queryText" name="query"></textarea></td>
                </tr>
                <tr>
                  <td align="right"><div id="warning"></div></td>
                  
                  <td align="right">
                    <table>
                      <tr>
                        <td><input type="submit" id="submitButton" disabled="true" style="width: 156px"></td>
                        <td><button type="button" onclick="reset()">Reset</button></td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
            </form>
          </div>
          
  
          <% 
            SelectionOptionsHTML o = new SelectionOptionsHTML(); 
            String [] options = (o.getViskoViews()).split(" "); 
            List<String> oneD = new ArrayList<String>(); 
            List<String> twoD = new ArrayList<String>(); 
            List<String> threeD = new ArrayList<String>(); 
            for(int i = 0; i < options.length; i++)
            {
              if(options[i].contains("1D"))
              {
                oneD.add(options[i]);
              }
              else if(options[i].contains("2D"))
              {
                twoD.add(options[i]);
              }
              else if(options[i].contains("3D")) 
              {
                threeD.add(options[i]);
              } 
            }
            String oneDString = "";
            for(int i = 0; i < oneD.size(); i++){
              oneDString = oneD.get(i).substring(oneD.get(i).indexOf("1D_"),oneD.get(i).length());
              oneD.set(i, oneDString);
            }
            
            String twoDString = "";
            for(int i = 0; i < twoD.size(); i++){
              twoDString = twoD.get(i).substring(twoD.get(i).indexOf("2D_"),twoD.get(i).length());
              twoD.set(i, twoDString);
            }
            
            String threeDString = "";
            for(int i = 0; i < threeD.size(); i++){
              threeDString = threeD.get(i).substring(threeD.get(i).indexOf("3D_"),threeD.get(i).length());
              threeD.set(i, threeDString);
            }
          %>

          <h3>Option 2</h3>
          <div class="panel-group" id="accordion">
            <div class="panel panel-default">
              <div class="panel-heading">
                <h4 data-toggle="collapse" data-parent="#accordion" href="#1D" class="panel-title">
                  1D Abstractions
                </h4>
              </div>
              <div id="1D" class="panel-collapse collapse">
                <div class="panel-body">
                  <table>
                  <%
                    for(int i = 0; i < oneD.size(); i++){
                      out.write("<tr><td>");
                      out.write("<form action=\"/visko-web/ViskoServletManager\">");
                      out.write("<input type=\"hidden\" name=\"requestType\" value=\"set-query-parameters\" />"); 
                      out.write("<input type=\"hidden\" name=\"abstractionType\" value=\""+oneD.get(i)+"\" />");
                      out.write("<input type=\"image\" src=\"/visko-web/Main/assets/img/"+oneD.get(i)+".png\" width=\"175\" height=\"175\">");
                      out.write("</form>");
                      out.write("</td></td>");
                      out.write("<td>"+oneD.get(i)+"</td>");
                      out.write("<td>"+"a linear representation of important events in the order in which they occurred"+"</td>");
                      out.write("</tr>");
                    }
                  %> 
                  <%
                  List<String> twoDesc = new ArrayList<String>(twoD.size()); 
                  List<String> threeDesc = new ArrayList<String>(threeD.size());
                  
                  twoDesc.add("A map showing elevations and surface configuration by means of contour lines.");
                  twoDesc.add("Assign forces among the set of edges and the set of nodes of a graph drawing."); 
                  twoDesc.add("A map that contains detailed points depending on a specified data set");
                  twoDesc.add("A data layer consisting of a gridded array of cells");
                  twoDesc.add("Represents the geographical region where individuals of a species can be found");
                  twoDesc.add("A data layer consisting of a gridded array of cells in a 3D model view");
                  twoDesc.add("A group of polygon objects as they change over time");
                  twoDesc.add("Description not available");                  
                  twoDesc.add("Description not available");
                  twoDesc.add("Description not available");
                  
                  threeDesc.add("Displays data visually either horizontally or vertically in a 3D model");
                  threeDesc.add("A three-dimensional analog of an isoline. It is a surface that represents points of a constant value");                  
                  threeDesc.add("Produces wireframe surfaces that color only the lines connecting the defining points");            
                  threeDesc.add("The three dimensional shape or configuration of a molecule is an important characteristic");
                  threeDesc.add("The three dimensional shape or configuration of a molecule is an important characteristic in a cartoon graphic");
                  threeDesc.add("3-dimensional Cartesian coordinate system.");
                  threeDesc.add("A 3D cube representation of a data layer consisting of a gridded array of cells");
                  threeDesc.add("A 3D Plot is a graphic display that shows all collated data");
                  threeDesc.add("A set of techniques used to display a 3D discretely sampled data set.");
                   %>
                  </table>
                </div>
              </div>
            </div>
            <div class="panel panel-default">
              <div class="panel-heading">
                <h4 data-toggle="collapse" data-parent="#accordion" href="#2D" class="panel-title">
                  2D Abstractions
                </h4>
              </div>
              <div id="2D" class="panel-collapse collapse">
                <div class="panel-body">
                  <table class = "table">
                  <%
                    for(int i = 0; i < twoD.size(); i++){
                      out.write("<tr><td>");
                      out.write("<form action=\"/visko-web/ViskoServletManager\">");
                      out.write("<input type=\"hidden\" name=\"requestType\" value=\"set-query-parameters\" />"); 
                      out.write("<input type=\"hidden\" name=\"abstractionType\" value=\"" + twoD.get(i) + "\" />");
                      out.write("<input type=\"image\" src=\"/visko-web/Main/assets/img/"+twoD.get(i) +".png\" width=\"175\" height=\"175\">");
                      out.write("</form>");
                      out.write("</td>");
                      out.write("<td>"+twoD.get(i)+"</td>");
                      out.write("<td>"+twoDesc.get(i)+"</td>");
                      out.write("</tr>");
                    }
                  %> 
                  </table>
                </div>
              </div>
            </div>
            <div class="panel panel-default">
              <div class="panel-heading">
                <h4 data-toggle="collapse" data-parent="#accordion" href="#3D" class="panel-title">
                  3D Abstractions
                </h4>
              </div>
              <div id="3D" class="panel-collapse collapse">
                <div class="panel-body">
                  <table class = "table">
                  <%
                    for(int i = 0; i < threeD.size(); i++){
                      out.write("<tr>");
                      out.write("<td>");
                      out.write("<form action=\"/visko-web/ViskoServletManager\">");
                      out.write("<input type=\"hidden\" name=\"requestType\" value=\"set-query-parameters\" />"); 
                      out.write("<input type=\"hidden\" name=\"abstractionType\" value=\"" + threeD.get(i) + "\" />");
                      out.write("<input type=\"image\" src=\"/visko-web/Main/assets/img/"+threeD.get(i) +".png\" width=\"150\" height=\"150\">");
                      out.write("</form>");
                      out.write("</td>");
                      out.write("<td>"+threeD.get(i)+"</td>");
                      out.write("<td>"+threeDesc.get(i)+"</td>");
                      out.write("</tr>");
                    }
                  %> 
                  </table>
                </div>
              </div>
            </div>
          </div>
        

        </div>      
      </div>
    </div>
  </body>
</html>