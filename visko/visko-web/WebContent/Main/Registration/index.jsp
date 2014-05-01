

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import ="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="edu.utep.trustlab.visko.web.*" %>

<%
    String warning = "";

    String email = request.getParameter("email");
    String password= request.getParameter("pass");

    Connection con;
    PreparedStatement pstatement = null;


    if( email != null && password != null )
    {
        try{

          // set connection
          Class.forName("com.mysql.jdbc.Driver");
          con = DriverManager.getConnection("jdbc:mysql://earth.cs.utep.edu/cs4311team1sp14","cs4311team1sp14","teamTBA"); 

          //check if email is being used
          String queryString = "SELECT COUNT(*) FROM Users WHERE Uemail='" + email + "';";

          Statement stmt = con.createStatement();
          ResultSet rst = stmt.executeQuery(queryString);

          rst.next();

          if( rst.getInt(1) >= 1 )
          {
            warning = "<p style='color:red'>email already being used</p> forgot password <a href='/visko-web/Main/Recover/'>click here</a>";
          }
          else
          {

            String org = request.getParameter("org");
            String first = request.getParameter("firstName");
            String last = request.getParameter("lastName");
            int priv = 0;

            queryString = "INSERT INTO Users(Utime, Uemail,Upassword,Ufirstname,Ulastname,Uorganization,Upriv) VALUES (NOW(), ?, ?, ?, ?, ?, ?);";

            pstatement = con.prepareStatement(queryString);
            pstatement.setString(1, email);
            pstatement.setString(2, password);
            pstatement.setString(3, first);
            pstatement.setString(4, last);
            pstatement.setString(5, org);
            pstatement.setInt(6, priv);

            pstatement.executeUpdate();

            User curUser = new User(email, password, org, priv, first, last);

            session.setAttribute("user", curUser);

            response.sendRedirect("/visko-web/Main/Home/");

          }
        }
        catch(SQLException sqle)
        {
          warning = "<p style='color:red'>Error connecting to SQL database: " + sqle.getMessage() + "</p>";
        }
        catch(Exception e){
          warning = "<p style='color:red'>Error: " + e.getMessage() + "</p>";
        }
    }
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- jsp -->
<html lang="en">
<%@page import="edu.utep.trustlab.visko.web.html.*" %>
    
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="/visko-web/Main/assets/ico/favicon.ico">

    <title>Register</title>

    <!-- Bootstrap core CSS -->
    <link href="/visko-web/Main/assets/css/bootstrap.min.css" rel="stylesheet">

    <%@ include file="../includePage/footer.jsp" %>

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
        $('#emailFail').hide();
        $('#emailPass').hide();
        $('#emailWarn').hide();

        $('#emailCheckFail').hide();
        $('#emailCheckPass').hide();

        $('#passFail').hide();
        $('#passPass').hide();
        $('#passWarn').hide();

        $('#passCheckFail').hide();
        $('#passCheckPass').hide();


        
        // Email Input
        $('#email').on('click mouseenter mouseleave keypress paste', function () {
          setTimeout(function(){ 
            var email = $('#email').val().toLowerCase();
            var check = $('#emailCheck').val().toLowerCase();
            var re = /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/igm;
            if (re.test(email)) 
            { //valid email 
              if( email == check )
              {
                $('#emailPass').show();
                $('#emailFail').hide();
                $('#emailWarn').hide();

                $('#emailCheckPass').show();
                $('#emailCheckFail').hide();
              }
              else
              {
                $('#emailFail').hide();
                $('#emailPass').hide();
                $('#emailWarn').show();
              }
            } 
            else {
              $('#emailFail').show();
              $('#emailPass').hide();
              $('#emailWarn').hide();
            }
          },0);
        });

        // Confirm Email Input
        $('#emailCheck').on('click mouseenter mouseleave keypress paste', function () {
          setTimeout(function(){ 
            var email = $('#email').val().toLowerCase();
            var check = $('#emailCheck').val().toLowerCase();
            var re = /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/igm;
            if (re.test(check) ) 
            { 
              if( email == check )
              {
                $('#emailPass').show();
                $('#emailFail').hide();
                $('#emailWarn').hide();

                $('#emailCheckPass').show();
                $('#emailCheckFail').hide();
              }
              else
              {
                $('#emailCheckPass').hide();
                $('#emailCheckFail').show();
              }
            }
            else {
              $('#emailCheckFail').show();
              $('#emailCheckPass').hide();
            }
          },0);
        });



        // Password Input
        $('#pass').on('click mouseenter mouseleave keypress paste', function () {
          setTimeout(function(){ 
            var pass = $('#pass').val();
            var check = $('#passCheck').val();
            if( pass.length >= 6 )
            {
              if( pass == check )
              {
                $('#passPass').show();
                $('#passFail').hide();
                $('#passWarn').hide();

                $('#passCheckPass').show();
                $('#passCheckFail').hide();
              }
              else
              {
                $('#passPass').hide();
                $('#passFail').hide();
                $('#passWarn').show();
              }
            }
            else
            {
              $('#passPass').hide();
              $('#passFail').show();
              $('#passWarn').hide();
            }
          },0);
        });

        // Confirm Password Input
        $('#passCheck').on('click mouseenter mouseleave keypress paste', function () {
          setTimeout(function(){ 
            var pass = $('#pass').val();
            var check = $('#passCheck').val();
            if( check.length >= 6 )
            {
              if( pass == check )
              {
                $('#passPass').show();
                $('#passFail').hide();
                $('#passWarn').hide();

                $('#passCheckPass').show();
                $('#passCheckFail').hide();
              }
              else
              {
                $('#passCheckPass').hide();
                $('#passCheckFail').show();              
              }
            }
            else
            {
              $('#passCheckPass').hide();
              $('#passCheckFail').show();
            }
          },0);
        });



        //Form Validation
        $("#regForm").submit(
          function (e) 
          {
            var email = $('#email').val().toLowerCase();
            var emailCheck = $('#emailCheck').val().toLowerCase();
            var pass = $('#pass').val();
            var passCheck = $('#passCheck').val();
            var re = /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/igm;
            var re2 = /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/igm;

            var prevent = true;

            if( re.test(email) )
            {
              if( re2.test(emailCheck) )
              {
                if( pass.length >= 6 && passCheck.length >= 6 )
                {
                  if( email == emailCheck && pass == passCheck )
                  {
                    prevent = false;
                    //alert("Pass");
                  }
                  else
                  {
                    prevent = true;
                    //alert("email or pass not equal");
                    $('#warning').html("<p style='color:red'>Make sure email and passwords match.</p>" );
                  }
                }
                else
                {
                  prevent = true;
                  //alert("pass or passCheck length");
                  $('#warning').html("<p style='color:red'>Password must be at least 6 characters.</p>" );
                }
              }
              else
              {
                prevent = true;
                //alert("emailCheck: " + emailCheck);
                $('#warning').html("<p style='color:red'>Please enter valid email.</p>" );
              }
            }
            else
            {
              prevent = true;
              //alert("email: " + email);
              $('#warning').html("<p style='color:red'>Please enter valid email.</p>" );
            }

            if( prevent )
            {
              e.preventDefault();
              //alert("Prevented Submit");
              //$('#warning').html("<p style='color:red'>Please enter valid email and password</p>" );
            }
          }
        );


      }); 

    </script>


  </head>


