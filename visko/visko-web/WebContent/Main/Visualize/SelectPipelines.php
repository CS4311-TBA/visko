<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../assets/ico/favicon.ico">

    <title>VisKO - Visualize</title>

    <!-- Bootstrap core CSS -->
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../assets/css/sideBar.css" rel="stylesheet">

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
          <a class="navbar-brand" href="http://cs4311.cs.utep.edu/team1">VisKo</a>
        </div>
        <div class="navbar-collapse collapse">
          <form class="navbar-form navbar-right" role="form">
	    <button type="submit" class="btn btn-success">Logout</button>
	  </form>
	  <p class="navbar-text navbar-right">Welcome <a href="#" class="navbar-link"><?php echo('[temp@utep.ed]');?></a></p>
        </div>
      </div>
    </div>
<!--  -->

<!--  -->
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
	    <li><a href="http://cs4311.cs.utep.edu/team1/Home">Home</a></li>
	    <li><a href="#">Search History</a></li>
	    <li class="active"><a href="http://cs4311.cs.utep.edu/team1/Visualize">Visualize</a></li>
	    <li><a href="#">Manage Services</a></li>
	    <li><a href="#">Configure Account</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href=""></a></li>
          </ul>
        </div>
        <div class="col-md-10 col-md-offset-2">
	  <div class="container">
	    <div class="row">
              <!--  ENTER CODE HERE  -->	

<h3>Select Pipeline</h3>
<div class="panel-group" id="accordion">
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 data-toggle="collapse" data-parent="#accordion" href="#GMT" class="panel-title">
        GMT
      </h4>
    </div>
    <div id="GMT" class="panel-collapse collapse">
      <div class="panel-body">
        <table class="table table-bordered">

        </table>    	
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 data-toggle="collapse" data-parent="#accordion" href="#VTK" class="panel-title">
        VTK
      </h4>
    </div>
    <div id="VTK" class="panel-collapse collapse">
      <div class="panel-body">
        <table class="table table-bordered">
	  <tr>
	    <td>ID</td>
	    <td>Abstraction</td>
	    <td>Format</td>
	  </tr>
	  <tr>
	    <td>12</td>
	    <td>Contour Map</td>
	    <td>JPEG</td>
	    <td><a class="btn btn-info" href="http://cs4311.cs.utep.edu/team1/Visualize/EditPipelineParameters.php" role="button">Edit</a></td>
	    <td><a class="btn btn-success" href="http://cs4311.cs.utep.edu/team1/Visualize/ExecutePipeline.php" role="button">Run</a></td>
	  </tr>
        </table>  
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 data-toggle="collapse" data-parent="#accordion" href="#PV" class="panel-title">
        ParaView
      </h4>
    </div>
    <div id="PV" class="panel-collapse collapse">
      <div class="panel-body">
        <table class="table table-bordered">
	  
        </table>  
      </div>
    </div>
  </div>
</div>             
              
<!--                      -->
            </div>
    	  </div>      
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
    <script src="../assets/js/docs.min.js"></script>
  </body>
</html>
