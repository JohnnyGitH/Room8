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
<link rel="stylesheet" type="text/css"
	href="/Room8Try1/pages/stylesheet.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>About Us</title>
</head>
<body>
<div id="locale">
		<a class="localeItem" href="/Room8Try1/pages/eng/user/aboutUs.jsp"> <img
			src="/Room8Try1/images/english.png" height="20px" alt="English"
			title="English" />
		</a>| <a class="localeItem" href="/Room8Try1/pages/fra/user/aboutUs.jsp"> <img
			src="/Room8Try1/images/french.png" height="20px"
			alt="Fran&ccedil;ais" title="Fran&ccedil;ais" />
		</a>| <a class="LocaleItem" href="/Room8Try1/pages/esp/user/aboutUs.jsp"> <img
			src="/Room8Try1/images/mexican.png" height="20px"
			alt="Espa&ntilde;ol" title="Espa&ntilde;ol" />
		</a>| <a class="LocaleItem" href="/Room8Try1/pages/afr/user/aboutUs.jsp"> <img
			src="/Room8Try1/images/afrikaans.png" height="20px" alt="Afrikaans"
			title="Afrikaans" />
		</a>
	</div>
	<div id="header">
		<img src="/Room8Try1/images/toplogoRev1PNG.png" id="toplog" />

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

		<h1 align="center">Room M8</h1>
		<p>Ever try to find a room for your study group to work in at
			Algonquin College? A nice space with a large table for collaboration
			or a TV to practice a presentation on.</p>
		<p>It is not the easiest or the most efficient. We have first hand
			experience with this, losing a room because it wasn't marked down
			properly (during midterm season) or having to clean up after the
			people previously using it.</p>
		<p>Sala de M8 es una aplicación basada en servidor optimizada que se
cuidar de la reserva de extremo a extremo . Desde un usuario que entra y
pedir una habitación específica durante un tiempo especificado , a la cual seguimiento
los usuarios pueden estar dejando la suciedad y pueden ofrecer hasta sanciones a aquellos
delincuentes</p>
		<p>La belleza de la habitación M8 reside en su incapacidad para hacer de oficina
errores u otros errores humanos orientada que existen en el papel arcaica
sistemas basados ​​</p>
			
			<h1 align="center"> El equipo</h1>
		<table cellpadding="20">
			<tr>
				<td><h3 align="center">Maria Reyes-Freaner</h3> 
María es un 5to semestre
estudiante de informática de Hermosillo , México . Maria tiene una
fondo en la robótica y otras actividades basadas en la lógica de que ella
ella cree llevado a este programa y han sido factores de conducción en
su éxito en la Universidad de Algonquin . María es también un amante de los animales ,
parcial al elefante.</td>
				<td align="center"><img src="/Room8Try1/images/aboutus/maria.jpg"
					alt="Smiley face" height="200px" /></td>
			</tr>
			<tr>
				<td align="center"><img src="/Room8Try1/images/aboutus/drew.jpg"
					alt="Smiley face" height="200px" /></td>
				<td><h3 align="center">Drew Hugill</h3> Drew es un ordenador semestre 5ª
estudiante de ciencias . De Drew encontró su camino en este programa a la derecha de
la escuela secundaria y ha encontrado a su paso en esta técnica y rápida
campo de ritmo . Drew ha encontrado su primer trabajo relacionado con este campo en
Al principio de este año . De Drew le gusta tocar la guitarra y
videojuegos en su tiempo libre .</td>
			</tr>
			<tr>
				<td><h3 align="center">Sindie Grobbelaar</h3> 
Sindie es un 5to semestre
estudiante de informática de Pretoria , Sudáfrica . Sindie tiene una
multitud de habilidades técnicas y de diseño que le permiten producir
gran palabra . Sindie le gusta jugar MMORPG en línea o con su Xbox
amigos en su tiempo libre .</td>
				<td align="center"><img src="/Room8Try1/images/aboutus/sindie.jpg"
					alt="Smiley face" height="200px" /></td>
			</tr>
			<tr>
				<td align="center"><img src="/Room8Try1/images/aboutus/johnny.jpg"
					alt="Smiley face" height="200px" /></td>
				<td><h3 align="center">Jonathan Cockrem</h3> 
Jonathan es un quinto semestre
estudiante de informática . Jonathan siempre ha disfrutar de la electrónica y
se ha rodeado de ordenadores desde que era joven . su entusiasmo
para el aprendizaje y buen ojo para el diseño le ha llevado a través de este
programar y lo preparó para la fuerza de trabajo . Jonathan le gusta jugar
Baloncesto cada domingo y andar en bicicleta a través de la Gatineaus .</td>

			</tr>
		</table>
	</div>

</body>
</html>