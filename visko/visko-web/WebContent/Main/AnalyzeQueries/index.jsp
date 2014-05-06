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
    		Access aDB = new Access();
			queryResult = aDB.selectResultSet("Query", "*", "Qstatus IS NOT NULL");        
        	int total = 0;
        	List<String> aType = new ArrayList<String>();
        	List<String> aViewSet = new ArrayList<String>();
        	List<String> aFormat = new ArrayList<String>();
        	List<String> aString = new ArrayList<String>();
        	
        while( queryResult.next() )
          {
          	total++;
      		String Eid = aDB.selectDB("QueryError", "Eid", "Qid = '"+queryResult.getString("Qid")+"'");
      		String getAbs = queryResult.getString("Qtype");
      		String getViewSet = queryResult.getString("QviewerSet");
      		String getFormat = queryResult.getString("QtargetType");
      		String getString = queryResult.getString("Qstring");
      		
      		String errorMessage;
      		
     		aType.add(getAbs);
     		aViewSet.add(getViewSet);
     		aFormat.add(getFormat);
     		aString.add(getString);
     		
     		
      		if(Eid != null)
      			errorMessage = aDB.selectDB("Error", "Edetail", "Eid = '"+Eid+"'");
      		else
      			errorMessage = "No Error";
      			
          	/**
              String html = "<tr align='center'><td>" + queryResult.getString("Qid") + "</td>" +
          		"<td>" + queryResult.getString("Qusername") + "</td>" +
                  "<td>" + queryResult.getString("Qtime") + "</td>" +
                	"<td>" + errorMessage + "</td>" +
                  "<td>" + "<button id=\"detailButton\" name=\"detailButton\" type=\"button\" class=\"btn btn-info\">Details</button>" + "</td>" +
                  "</tr>";
              out.println( html );
              **/
          } %>
          
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
        	  dupView[i] = aString.get(i);
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
          <h4>Frequency of pipeline Errors</h4>
          
          <br>
          <p>--GRAPH GOES HERE--</p>
          <br>
          
          <h4>Most Popular Query</h4>
          
          
          
    	      <textarea rows="4" cols="50">
				<% out.write(dupString[posString]);%>
			  </textarea>
			
			
      </div>      
    </div>

  </body>
</html>