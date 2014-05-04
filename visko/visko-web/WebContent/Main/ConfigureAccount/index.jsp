<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import ="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="edu.utep.trustlab.visko.web.*" %>


<%

  String warning = "";
  boolean cEmail = Boolean.parseBoolean( request.getParameter("emailChange") );
  boolean cPass = Boolean.parseBoolean( request.getParameter("passwordChange") );

  User curUser = (User)session.getAttribute("user");
  String nEmail = request.getParameter("newEmail");
  String nPass = request.getParameter("newPass");

  try
  {
    
    // set connection
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://earth.cs.utep.edu/cs4311team1sp14","cs4311team1sp14","teamTBA");

    if( cEmail && cPass )
    {
    	nEmail = nEmail.toLowerCase();
      //need to check if new email is already being used

      Statement st1 = con.createStatement();

      st1.executeUpdate("UPDATE Users SET Uemail='" + nEmail
      + "', Upassword='"+ nPass +"' WHERE Uemail='"
      + curUser.getEmail() +"';");

      curUser.setEmail(nEmail);
      curUser.setPass(nPass);
      session.setAttribute("user", curUser);
      warning = "<p style='color:green'>Email and Password updated successfully.</p>";

    }
    else if ( cEmail && !cPass ) //Change email only
    {

    	nEmail = nEmail.toLowerCase();
      //need to check if new email is already being used

      Statement st1 = con.createStatement();

      st1.executeUpdate("UPDATE Users SET Uemail='" + nEmail 
      + "' WHERE Uemail='" + curUser.getEmail() +"';");

      curUser.setEmail(nEmail);
      session.setAttribute("user", curUser);
      warning = "<p style='color:green'>Email updated successfully.</p>";


    }
    else if ( !cEmail && cPass ) //change password only
    {
      //need to check if new email is already being used

      Statement st1 = con.createStatement();

      st1.executeUpdate("UPDATE Users SET Upassword='"+ nPass +"' WHERE Uemail='"
      + curUser.getEmail() +"';");

      curUser.setPass(nPass);
      session.setAttribute("user", curUser);
      warning = "<p style='color:green'>Password updated successfully.</p>";
    }
    else
    {
        //Do nothing
    }  
  }
  catch(SQLException sq)
  {
    warning = "<p style='color:red'>Error connecting to SQL database: " + sq.getMessage() + "</p>";
  }
  catch(Exception e){
    warning = "<p style='color:red'>Error: " + e.getMessage() + "</p>";
  }
%>



