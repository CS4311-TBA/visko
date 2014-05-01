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

    <%@ page import="edu.utep.trustlab.visko.web.html.*" %>
    <%@ page import="java.util.*" %>     
    <%@ include file="../includePage/sideBar.jsp" %>

    <div class="col-md-10 col-md-offset-2">
      <div class="container">
        <div class="row">

          <!-- PAGE INFORMAITON GOES HERE -->

          <% 
            SelectionOptionsHTML o = new SelectionOptionsHTML();
            String abstractionType = (String) request.getSession().getAttribute("AbstractionType"); 
          %>

          <h3>Set Query Parameters</h3>
          <ul class="list-inline">
            <li><img src="/visko-web/Main/assets/img/<%= abstractionType %>.png" class="img-responsive" alt="Responsive image" width="200" height="200"></li>
            <li><p> <%= abstractionType %> <% String description = "TEST OUT"; %> <%if (abstractionType.contains("1D_Timeline")){
            										description = "TEST!!!";
            										}%> - <% out.write(description) %>  Description text corresponding to selected visual abstraction from previous page</p></li>
            }
          </ul>

          
          <hr>
          
          <form action="/visko-web/ViskoServletManager">
            <input type="hidden" name="requestType" value="new-build-query" />
            <input type="hidden" name="abstractionType" value="<%=abstractionType%>" />
            <ul class="list-inline">
              <li>
                <select class="form-control" name="viewerSet" style="width: 500px"><%=o.getViewerSets()%>
              </select>
              </li>
              <li><p><b>Viewer Sets</b>  refer to programs that present the abstractions...</p></li>
            <br>
              <li>
                <select class="form-control" name="inputUrlFormat" style="width: 500px"><%=o.getFormats()%></select>  
              </li>
              <li><p><b>Input Data Format</b>  refers to the file encoding of the input data set...</p></li>
            <br>
              <li>
                <select class="form-control" name=inputUrlType style="width: 500px"><%=o.getTypes()%></select> 
              </li>
              <li><p><b>Input Data Type</b> refers to the data structure represented by...</p></li>
            <br>
              <li>
                <input class="form-control" name="inputUrl" type="text" style="width: 500px">
              </li>
              <li><p><b>Input Data URL</b>  refers to the location of the data to be visualized...</p></li>
            </ul>
            <td><input type="submit" id="submitButton" style="width: 156px"></td>
          </form>



          
        </div>      
      </div>
    </div>

    <%@ include file="../includePage/footer.jsp" %>
  </body>
</html>