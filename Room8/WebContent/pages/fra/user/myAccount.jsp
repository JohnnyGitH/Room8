<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
		<%
	String lang = "fra";
	session.setAttribute("lang",lang);
%>
	<!--  FRENCH FRANCAIS -->
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/Room8Try1/pages/stylesheet.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mon Compte</title>
</head>
<body>
<div id="locale">
		<a class="localeItem" href="/Room8Try1/pages/eng/user/myAccount.jsp"> <img
			src="/Room8Try1/images/english.png" height="20px" alt="English"
			title="English" />
		</a>| <a class="localeItem" href="/Room8Try1/pages/fra/user/myAccount.jsp"> <img
			src="/Room8Try1/images/french.png" height="20px"
			alt="Fran&ccedil;ais" title="Fran&ccedil;ais" />
		</a>| <a class="LocaleItem" href="/Room8Try1/pages/esp/user/myAccount.jsp"> <img
			src="/Room8Try1/images/mexican.png" height="20px"
			alt="Espa&ntilde;ol" title="Espa&ntilde;ol" />
		</a>| <a class="LocaleItem" href="/Room8Try1/pages/afr/user/myAccount.jsp"> <img
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
		<h1>Relevé De Compte:</h1>
		<br /> <br />
		<h2>Prénom:</h2>
		<%=session.getAttribute("name")%>
		<br />
		<h2>Nom de famille:</h2>
		<%=session.getAttribute("LastName")%>
		<br />
		<h2>Numéro d'étudiant:</h2>
		<%=session.getAttribute("StudentNum")%>
		<br />
		<h2>Évaluation:</h2>
		<%=session.getAttribute("Rating")%>
		<br />
		<h2>Nombre d'incidents :</h2>
		<%=session.getAttribute("Incidents")%>
		<br>
		<h3>Changez votre mot de passe ici :</h3>
		<form action="loginServlet" method="get">
			<input type="text" name="newPassword" /> <input type="submit"
				value="Submit" />
		</form>
	</div>
</body>
</html>