/*
Copyright (c) 2012, University of Texas at El Paso
All rights reserved.
Redistribution and use in source and binary forms, with or without modification, are permitted
provided that the following conditions are met:

	-Redistributions of source code must retain the above copyright notice, this list of conditions
	 and the following disclaimer.
	-Redistributions in binary form must reproduce the above copyright notice, this list of conditions
	 and the following disclaimer in the documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED
WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.*/


package edu.utep.trustlab.visko.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.StringTokenizer;
import java.util.TreeMap;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.utep.trustlab.visko.web.html.Template;
import edu.utep.trustlab.visko.web.requestHandler.execution.ExecutePipelineCancelServlet;
import edu.utep.trustlab.visko.web.requestHandler.execution.ExecutePipelineServlet;
import edu.utep.trustlab.visko.web.requestHandler.knowledgeBaseInfo.KnowledgeBaseInformationJSONServlet;
import edu.utep.trustlab.visko.web.requestHandler.planning.EditParametersServlet;
import edu.utep.trustlab.visko.web.requestHandler.planning.ExecuteQueryServlet;
import edu.utep.trustlab.visko.web.requestHandler.planning.GetPipelineJSONServlet;
import edu.utep.trustlab.visko.web.requestHandler.planning.GetQueryServlet;
import edu.utep.trustlab.visko.web.requestHandler.planning.ParameterBindingsCheckServlet;
import edu.utep.trustlab.visko.web.requestHandler.planning.ShowPipelineServlet;
import edu.utep.trustlab.visko.web.requestHandler.queryExecutionService.ExecuteQueryServiceServlet;
import edu.utep.trustlab.visko.web.requestHandler.queryExecutionService.IFeelLuckyServlet;
import edu.utep.trustlab.visko.web.requestHandler.sparql.ExecuteSPARQLQueryServlet;

/**
 * Servlet implementation class ViskoServletManager
 */
