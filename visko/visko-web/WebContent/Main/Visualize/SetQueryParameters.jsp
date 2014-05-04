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

    <div class="col-md-10 col-md-offset-1">
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
            <li><p> <%= abstractionType %> <% String description = ""; %> 
            <%if (abstractionType.contains("1D_")){
            	description = "a linear representation of important events in the order in which they occurred";
            	}
            else if (abstractionType.contains("Contour")){
            	description = " contour";
            	}
            else if (abstractionType.contains("ForceGraph")){
            	description = " assign forces among the set of edges and the set of nodes of a graph drawing. ";
            }
            else if (abstractionType.contains("PointMap")){
            	description = " a map that contains detailed points depending on a specified data set";
            }
            else if (abstractionType.contains("Raster")){
            	description = " a data layer consisting of a gridded array of cells";
            	}
            else if (abstractionType.contains("Species")){
            	description = " represents the geographical region where individuals of a species can be found";
            	}
            else if (abstractionType.contains("SpherizedRaster")){
            	description = " a data layer consisting of a gridded array of cells in a 3D model view";
            	}
            else if (abstractionType.contains("TimeSeries")){
            	description = " a group of polygon objects as they change over time";
            	}
            else if (abstractionType.contains("VisKo_DataTransformations_ForceGraph")){
            	description = " Description not available";
            	}
            else if (abstractionType.contains("Visko_Instances_BarChart")){
            	description = " Description not available";
            	}
            else if (abstractionType.contains("VisKo_OperatorPaths_ForceGraph")){
            	description = " Description not available";
            	}
            else if (abstractionType.contains("3D_BarChart")){
            	description = " displays data visually either horizontally or vertically in a 3D model";
            	}
            else if (abstractionType.contains("3D_IsoSurfacesRendering")){
            	description = " a three-dimensional analog of an isoline. It is a surface that represents points of a constant value";
            	}
            else if (abstractionType.contains("3D_MeshPlot")){
            	description = " produces wireframe surfaces that color only the lines connecting the defining points";
            	}
            else if (abstractionType.contains("3D_MolecularStructure")){
            	description = " the three dimensional shape or configuration of a molecule is an important characteristic";
            	}
            else if (abstractionType.contains("3D_MolecularStructure_Cartoon")){
            	description = " he three dimensional shape or configuration of a molecule is an important characteristic in a cartoon graphic";
            	}
            else if (abstractionType.contains("3D_PointPlot")){
            	description = " 3-dimensional Cartesian coordinate system.";
            	}
            else if (abstractionType.contains("3D_RasterCube")){
            	description = " a 3D cube representation of a data layer consisting of a gridded array of cells";
            	}
            else if (abstractionType.contains("3D_SurfacePlot")){
            	description = "  a 3D Plot is a graphic display that shows all collated data";
            	}
            else if (abstractionType.contains("3D_VolumeRendering")){
            	description = "  a set of techniques used to display a 3D discretely sampled data set.";
            	}%> - <% out.write(description); %> </p></li>
            
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