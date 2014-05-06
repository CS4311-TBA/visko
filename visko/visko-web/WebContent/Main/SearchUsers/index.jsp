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
    	boolean toggleSubmitted = Boolean.parseBoolean( request.getParameter("toggleSubmitted") );
    	Access aDB = new Access();
	    ResultSet rst = null;
	    
	    
	    if( toggleSubmitted )
	    {
	    	String s = request.getParameter("userStatus");
	    	String id = request.getParameter("userID");
	    	
	    	
	    	if( s.equalsIgnoreCase("0") )
	    	{
	    		aDB.updateDB("Users", "Ustatus", "1", "Usid", id);
	    	}	
	    	else
	    	{
	    		aDB.updateDB("Users", "Ustatus", "0", "Usid", id);
	    	}
	    	
	    }
	    
	    
	    
    
	    if( formSubmitted )
    	{

    		String email = request.getParameter( "email" );
    		String fname = request.getParameter( "first" );
    		String lname = request.getParameter( "last" );
    		String org = request.getParameter( "affiliation" );
    		String status = request.getParameter( "status" );
    		String start = request.getParameter( "startDate" );
    		String end = request.getParameter( "endDate" );
    		
    		String constraints = "(";
    		boolean conAdded = false;

            /*
            if( email == null || email.equalsIgnoreCase("") )
            {
                out.println("<br><br><br><br><br><br><div class='col-md-10 col-md-offset-2'><div class='container'><div class='row'>email: ( NULL OR EMPTY )</div></div></div>");
            }
            else
            {
                out.println("<br><br><br><br><br><br><div class='col-md-10 col-md-offset-2'><div class='container'><div class='row'>email: (" + email + ")</div></div></div>");
            }
            */


            
    		
    		if( !email.equalsIgnoreCase("") && email != null )
    		{
    			constraints += " Uemail = '" + email + "' ";
    			conAdded = true;
    		}
    		
    		if( !fname.equalsIgnoreCase("") && fname != null )
    		{
    			if( conAdded )
    			{
    				constraints += "&& Ufirstname = '" + fname + "' ";	
    			}
    			else
    			{
    				constraints += " Ufirstname = '" + fname + "' ";
    				conAdded = true;
    			}
    			
    		}
    		
    		if( !lname.equalsIgnoreCase("") && lname != null )
    		{
    			if( conAdded )
    			{
    				constraints += "&& Ulastname = '" + lname + "' ";	
    			}
    			else
    			{
    				constraints += " Ulastname = '" + lname + "' ";
    				conAdded = true;
    			}
    			
    		}
    		
    		if( !org.equalsIgnoreCase("") && org != null )
    		{
                if( !org.equalsIgnoreCase("*") )
                {
        			if( conAdded )
        			{
        				constraints += "&& Uorganization = '" + org + "' ";	
        			}
        			else
        			{
        				constraints += " Uorganization = '" + org + "' ";
        				conAdded = true;
        			}
                }
    			
    		}
    		
    		if( !status.equalsIgnoreCase("") && status != null )
    		{
                if( !status.equalsIgnoreCase("*") )
                {
                    if( conAdded )
                    {
                        constraints += "&& Ustatus = '" + status + "' ";    
                    }
                    else
                    {
                        constraints += " Ustatus = '" + status + "' ";
                        conAdded = true;
                    }
                }	
    		}
    		
    		// both start and end found
    		if( (!start.equalsIgnoreCase("") && start != null) && (!end.equalsIgnoreCase("") && end != null) )
    		{
    			if( conAdded )
    			{
    				constraints += "&& Utime BETWEEN '" + start + "' and '" + end + "' ";	
    			}
    			else
    			{
    				constraints += " Utime BETWEEN '" + start + "' and '" + end + "' ";
    				conAdded = true;
    			}
    			
    		}//only start found
    		else if( (!start.equalsIgnoreCase("") && start != null) && 
    				(end.equalsIgnoreCase("") || end == null) )
    		{
    			if( conAdded )
    			{
    				constraints += "&& Utime > '" + start + "'  ";	
    			}
    			else
    			{
    				constraints += " Utime > '" + start + "' ";
    				conAdded = true;
    			}	
    		}//only end found
    		else if( (start.equalsIgnoreCase("") || start == null) && 
    				(!end.equalsIgnoreCase("") && end != null) )
    		{
    			if( conAdded )
    			{
    				constraints += "&& Utime < '" + end + "'  ";	
    			}
    			else
    			{
    				constraints += " Utime < '" + end + "' ";
    				conAdded = true;
    			}	
    		}
    		

    		
    		if( conAdded )
    		{
    			constraints += ");";	
    		}
    		else
    		{
    			constraints += "Ufirstname IS NOT NULL );";
    		}
    		
    		rst = aDB.selectResultSet("Users", "*", constraints);
    		

            
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

    <script>
      $(function() {


        $( "#startDate_picker" ).datepicker(
            {
                "altField":"#startDate",
                "dateFormat":"yy-mm-dd"
            }
        );
        $("#endDate_picker").datepicker(
            {
                "altField":"#endDate",
                "dateFormat":"yy-mm-dd"
            }
        );
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
                <h3> User Search Criteria </h3>

                    <div class="row">

                      <label class="control-label" for="userEmail">User Email</label>
                      <input class="form-control" type="text" name="email">

                      <label class="control-label" for="viewerSet">First Name</label>
                      <input class="form-control" type="text" name="first">

                      <label class="control-label" for="sourceFormat">Last Name</label>
                      <input class="form-control" type="text" name="last">

                      <label class="control-label" for="sourceType">Affiliation</label>
               		 <select class="form-control" name="affiliation">
                        <option value="*">Any</option>
                      <%
                      	aDB = new Access();
                    	ResultSet rs = aDB.selectResultSet("Users", "DISTINCT Uorganization", "Uorganization IS NOT NULL");
                    	
                    	while( rs.next() )
                    	{
                    		String org = rs.getString("Uorganization");
                    		out.println("<option value='"+org+"'>"+org+"</option>");
                    	}
                    	
                      %>
                      
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
                      <input id="startDate_picker" type="text" class="form-control" />
                    </div>

                    <div class="col-md-6">
                      <label for="date-picker-2" class="control-label">End Date</label>
                      <input id="endDate_picker" type="text" class="form-control" />
                    </div>
                  </div>

                  <br><br>

                  <label class="control-label" for="targetFormat">Account Status</label>
                  <select class="form-control" name="status">
                    <option value="*">Any Status</option>
                    <option value="1">Active</option>
                    <option value="0">Suspended</option>
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

             <%
                if( rst != null )
                {
                    out.println("<div class='row'>");
                    out.println("<div class=\"col-md-10\"><br><label for='results'>Results</label>");
                    out.println("<table class=\"table table-striped\">");
                    out.println("<tr><tr>");
                    out.println("<th bgcolor='#B4CDCD' style='border:1px solid black;padding:15px;'>Date Joined</th>");
                    out.println("<th bgcolor='#B4CDCD' style='border:1px solid black;padding:15px;'>Account Status</th> ");
                    out.println("<th bgcolor='#B4CDCD' style='border:1px solid black;padding:15px;'>First Name</th>");
                    out.println("<th bgcolor='#B4CDCD' style='border:1px solid black;padding:15px;'>Last Name</th>");
                    out.println("<th bgcolor='#B4CDCD' style='border:1px solid black;padding:15px;'>Affiliation</th>");
                    out.println("</tr>");



                    while( rst.next() )
                    {
                        String html = "<form id='toggleForm' method='post' class='form-horizontal'>" +
                        	"<tr align='center'><td>" + rst.getString("Utime") + "</td>" +
                            "<td>" + rst.getString("Ustatus") + "</td>" +
                            "<td>" + rst.getString("Ufirstname") + "</td>" + 
                            "<td>" + rst.getString("Ulastname") + "</td>" + 
                            "<td>" + rst.getString("Uorganization") + "</td>" + 
                            "<input type='hidden' name='userID' id='userID' value='"+rst.getString("Usid") +"'>" +
                            "<input type='hidden' name='userStatus' id='userStatus' value='"+rst.getString("Ustatus") +"'>" +
                            "<input type='hidden' name='toggleSubmitted' id='toggleSubmitted' value='true'>" +
                            "<td>" + "<button id='toggleButton' name='toggleButton' type='submit' class='btn btn-info'>Toggle</button>" + "</td>" + 
                            "</tr></form>";
                        out.println( html );
                    }

                    out.println("</table></div></div>");
                }

             %>
			 
			
      </div>      
    </div>

  </body>
</html>