<%
	session.removeAttribute("user");
	response.sendRedirect("/visko-web/Main/");				
%>