<%

	session.removeAttribute("email");
	session.removeAttribute("pass");
	session.removeAttribute("priv");
	response.sendRedirect("/visko-web/Main/");
				
%>