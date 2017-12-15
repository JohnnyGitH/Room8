<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="/Room8Try1/pages/stylesheet.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Account</title>
</head>
<body>
<div id="locale" style="font-size: 18px; padding-left: 3%; padding-right: 3%;">
Admin View</div>iew</div>
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
		<h1>Edit a User Profile</h1>
		<form action="/Room8Try1/EditUser" method="get">
			Enter a User ID: <input type="text" name="userID" /> <input
				type="submit" value="Submit" />
		</form>
		<br /> <br />
		<h2>User Info</h2>
		<h3>First Name:</h3>
		<%=session.getAttribute("name")%>
		<br />
		<h3>Last Name:</h3>
		<%=session.getAttribute("LastName")%>
		<br />
		<h3>ID Number:</h3>
		<%=session.getAttribute("StudentNum")%>
		<br />
		<h3>Set a temporary password:</h3>
		<form action="/Room8Try1/loginServlet" method="get">
			<input type="text" name="newPassword" /> <br /> <br /> <input
				type="submit" value="Submit" /> <br /> <br />
			<h2>Incident Report</h2>
			<h3>Date of Incident</h3>
			<input type="text" /> <br />
			<h3>Description of Incident</h3>
			<input type="text" /> <br /> <br />
			<button>Submit</button>
		</form>
	</div>
</body>
</html>