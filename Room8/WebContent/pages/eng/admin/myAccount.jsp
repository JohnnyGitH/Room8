<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/Room8Try1/pages/stylesheet.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Account</title>
</head>
<body>
<div id="locale" style="font-size: 18px; padding-left: 3%; padding-right: 3%;">
Admin View</div>
		<div id="header">
			<img src="/Room8Try1/images/toplogoRev1PNG.png" id="toplog"/>

		<table ID="menutable" align="center">
			<tr>
				<td><a class="menuItem" href="/Room8Try1/pages/eng/admin/home.jsp">Today</a></td>
				<td><a class="menuItem" href="/Room8Try1/pages/eng/admin/myAccount.jsp">My Account</a></td>
				<td><a class="menuItem" href="/Room8Try1/pages/eng/admin/editUsers.jsp">Edit Users</a></td>
				<td><a class="menuItem" href="/Room8Try1/pages/eng/admin/editRooms.jsp">Edit Rooms</a></td>				
				<td><a class="menuItem" href="/Room8Try1/pages/eng/login.jsp">Log Out</a></td>
			</tr>
		</table>
	</div>
	<div class="content">
		<h1>Account Summary:</h1>
		<br /> <br />
		<h2>First Name:</h2>
		<%=session.getAttribute("name")%>
		<br />
		<h2>Last Name:</h2>
		<%=session.getAttribute("LastName")%>
		<br />
		<h2>ID Number:</h2>
		<%=session.getAttribute("StudentNum")%>
		<br />
		<h3>Change your password here:</h3>
		<form action="loginServlet" method="get">
			<input type="text" name="newPassword" /> <input type="submit"
				value="Submit" />
		</form>
	</div>
</body>
</html>