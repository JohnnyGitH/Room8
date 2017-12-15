package codebehind;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import booking.HoursOfRooms;


public class Amenities extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8338218015785197934L;
	Try2 connect = new Try2();
	String lang = null;
	public void doPost(HttpServletRequest request, HttpServletResponse response)    
			throws ServletException, IOException {
		lang = (String) request.getSession().getAttribute("lang");
//		int bookingid = (int) request.getSession().getAttribute("bookingid");
		String args[]= request.getParameterValues("id");
		String hdmi="no";
		String usb = "no";
		String markers = "no";
		String other = "no";
		String roomId =  request.getParameter("roomid");
		int userID = Integer.valueOf(request.getParameter("user_id"));
		String typeUser = (String) request.getSession().getAttribute("TypeofUser");
		HoursOfRooms newBooking = (HoursOfRooms) request.getSession().getAttribute("newBooking");
		if(typeUser.equals("student")){
			typeUser = "user";
		}
		for(int i =0; i< args.length;i++){
			switch(args[i]){

			case "markers":
				markers = "yes";
				break;
			case "HDMI":
				hdmi = "yes";
				break;
			case "USB":
				usb = "yes";
				break;
			case "Other":
				other = "yes";
				break;

			default:
				other = args[i];
				break;


			}

		}
		connect.openConnection();
		connect.AddAmenities(hdmi, usb, markers, other);
		int ameniti_id = connect.GetAmenId(hdmi, usb, markers, other);//algo aqui esta mal
	//	connect.UpdateAmenities(ameniti_id,bookingid);//que pasa aqui, creo que es el bookingid
		//connect.UpdateAmenities(ameniti_id,bookingid);//que pasa aqui, creo que es el bookingid
		if(typeUser == "admin"){
			UserActive user = (UserActive) request.getSession().getAttribute("student");
			newBooking.setUserID(user.getId());
		}
		else{
			newBooking.setUserID(userID);
		}
		//You're not overwriting dumbass
		newBooking.setAmenitiesID(ameniti_id);
		connect.AddNewBooking(newBooking);
		request.getSession().removeAttribute("newBooking");
		connect.CloseConnection();
		RequestDispatcher rd;
		if (typeUser == "admin"){
			rd=request.getRequestDispatcher("/pages/"+ typeUser + "/booked.jsp");}
		else{
			rd=request.getRequestDispatcher("/pages/"+lang+"/user/booked.jsp");
		}
		rd.forward(request,response);

	}


}
