<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Visko</title>
    <%@ include file="../includePage/header.jsp" %>
    <%@ page import="edu.utep.trustlab.visko.web.html.*" %>
    <%@ page import="java.util.*" %>
    <%@ page import ="java.sql.*" %> 

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

    <div class="col-md-10 col-md-offset-1">
      <div class="container">
        <div class="row">
        
        <h3> Search Result Details</h3>
        
        <%
        String Qid = request.getParameter("Qid");
        String Pid = request.getParameter("Pid");
        String Vid = request.getParameter("Vid");
        Access access = new Access();

        out.println("<label for='results'>Visualization</label>");
        out.println("<table class=\"table table-striped\">");
        out.println("<tr>");
        out.println("<th bgcolor='#B4CDCD' style='border:1px solid black;padding:15px;'>ID</th>");
        out.println("<th bgcolor='#B4CDCD' style='border:1px solid black;padding:15px;'>Time Submitted</th>");
        out.println("</tr>");

        ResultSet visResult = access.selectResultSet("Visualization", "*", "Vid = '"+Vid+"';");

        while( visResult.next() )
        {
            out.println("<tr><td>" + visResult.getString("Vid") + "</td>" +
            "<td>" + visResult.getString("Vtime") + "</td></tr>" );
        }

        out.println("</table><hr>");



        out.println("<label for='results'>Pipeline</label>");
        out.println("<table class=\"table table-striped\">");
        out.println("<tr>");
        out.println("<th bgcolor='#B4CDCD' style='border:1px solid black;padding:15px;'>ID</th>");
        out.println("<th bgcolor='#B4CDCD' style='border:1px solid black;padding:15px;'>Abstraction</th>");
        out.println("<th bgcolor='#B4CDCD' style='border:1px solid black;padding:15px;'>Format</th>");
        out.println("<th bgcolor='#B4CDCD' style='border:1px solid black;padding:15px;'>Time Submitted</th>");
        out.println("</tr>");

        ResultSet pResult = access.selectResultSet("Pipeline", "*", "Pid = '"+Pid+"';");

        while( pResult.next() )
        {
            out.println("<tr><td>" + pResult.getString("Pid") + "</td>" +
            "<td>" + pResult.getString("Pabstraction") + "</td>" +
            "<td>" + pResult.getString("Pformat") + "</td>" +
            "<td>" + pResult.getString("Ptime") + "</td></tr>");
        }

        out.println("</table><hr>");



        out.println("<label for='results'>Query</label>");
        out.println("<table class=\"table table-striped\">");
        out.println("<tr>");
        out.println("<th bgcolor='#B4CDCD' style='border:1px solid black;padding:15px;'>ID</th>");
        out.println("<th bgcolor='#B4CDCD' style='border:1px solid black;padding:15px;'>Type</th>");
        out.println("<th bgcolor='#B4CDCD' style='border:1px solid black;padding:15px;'>Input URL</th>");
        out.println("<th bgcolor='#B4CDCD' style='border:1px solid black;padding:15px;'>Viewer Set</th>");
        out.println("<th bgcolor='#B4CDCD' style='border:1px solid black;padding:15px;'>Target Type</th>");
        out.println("<th bgcolor='#B4CDCD' style='border:1px solid black;padding:15px;'>Time Submitted</th>");
        out.println("</tr>");

        ResultSet qResult = access.selectResultSet("Query", "*", "Qid = '"+Qid+"';");

        qResult.first();
            out.println("<tr><td>" + qResult.getString("Qid") + "</td>" +
            "<td>" + qResult.getString("Qtype") + "</td>" +
            "<td>" + qResult.getString("QinputUrl") + "</td>" +
            "<td>" + qResult.getString("QviewerSet") + "</td>" +
            "<td>" + qResult.getString("QtargetType") + "</td>" + 
            "<td>" + qResult.getString("Qtime") + "</td></tr>");
        out.println("</table>");

        out.println("<label>Query String </label><br><textarea style='width: 989px; height: 200px;'' id='queryText' name='query'>"+qResult.getString("Qstring")+"</textarea>");






    	%>
    	
        </div> 
      </div>      
    </div>

  </body>
</html>