<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="booking.Rooms"%>
<%@page import="booking.HoursOfRooms"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="/Room8Try1/pages/stylesheet.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Room M8</title>

</head>
<body>
<div id="locale" style="font-size: 18px; padding-left: 3%; padding-right: 3%;">
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
		<h3>Rooms available:</h3>
		<%-- <h3><% foreach(Room meep in session.getAttribute("rooms")){}%></h3> --%>

		<form action="/Room8Try1/Booking" method="get">
			<br> <select name="chooseroom">
				<option value="CA">CA</option>
			</select> <input type="submit" name="Submit" />
		</form>

			<% ArrayList<Rooms> list = new ArrayList<Rooms>();
		ArrayList<HoursOfRooms> hoursList = new ArrayList<HoursOfRooms>();
		//Calendar calendar =Calendar.getInstance();
	
	if(request.getAttribute("rooms") != null){
		%>
		<h2>You can choose the following rooms</h2>
		<table style="width: 100%; text-align:center;">
		<tr>
				<td>Name</td>
				<td>Location</td>
				<td>Number of people allowed</td>
				<td>Start of reservation</td>
				<td>End of reservation</td>
				<td>Reserve</td>
				<tr/>
				<% int hour=8; 
					boolean hasHour=false;
					int rowtoIterate = 0;
					int x=0;
				%>
		<% list =  (ArrayList<Rooms>) request.getAttribute("rooms");
			hoursList = (ArrayList<HoursOfRooms>) request.getAttribute("hours");
		for(int i=0; i< list.size();i++){
		
		for(int j=0; j<12;j++){
		
	if(list.get(i).getId() == hoursList.get(x).getRoomID()){
		if(rowtoIterate>1){
			rowtoIterate=0;
			x++;
		}
			if(hoursList.get(x).getDate(rowtoIterate) !=null){
				
				String meep = String.valueOf(hour)+ ":00";
				
			hasHour = hoursList.get(x).getDate(rowtoIterate).contains(meep);
			
			if( hasHour){
			%>
				
				<tr bgcolor="#FF0000">
				<td><%= list.get(i).getRoomName() %></td>
				<td><%= list.get(i).getLocation() %></td>
				<td><%= list.get(i).getSeating()%></td>
				
				<td><%= hour %>:00</td>
				<%
				hour++; 
				rowtoIterate++;
				%>
				<td><%= hour %>:00</td>
				
				</tr>
				<%}
			else{ %>
				
					<tr >
				<td><%= list.get(i).getRoomName() %></td>
				<td><%= list.get(i).getLocation() %></td>
				<td><%= list.get(i).getSeating()%></td>
				
				<td><%= hour %>:00</td>
				<%hour++; %>
				<td><%= hour %>:00</td>
				<td><button>Reserve</button></td>
				</tr>
				<%} }//end of if
	}
				else{ 
				%>
				<tr>
				<td><%= list.get(i).getRoomName() %></td>
				<td><%= list.get(i).getLocation() %></td>
				<td><%= list.get(i).getSeating()%></td>
				
				<td><%= hour %>:00</td>
				<%hour++; %>
				<td><%= hour %>:00</td>
				<td><button>Reserve</button></td>
				</tr>
				<%
				}//end of first else
	}//end of third for loop j
	
	
			hour=8;	}//end of first for loop i
		}//end of if room !=null
		%>
	</table>
	</div>

</body>
</html>