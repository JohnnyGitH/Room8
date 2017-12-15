<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.Locale" %>
<%@page import="booking.Rooms"%>
<%@page import="booking.HoursOfRooms"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>

<%
	String lang = "eng";
	session.setAttribute("lang", lang);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="/Room8Try1/pages/stylesheet.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Room M8</title>

</head>
<body>

	<div id="locale">
		<a class="localeItem" href="/Room8Try1/pages/eng/user/home.jsp"> <img
			src="/Room8Try1/images/english.png" height="20px" alt="English"
			title="English" />
		</a>| <a class="localeItem" href="/Room8Try1/pages/fra/user/home.jsp">
			<img src="/Room8Try1/images/french.png" height="20px"
			alt="Fran&ccedil;ais" title="Fran&ccedil;ais" />
		</a>| <a class="LocaleItem" href="/Room8Try1/pages/esp/user/home.jsp">
			<img src="/Room8Try1/images/mexican.png" height="20px"
			alt="Espa&ntilde;ol" title="Espa&ntilde;ol" />
		</a>| <a class="LocaleItem" href="/Room8Try1/pages/afr/user/home.jsp">
			<img src="/Room8Try1/images/afrikaans.png" height="20px"
			alt="Afrikaans" title="Afrikaans" />
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
		<h1>My Schedule</h1>
		<!-- aqui iba la imagen del schedule de domingo a lunes -->
		<%
			ArrayList<HoursOfRooms> hours = new ArrayList<HoursOfRooms>();
			hours = (ArrayList<HoursOfRooms>) session.getAttribute("HoursAlreadyBookedByUser");
			
			ArrayList<Rooms> allRooms = new ArrayList<Rooms>();
			allRooms = (ArrayList<Rooms>) session.getAttribute("AllRooms");

			String roomy = "";

			if (!hours.isEmpty()) {
		%>

		<div id="book">
			<a href="/Room8Try1/pages/eng/user/bookARoom.jsp"><button
					class="buttn">Book a Room</button></a>
		</div>
		<br /> <br />

		<form action="/Room8Try1/ScheduleRoomHour" method="get">
			<div id="myBookings">
				<table id="userSched">
					<tr>
						<th>Date</th>
						<th>Time</th>
						<th>Room</th>
						<th><input class="buttn" type="submit" name="cancel"
							value="Cancel"></input></th>

					</tr>
					<%
						if (hours != null) {
								//	String dateTime[] = null;
								SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
								SimpleDateFormat formatter = new SimpleDateFormat("EEE, MMM d, yyyy", Locale.ENGLISH);
								
								for (int i = 0; i < hours.size(); i++) {
									String dateTime[] = hours.get(i).getDate(0).split(" ");
									Date showDay = sdf.parse(dateTime[0]);
									String dateDisplay = formatter.format(showDay);
									String timeDisplay = dateTime[1].substring(0, dateTime[1].length() - 3);
					%>
					<tr>
						<td><%=dateDisplay%></td>
						<td><%=timeDisplay%> - <%=hours.get(i).getFirstHour(1)%>:00</td>
						<%
							for (Rooms r : allRooms) {

											if (r.getId() == hours.get(i).getRoomID()) {
												roomy = r.getRoomName();
											}
										}
						%>
						<td><%=roomy%></td>

						<td><input type="radio" name="meeps" required
							value="<%=hours.get(i).getID()%>"></input></td>

					</tr>
					<%
						} //end of forloop
							} //end of if
					%>
				</table>
			</div>

		</form>
		<%
			} //end of if(hours)
			else {
		%>
		You don't have any rooms booked this week!
		<div id="book">
			<a href="/Room8Try1/pages/eng/user/bookARoom.jsp"><button>Book
					a Room</button></a>
		</div>
		<%
			}
		%>
	</div>

</body>
</html>