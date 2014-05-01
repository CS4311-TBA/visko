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

    <%@ page import="java.util.*" %>     
    <%@ include file="../includePage/sideBar.jsp" %>

    <div class="col-md-10 col-md-offset-2">
      <div class="container">
        <div class="row">

        <!-- PAGE INFORMAITON GOES HERE -->

          <h3>Select Pipeline</h3>
          <%  
            String test = (String) request.getAttribute( "TEST" );
            String re = (String) request.getSession().getAttribute("re");
    
            TreeMap<String, ArrayList<String>> pipeLines = (TreeMap<String, ArrayList<String>>) request.getSession().getAttribute("resultMap");
    
            // Use iterator to display the keys and associated values
            Set<String> keys = pipeLines.keySet();
            Iterator<String> it = keys.iterator();
            
            if(pipeLines.isEmpty()){
            	out.println("<h3>No Pipeline Found Corresponding to Query.</h3>");
            	out.println("<br><br><a class=\"btn btn-warning\" href=\"/visko-web/Main/Visualize/index.jsp\" style=\"width: 156px\">Back</a>");
            }
            else{         	
	            out.println("<div class=\"panel-group\" id=\"accordion\">");
	            while( it.hasNext() )
	            {
	              String key = it.next();
	              ArrayList<String> value = pipeLines.get(key);
	    
	              out.println(
	                "<div class=\"panel panel-default\">" +
	                "<div class=\"panel-heading\">" +
	                "<h4 data-toggle=\"collapse\" data-parent=\"#accordion\" href=\"#" +key +"\" class=\"panel-title\">"
	              );  
	              out.println(key);
	              out.println(
	                "</h4>" +
	                "</div>" +
	                "<div id=\""+ key +"\" class=\"panel-collapse collapse\">" +
	                "<div class=\"panel-body\">"
	              );
	    
	              out.println(
	                "<table class=\"table table-bordered\">" +
	                "<tr>" +
	                "<td>ID</td>" +
	                "<td>Abstraction</td>" +
	                "<td>Format</td>" +
	                "</tr>"
	              );
	
	              for( int i = 0; i < value.size(); i ++ )
	              {
	                StringTokenizer st = new StringTokenizer(value.get(i), "|");
	                String[] items = new String[6];
	                int count = 0;
	                while (st.hasMoreTokens())
	                {
	                  items[count] = st.nextToken();
	                  count++;
	                } 
	                
	                String executeUrl = items[0];
	                String executeProvenanceUrl = items[1].substring(0, items[1].indexOf("requestType=")+12) + "new-" 
	  					  + items[1].substring(items[1].indexOf("requestType=")+12, items[1].length());
	                //modify editParameters url to call new redirect in ViskoServletManager
	                String editParameters = items[2].substring(0, items[2].indexOf("requestType=")+12) + "new-" 
	                					  + items[2].substring(items[2].indexOf("requestType=")+12, items[2].length());
	                String abstractionType = items[3];
	                String abstractionFormat = items[4];
	                String abstractionDescription = items[5];
	                
	                out.println("<tr>");
	                out.println("<td>"+ i +"</td>");
	                out.println("<td>"+ abstractionType +"</td>");
	                out.println("<td>"+ abstractionFormat +"</td>");
	                out.println("<td><a class=\"btn btn-success\" href=\""+ request.getContextPath()+"\\"+editParameters +"\" role=\"button\">Edit</a></td>");
	                out.println("<td><a class=\"btn btn-success\" href=\""+ request.getContextPath()+"\\"+executeProvenanceUrl +"\" role=\"button\">Run</a></td>");
	                out.println("</tr>");
	              }
	              
	              out.println("</table>" +  
	                "</div>" +
	                "</div>" +
	                "</div>"
	              );
	            }
            }
          %>                 


        </div>      
      </div>
    </div>

    <%@ include file="../includePage/footer.jsp" %>
  </body>
</html>