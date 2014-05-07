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

package edu.utep.trustlab.visko.web.requestHandler.execution;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.utep.trustlab.visko.execution.PipelineExecutor;
import edu.utep.trustlab.visko.execution.PipelineExecutorJob;
import edu.utep.trustlab.visko.execution.PipelineExecutorJobStatus;
import edu.utep.trustlab.visko.planning.QueryEngine;
import edu.utep.trustlab.visko.planning.pipelines.Pipeline;
import edu.utep.trustlab.visko.web.Access;
import edu.utep.trustlab.visko.web.User;
import edu.utep.trustlab.visko.web.context.ViskoWebSession;
import edu.utep.trustlab.visko.web.requestHandler.RequestHandlerRedirect;

public class ExecutePipelineServlet extends RequestHandlerRedirect {
	
	public static final String JSP_PAGE = "/Main/Visualize/ExecutePipelineStatus.jsp";

	public void doGet(HttpServletRequest request, HttpServletResponse response, HttpServlet servlet) throws IOException, ServletException {
		String provenance = request.getParameter("provenance");
		String stringIndex = request.getParameter("index");

		boolean captureProvenance = false;
		if(provenance != null)
			captureProvenance = true;
		
		ViskoWebSession session = (ViskoWebSession) request.getSession().getAttribute(ViskoWebSession.SESSION_ID);
		ExecutePipelineStatusBean statusBean;
				
		if(!session.hasPipelineExecutor()){
			int index = Integer.valueOf(stringIndex);
			
			System.out.println("Kicking off new pipeline executor...");
			QueryEngine engine = session.getQueryEngine();
			Pipeline pipe = engine.getPipelines().get(index);
						
			PipelineExecutorJob job = new PipelineExecutorJob(pipe);
			job.setProvenanceLogging(captureProvenance);
			
			PipelineExecutor runningPipeline = new PipelineExecutor();
			runningPipeline.setJob(job);
			
			//add the running pipeline to the session object
			session.setPipelineExecutor(runningPipeline);
			runningPipeline.process();
			
			System.out.println("Redirecting to self...");
			if(captureProvenance)
				response.sendRedirect("ViskoServletManager?provenance=true&requestType=execute-pipeline&index=" + index);
			else
				response.sendRedirect("ViskoServletManager?provenance=true&requestType=execute-pipeline&index=" + index);
		}	
		else{		
	        statusBean = new ExecutePipelineStatusBean(session.getPipelineExecutor().getJob());
	        
	        if(!session.getPipelineExecutor().isAlive() || session.getPipelineExecutor().getJob().getJobStatus().isJobCompleted()){
	        	session.removePipelineExecutor();
	        }
	        
	        request.setAttribute("statusBean", statusBean);
	        forward(JSP_PAGE, request, response, servlet);
		}		
	}
	
	// New method used instead of the original method doGet()
	public void newExecutePipeline (HttpServletRequest request, HttpServletResponse response, HttpServlet servlet) throws IOException, ServletException {
		String provenance = request.getParameter("provenance");
		String stringIndex = request.getParameter("index");
		
		//
		int index = Integer.valueOf(stringIndex);
		
		Access access = new Access();
		User user = (User) request.getSession().getAttribute("user");
		String Usid = access.selectDB("Users", "Usid", " Uemail = '"+user.getEmail()+"'");
		String Qid = access.selectMaxID("Query", "Qid", "Usid = '"+Usid+"';");
		String Pid = access.selectDB("Pipeline", "Pid", "Qid = '"+Qid+"' AND Pindex = '"+index+"';");
		//
		
		boolean captureProvenance = false;
		if(provenance != null)
			captureProvenance = true;
		
		ViskoWebSession session = (ViskoWebSession) request.getSession().getAttribute(ViskoWebSession.SESSION_ID);
		ExecutePipelineStatusBean statusBean;
				
		if(!session.hasPipelineExecutor()){
			index = Integer.valueOf(stringIndex);
			
			System.out.println("Kicking off new pipeline executor...");
			QueryEngine engine = session.getQueryEngine();
			Pipeline pipe = engine.getPipelines().get(index);
						
			PipelineExecutorJob job = new PipelineExecutorJob(pipe);
			job.setProvenanceLogging(captureProvenance);
			
			// log visualization to the Database
			String insertValues = Qid;
			insertValues += "," +Pid;
			insertValues += ",NOW()";
			access.insertDB("Visualization", "Qid, Pid, Vtime", insertValues);
			
			PipelineExecutor runningPipeline = new PipelineExecutor();
			runningPipeline.setJob(job);
			
			//add the running pipeline to the session object
			session.setPipelineExecutor(runningPipeline);
			runningPipeline.process();
			
			System.out.println("Redirecting to self...");
			if(captureProvenance)
				response.sendRedirect("ViskoServletManager?provenance=true&requestType=new-execute-pipeline&index=" + index);
			else
				response.sendRedirect("ViskoServletManager?provenance=true&requestType=new-execute-pipeline&index=" + index);
		}	
		else{		
	        statusBean = new ExecutePipelineStatusBean(session.getPipelineExecutor().getJob());
	        
	        if(!session.getPipelineExecutor().isAlive() || session.getPipelineExecutor().getJob().getJobStatus().isJobCompleted()){
	        	
	        	// finish logging pipeline status to database
	        	PipelineExecutorJobStatus status = session.getPipelineExecutor().getJob().getJobStatus();
	 			//if pipeline executed correctly, flag it's status as valid
	 			if(status.getPipelineState().name().equals("COMPLETE")){
	 				access.updateDB("Pipeline", "Pstatus", "1", "Pid", Pid);
	 			}
	 			else{ //if failure while pipeline executed, flag it as failure 
	 				access.updateDB("Pipeline", "Pstatus", "0", "Pid", Pid);
	 				access.insertDB("Failure", "Fdetail, Ftime", "Pipeline Failure: "+status.toString()+",NOW()");
	 				String Fid = access.selectMaxID("Failure", "Fid");
	 				access.insertDB("PipelineFailure", "Pid, Fid, PFtime", Pid+","+Fid+",NOW()");
	 			}
	        	
	        	session.removePipelineExecutor();
	        }
	        
	        request.setAttribute("statusBean", statusBean);
	        forward(JSP_PAGE, request, response, servlet);
		}		
	}
	
	 /*
     * private method for forwarding to the view.
     */
    private void forward(String resource, HttpServletRequest  request, HttpServletResponse response, HttpServlet servlet) throws ServletException, IOException{
        servlet.getServletContext().getRequestDispatcher(resource).forward(request, response);
    }
}