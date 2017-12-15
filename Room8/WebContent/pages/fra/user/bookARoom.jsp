<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList"%>
    <%@page import="booking.Rooms" %>
    <%@page import="booking.HoursOfRooms" %>
    <%@page import="java.util.Calendar" %>
    <%@page import="java.text.SimpleDateFormat" %>
   <%@page import="java.util.Date" %>
      <%@page import="java.util.Calendar" %>
      <%@page import="java.util.GregorianCalendar" %>
      <%
	String lang = "fra";
	session.setAttribute("lang",lang);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

		<!--  FRANCAIS FRENCH -->

<head>
<link rel="stylesheet" type="text/css" href="/Room8Try1/pages/stylesheet.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Réserver une chambre</title>
</head>
<body>
<div id="locale">
		<a class="localeItem" href="/Room8Try1/pages/eng/user/bookARoom.jsp"> <img
			src="/Room8Try1/images/english.png" height="20px" alt="English"
			title="English" />
		</a>| <a class="localeItem" href="/Room8Try1/pages/fra/user/bookARoom.jsp"> <img
			src="/Room8Try1/images/french.png" height="20px"
			alt="Fran&ccedil;ais" title="Fran&ccedil;ais" />
		</a>| <a class="LocaleItem" href="/Room8Try1/pages/esp/user/bookARoom.jsp"> <img
			src="/Room8Try1/images/mexican.png" height="20px"
			alt="Espa&ntilde;ol" title="Espa&ntilde;ol" />
		</a>| <a class="LocaleItem" href="/Room8Try1/pages/afr/user/bookARoom.jsp"> <img
			src="/Room8Try1/images/afrikaans.png" height="20px" alt="Afrikaans"
			title="Afrikaans" />
		</a>
	</div>
	<div id="header">
		<img src="/Room8Try1/images/toplogoRev1PNG.png" id="toplog" />
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
		<h1>Vous pouvez réserver la chambre suivante:</h1>
		<br /> <br />
		<h2>Prénom:</h2>
		<%= session.getAttribute("name") %>
		<h3>Chambres disponibles:</h3>
		<%-- <h3><% foreach(Room meep in session.getAttribute("rooms")){}%></h3> --%>

		<form  action="/Room8Try1/Booking" method="get">
	<br>
	<select name="chooseroom">
		<option value="CA">CA</option>
	</select>
	<input type="submit" name="Submit"/>
</form>		
	
	<% ArrayList<Rooms> list = new ArrayList<Rooms>();
		ArrayList<HoursOfRooms> hoursList = new ArrayList<HoursOfRooms>();
		//Date cal = Calendar.getInstance().getTime();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = new GregorianCalendar();
		String date = sdf.format(cal.getTime());
		cal.add(Calendar.DAY_OF_MONTH, 6);
		String date1 = sdf.format(cal.getTime());
	
	if(request.getAttribute("rooms") != null){
		%>
		<h2>Vous pouvez choisir les pièces suivantes</h2>
<form  action="/Room8Try1/ScheduleRoomHour" method="post">
			<br/>
			<input type="submit" name="meep" value="Reserve">
		<table style="width: 100%; text-align:center;">
			<tr><td><%= date %></td></tr>
				<tr><td><%= date1 %></td></tr>
			<tr>
<td>Heures</td>				
<td>prénom</td>
				<td>Emplacement</td>
				<td>Nombre de personnes autorisé</td>
				
				<td>réserve</td>
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
			if(x<hoursList.size()){
				
				
			
		
	if(list.get(i).getId() == hoursList.get(x).getRoomID()){
		
			if(hoursList.get(x).getDate(rowtoIterate) !=null){
				
				String meep = String.valueOf(hour)+ ":00";
				
			hasHour = hoursList.get(x).getDate(rowtoIterate).contains(meep);
			
			if( hasHour){
			%>
				
				<tr bgcolor="#FF0000">
				<td><%= hour %>:00
				<br>
				<%
				hour++; 
				x++;
				%>
				<%= hour %>:00
				</td>
				<td><%= list.get(i).getRoomName() %></td>
				<td><%= list.get(i).getLocation() %></td>
				<td><%= list.get(i).getSeating()%></td>
				
				<%-- <td><%= hour %>:00</td>
				<%
				hour++; 
				x++;
				%>
				<td><%= hour %>:00</td> --%>
				
				</tr>
				<%}
			else{ %>
				
					<tr id="row" >
						<td><%= hour %>:00
				<br>
				<%
				hour++; 
				
				%>
				<%= hour %>:00
				</td>
				<td id="nameRoom"><%= list.get(i).getRoomName() %></td>
				<td><%= list.get(i).getLocation() %></td>
				<td><%= list.get(i).getSeating()%></td>
				
			<%-- 	<td id="startHour"><%= hour %>:00</td>
				<%hour++; %>
				<td><%= hour %>:00</td> --%>
				<td>
				  <input type="radio" name="getRoom" value="<%= list.get(i).getId()%>/<%= date %> <%= hour%>"/>
				
				</td>
				</tr>
				<%} }//end of if
	}
				else{ 
				%>
				<tr id="row">
					<td><%= hour %>:00
				<br>
				<%
				hour++; 
				
				%>
				<%= hour %>:00
				</td>
				<td id="nameRoom"><%= list.get(i).getRoomName() %></td>
				<td><%= list.get(i).getLocation() %></td>
				<td><%= list.get(i).getSeating()%></td>
				
			<%-- 	<td id="startHour"><%= hour %>:00</td>
				<%hour++; %>
				<td><%= hour %>:00</td> --%>
				<td><input type="radio" name="getRoom" value="<%= list.get(i).getId()%>/<%= date %> <%= hour%>"/></td>
			</tr>
			<%
				
				}}//end of first else
				else{ 
					%>
					<tr id="row">
						<td><%= hour %>:00
				<br>
				<%
				hour++; 
			
				%>
				<%= hour %>:00
					</td>
					<td id="nameRoom"><%= list.get(i).getRoomName() %></td>
					<td><%= list.get(i).getLocation() %></td>
					<td><%= list.get(i).getSeating()%></td>
					
					<%-- <td id="startHour"><%= hour %>:00</td>
					<%hour++; %>
					<td><%= hour %>:00</td> --%>
					<td><input type="radio" name="getRoom" value="<%= list.get(i).getId()%>/<%= date %> <%= hour%>"/></td>
					</tr>
					<%
					
					}
	}//end of third for loop j
	
	
			hour=8;	}//end of first for loop i
		%>
	
	</table>
	
		<%
		}//end of if room !=null
		%>
		
		
		
	</form>
	

	</div>

</body>
</html>