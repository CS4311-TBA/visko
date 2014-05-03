<%@ page import="javax.mail.*"%>
<%@ page import="javax.mail.internet.*"%>
<%@ page import="java.util.*"%>
<%@ page import ="java.sql.*" %>
<%@ page import="java.io.*" %>
<%

   boolean submitted = Boolean.parseBoolean( request.getParameter("formSubmitted") );
   String result = "";

   if( submitted )
   {

      String email = request.getParameter("email");
      email = email.toLowerCase();
      boolean changePass = false;
      try
      {
         //check if email is in database, if not show error mesage
         Class.forName("com.mysql.jdbc.Driver");
         Connection con = DriverManager.getConnection("jdbc:mysql://earth.cs.utep.edu/cs4311team1sp14","cs4311team1sp14","teamTBA"); 

         //check if email is being used
         String queryString = "SELECT COUNT(*) FROM Users WHERE Uemail='" + email + "';";

         Statement stmt = con.createStatement();
         ResultSet rst = stmt.executeQuery(queryString);

         rst.next();
         if( rst.getInt(1) >= 1 )
         {
            changePass = true;
         }
         else
         {
            changePass = false;
            result = "<p style='color:red'>No account found with that email address</p>";
         }
      }
      catch(SQLException s){
         result = "<p style='color:red'>Error connecting to SQL Database: "+ s.getMessage() + "</p>";
      }
      catch(Exception e){
         result = "<p style='color:red'>Error: " + e.getMessage() + "</p>";
      }


      if( changePass )
      {

         boolean updatedDB = false;
         //create random password
         // Pick from some letters that won't be easily mistaken for each
         // other. So, for example, omit o O and 0, 1 l and L.
         String letters = "abcdefghjkmnpqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ23456789+@";
         String pw = "";

         Random RANDOM = new Random();
         for (int i=0; i<8; i++)
         {
            int index = (int)(RANDOM.nextDouble()*letters.length());
            pw += letters.substring(index, index+1);
         }


         try
         {
            // set connection
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://earth.cs.utep.edu/cs4311team1sp14","cs4311team1sp14","teamTBA");

            Statement st1 = con.createStatement();
            st1.executeUpdate("UPDATE Users SET Upassword='"+ pw +"' WHERE Uemail='"
            + email +"';");
            updatedDB = true;
         }
         catch(SQLException sq)
         {
            result = "<p style='color:red'>Error connecting to SQL database: " + sq.getMessage() + "</p>";
         }
         catch(Exception e){
            result = "<p style='color:red'>Error: " + e.getMessage() + "</p>";
         }  


         if( updatedDB )
         {
            //send email

            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.starttls.enable","true");
            props.put("mail.smtp.socketFactory.port", "587");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "587");

            Session ses = Session.getInstance(props,
               new javax.mail.Authenticator() {
                  protected PasswordAuthentication getPasswordAuthentication() {
                     return new PasswordAuthentication("Team1tba@gmail.com","TeamTBA1");
                  }
               }
            );

            try
            {
               Message message = new MimeMessage(ses);
               message.setFrom(new InternetAddress("Team1tba@gmail.com"));
               message.setRecipients(Message.RecipientType.TO,
                        InternetAddress.parse(email));
               message.setSubject("Visko - Password Recovery");
               message.setText("Your password has been changed to: " + pw);
               
               Transport.send(message);
               result = "<p style='color:green'>Email successfully sent.</p>";
            }
            catch( Exception e){
               result = "Error Sending email, please try again. <br>" +e.getMessage();
            }

         }

      }
   }
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="/visko-web/Main/assets/ico/favicon.ico">

    <title>Visko - Account Recovery</title>

    <!-- Bootstrap core CSS -->
    <link href="/visko-web/Main/assets/css/bootstrap.min.css" rel="stylesheet">

    <%@ include file="../includePage/footer.jsp" %>

    <style type="text/css">
      .secondary { 
         font-size: 11px;
         color: #666;
         line-height: 18px;
      }
    </style>
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

  <br><br><br><br><br>

  <div class="container">
    <div class="row">

    <!-- Warning -->
          <div class="form-group">
            <div id="warning" class="text-center" for="warning">
              <%= result %>
            </div> 
          </div>

      <form id="regForm" method="post" class="form-horizontal">
        <fieldset>

         <div class="row">
            <div class="col-md-6 col-md-offset-3">
               <h3>Forgot your password?</h3>

               <p>
               To reset your password, enter the email address you use to sign in to Visko. This can be any email address associated with your account.
               </p>

               <label class="control-label" for="email">Email address</label>

               <input id="email" name="email" type="text" placeholder="example@visko.com" class="form-control input-md" required="">
               
               <br>
               
               <button id="submit" name="submit" type="submit" class="btn btn-success">Submit</button>
               
               <br><br>

               <p class="secondary">
               If you don't have a Visko Account, you can <a href="/visko-web/Registration/">create one now</a>
               </p>

               <input type="hidden" name="formSubmitted" id="formSubmitted" value="true">

            </div>
         </div>
      </fieldset>
      </form>
      </div>
   </div>

   </body>
</html>