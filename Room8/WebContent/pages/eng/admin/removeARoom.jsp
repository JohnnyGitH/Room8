<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="booking.Rooms"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="/Room8Try1/pages/stylesheet.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add a Room</title>
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
	<%String remove = (String)request.getSession().getAttribute("remove"); %>
	<form action="/Room8Try1/AddEditREmoveRooms" method="post">
		<select name="chooseroom">
			<%ArrayList<Rooms> optionList = new ArrayList<Rooms>();
		optionList = (ArrayList<Rooms>) session.getAttribute("AllRooms");
		for(int i=0;i<optionList.size();i++){
			
	%>
			<option name="optionRoom"
				value="<%= optionList.get(i).getRoomName()%>"><%= optionList.get(i).getRoomName()%></option>

			<%} %>
		</select> <input type="submit" name="action" value="Remove" />
	</form>
</div>
</body>
</html>