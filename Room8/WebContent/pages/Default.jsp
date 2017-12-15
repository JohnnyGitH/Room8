<%@ page import="java.io.*,java.util.Locale"%>
<%@ page import="javax.servlet.*,javax.servlet.http.* "%>
<%
	//Get the client's Locale
	Locale locale = request.getLocale();
	String language = locale.getLanguage();
	String country = locale.getCountry();
%>
<html>
<head>
<title>Detecting Locale</title>
</head>
<body>
	<center>
		<h1>Detecting Locale</h1>
	</center>
	<p align="center">
		<%
			out.println("Language : " + language + "<br />");
			out.println("Country  : " + country + "<br />");
		%>
		<%
			String lang = null;
			switch (language) {
			case "fr":
				lang = "fra";
			case "es":
				lang = "esp";
			case "af":
				lang = "afr";
			default:
				lang = "eng";
			}
			;
			// New location to be redirected
			String site = new String("/Room8Try1/pages/" + lang + "/login.jsp");
			 response.setStatus(response.SC_MOVED_TEMPORARILY);
			response.setHeader("Location", site);
		%>
	</p>
</body>
</html>