<%@page import="sun.util.resources.cldr.en.LocaleNames_en"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Locale"%>
<%@page import="booking.Rooms"%>
<%@page import="booking.HoursOfRooms"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="/Room8Try1/pages/stylesheet.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Book A Room</title>
</head>
<div id="locale"
	style="font-size: 18px; padding-left: 3%; padding-right: 3%;">
	Admin View</div>
<div id="header">
	<img src="/Room8Try1/images/toplogoRev1PNG.png" id="toplog" />

	<table ID="menutable" align="center">
		<tr>
			<td><a class="menuItem"
				href="/Room8Try1/pages/eng/admin/home.jsp">Today</a></td>
			<td><a class="menuItem"
				href="/Room8Try1/pages/eng/admin/myAccount.jsp">My Account</a></td>
			<td><a class="menuItem"
				href="/Room8Try1/pages/eng/admin/editUsers.jsp">Edit Users</a></td>
			<td><a class="menuItem"
				href="/Room8Try1/pages/eng/admin/editRooms.jsp">Edit Rooms</a></td>
			<td><a class="menuItem" href="/Room8Try1/pages/eng/login.jsp">Log
					Out</a></td>
		</tr>
	</table>
</div>

<div class="content">
		<h1>Reserve Your Room</h1>
		<h4>
			Hello,
			<%=session.getAttribute("name")%></h4>
		<h4>Please reserve your room from the following options:</h4>
		<%-- <h3><% foreach(Room meep in session.getAttribute("rooms")){}%></h3> --%>

		<form action="/Room8Try1/Booking" method="get">
			<select name="chooseroom">
				<%
					ArrayList<Rooms> optionList = new ArrayList<Rooms>();
					optionList = (ArrayList<Rooms>) session.getAttribute("AllRooms");
					for (int i = 0; i < optionList.size(); i++) {
				%>
				<option value="<%=optionList.get(i).getLocation()%>"><%=optionList.get(i).getRoomName()%></option>

				<%
					}
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
					Calendar cal = new GregorianCalendar();
					String[] days = new String[7];
					days[0] = sdf.format(cal.getTime());
					for (int i = 1; i < 7; i++) {
						cal.add(Calendar.DAY_OF_MONTH, 1);
						days[i] = sdf.format(cal.getTime());
					}
				%>
			</select> <select name="choosename">
				<%
					String displayDay[] = new String[7];
					SimpleDateFormat formatter = new SimpleDateFormat("EEE, MMM d, yyyy", Locale.ENGLISH);

					for (int t = 0; t < days.length; t++) {
						Date datum = sdf.parse(days[t]);
						displayDay[t] = formatter.format(datum);
				%>

				<option value="<%=days[t]%>"><%=displayDay[t]%></option>


				<%
					}
				%>


			</select> <input type="submit" name="Submit" class="buttn" value="Submit" />
		</form>

		<%
			ArrayList<Rooms> list = new ArrayList<Rooms>();

			ArrayList<HoursOfRooms> hoursList = new ArrayList<HoursOfRooms>();

			if (request.getAttribute("rooms") != null) {
				String date = (String) request.getSession().getAttribute("date");
				Date datum = sdf.parse((String) request.getSession().getAttribute("date"));

				String dateDisplay = formatter.format(datum);
		%>
		<form action="/Room8Try1/ScheduleRoomHour" method="post">
			<br /> <br />

			<h3><%=session.getAttribute("chosenRoom")%>
				availabilities for
				<%=dateDisplay%></h3>
			<table id="userSched">

				<tr>
					<th>Time</th>
					<th>Room</th>
					<th>Location</th>
					<th>Room Capacity</th>

					<th><input class="buttn" type="submit" name="meep"
						value="Reserve"></th>
				<tr />
				<%
					int hour = 8;
						boolean hasHour = false;
						boolean hasDate = false;
						int rowtoIterate = 0;
						int x = 0;
				%>
				<%
					list = (ArrayList<Rooms>) request.getAttribute("rooms");
						hoursList = (ArrayList<HoursOfRooms>) request.getAttribute("hours");
						int hourListsize=hoursList.size()-1;
						for(int y=hourListsize;y>=0;y--){
							if(hoursList.get(y).getDate(rowtoIterate).contains(date) == false){
								hoursList.remove(y);
							}
						}
						for (int i = 0; i < list.size(); i++) {

							for (int j = 0; j < 12; j++) {
								if (x < hoursList.size()) {

									if (list.get(i).getId() == hoursList.get(x).getRoomID()) {

										if (hoursList.get(x).getDate(rowtoIterate) != null
												&& hoursList.get(x).getDate(rowtoIterate).contains(date)) {

											String meep = String.valueOf(hour) + ":00:00";

											hasHour = hoursList.get(x).getDate(rowtoIterate).contains(meep);
											//hasDate = hoursList.get(x).getDate(rowtoIterate).contains(date);
											if (hasHour) {
				%>

				<tr
					style="background-color: rgba(178, 165, 156, 0.8); color: white;">
					<td><%=hour%>:00 - <%
						hour++;
													x++;
					%> <%=hour%>:00</td>
					<td><%=list.get(i).getRoomName()%></td>
					<td><%=list.get(i).getLocation()%></td>
					<td><%=list.get(i).getSeating()%></td>
					<td></td>
					<%-- <td><%= hour %>:00</td>
				<%
				hour++; 
				x++;
				%>
				<td><%= hour %>:00</td> --%>

				</tr>
				<%
					} else {
				%>

				<tr id="row">
					<td><%=hour%>:00 - <%
						hour++;
					%> <%=hour%>:00</td>
					<td id="nameRoom"><%=list.get(i).getRoomName()%></td>
					<td><%=list.get(i).getLocation()%></td>
					<td><%=list.get(i).getSeating()%></td>

					<%-- 	<td id="startHour"><%= hour %>:00</td>
				<%hour++; %>
				<td><%= hour %>:00</td> --%>
					<td><input type="radio" name="getRoom" required
						value="<%=list.get(i).getId()%>/<%=date%> <%=hour - 1%>" /></td>
				</tr>
				<%
					}
										} //end of if
									} else {
										//x++;
				%>
				<tr id="row">
					<td><%=hour%>:00 - <%
						hour++;
					%> <%=hour%>:00</td>
					<td id="nameRoom"><%=list.get(i).getRoomName()%></td>
					<td><%=list.get(i).getLocation()%></td>
					<td><%=list.get(i).getSeating()%></td>

					<%-- 	<td id="startHour"><%= hour %>:00</td>
				<%hour++; %>
				<td><%= hour %>:00</td> --%>
					<td><input type="radio" name="getRoom" required
						value="<%=list.get(i).getId()%>/<%=date%> <%=hour - 1%>" /></td>
				</tr>
				<%
					}
								} //end of first else
								else {
				%>
				<tr id="row">
					<td><%=hour%>:00 - <%
						hour++;
					%> <%=hour%>:00</td>
					<td id="nameRoom"><%=list.get(i).getRoomName()%></td>
					<td><%=list.get(i).getLocation()%></td>
					<td><%=list.get(i).getSeating()%></td>

					<%-- <td id="startHour"><%= hour %>:00</td>
					<%hour++; %>
					<td><%= hour %>:00</td> --%>
					<td><input type="radio" name="getRoom" required
						value="<%=list.get(i).getId()%>/<%=date%> <%=hour - 1%>" /></td>
				</tr>
				<%
					}
							} //end of third for loop j

							hour = 8;

						} //end of first for loop i
				%>

			</table>

			<%
				} //end of if room !=null
			%>



		</form>


	</div>

</body>
</html>