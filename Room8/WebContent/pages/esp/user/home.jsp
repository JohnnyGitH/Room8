<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	    <%
	String lang = "esp";
	session.setAttribute("lang",lang);
%>
	<!--  SPANISH ESPANOL -->
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/Room8Try1/pages/stylesheet.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Room M8</title>

</head>
<body>
<div id="locale">
		<a class="localeItem" href="/Room8Try1/pages/eng/user/home.jsp"> <img
			src="/Room8Try1/images/english.png" height="20px" alt="English"
			title="English" />
		</a>| <a class="localeItem" href="/Room8Try1/pages/fra/user/home.jsp"> <img
			src="/Room8Try1/images/french.png" height="20px"
			alt="Fran&ccedil;ais" title="Fran&ccedil;ais" />
		</a>| <a class="LocaleItem" href="/Room8Try1/pages/esp/user/home.jsp"> <img
			src="/Room8Try1/images/mexican.png" height="20px"
			alt="Espa&ntilde;ol" title="Espa&ntilde;ol" />
		</a>| <a class="LocaleItem" href="/Room8Try1/pages/afr/user/home.jsp"> <img
			src="/Room8Try1/images/afrikaans.png" height="20px" alt="Afrikaans"
			title="Afrikaans" />
		</a>
	</div>
		<div id="header">
			<img src="/Room8Try1/images/toplogoRev1PNG.png" id="toplog"/>

		<table ID="menutable" align="center">
						<tr>
				<td><a class="menuItem" href="/Room8Try1/pages/esp/user/home.jsp">Mi Programar</a></td>
				<td><a class="menuItem" href="/Room8Try1/pages/esp/user/myAccount.jsp">Mi Cuenta</a></td>
				<td><a class="menuItem" href="/Room8Try1/pages/esp/user/contactUs.jsp">Cont�ctenos</a></td>
				<td><a class="menuItem" href="/Room8Try1/pages/esp/user/aboutUs.jsp">Sobre nosotros</a></td>
				<td><a class="menuItem" href="/Room8Try1/pages/esp/login.jsp">Cerrar sesi�n</a></td>
			</tr>
		</table>
	</div>

	<div class="content">
		
		<a href="/Room8Try1/pages/esp/user/bookARoom.jsp"><button>Reservar Una Habitaci�n</button></a>
		<br/><br/>
		<img src="/Room8Try1/images/home/schedule.jpg" alt="" /> 
	</div>

</body>
</html>