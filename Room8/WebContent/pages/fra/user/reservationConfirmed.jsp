<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	      <%
	String lang = "fra";
	session.setAttribute("lang",lang);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/Room8Try1/pages/stylesheet.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<div id="locale">
		<a class="localeItem" href="/Room8Try1/pages/eng/user/reservationConfirmed.jsp"> <img
			src="/Room8Try1/images/english.png" height="20px" alt="English"
			title="English" />
		</a>| <a class="localeItem" href="/Room8Try1/pages/fra/user/reservationConfirmed.jsp"> <img
			src="/Room8Try1/images/french.png" height="20px"
			alt="Fran&ccedil;ais" title="Fran&ccedil;ais" />
		</a>| <a class="LocaleItem" href="/Room8Try1/pages/esp/user/reservationConfirmed.jsp"> <img
			src="/Room8Try1/images/mexican.png" height="20px"
			alt="Espa&ntilde;ol" title="Espa&ntilde;ol" />
		</a>| <a class="LocaleItem" href="/Room8Try1/pages/afr/user/reservationConfirmed.jsp"> <img
			src="/Room8Try1/images/afrikaans.png" height="20px" alt="Afrikaans"
			title="Afrikaans" />
		</a>
	</div>
		<div id="header">
			<img src="/Room8Try1/images/toplogoRev1PNG.png" id="toplog"/>

		<table ID="menutable" align="center">
			<tr>
				<td><a class="menuItem" href="/Room8Try1/pages/fra/user/home.jsp">Ma Programme</a></td>
				<td><a class="menuItem" href="/Room8Try1/pages/fra/user/myAccount.jsp">Mon compte</a></td>
				<td><a class="menuItem" href="/Room8Try1/pages/fra/user/contactUs.jsp">Contactez nous</a></td>
				<td><a class="menuItem" href="/Room8Try1/pages/fra/user/aboutUs.jsp">À propos de nous</a></td>
				<td><a class="menuItem" href="/Room8Try1/pages/fra/login.jsp">Se déconnecter</a></td>
			</tr>
		</table>
	</div>
	<div class="content">
<h1>Amenities: </h1>
	<form action="/Room8Try1/Amenities" method="post">
		<input type="checkbox" name="id" value="markers"> Markers<BR>
		<input type="checkbox" name="id" value="USB"> USB Cable<BR>
		<input type="checkbox" name="id" value="HDMI"> HDMI<BR>
<% String meep = (String) request.getAttribute("roomid"); 
			session.setAttribute("roomyid", meep);
		%>
 <input type="hidden" name="roomid" value="<%=meep%>" />
<input type="checkbox" name="id" value="Other"> Other<BR>
<TEXTAREA NAME="id" ROWS="5"></TEXTAREA><BR>
<input type="submit" value="Submit">
	</form>
	</div>
</body>
</html>