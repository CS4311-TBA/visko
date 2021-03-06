<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Visko</title>
    <%@ include file="../includePage/header.jsp" %>
    <%@ page import="edu.utep.trustlab.visko.web.html.*" %>
    <%@ page import="java.util.*" %>
    <%@ page import ="java.sql.*" %>
    
    <%
    	boolean formSubmitted = Boolean.parseBoolean( request.getParameter("fSubmitted") );
	    ResultSet queryResult = null;
	    ResultSet queryErrorResult = null;
	    ResultSet errorResult = null;
	    
	    if( formSubmitted )
    	{

	    	String abstraction = request.getParameter( "abstraction" );
    		String inputUrl = request.getParameter( "inputUrl" );
    		String viewerSet = request.getParameter( "viewerSet" );
    		String sourceFormat = request.getParameter( "sourceFormat" );
    		String sourceType = request.getParameter( "sourceType" );
    		String targetFormat = request.getParameter( "targetFormat" );
    		String targetType = request.getParameter( "targetType" );
    		String start = request.getParameter( "startDate" );
    		String end = request.getParameter( "endDate" );
    		
    		String constraints = "(";
    		boolean conAdded = false;
    		
    		if( !abstraction.equalsIgnoreCase("") && abstraction != null )
    		{
    			constraints += " Qtype = '" + abstraction + "' ";
    			conAdded = true;
    		}
    		
    		if( !inputUrl.equalsIgnoreCase("") && inputUrl != null )
    		{
    			if( conAdded )
    			{
    				constraints += "&& QinputUrl = '" + inputUrl + "' ";	
    			}
    			else
    			{
    				constraints += " QinputUrl = '" + inputUrl + "' ";
    				conAdded = true;
    			}
    			
    		}
    		
    		if( !viewerSet.equalsIgnoreCase("") && viewerSet != null )
    		{
    			if( conAdded )
    			{
    				constraints += "&& QviewerSet = '" + viewerSet + "' ";	
    			}
    			else
    			{
    				constraints += " QviewerSet = '" + viewerSet + "' ";
    				conAdded = true;
    			}
    			
    		}
    		
    		if( !sourceFormat.equalsIgnoreCase("") && sourceFormat != null )
    		{
                if( !sourceFormat.equalsIgnoreCase("*") )
                {
                    if( conAdded )
                    {
                        constraints += "&& QsourceFormat = '" + sourceFormat + "' ";    
                    }
                    else
                    {
                        constraints += " QsourceFormat = '" + sourceFormat + "' ";
                        conAdded = true;
                    }
                }	
    		}
    		
    		if( !sourceType.equalsIgnoreCase("") && sourceType != null )
    		{
                if( !sourceType.equalsIgnoreCase("*") )
                {
        			if( conAdded )
        			{
        				constraints += "&& QsourceType = '" + sourceType + "' ";	
        			}
        			else
        			{
        				constraints += " QsourceType = '" + sourceType + "' ";
        				conAdded = true;
        			}
                }
    			
    		}

    		if( !targetFormat.equalsIgnoreCase("") && targetFormat != null )
    		{
                if( !targetFormat.equalsIgnoreCase("*") )
                {
                    if( conAdded )
                    {
                        constraints += "&& QtargetFormat = '" + targetFormat + "' ";    
                    }
                    else
                    {
                        constraints += " QtargetFormat = '" + targetFormat + "' ";
                        conAdded = true;
                    }
                }	
    		}
    		
    		if( !targetType.equalsIgnoreCase("") && targetType != null )
    		{
                if( !targetType.equalsIgnoreCase("*") )
                {
        			if( conAdded )
        			{
        				constraints += "&& QtargetType = '" + targetType + "' ";	
        			}
        			else
        			{
        				constraints += " QtargetType = '" + targetType + "' ";
        				conAdded = true;
        			}
                }
    			
    		}
    		
    		
    		// both start and end found
    		if( (!start.equalsIgnoreCase("") && start != null) && (!end.equalsIgnoreCase("") && end != null) )
    		{
    			if( conAdded )
    			{
    				constraints += "&& Qtime BETWEEN '" + start + "' and '" + end + "' ";	
    			}
    			else
    			{
    				constraints += " Qtime BETWEEN '" + start + "' and '" + end + "' ";
    				conAdded = true;
    			}
    			
    		}//only start found
    		else if( (!start.equalsIgnoreCase("") && start != null) && 
    				(end.equalsIgnoreCase("") || end == null) )
    		{
    			if( conAdded )
    			{
    				constraints += "&& Qtime > '" + start + "'  ";	
    			}
    			else
    			{
    				constraints += " Qtime > '" + start + "' ";
    				conAdded = true;
    			}	
    		}//only end found
    		else if( (start.equalsIgnoreCase("") || start == null) && 
    				(!end.equalsIgnoreCase("") && end != null) )
    		{
    			if( conAdded )
    			{
    				constraints += "&& Qtime < '" + end + "'  ";	
    			}
    			else
    			{
    				constraints += " Qtime < '" + end + "' ";
    				conAdded = true;
    			}	
    		}
    		

    		
    		if( conAdded )
    		{
    			constraints += ")";	
    		}
    		else
    		{
    			constraints += "Qstatus IS NOT NULL )";
    		}
    		
    		Access aDB = new Access();
    		
    		queryResult = aDB.selectResultSet("Query", "*", constraints);
    		   
    	}
    %>   

        <!-- Bootstrap core CSS -->
    <link href="/visko-web/Main/assets/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/visko-web/Main/assets/css/sideBar.css" rel="stylesheet">

    <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>



    <style type="text/css">

    </style>

    <script type="text/javascript">
    
	    function buttonClick( id )
	    {
	        $.post("/visko-web/ViskoServletManager",{requestType:'getQueryText',queryID:id},
	            function(result) 
	            {       
	                $("#queryText").html( "<textarea style='width: 989px; height: 200px;' id='queryTextArea' name='query'>"+result+"</textarea>");   
	            }
	        );  
	    }
    
		$(function() {
       		$( "#startDate" ).datepicker();
        	$("#endDate").datepicker();
    	});
    </script>


  </head>

  <body>
     
    <%@ include file="../includePage/sideBar.jsp" %>

    <div class="col-md-10 col-md-offset-1">
      <div class="container">
        <div class="row">

          <form id="changeForm" method="post" class="form-horizontal">
          <fieldset>
          

            <div class="row">
            

              <!-- left Side -->
              <div class="col-md-6">
                <!-- Change Pass -->
                <h3> Query Search Criteria </h3>

                
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
	                      <%
	                      	out.write( "<option value=\"\"> </option>");
	                      	for (int i = 0; i < abstractions.size(); i++){
	                      		out.write( "<option value=\""+options[i]+"\">" + abstractions.get(i) + "</option>");
	                      	}
	                      %>
                      </select>

                      <label class="control-label" for="inputUrl">Input URL</label>
                      <input class="form-control" type="text" name="inputUrl">

                      <label class="control-label" for="viewerSet">Viewer Set</label>
                      <select class="form-control" name="viewerSet">
                        <option value=""><%=o.getViewerSets()%></option>
                      </select>

                      <label class="control-label" for="sourceFormat">Source Format</label>
                      <select class="form-control" name="sourceFormat">
                        <option value=""><%=o.getFormats()%></option>
                      </select>

                      <label class="control-label" for="sourceType">Source Type</label>
                      <select class="form-control" name="sourceType">
                        <option value=""><%=o.getTypes()%></option>
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
                    <option value=""><%=o.getFormats()%></option>
                  </select>

                  <label class="control-label" for="targetType">Target Type</label>
                  <select class="form-control" name="targetType">
                    <option value=""><%=o.getTypes()%></option>
                  </select>
                  
                  <input type="hidden" name="fSubmitted" id="fSubmitted" value="true">
                  <input type="hidden" name="startDate" id="startDate" value="">
                  <input type="hidden" name="endDate" id="endDate" value="">

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
        	<div id="queryText" class="col-md-10">

        	</div>
        </div>

		<%
			Access access = new Access();
            
            if( queryResult != null )
            {
                out.println("<div class='row'>");
                out.println("<div class=\"col-md-10\"><br><label for='results'>Results</label>");
                out.println("<table class=\"table table-striped\">");
                out.println("<tr><tr>");
                out.println("<th bgcolor='#B4CDCD' style='border:1px solid black;padding:15px;'>ID</th>");
                out.println("<th bgcolor='#B4CDCD' style='border:1px solid black;padding:15px;'>Submitted By User</th>");
                out.println("<th bgcolor='#B4CDCD' style='border:1px solid black;padding:15px;'>Date Created</th>");
                out.println("<th bgcolor='#B4CDCD' style='border:1px solid black;padding:15px;'>Error</th>");
                out.println("</tr>");

				

                while( queryResult.next() )
                {
                	
            		String Eid = access.selectDB("QueryError", "Eid", "Qid = '"+queryResult.getString("Qid")+"'");
            		String errorMessage;
            		if(Eid != null)
            			errorMessage = access.selectDB("Error", "Edetail", "Eid = '"+Eid+"'");
            		else
            			errorMessage = "No Error";
            			
            		request.getSession().setAttribute("Qid", queryResult.getString("Qid"));
            		request.getSession().setAttribute("Eid", Eid);
                	
                    String html = "<tr align='center'><td>" + queryResult.getString("Qid") + "</td>" +
                		"<td>" + queryResult.getString("Qusername") + "</td>" +
                        "<td>" + queryResult.getString("Qtime") + "</td>" +
                      	"<td>" + errorMessage + "</td>" +
                        "<td>" + "<a class=\"btn btn-info\" id='"+ queryResult.getString("Qid") +"' role=\"button\" onclick='buttonClick("+ queryResult.getString("Qid") +")'>Details</a>" + "</td>" +
                        "</tr><form>";
                    out.println( html );
                }

                out.println("</table></div></div>");
            }
        %>
        
      </div>      
    </div>

  </body>
</html>