<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	      <%
	String lang = "eng";
	session.setAttribute("lang",lang);
%>
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
				<td><a class="menuItem"
					href="/Room8Try1/pages/eng/user/home.jsp">My Schedule</a></td>
				<td><a class="menuItem"
					href="/Room8Try1/pages/eng/user/myAccount.jsp">My Account</a></td>
				<td><a class="menuItem"
					href="/Room8Try1/pages/eng/user/contactUs.jsp">Contact Us</a></td>
				<td><a class="menuItem"
					href="/Room8Try1/pages/eng/user/aboutUs.jsp">About Us</a></td>
				<td><a class="menuItem" href="/Room8Try1/pages/eng/login.jsp">Log
						Out</a></td>
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
		<p>Room M8 is a streamlined server based application that will
			look after the booking from end to end. From a user logging in and
			requesting a specific room for a specified time, to tracking which
			users may be leaving messes and can offer up penalties to those
			offenders.</p>
		<p>The beauty of Room M8 lies in its inability to make clerical
			errors or other human oriented errors that exist in archaic paper
			based systems.</p>
			
			<h1 align="center"> The Team</h1>
		<table cellpadding="20">
			<tr>
				<td><h3 align="center">Maria Reyes-Freaner</h3> Maria is a 5th semester
					computer science student from Hermosillo, Mexico. Maria has a
					background in robotics and other logic based activities that she
					believes led her into this program and have been driving factors in
					her success at Algonquin College. Maria is also an animal lover ,
					partial to the elephant.</td>
				<td align="center"><img src="/Room8Try1/images/aboutus/maria.jpg"
					alt="Smiley face" height="200px" /></td>
			</tr>
			<tr>
				<td align="center"><img src="/Room8Try1/images/aboutus/drew.jpg"
					alt="Smiley face" height="200px" /></td>
				<td><h3 align="center">Drew Hugill</h3> Drew is a 5th semester computer
					science student . Drew found his way into this program right out of
					high school and has found his stride in this technical and fast
					paced field. Drew has found his first job related to this field at
					the beginning of this year. Drew enjoys playing his guitar and
					video games in his spare time.</td>
			</tr>
			<tr>
				<td><h3 align="center">Sindie Grobbelaar</h3> Sindie is a 5th semester
					computer science student from Pretoria, South Africa. Sindie has a
					multitude of technical and design skills that enable her to produce
					great word. Sindie enjoys playing MMORPGs online or Xbox with her
					friends in her spare time.</td>
				<td align="center"><img src="/Room8Try1/images/aboutus/sindie.jpg"
					alt="Smiley face" height="200px" /></td>
			</tr>
			<tr>
				<td align="center"><img src="/Room8Try1/images/aboutus/johnny.jpg"
					alt="Smiley face" height="200px" /></td>
				<td><h3 align="center">Jonathan Cockrem</h3> Jonathan is a 5th semester
					computer science student. Jonathan has always enjoy electronics and
					has been surrounded by computers since he was young. His enthusiasm
					for learning and keen eye for design has led him through this
					program and prepared him for the workforce. Jonathan enjoys playing
					Basketball every Sunday and biking through the Gatineaus.</td>

			</tr>
		</table>
	</div>

</body>
</html>