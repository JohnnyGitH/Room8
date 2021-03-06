
	
	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
	<%
	String lang = "esp";
	session.setAttribute("lang",lang);
%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/Room8Try1/pages/stylesheet.css">
<link rel="stylesheet" type="text/css" href="/Room8Try1/pages/loginStyle.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Room M8</title>
</head>
                 <!--  SPANISH ESPANOL -->
<body>
<div id="locale">
		<a class="localeItem" href="/Room8Try1/pages/eng/login.jsp"> <img
			src="/Room8Try1/images/english.png" height="20px" alt="English"
			title="English" />
		</a>| <a class="localeItem" href="/Room8Try1/pages/fra/login.jsp"> <img
			src="/Room8Try1/images/french.png" height="20px"
			alt="Fran&ccedil;ais" title="Fran&ccedil;ais" />
		</a>| <a class="LocaleItem" href="/Room8Try1/pages/esp/login.jsp"> <img
			src="/Room8Try1/images/mexican.png" height="20px"
			alt="Espa&ntilde;ol" title="Espa&ntilde;ol" />
		</a>| <a class="LocaleItem" href="/Room8Try1/pages/afr/login.jsp"> <img
			src="/Room8Try1/images/afrikaans.png" height="20px" alt="Afrikaans"
			title="Afrikaans" />
		</a>
	</div>
	<div align="center" class="allDiv">
		<div id="topLogo">
			<img src="/Room8Try1/images/toplogoRev1PNG.png" id="toplog"/>
		</div>
		<form action="/Room8Try1/loginServlet" method="post">
			<div class="boxLayout">
				<div>
					<input type="text" id="username" name="username"
						required="required" placeholder="Num. de usuario" class="inputUser" />
				</div>
				<div class="pad">
					<input type="password" id="password" name="userpass"
						required="required" placeholder="Contrase&ntilde;a" class="inputPass" />
				</div>
				<div class="pad">
					<div class="errorArea">
						<%
						if (request.getAttribute("errMsg") != null) {
							String message = "error de Numero de usuario o contrase&ntilde;a";
							out.println(message);
						}
						%>
					</div>
				</div>
				<div class="pad">
					<input type="submit" value="INICIAR SESI&Oacute;N" id="login" class="butn" />
				</div>
				<div class="pad">
					&iquest;Teniendo problemas? <br /> <a class="login"
						href="mailto:admin@roomm8.ca?subject=RoomM8 Login Issue">
                        Contactar al administrador</a>
				</div>
			</div>
		</form>
	</div>

</body>

</html>
