<%
	/*
	session.removeAttribute("email");
	session.removeAttribute("pass");
	session.removeAttribute("priv");
	*/
	session.removeAttribute("user");
	response.sendRedirect("/visko-web/Main/");
				
%>