<body>

  <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="/visko-web/Main/">VisKo</a>
      </div>
      <div class="navbar-collapse collapse">
    <p class="navbar-text navbar-right"><a href="/visko-web/Main/" class="navbar-link">Return Home</a></p>
    
      </div>
    </div>
  </div>

  <br>
  <br>
  <br>
  <br>
  <br>

  <div class="container">
    <div class="row">

      <form id="regForm" method="post" class="form-horizontal">
        <fieldset>

          <!-- Form Name -->
          <legend>Register <p style="display:inline; font-size:small; color: red;">*Required</p></legend>


          <!-- Warning -->
          <div class="form-group">
            <div id="warning" class="text-center" for="warning">
              <%= warning %>
            </div> 
          </div>


          <!-- Email -->
          <div class="row">
            <div class="col-md-12">
              <label class="control-label" for="email">Email <p style="display:inline; font-size:small; color: red;">*</p></label>
            </div>
          </div>

          <div class="row">
            <div class="col-md-11">
              <input id="email" name="email" type="text" placeholder="example@visko.com" class="form-control input-md" required="">
            </div>
            <div class="col-md-1">
              <div id="emailFail" class="glyphicon glyphicon-ok red"></div>
              <div id="emailPass" class="glyphicon glyphicon-ok green"></div>
              <div id="emailWarn" class="glyphicon glyphicon-ok orange"></div>
            </div>
          </div>

          <!-- Confirm Email -->
          <div class="row">
            <div class="col-md-12">
              <label class="control-label" for="confirmEmail">Confirm Email <p style="display:inline; font-size:small; color: red;">*</p></label>
            </div>
          </div>

          <div class="row">
            <div class="col-md-11">
              <input id="emailCheck" name="emailCheck" type="text" placeholder="example@visko.com" class="form-control input-md" required="">
            </div>
            <div class="col-md-1">
              <div id="emailCheckFail" class="glyphicon glyphicon-ok red"></div>
              <div id="emailCheckPass" class="glyphicon glyphicon-ok green"></div>
            </div>
          </div>

          <!-- Password Labels-->
          <div class="row">
            <div class="col-md-6">
              <label class="control-label" for="password">Password <p style="display:inline; font-size:small; color: red;">*</p></label>
            </div>
            <div class="col-md-6">
              <label class="control-label" for="passwordCheck">Confirm Password <p style="display:inline; font-size:small; color: red;">*</p></label>
            </div>
          </div>

          <!-- Password Inputs -->

          <div class="row">
            <div class="col-md-5">
              <input id="pass" name="pass" type="password" placeholder="" class="form-control input-md" required="">
            </div>
            <div class="col-md-1">
              <!-- CHECK MARKS HERE -->
              <div id="passFail" class="glyphicon glyphicon-ok red"></div>
              <div id="passPass" class="glyphicon glyphicon-ok green"></div>
              <div id="passWarn" class="glyphicon glyphicon-ok orange"></div>
            </div>
            <div class="col-md-5">
               <input id="passCheck" name="passCheck" type="password" placeholder="" class="form-control input-md" required="">
            </div>
            <div class="col-md-1">
              <!-- CHECK MARKS HERE -->
              <div id="passCheckFail" class="glyphicon glyphicon-ok red"></div>
              <div id="passCheckPass" class="glyphicon glyphicon-ok green"></div>
            </div>
          </div>

          <hr>

          
          <div class="row">
            <div class="col-md-6">
              <label class="control-label" for="firstName">First Name</label>
            </div>
            <div class="col-md-6">
              <label class="control-label" for="lastName">Last Name</label>  
            </div>
          </div>

          <div class="row">
            <div class="col-md-5">
               <input id="firstName" name="firstName" type="text" placeholder="" class="form-control input-md">
            </div>
            <div class="col-md-1">
              <!-- Empy for spacing -->
            </div>
            <div class="col-md-5">
              <input id="lastName" name="lastName" type="text" placeholder="" class="form-control input-md">
            </div>
          </div>

          <div class="row">
            <div class="col-md-12">
              <label class="control-label" for="org">Organization Affiliation</label>
            </div>
            <div class="col-md-11">
              <input id="org" name="org" type="text" placeholder="" class="form-control input-md">
            </div>
          </div>

          <br>

          <!-- Button -->
          <div class="row">
            <div class="col-md-5 text-right">
              <button id="reset" name="reset" type="reset" class="btn btn-info">Reset</button>
            </div>
            <div class="col-md-6 text-left">
              <button id="register" name="register" type="submit" class="btn btn-success">Create Account</button>
            </div>
          </div>


        </fieldset>
      </form>
    </div>
  </div>
</body>
</html>