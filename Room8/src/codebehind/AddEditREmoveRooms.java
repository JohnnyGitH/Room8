package codebehind;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import booking.Rooms;


public class AddEditREmoveRooms extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 9014803386466392813L;
	Try2 connect = new Try2();
	String lang = null;
	public void doPost(HttpServletRequest request, HttpServletResponse response)    
			throws ServletException, IOException {
		lang = (String) request.getSession().getAttribute("lang");
		String args[]= request.getParameterValues("action");
		String action = args[0];
		connect.openConnection();
		
		if(action.contains("Add")){
			String[] name = request.getParameterValues("roomName");
			String[] locationArray = request.getParameterValues("location");
			String[] seatingArray = request.getParameterValues("seating");
			String[] buildingArray = request.getParameterValues("building");
			Rooms newRoom = new Rooms();
			
			int adminIDArray = (int) request.getSession().getAttribute("UserId");
			String roomName = name[0];
			String location = locationArray[0];
			String seating = seatingArray[0];
			String building = buildingArray[0];
			
			newRoom.setAdminId(adminIDArray);
			newRoom.setBuilding(building);
			newRoom.setLocation(location);
			newRoom.setRoomName(roomName);
			newRoom.setSeating(Integer.valueOf(seating));
			
			connect.AddRoom(adminIDArray, roomName, location, seating, building);
			ArrayList<Rooms> optionList = new ArrayList<Rooms>();
			optionList = (ArrayList<Rooms>) request.getSession().getAttribute("AllRooms");
			optionList.add(newRoom);
			request.getSession().setAttribute("AllRooms", optionList);
			request.getRequestDispatcher("/pages/"+lang+"/admin/editRooms.jsp").forward(request, response);
			
		}
		else if(action.contains("Submit")){
			String roomedit = request.getParameter("chooseroom");
			request.getSession().setAttribute("RoomChosenToEdit", roomedit);
			request.getRequestDispatcher("/pages/"+lang+"/admin/editARoom.jsp").forward(request, response);
			
		}
		else if(action.contains("Edit")){
			String oldRoomName = (String)request.getSession().getAttribute("RoomChosenToEdit");
			String[] name = request.getParameterValues("roomName");
			String[] locationArray = request.getParameterValues("location");
			String[] seatingArray = request.getParameterValues("seating");
			String[] buildingArray = request.getParameterValues("building");
			
			
			int adminIDArray = (int) request.getSession().getAttribute("UserId");
			String roomName = name[0];
			String location = locationArray[0];
			String seating = seatingArray[0];
			String building = buildingArray[0];
			
			connect.EditRoom(oldRoomName, adminIDArray, roomName, location, seating, building);
			
			request.getRequestDispatcher("/pages/"+lang+"/admin/editRooms.jsp").forward(request, response);
			
		}
		else{
			String roomedit = request.getParameter("chooseroom");
			connect.DeleteRoom(roomedit);
			ArrayList<Rooms> optionList = new ArrayList<Rooms>();
			optionList = (ArrayList<Rooms>) request.getSession().getAttribute("AllRooms");
			for(int i=0;i<optionList.size();i++){
				
				if(optionList.get(i).getRoomName().contains(roomedit)){
					optionList.remove(i);
				}
				
			}
			request.getSession().setAttribute("AllRooms", optionList);
			request.getRequestDispatcher("/pages/"+lang+"/admin/editRooms.jsp").forward(request, response);
		}
		
	}

}
