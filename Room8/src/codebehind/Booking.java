package codebehind;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import booking.HoursOfRooms;
import booking.Rooms;


public class Booking extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = -1594317120043704668L;
	/* static final Comparator<HoursOfRooms> Hours_Order = new Comparator<HoursOfRooms>(){
		 public int compare(HoursOfRooms hourOne, HoursOfRooms hourTwo) {
				if(hourOne.getRoomID()== hourTwo.getRoomID()){
					int value1 = hourOne.getFirstDate(0).compareTo(hourTwo.getFirstDate(0));
					if(value1==0){
						return hourOne.getFirstHour(0).compareTo(hourTwo.getFirstHour(0));
							
					}
				}
				if(hourOne.getRoomID()> hourTwo.getRoomID()){
					return -1;
				}
				return 1;
			}
	 };*/
	static final Comparator<HoursOfRooms> Hours_Order = new Comparator<HoursOfRooms>(){
		 public int compare(HoursOfRooms hourOne, HoursOfRooms hourTwo) {
				if(hourOne.getRoomID()== hourTwo.getRoomID()){
					
					int value1 = Integer.parseInt(hourOne.getFirstHour(0));
					int value2 = Integer.parseInt(hourTwo.getFirstHour(0));
					if(value1>value2){
						return -1;
							
					}
					else if(value1<value2){
						return 1;
					}
				}
				if(hourOne.getRoomID()> hourTwo.getRoomID()){
					return -1;
				}
				return 1;
			}
	 };
	

	Try2 connect = new Try2();
	String lang = null;
	public void doGet(HttpServletRequest request, HttpServletResponse response)    
			throws ServletException, IOException {  
		String typeUser = (String) request.getSession().getAttribute("TypeofUser");
		response.setContentType("text/html");    
		PrintWriter out = response.getWriter();  
		connect.openConnection();
		lang = (String) request.getSession().getAttribute("lang");
		String building = request.getParameter("chooseroom");
		String date = request.getParameter("choosename");
		request.getSession().setAttribute("date", date);
		connect.CloseConnection();//lo acabas de agregar
		connect.openConnection();//lo acabas de agregar
		List<Rooms> listRooms =connect.Rooms(building);
		List<HoursOfRooms> listhours = new ArrayList<HoursOfRooms>();
		
		List<HoursOfRooms> listhoursRoom = new ArrayList<HoursOfRooms>();
		for(int i=0; i< listRooms.size();i++){
			listhoursRoom = connect.Hours(listRooms.get(i).getId());
			request.getSession().setAttribute("chosenRoom", (listRooms.get(i).getRoomName()));

			for(int j=0; j< listhoursRoom.size();j++){
				listhours.add(listhoursRoom.get(j));
			}

		}
		Collections.sort(listhours, Hours_Order);
		Collections.reverse(listhours);
		request.setAttribute("rooms", listRooms);
		request.setAttribute("hours", listhours);
		connect.CloseConnection();//lo acabas de agregar
		if (typeUser.trim().equals("admin")){
			request.getRequestDispatcher("/pages/eng/admin/bookARoom.jsp").forward(request, response);
		}
		else
		request.getRequestDispatcher("/pages/"+lang+"/user/bookARoom.jsp").forward(request, response);

		/*for(int i=0; i<listRooms.size();i++){
			out.print("<h2>This is a room: </h2>");
			out.print(listRooms.get(i).getRoomName());

		}
		RequestDispatcher rd=request.getRequestDispatcher("BookARoom.jsp");    
		rd.include(request,response);  */
	}


/*	public class GraduationCeremonyComparator implements Comparator<graduationCeremony> {
	    public int compare(graduationCeremony o1, graduationCeremony o2) {
	        int value1 = o1.campus.compareTo(o2.campus);
	        if (value1 == 0) {
	            int value2 = o1.faculty.compareTo(o2.faculty);
	            if (value2 == 0) {
	                return o1.building.compareTo(o2.building);
	            } else {
	                return value2;
	        }
	        return value1;
	    }
	}*/
}
