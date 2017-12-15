<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/Room8Try1/pages/stylesheet.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Booking</title>
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
				<td><a class="menuItem" href="/Room8Try1/pages/eng/user/home.jsp">Schedule</a></td>
				<td><a class="menuItem" href="/Room8Try1/pages/eng/user/myAccount.jsp">My Account</a></td>
				<td><a class="menuItem" href="/Room8Try1/pages/eng/user/contactUs.jsp">Contact Us</a></td>
				<td><a class="menuItem" href="/Room8Try1/pages/eng/user/aboutUs.jsp">About Us</a></td>
				<td><a class="menuItem" href="/Room8Try1/pages/eng/login.jsp">Log Out</a></td>
			</tr>
		</table>
	</div>
	
	<div class="content">
	<h2>Room has been booked!!</h2>
	<button onclick="refreshParent()">Close pop and return to home</button>
	</div>
	<script>
        window.onunload = refreshParent;
        function refreshParent() {
        	<%-- var lang = '<%= session.getAttribute("lang")%>';
        	var typeUser = '<%= session.getAttribute("TypeofUser")%>'; --%>
        	//String lang = "eng";
        	//String typeUser = "user"													commented code should be redirecting fine but it's not tried for a while
        	//String url = "/Room8Try1/pages/"+lang+"/"+typeUser+"/home.jsp";			play with it if you'd like no big deal though
        	/* if(typeUser.equals("student")){
    			typeUser = "user";
    		} */
        	//window.opener.location.href = url;
        	window.opener.location.href = "/Room8Try1/pages/eng/user/home.jsp";
        	window.close();
        }
    </script>
</body>
</html>