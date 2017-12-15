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
	</div>
	
	<div class="content">
	
	<script>
        window.onload = refreshParent;
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
        	window.opener.location.href = "/Room8Try1/pages/"+lang+"/user/home.jsp";
        }
    </script>
	<%
	int hoursBooked = Integer.parseInt(session.getAttribute("HoursBooked").toString());
	int max = Integer.parseInt(session.getAttribute("MaxHours").toString());
		int hoursLeft = max - hoursBooked;
		int id = Integer.parseInt(session.getAttribute("id").toString());
	%>
		<h1>Request a booking:</h1>
		<br /> <br />
		<h2>Hours currently booked:</h2>
		<%=hoursBooked%>
		<br />
		<h2>Weekly hours remaining:</h2>
		<%= hoursLeft%>
		<br />
		<% if(hoursLeft > 0){%>
		<h2>You are allowed to book:</h2>
		<% if(hoursLeft > 0){%>
					
					<h1>Amenities: </h1>
					<form action="/Room8Try1/Amenities" method="post">
					<input type="checkbox" name="id" value="markers"> Markers<BR>
					<input type="checkbox" name="id" value="USB"> USB Cable<BR>
					<input type="checkbox" name="id" value="HDMI"> HDMI<BR>
					<% String meep = (String) request.getAttribute("roomid"); 
					session.setAttribute("roomyid", meep);%>
 					<input type="hidden" name="roomid" value="<%=meep%>" />
 					<input type="hidden" name="user_id" value="<%=id%>">
					<input type="checkbox" name="id" value="Other"> Other<BR>
					<TEXTAREA NAME="id" ROWS="5"></TEXTAREA><BR>
					<input type="submit" value="Submit">
					</form>
				<%}
				else{%>
				<h2>User reached the weekly limit</h2>	
				<% }
			}
		else{%>
		<h2>You have reached the weekly limit</h2>	
		<% }%>
		
		
	</div>
</body>
</html>