<%

  String url = request.getRequestURI();
  String curPage = url.substring(url.indexOf("Main/")+5, url.length());
  String priv = "";
  if( session.getAttribute("priv") != null )
  {
    priv = ""+session.getAttribute("priv");
  }
  else
  {
    priv = "1";
  }


  //print top of sidebar
  out.println(
    "<div class=\"container-fluid\">" +
      "<div class=\"row\">" +
        "<div class=\"col-sm-3 col-md-2 sidebar\">" +
          "<ul class=\"nav nav-sidebar\">"
  );

  if( priv.equalsIgnoreCase("2") )
  { 
    if( curPage.contains("SearchPipelines") )
    {
      out.println(
        "<li><a href=\"/visko-web/Main/Home/\">Home</a></li>" +
        "<li class=\"active\"><a href=\"/visko-web/Main/SearchPipelines/\">Search Pipelines</a></li>" +
        "<li><a href=\"/visko-web/Main/SearchQueries/\">Search Queries</a></li>" +
        "<li><a href=\"/visko-web/Main/SearchServices/\">Search Services</a></li>" +
        "<li><a href=\"/visko-web/Main/SearchUsers/\">Search Users</a></li>" +
        "<li class=\"line-separator\"> </li>" +
        "<li><a href=\"/visko-web/Main/AnalyzePipelines/\">Analyze Pipelines</a></li>" +
        "<li><a href=\"/visko-web/Main/AnalyzeQueries/\">Analyze Queries</a></li>" +
        "<li><a href=\"/visko-web/Main/AnalyzeServices/\">Analyze Services</a></li>" 
      );
    }
    else if( curPage.contains("SearchQueries") )
    {
      out.println(
        "<li><a href=\"/visko-web/Main/Home/\">Home</a></li>" +
        "<li><a href=\"/visko-web/Main/SearchPipelines/\">Search Pipelines</a></li>" +
        "<li class=\"active\"><a href=\"/visko-web/Main/SearchQueries/\">Search Queries</a></li>" +
        "<li><a href=\"/visko-web/Main/SearchServices/\">Search Services</a></li>" +
        "<li><a href=\"/visko-web/Main/SearchUsers/\">Search Users</a></li>" +
        "<li class=\"line-separator\"> </li>" +
        "<li><a href=\"/visko-web/Main/AnalyzePipelines/\">Analyze Pipelines</a></li>" +
        "<li><a href=\"/visko-web/Main/AnalyzeQueries/\">Analyze Queries</a></li>" +
        "<li><a href=\"/visko-web/Main/AnalyzeServices/\">Analyze Services</a></li>" 
      );
    }
    else if( curPage.contains("SearchServices") )
    {
      out.println(
        "<li><a href=\"/visko-web/Main/Home/\">Home</a></li>" +
        "<li><a href=\"/visko-web/Main/SearchPipelines/\">Search Pipelines</a></li>" +
        "<li><a href=\"/visko-web/Main/SearchQueries/\">Search Queries</a></li>" +
        "<li class=\"active\"><a href=\"/visko-web/Main/SearchServices/\">Search Services</a></li>" +
        "<li><a href=\"/visko-web/Main/SearchUsers/\">Search Users</a></li>" +
        "<li class=\"line-separator\"> </li>" +
        "<li><a href=\"/visko-web/Main/AnalyzePipelines/\">Analyze Pipelines</a></li>" +
        "<li><a href=\"/visko-web/Main/AnalyzeQueries/\">Analyze Queries</a></li>" +
        "<li><a href=\"/visko-web/Main/AnalyzeServices/\">Analyze Services</a></li>" 
      );
    }
    else if( curPage.contains("SearchUsers") )
    {
      out.println(
        "<li><a href=\"/visko-web/Main/Home/\">Home</a></li>" +
        "<li><a href=\"/visko-web/Main/SearchPipelines/\">Search Pipelines</a></li>" +
        "<li><a href=\"/visko-web/Main/SearchQueries/\">Search Queries</a></li>" +
        "<li><a href=\"/visko-web/Main/SearchServices/\">Search Services</a></li>" +
        "<li class=\"active\"><a href=\"/visko-web/Main/SearchUsers/\">Search Users</a></li>" +
        "<li class=\"line-separator\"> </li>" +
        "<li><a href=\"/visko-web/Main/AnalyzePipelines/\">Analyze Pipelines</a></li>" +
        "<li><a href=\"/visko-web/Main/AnalyzeQueries/\">Analyze Queries</a></li>" +
        "<li><a href=\"/visko-web/Main/AnalyzeServices/\">Analyze Services</a></li>" 
      );
    }
    else if( curPage.contains("AnalyzePipelines") )
    {
      out.println(
        "<li><a href=\"/visko-web/Main/Home/\">Home</a></li>" +
        "<li><a href=\"/visko-web/Main/SearchPipelines/\">Search Pipelines</a></li>" +
        "<li><a href=\"/visko-web/Main/SearchQueries/\">Search Queries</a></li>" +
        "<li><a href=\"/visko-web/Main/SearchServices/\">Search Services</a></li>" +
        "<li><a href=\"/visko-web/Main/SearchUsers/\">Search Users</a></li>" +
        "<li class=\"line-separator\"> </li>" +
        "<li class=\"active\"><a href=\"/visko-web/Main/AnalyzePipelines/\">Analyze Pipelines</a></li>" +
        "<li><a href=\"/visko-web/Main/AnalyzeQueries/\">Analyze Queries</a></li>" +
        "<li><a href=\"/visko-web/Main/AnalyzeServices/\">Analyze Services</a></li>" 
      );
    }
    else if( curPage.contains("AnalyzeQueries") )
    {
      out.println(
        "<li><a href=\"/visko-web/Main/Home/\">Home</a></li>" +
        "<li><a href=\"/visko-web/Main/SearchPipelines/\">Search Pipelines</a></li>" +
        "<li><a href=\"/visko-web/Main/SearchQueries/\">Search Queries</a></li>" +
        "<li><a href=\"/visko-web/Main/SearchServices/\">Search Services</a></li>" +
        "<li><a href=\"/visko-web/Main/SearchUsers/\">Search Users</a></li>" +
        "<li class=\"line-separator\"> </li>" +
        "<li><a href=\"/visko-web/Main/AnalyzePipelines/\">Analyze Pipelines</a></li>" +
        "<li class=\"active\"><a href=\"/visko-web/Main/AnalyzeQueries/\">Analyze Queries</a></li>" +
        "<li><a href=\"/visko-web/Main/AnalyzeServices/\">Analyze Services</a></li>" 
      );
    }
    else if( curPage.contains("AnalyzeServices") )
    {
      out.println(
        "<li><a href=\"/visko-web/Main/Home/\">Home</a></li>" +
        "<li><a href=\"/visko-web/Main/SearchPipelines/\">Search Pipelines</a></li>" +
        "<li><a href=\"/visko-web/Main/SearchQueries/\">Search Queries</a></li>" +
        "<li><a href=\"/visko-web/Main/SearchServices/\">Search Services</a></li>" +
        "<li><a href=\"/visko-web/Main/SearchUsers/\">Search Users</a></li>" +
        "<li class=\"line-separator\"> </li>" +
        "<li><a href=\"/visko-web/Main/AnalyzePipelines/\">Analyze Pipelines</a></li>" +
        "<li><a href=\"/visko-web/Main/AnalyzeQueries/\">Analyze Queries</a></li>" +
        "<li class=\"active\"><a href=\"/visko-web/Main/AnalyzeServices/\">Analyze Services</a></li>" 
      );
    }
    else
    {
      out.println(
        "<li class=\"active\"><a href=\"/visko-web/Main/Home/\">Home</a></li>" +
        "<li><a href=\"/visko-web/Main/SearchPipelines/\">Search Pipelines</a></li>" +
        "<li><a href=\"/visko-web/Main/SearchQueries/\">Search Queries</a></li>" +
        "<li><a href=\"/visko-web/Main/SearchServices/\">Search Services</a></li>" +
        "<li><a href=\"/visko-web/Main/SearchUsers/\">Search Users</a></li>" +
        "<li class=\"line-separator\"> </li>" +
        "<li><a href=\"/visko-web/Main/AnalyzePipelines/\">Analyze Pipelines</a></li>" +
        "<li><a href=\"/visko-web/Main/AnalyzeQueries/\">Analyze Queries</a></li>" +
        "<li><a href=\"/visko-web/Main/AnalyzeServices/\">Analyze Services</a></li>" 
      );
    }
  }
  else
  {
    if( curPage.contains("SearchHistory") )
    {
      out.println(
        "<li><a href=\"/visko-web/Main/Home/\">Home</a></li>" +
        "<li class=\"active\"><a href=\"/visko-web/Main/SearchHistory/\">Search History</a></li>" +
        "<li><a href=\"/visko-web/Main/Visualize/\">Visualize</a></li>" +
        "<li><a href=\"/visko-web/Main/ManageServices/\">Manage Services</a></li>" +
        "<li><a href=\"/visko-web/Main/ConfigureAccount/\">Configure Account</a></li>"
      );
    }
    else if( curPage.contains("Visualize") )
    {
      out.println(
        "<li><a href=\"/visko-web/Main/Home/\">Home</a></li>" +
        "<li><a href=\"/visko-web/Main/SearchHistory/\">Search History</a></li>" +
        "<li class=\"active\"><a href=\"/visko-web/Main/Visualize/\">Visualize</a></li>" +
        "<li><a href=\"/visko-web/Main/ManageServices/\">Manage Services</a></li>" +
        "<li><a href=\"/visko-web/Main/ConfigureAccount/\">Configure Account</a></li>"
      );
    }
    else if( curPage.contains("ManageServices") )
    {
      out.println(
        "<li><a href=\"/visko-web/Main/Home/\">Home</a></li>" +
        "<li><a href=\"/visko-web/Main/SearchHistory/\">Search History</a></li>" +
        "<li><a href=\"/visko-web/Main/Visualize/\">Visualize</a></li>" +
        "<li class=\"active\"><a href=\"/visko-web/Main/ManageServices/\">Manage Services</a></li>" +
        "<li><a href=\"/visko-web/Main/ConfigureAccount/\">Configure Account</a></li>"
      );
    }
    else if( curPage.contains("ConfigureAccount") )
    {
      out.println(
        "<li><a href=\"/visko-web/Main/Home/\">Home</a></li>" +
        "<li><a href=\"/visko-web/Main/SearchHistory/\">Search History</a></li>" +
        "<li><a href=\"/visko-web/Main/Visualize/\">Visualize</a></li>" +
        "<li><a href=\"/visko-web/Main/ManageServices/\">Manage Services</a></li>" +
        "<li class=\"active\"><a href=\"/visko-web/Main/ConfigureAccount/\">Configure Account</a></li>"
      );
    }
    else
    {
      out.println(
      "<li class=\"active\"><a href=\"/visko-web/Main/Home/\">Home</a></li>" +
      "<li><a href=\"/visko-web/Main/SearchHistory/\">Search History</a></li>" +
      "<li><a href=\"/visko-web/Main/Visualize/\">Visualize</a></li>" +
      "<li><a href=\"/visko-web/Main/ManageServices/\">Manage Services</a></li>" +
      "<li><a href=\"/visko-web/Main/ConfigureAccount/\">Configure Account</a></li>"
    );
    }
  }

  //print close of sidebar
  out.println(
    "</ul>" +
      "<ul class=\"nav nav-sidebar\">" +
        "<li><a href=\"\"></a></li>" +
      "</ul>" +
    "</div>" +
    "</div>" +
    "</div>"
  );

  %>