public class ViskoServletManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViskoServletManager() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    
    private static String[] explode(String value) {
    	 	  	
    	StringTokenizer st = new StringTokenizer(value, ",");
    	String[] values = new String[st.countTokens()];
    	int i = 0;
    	while (st.hasMoreElements()){
        	values[i] = (String) st.nextElement();
    		i++;
        }
    	
    	return values;
    }
    /**
     * Log to the database
     * receives parameters:
     * table: String name of the database table to insert to
     * columns: String containing names of the columns to insert to, separated by commas IE. "column1, column2, column3"
     * values: String containing values to insert, separated by commas IE. "value1, value2, value3"
     * creates insert statement: "INSERT INTO table (column1, column2, column3) VALUES ("value1", "value2", "value3");"
     */
    public String insertDB(String table, String columns, String value) {
    	
    	String[] insertValues = explode(value);
    	int items = insertValues.length;
    	String warning = "";
    	Connection con;
    	
        try{
	    	// set connection
	        Class.forName("com.mysql.jdbc.Driver");
	        con = DriverManager.getConnection("jdbc:mysql://earth.cs.utep.edu/cs4311team1sp14","cs4311team1sp14","teamTBA"); 
	        
	        String queryString = "INSERT INTO "+table+" ("+columns+") VALUES (\""+insertValues[0]+"\"";
	        if(items>1){
	        	for (int i=1; i<items; i++){
	        		queryString += ", \""+insertValues[i]+"\"";
	        	}
	        }
	        queryString += ");";
	        
	        Statement call = con.createStatement();
	        call.execute(queryString);
	        
        }
        catch(SQLException sqle)
        {
        	warning = "<p style='color:red'>Error connecting to SQL database</p>";
        }
        catch(Exception e){
        	warning = "<p style='color:red'>Error</p>";
        }
        return warning; 	
    }
    
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String requestType = request.getParameter("requestType");
		
		if( requestType == null )
		{
			response.getWriter().write("<html><body><p>Invalid argument specified for <b>requestType</b></body></html>");
		}
		else if( requestType.equalsIgnoreCase("ERIK_TEST") )
		{
			request.setAttribute("TEST", "THIS IS FROM THE SERVLET");
			request.getRequestDispatcher("Main/Visualize/SelectPipelines.jsp").forward(request, response);
		}
		else if( requestType.equalsIgnoreCase("REDIRECT") )
		{			
			request.getSession().setAttribute("re", "REDIRECT IN SERVLET");
			response.sendRedirect("Main/SelectPipelines.jsp");
			//HttpServletResponse.sendRedirect("/your/new/location.jsp");
			//request.getRequestDispatcher("Main/Visualization.jsp");
		}
		else if( requestType.equalsIgnoreCase("new-execute-query") )
		{
			TreeMap<String, ArrayList<String>> result = new ExecuteQueryServlet().getTreeMap(request, response);		
			request.getSession().setAttribute("resultMap", result);
			
			String insertValues = request.getParameter("query");
			insertValues += "," + request.getSession().getAttribute("email");
			insertValues += "," + "Y";
			
			insertDB("query", "Qstring, Uusername, Qsuccess", insertValues);
			
			response.sendRedirect("Main/Visualize/SelectPipelines.jsp");
		}
		
		else if( requestType.equalsIgnoreCase("new-build-query") )
		{	
			TreeMap<String, ArrayList<String>> result = new ExecuteQueryServlet().getTreeMapBuild(request, response);
			request.getSession().setAttribute("resultMap", result);
			response.sendRedirect("Main/Visualize/SelectPipelines.jsp");
		}		
		else if( requestType.equalsIgnoreCase("set-query-parameters") )
		{
			String abstractionType = request.getParameter("abstractionType");
			request.getSession().setAttribute("AbstractionType", abstractionType);
			response.sendRedirect("Main/Visualize/SetQueryParameters.jsp");
		}
		else if( requestType.equalsIgnoreCase("new-edit-parameters") )
		{
			String EditParametersForm = new EditParametersServlet().getEditParametersForm(request);
			request.getSession().setAttribute("EditParametersForm", EditParametersForm);
			response.sendRedirect("Main/Visualize/EditPipelineParameters.jsp");
		}
		else if( requestType.equalsIgnoreCase("new-execute-pipeline") )
		{
			new ExecutePipelineServlet().newExecutePipeline(request, response, this);
			//String EditParametersForm = new EditParametersServlet().getEditParametersForm(request);
			//request.getSession().setAttribute("EditParametersForm", EditParametersForm);
			//response.sendRedirect("Main/Visualize/EditPipelineParameters.jsp");
		}
		else if(requestType.equalsIgnoreCase("execute-pipeline"))
			new ExecutePipelineServlet().setRedirection(request, response, this);
		else if(requestType.equalsIgnoreCase("execute-query-service"))
			new ExecuteQueryServiceServlet().setJSON(request, response);
		else if(requestType.equalsIgnoreCase("i-feel-lucky"))
			new IFeelLuckyServlet().setURL(request, response);
		else if(requestType.equalsIgnoreCase("execute-query"))
			new ExecuteQueryServlet().setHTMLPage(request, response);
		else if(requestType.equalsIgnoreCase("knowledge-base-info"))
			new KnowledgeBaseInformationJSONServlet().setJSON(request, response);
		else if(requestType.equalsIgnoreCase("get-pipeline-json"))
			new GetPipelineJSONServlet().setJSON(request, response);
		else if(requestType.equalsIgnoreCase("show-pipeline"))
			new ShowPipelineServlet().setHTMLPage(request, response);
		else if(requestType.equalsIgnoreCase("edit-parameters"))
			new EditParametersServlet().setHTMLPage(request, response);
		else if(requestType.equalsIgnoreCase("check-bindings"))
			new ParameterBindingsCheckServlet().setRedirection(request, response, this);
		else if(requestType.equals("query-triple-store"))
			new ExecuteSPARQLQueryServlet().setSparqlResults(request, response);
		else if(requestType.equals("get-query"))
			new GetQueryServlet().setHTMLPage(request, response);
		else if(requestType.equals("cancel-pipeline-execution"))
			new ExecutePipelineCancelServlet().setRedirection(request, response, this);
		else{
			String header = Template.getCompleteHeader();
			String footer = Template.getCompleteFooter();
			response.getWriter().write(header + "<p>Invalid argument specified for <b>requestType:"+ requestType +":</b></p>" + footer);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
}