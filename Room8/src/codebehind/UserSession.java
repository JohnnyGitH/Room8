package codebehind;


import java.io.IOException;
import java.io.PrintWriter;
import java.security.SecureRandom;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import booking.HoursOfRooms;
import booking.Rooms;





public class UserSession extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5078031267023856285L;
	UserActive currentUser = new UserActive();	
	Try2 connect = new Try2();
	Connection usercon = null;
	HttpSession session = null;
	String lang = null;

	public void doPost(HttpServletRequest request, HttpServletResponse response)    
			throws ServletException, IOException {    

		response.setContentType("text/html");    
		PrintWriter out = response.getWriter();    

		String n=request.getParameter("username");    
		String p=request.getParameter("userpass");   
		lang = (String) request.getSession().getAttribute("lang");

		 session = request.getSession(false);  
		currentUser = connect.createConnection(n,p);
		if(currentUser != null)  {
			session.setAttribute("name", currentUser.getFirstName()); 
			session.setAttribute("id", currentUser.getId());
			ArrayList<HoursOfRooms> meep = new ArrayList<HoursOfRooms>();
			
			currentUser.setHoursAllReadyBooked((ArrayList<HoursOfRooms>) connect.HoursAlreadyBookedByUser(currentUser.getId()));
			
			ArrayList<Rooms> allRooms = new ArrayList<Rooms>();
			allRooms = (ArrayList<Rooms>) connect.Rooms("all");
			
			session.setAttribute("TypeofUser", currentUser.getTypeOfUser());
			session.setAttribute("LastName", currentUser.getLastName());
			session.setAttribute("Rating", currentUser.getRating());
			session.setAttribute("Incidents", currentUser.getIncidents());
			session.setAttribute("StudentNum", currentUser.getUserNumber());
			session.setAttribute("password", currentUser.getPassword());
			session.setAttribute("HoursAlreadyBookedByUser", currentUser.getAllHoursBooked());
			session.setAttribute("AllRooms", allRooms);
			session.setAttribute("UserId", currentUser.getId());
			session.setAttribute("MaxHours", currentUser.getMaxHours());
			session.setAttribute("HoursBooked", currentUser.getHoursBooked());


			//connect.CloseConnection();
			System.out.println(currentUser.getTypeOfUser());
			if (currentUser.getTypeOfUser().trim().equals("admin")){
				RequestDispatcher rd=request.getRequestDispatcher("/pages/"+lang+"/admin/home.jsp"); 
				rd.forward(request,response);
			}
			else {
			RequestDispatcher rd=request.getRequestDispatcher("/pages/"+lang+"/user/home.jsp"); 
			rd.forward(request,response);
			}
		}
		else{    
			request.setAttribute("errMsg", "not null");    
			RequestDispatcher rd=request.getRequestDispatcher("/pages/"+lang+"/login.jsp");    
			rd.include(request,response);    
		}   

	}  
	
	/*public void ChangeName(String newName){
		connect.ChangeRecordName(newName, currentUser.getFirstName());
		currentUser.setFirstName(newName);
		session.setAttribute("name",currentUser.getFirstName());
		
		
	}*/
	
	//changes were made here
	//aqui es para el password change implementtando lo de drewbie picioso
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		response.setContentType("text/html");    
		PrintWriter out = response.getWriter();  
		//String newsalt = GenerateSalt();
		connect.openConnection();
		String newName = request.getParameter("newPassword");
		connect.ChangePassword(newName, currentUser.getPassword());
		currentUser.setPassword(newName);
		session.setAttribute("password", currentUser.getPassword());
		RequestDispatcher rd=request.getRequestDispatcher("/pages/"+lang+"/user/myAccount.jsp"); 
		rd.forward(request,response);
		
	}
	//new method added
	public static String GenerateSalt(){
		SecureRandom random = new SecureRandom();
		byte salt[] = new byte[20];
		random.nextBytes(salt);
		return salt.toString();
	}

}
