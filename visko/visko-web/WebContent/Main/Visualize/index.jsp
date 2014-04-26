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
                  <td></td>
                  <td align="right">
                    <table>
                      <tr>
                        <td><input type="submit" id="submitButton" style="width: 156px"></td>
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
                      out.write("<td>"+"Description"+"</td>");
                      out.write("</tr>");
                    }
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
                  <table>
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
                      out.write("<td>"+"Description"+"</td>");
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
                  <table>
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
                      out.write("<td>"+"Description"+"</td>");
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

    <%@ include file="../includePage/footer.jsp" %>
  </body>
</html>