package codebehind;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Comparator;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import booking.HoursOfRooms;


public class ScheduleRoomHour extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8687078084465682506L;
	Try2 connect = new Try2();
	String id="";
	String idToDelete ="";
	String date="";
	String lang = null;
	HoursOfRooms newRoom = new HoursOfRooms();
	ArrayList<HoursOfRooms> update = new ArrayList<HoursOfRooms>();
String typeUser = null;
	String endHour = null;
	public void doPost(HttpServletRequest request, HttpServletResponse response)    
			throws ServletException, IOException {
		HoursOfRooms newBooking = new HoursOfRooms();
		lang = (String) request.getSession().getAttribute("lang");
		typeUser = (String) request.getSession().getAttribute("TypeofUser");
		if(typeUser.equals("student")){
			typeUser = "user";
		}
		String args[]= request.getParameterValues("getRoom");
		//int userId = (int) request.getSession().getAttribute("id");
		update = (ArrayList<HoursOfRooms>) request.getSession().getAttribute("HoursAlreadyBookedByUser");


		int j=0;
		connect.openConnection();
		for(int i = 0 ; i< args.length;i++){
			String[] parts =  args[i].split("/");

			while(j<parts.length -1){
				id = parts[j];
				j++;
				date = parts[j];


			}
		}
		request.setAttribute("roomid", id);
		newBooking.setRoomID(Integer.parseInt(id)); //Check start and end before
		newBooking.setStartAndEnd(date +":00:00");
		int startHour= Integer.valueOf(newBooking.getFirstHour(0));
		String test = newBooking.getFirstDate(0);
		String endTime = test + " " + (++startHour) +":00:00";
		newBooking.setStartAndEnd(endTime);
		
		
		//connect.AddNewHour(id, date, userId);
		//int bookingid = connect.getHourID(id, date, userId);
		//request.getSession().setAttribute("bookingid", bookingid);
		request.getSession().setAttribute("newBooking", newBooking);
		connect.CloseConnection();
		PrintWriter out = response.getWriter();
	    out.println("<html><body>");
	    out.println("<script type=\"text/javascript\">");
	    out.println("window.open(\"http://localhost:8080/Room8Try1/pages/"+lang+"/"+typeUser+"/bookPop.jsp\", \"Popup\", \"toolbar=no,scrollbars=yes,location=no\" +\",statusbar=no,menubar=no,resizable=0,width=900,\" +\"height=700,left = 490,top = 262\");");
//	    out.println("window.open('http://localhost:8080/Room8Try1/pages/eng/admin/bookPop.jsp','1458343164502','width=900,height=700,toolbar=0,menubar=0,location=0,status=0,scrollbars=0,resizable=0,left=0,top=0');return false;");
	    out.println("</script>");
	    out.println("</body></html>");


//		RequestDispatcher rd=request.getRequestDispatcher("/pages/"+lang+"/"+ typeUser + "/bookPop.jsp"); //Try and implement the pop up here




	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)    
			throws ServletException, IOException {
		lang = (String) request.getSession().getAttribute("lang");
		update = (ArrayList<HoursOfRooms>) request.getSession().getAttribute("HoursAlreadyBookedByUser");

		String args[]= request.getParameterValues("meeps");

		connect.openConnection();

		idToDelete = args[0];

		for(int i=0; i<update.size();i++){

			if(update.get(i).getID() == Integer.parseInt(idToDelete)){
				update.remove(i);
				return;
			}
		}
		request.getSession().setAttribute("HoursAlreadyBookedByUser", update);
		connect.DeleteReservation(idToDelete);
		connect.CloseConnection();
//		RequestDispatcher rd=request.getRequestDispatcher("/pages/"+lang+"/user/home.jsp"); 
//				rd.forward(request,response);
		String redirect = 
				response.encodeRedirectURL(request.getContextPath() + "/pages/"+lang+"/user/home.jsp");
		response.sendRedirect(redirect);

	}

}
