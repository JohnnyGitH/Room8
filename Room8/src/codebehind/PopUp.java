package codebehind;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import booking.HoursOfRooms;
import booking.Rooms;

public class PopUp extends HttpServlet {


	//Get the hoursBooked here with a select statement
	//Maybe booked = select * from bookings where userID == student.id
	//request.setAttribute("hoursBooked", booked);
	//Grab max hours as well the sayy way.
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -5960104888147124484L;
	Try2 connect = new Try2();
	String typeUser = null;
	String lang = null;
	public void doGet(HttpServletRequest request, HttpServletResponse response)    
			throws ServletException, IOException {  
		response.setContentType("text/html");    
		PrintWriter out = response.getWriter();  
		typeUser = (String) request.getSession().getAttribute("TypeofUser");
		lang = (String) request.getSession().getAttribute("lang");
		if(typeUser.equals("student")){
			typeUser = "user";
		}
		connect.openConnection();
		String studentID = request.getParameter("studentID");
	connect.CloseConnection();
		connect.openConnection();
		UserActive student = connect.getUser(studentID);
		request.setAttribute("user", student);
		request.setAttribute("attempted", true);
		connect.CloseConnection();//lo acabas de agregar
		RequestDispatcher rd=request.getRequestDispatcher("/pages/"+lang+"/"+ typeUser + "/bookPop.jsp");
		rd.forward(request,response);
	}
}