<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Visko - Configure Account</title>

    <%@ include file="../includePage/header.jsp" %>
    <%@ include file="../includePage/footer.jsp" %>

    <!-- Bootstrap core CSS -->
    <link href="/visko-web/Main/assets/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/visko-web/Main/assets/css/sideBar.css" rel="stylesheet">

    <style type="text/css">
      .orange {
        color: orange;
      }

      .green {
          color: green;
      }

      .red {
          color: red;
      }

      td
      {
        text-align:left;
      }

    </style>

    <script>
      $( document ).ready(function() {
        $('#curPassFail').hide();
        $('#curPassPass').hide();

        $('#newPassFail').hide();
        $('#newPassPass').hide();
        $('#newPassWarn').hide();

        $('#confirmPassFail').hide();
        $('#confirmPassPass').hide();
        $('#confirmPassWarn').hide();

        $('#newEmailPass').hide();
        $('#newEmailWarn').hide();
        $('#newEmailFail').hide();

        $('#confirmEmailPass').hide();
        $('#confirmEmailWarn').hide();
        $('#confirmEmailFail').hide(); 

        //Reset buton
        $('#reset').on('click', 
          function () 
          {
            $('#curPassFail').hide();
            $('#curPassPass').hide();

            $('#newPassFail').hide();
            $('#newPassPass').hide();
            $('#newPassWarn').hide();

            $('#confirmPassFail').hide();
            $('#confirmPassPass').hide();
            $('#confirmPassWarn').hide();

            $('#newEmailPass').hide();
            $('#newEmailWarn').hide();
            $('#newEmailFail').hide();

            $('#confirmEmailPass').hide();
            $('#confirmEmailWarn').hide();
            $('#confirmEmailFail').hide();

            $('#passwordChange').val("false");
            $('#emailChange').val("false");
          }
        );



        // Current Password Input
        $('#curPass').on('click mouseenter mouseleave keyup paste', function () {
          setTimeout(function(){ 
            var passInput = $('#curPass').val();
            //var check = $('#passSession').val();
            var check = '<%= curUser.getPass() %>';
            if( passInput.length == 0 )
            {
              $('#curPassPass').hide();
              $('#curPassFail').hide();

              $('#passwordChange').val("false");
            }
            else if( passInput == check )
            {
              $('#curPassPass').show();
              $('#curPassFail').hide();

              if( $('#newPass').val().length >= 6 && $('#newPass').val() == $('#confirmPass').val() )
              {
                $('#passwordChange').val("true");
              }
              else
              {
                $('#passwordChange').val("false");
              }

            }
            else
            {
              $('#curPassPass').hide();
              $('#curPassFail').show();

              $('#passwordChange').val("false");
            }
          },0);
        });

        // Password Input
        $('#newPass').on('click mouseenter mouseleave keyup paste', function () {
          setTimeout(passMatchCheck, 0);
        });


        $('#confirmPass').on('click mouseenter mouseleave keyup paste', function () {
          setTimeout(passMatchCheck, 0);
        });


        $('#newEmail').on('click mouseenter mouseleave keyup paste', function () {
          setTimeout(emailMatchCheck, 0);
        });

        $('#confirmEmail').on('click mouseenter mouseleave keyup paste', function () {
          setTimeout(emailMatchCheck, 0);
        });



        



      });  //Document Ready

      function passMatchCheck() {
        //Password
        var passInput = $('#newPass').val();
        var checkInput = $('#confirmPass').val();

        var check = '<%= curUser.getPass() %>';

        if( passInput.length >= 6 ) 
        {
          if( passInput == checkInput)
          {
            $('#newPassPass').show();
            $('#newPassWarn').hide();
            $('#newPassFail').hide();

            $('#confirmPassPass').show();
            $('#confirmPassWarn').hide();
            $('#confirmPassFail').hide();

            
            if( $('#curPass').val() == check )
            {
              $('#passwordChange').val("true");
            }
            else
            {
              $('#passwordChange').val("false");
            }
          }
          else if( checkInput.length >= 6 )
          {
            $('#newPassPass').hide();
            $('#newPassWarn').show();
            $('#newPassFail').hide();

            $('#confirmPassPass').hide();
            $('#confirmPassWarn').show();
            $('#confirmPassFail').hide();            
          
            $('#passwordChange').val("false");
          }
          else if( checkInput.length > 0 )
          {
            $('#newPassPass').hide();
            $('#newPassWarn').show();
            $('#newPassFail').hide();

            $('#confirmPassPass').hide();
            $('#confirmPassWarn').hide();
            $('#confirmPassFail').show();

            $('#passwordChange').val("false");
          }
          else
          {
            $('#newPassPass').hide();
            $('#newPassWarn').show();
            $('#newPassFail').hide();

            $('#confirmPassPass').hide();
            $('#confirmPassWarn').hide();
            $('#confirmPassFail').hide();

            $('#passwordChange').val("false");
          }
        }
        else if( checkInput.length >= 6 )
        {
          if( passInput == checkInput)
          {
            $('#newPassPass').show();
            $('#newPassWarn').hide();
            $('#newPassFail').hide();

            $('#confirmPassPass').show();
            $('#confirmPassWarn').hide();
            $('#confirmPassFail').hide();

            $('#passwordChange').val("false");
          }
          else if( passInput.length >= 6 )
          {
            $('#newPassPass').hide();
            $('#newPassWarn').show();
            $('#newPassFail').hide();

            $('#confirmPassPass').hide();
            $('#confirmPassWarn').show();
            $('#confirmPassFail').hide(); 

            $('#passwordChange').val("false");           
          }
          else if( passInput.length > 0 )
          {
            $('#newPassPass').hide();
            $('#newPassWarn').hide();
            $('#newPassFail').show();

            $('#confirmPassPass').hide();
            $('#confirmPassWarn').show();
            $('#confirmPassFail').hide();

            $('#passwordChange').val("false");
          }
          else
          {
            $('#newPassPass').hide();
            $('#newPassWarn').hide();
            $('#newPassFail').hide();

            $('#confirmPassPass').hide();
            $('#confirmPassWarn').show();
            $('#confirmPassFail').hide();

            $('#passwordChange').val("false");
          }
        }
        else{
          if( passInput.length > 0 )
          {
            $('#newPassPass').hide();
            $('#newPassWarn').hide();
            $('#newPassFail').show();

            $('#passwordChange').val("false");
          }
          else
          {
            $('#newPassPass').hide();
            $('#newPassWarn').hide();
            $('#newPassFail').hide();

            $('#passwordChange').val("false");
          }
          

          if( checkInput.length > 0 )
          {
            $('#confirmPassPass').hide();
            $('#confirmPassWarn').hide();
            $('#confirmPassFail').show();

            $('#passwordChange').val("false");
          }
          else
          {
            $('#confirmPassPass').hide();
            $('#confirmPassWarn').hide();
            $('#confirmPassFail').hide();

            $('#passwordChange').val("false");
          }
        }
      }


      function emailMatchCheck()
      {
        var newEmail = $('#newEmail').val().toLowerCase();
        var conEmail = $('#confirmEmail').val().toLowerCase();
        var emailTest = /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/igm;
        var confirmEmailTest = /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/igm;

        if( newEmail.length > 0 )
        {
          if( emailTest.test(newEmail) ) //email is valid
          {
            if( newEmail == conEmail )
            {
              $('#newEmailPass').show();
              $('#newEmailWarn').hide();
              $('#newEmailFail').hide();
             
              $('#confirmEmailPass').show();
              $('#confirmEmailWarn').hide();
              $('#confirmEmailFail').hide();

              $('#emailChange').val("true");
            }
            else if( conEmail.length > 0 )
            {
              if( confirmEmailTest.test(conEmail) )
              {
                $('#newEmailPass').hide();
                $('#newEmailWarn').show();
                $('#newEmailFail').hide();
               
                $('#confirmEmailPass').hide();
                $('#confirmEmailWarn').show();
                $('#confirmEmailFail').hide(); 

                $('#emailChange').val("false");
              }
              else
              {
                $('#newEmailPass').hide();
                $('#newEmailWarn').show();
                $('#newEmailFail').hide();
               
                $('#confirmEmailPass').hide();
                $('#confirmEmailWarn').hide();
                $('#confirmEmailFail').show(); 

                $('#emailChange').val("false");
              }
            }
            else
            {
              $('#newEmailPass').hide();
              $('#newEmailWarn').show();
              $('#newEmailFail').hide();
             
              $('#confirmEmailPass').hide();
              $('#confirmEmailWarn').hide();
              $('#confirmEmailFail').hide(); 

              $('#emailChange').val("false");
            }
          }
          else //email not valid
          {
            if( conEmail.length > 0 ) //non-empty conEmail field
            {
              $('#newEmailPass').hide();
              $('#newEmailWarn').hide();
              $('#newEmailFail').show();

              $('#confirmEmailPass').hide();
              $('#confirmEmailWarn').hide();
              $('#confirmEmailFail').show(); 

              $('#emailChange').val("false");
            } 
            else //empty conEmail field
            {
              $('#newEmailPass').hide();
              $('#newEmailWarn').hide();
              $('#newEmailFail').show();

              $('#confirmEmailPass').hide();
              $('#confirmEmailWarn').hide();
              $('#confirmEmailFail').hide(); 

              $('#emailChange').val("false");
            }

          }
        }
        else //email lenght == 0
        {
          if( conEmail.length > 0 )
          {
            if( confirmEmailTest.test(conEmail) )
            {
              $('#newEmailPass').hide();
              $('#newEmailWarn').hide();
              $('#newEmailFail').hide();

              $('#confirmEmailPass').hide();
              $('#confirmEmailWarn').show();
              $('#confirmEmailFail').hide(); 

              $('#emailChange').val("false");
            }
            else
            {
              $('#newEmailPass').hide();
              $('#newEmailWarn').hide();
              $('#newEmailFail').hide();

              $('#confirmEmailPass').hide();
              $('#confirmEmailWarn').hide();
              $('#confirmEmailFail').show(); 

              $('#emailChange').val("false");
            }
          }
          else //conEmail == 0
          {
            $('#newEmailPass').hide();
            $('#newEmailWarn').hide();
            $('#newEmailFail').hide();

            $('#confirmEmailPass').hide();
            $('#confirmEmailWarn').hide();
            $('#confirmEmailFail').hide(); 

            $('#emailChange').val("false");
          }
        }
      }

    </script>


  </head>

  <body>
     
    <%@ include file="../includePage/sideBar.jsp" %>

    <div class="col-md-10 col-md-offset-1">
      <div class="container">
        <div class="row">

        <!-- PAGE INFORMAITON GOES HERE -->

        <br><br><br>

        <form id="changeForm" method="post" class="form-horizontal">
        <fieldset>


          <!-- Warning -->
          <div class="form-group">
            <div id="warning" class="text-center" for="warning">
              <%= warning %>
            </div> 
          </div>


          <!-- Change Pass -->
          <h3> Change Password </h3>

          <!-- Change Pasword -->
          <div class="row">
            <div class="col-md-12">
              <label class="control-label" for="curPassword">Current Password</label>
            </div>
          </div>

          <div class="row">
            <div class="col-md-10">
              <input id="curPass" name="curPass" type="password" placeholder="" class="form-control input-md">
            </div>
            <div class="col-md-1">
              <div id="curPassFail" class="glyphicon glyphicon-ok red"></div>
              <div id="curPassPass" class="glyphicon glyphicon-ok green"></div>
            </div>
          </div>

          <div class="row">
            <div class="col-md-12">
              <label class="control-label" for="curPassword">New Password</label>
            </div>
          </div>

          <div class="row">
            <div class="col-md-10">
              <input id="newPass" name="newPass" type="password" placeholder="" class="form-control input-md">
            </div>
            <div class="col-md-1">
              <div id="newPassFail" class="glyphicon glyphicon-ok red"></div>
              <div id="newPassPass" class="glyphicon glyphicon-ok green"></div>
              <div id="newPassWarn" class="glyphicon glyphicon-ok orange"></div>
            </div>
          </div>
          
          <div class="row">  
            <div class="col-md-12">
              <label class="control-label" for="confirmPassword">Confirm New Password</label>
            </div>
          </div>
          
          <div class="row">
            <div class="col-md-10">
              <input id="confirmPass" name="confirmPass" type="password" placeholder="" class="form-control input-md">
            </div>
            <div class="col-md-1">
              <div id="confirmPassFail" class="glyphicon glyphicon-ok red"></div>
              <div id="confirmPassPass" class="glyphicon glyphicon-ok green"></div>
              <div id="confirmPassWarn" class="glyphicon glyphicon-ok orange"></div>
            </div>
          </div>


        
          <!-- Change Email -->
          <h3> Change Email </h3>

           <!-- Change Email -->
          <div class="row">
            <div class="col-md-12">
              <label class="control-label" for="newEmail">New Email</label>
            </div>
          </div>

          <div class="row">
            <div class="col-md-10">
              <input id="newEmail" name="newEmail" type="text" placeholder="example@visko.com" class="form-control input-md">
            </div>
             <div class="col-md-1">
              <div id="newEmailFail" class="glyphicon glyphicon-ok red"></div>
              <div id="newEmailPass" class="glyphicon glyphicon-ok green"></div>
              <div id="newEmailWarn" class="glyphicon glyphicon-ok orange"></div>
            </div>
          </div>

          <div class="row">
            <div class="col-md-12">
              <label class="control-label" for="confirmEmail">Confirm New Email</label>
            </div>
          </div>

          <div class="row">
            <div class="col-md-10">
               <input id="confirmEmail" name="confirmEmail" type="text" placeholder="example@visko.com" class="form-control input-md">
            </div>
            <div class="col-md-1">
              <div id="confirmEmailFail" class="glyphicon glyphicon-ok red"></div>
              <div id="confirmEmailPass" class="glyphicon glyphicon-ok green"></div>
              <div id="confirmEmailWarn" class="glyphicon glyphicon-ok orange"></div>
            </div>
          </div>

          <br><br>

          <input type="hidden" name="passwordChange" id="passwordChange" value="false">
          <input type="hidden" name="emailChange" id="emailChange" value="false">

          <!-- Button -->
          <div class="row">
            <div class="col-md-10 text-center">
              <button id="reset" name="reset" type="reset" class="btn btn-info">Reset</button>
              <button id="register" name="register" type="submit" class="btn btn-success">Submit</button>
            </div>
           
          </div>
        </fieldset>
      </form>
          
        </div>
      </div>      
    </div>
    
  </body>
</html>