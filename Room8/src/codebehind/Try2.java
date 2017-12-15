package codebehind;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import booking.HoursOfRooms;


public class Try2 {


	ResultSet rs = null;
	ResultSet hBooked = null;
	ResultSet resultRoom = null;
	ResultSet resultHours =null;
	ResultSet resultHourID=null;

	ResultSet amenityid = null;
	ResultSet meep = null;
	int resultForNameChange = 0;
	Connection conn = null;  
	PreparedStatement getHBooked = null;
	PreparedStatement deleteBookingRecord=null;
	PreparedStatement getHourID = null;
	PreparedStatement pst = null;  
	PreparedStatement allhours = null;
	PreparedStatement changeName = null;
	PreparedStatement getRooms = null;
	PreparedStatement getHours = null;
	PreparedStatement setNewSchedule = null;
	PreparedStatement setAmenities = null;
	PreparedStatement updateAmenity = null;
	PreparedStatement addNewRoom = null;
	PreparedStatement editRoom= null;
	PreparedStatement removeRoom=null;
	PreparedStatement updateUser = null;

	boolean goodPassword = false;
	UserActive useR = new UserActive();
	ArrayList<HoursOfRooms> userHourList= new ArrayList<HoursOfRooms>();
	public void openConnection(){
		String url = "jdbc:mysql://localhost:3306/"; 
		String dbName = "java_web_project?useSSL=false";
		// String dbName = "java_web_project";
		String driver = "com.mysql.jdbc.Driver"; 
		String userName = "root"; 
		String password = "Roygbiv7";


		try {Class.forName(driver).newInstance();
		conn = DriverManager  
				.getConnection(url + dbName, userName, password);
		} catch (SQLException | InstantiationException | IllegalAccessException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	}

	public UserActive createConnection(String name, String pass){




		String url = "jdbc:mysql://localhost:3306/"; 
		String dbName = "java_web_project?useSSL=false";
		HoursOfRooms hoursBooked = null;
		String driver = "com.mysql.jdbc.Driver"; 
		String userName = "root"; 
		String password = "Roygbiv7";
		try {  
			Class.forName(driver).newInstance();  
			conn = DriverManager  
					.getConnection(url + dbName, userName, password);  

			String possiblePass = EncryptPass(pass);

			pst = conn  
					.prepareStatement("select * from user where user_num=? and user_password=?");  //and user_password=?

			pst.setString(1, name);

			pst.setString(2, possiblePass);  

			rs = pst.executeQuery();
			if(rs.next()){

				useR.setUserNum(rs.getInt("user_num"));
				useR.setFirstName(rs.getString("user_first_name"));
				useR.setLastName(rs.getString("user_last_name"));
				useR.setPassword(rs.getString("user_password"));
				//useR.setIncidents(rs.getInt("incidents_id"));
				useR.setRating(rs.getInt("rating"));
				useR.setTypeOfUser(rs.getString("type_of_user"));
				useR.setId(rs.getInt("id"));
				useR.setMaxHours(rs.getInt("max_hours"));

				String id = String.valueOf(useR.getId());

				getHBooked = conn  
						.prepareStatement("select count(*) from bookings where user_id=?");  //and user_password=?

				getHBooked.setString(1, id);

				hBooked = getHBooked.executeQuery();
				if(hBooked.next()){
					useR.setHoursBooked(hBooked.getInt(1));
				}
				else{
					useR.setHoursBooked(0);
				}
			}
			else{
				useR= null;
			}


		} catch (Exception e) {  
			System.out.println(e);  
		} 
		return useR;
	}

	public UserActive getUser(String studentID){


		UserActive useR = new UserActive();

		String url = "jdbc:mysql://localhost:3306/"; 
		String dbName = "java_web_project?useSSL=false";
		// String dbName = "java_web_project";
		String driver = "com.mysql.jdbc.Driver"; 
		String userName = "root"; 
		String password = "Hugs1995!0809";
		try {  
			Class.forName(driver).newInstance();  
			conn = DriverManager  
					.getConnection(url + dbName, userName, password);  


			pst = conn  
					.prepareStatement("select * from user where user_num=?");  //and user_password=?

			pst.setString(1, studentID); 

			rs = pst.executeQuery();
			if(rs.next()){

				useR.setUserNum(rs.getInt("user_num"));
				useR.setFirstName(rs.getString("user_first_name"));
				useR.setLastName(rs.getString("user_last_name"));
				useR.setPassword(rs.getString("user_password"));
				useR.setIncidents(rs.getInt("incidents_id"));
				useR.setRating(rs.getInt("rating"));
				useR.setTypeOfUser(rs.getString("type_of_user"));
				useR.setId(rs.getInt("id"));
				useR.setMaxHours(rs.getInt("max_hours"));

				String id = String.valueOf(useR.getId());

				getHBooked = conn  
						.prepareStatement("select count(*) from bookings where user_id=?");  //and user_password=?

				getHBooked.setString(1, id);

				hBooked = getHBooked.executeQuery();
				if(hBooked.next()){
					useR.setHoursBooked(hBooked.getInt(1));
				}
				else{
					useR.setHoursBooked(0);
				}
			}
			else{
				useR= null;
			}


		} catch (Exception e) {  
			System.out.println(e);  
		} 
		return useR;
	}

	public void CloseConnection(){

		try {
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	//changes were made heere
	public void ChangePassword(String newpassword, String oldpassword){
		try {

			String newPass = EncryptPass(newpassword);
			changeName = conn.prepareStatement("update user set user_password=? where user_password =?");
			changeName.setString(1, newPass);
			changeName.setString(2, oldpassword);
			resultForNameChange = changeName.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


	}
	public static String EncryptPass(String pass){
		try{
			MessageDigest md = MessageDigest.getInstance("MD5");
			StringBuffer stringBuf = new StringBuffer();
			byte[] encryptedPass = md.digest(pass.getBytes());

			for(int i = 0; i < encryptedPass.length; ++i){
				stringBuf.append(Integer.toHexString((encryptedPass[i] & 0xFF) | 0x100).substring(1,3));
			}
			return stringBuf.toString();

		}catch(NoSuchAlgorithmException e){

		}

		return null;

	}
	public static boolean CheckPass(String inputPass, String salt, String dbPass){
		String inputPassSalt = inputPass + salt;
		String inputEncrypt = EncryptPass(inputPassSalt);
		if(dbPass.equals(inputEncrypt)){
			return true;
		}
		else
			return false;

	}

	public List<booking.Rooms> Rooms(String chooseroom){
		List<booking.Rooms> rooms = new ArrayList<booking.Rooms>();
		if(chooseroom.contentEquals("all")){

			try {
				getRooms= conn.prepareStatement("select * from room");

				resultRoom = getRooms.executeQuery();
				while(resultRoom.next()){
					booking.Rooms room = new booking.Rooms();
					room.setId(resultRoom.getInt("id"));
					room.setAdminId(resultRoom.getInt("fk_admin_id"));
					room.setRoomName(resultRoom.getString("room_name"));
					room.setLocation(resultRoom.getString("location"));
					room.setSeating(resultRoom.getInt("seating"));
					room.setBuilding(resultRoom.getString("building"));
					room.setHistoryId(resultRoom.getInt("history_id"));

					rooms.add(room);

				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}


		}

		else{
			try {
				getRooms= conn.prepareStatement("select * from room where location=?");
				getRooms.setString(1, chooseroom);
				resultRoom = getRooms.executeQuery();
				while(resultRoom.next()){
					booking.Rooms room = new booking.Rooms();
					room.setId(resultRoom.getInt("id"));
					room.setAdminId(resultRoom.getInt("fk_admin_id"));
					room.setRoomName(resultRoom.getString("room_name"));
					room.setLocation(resultRoom.getString("location"));
					room.setSeating(resultRoom.getInt("seating"));
					room.setBuilding(resultRoom.getString("building"));
					room.setHistoryId(resultRoom.getInt("history_id"));

					rooms.add(room);

				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return rooms;
	}
	public List<booking.HoursOfRooms> HoursAlreadyBookedByUser(int studentId){
		List<booking.HoursOfRooms> hours = new ArrayList<booking.HoursOfRooms>();
		try {
			getHours=conn.prepareStatement("select * from bookings where user_id=?");
			getHours.setInt(1,studentId);
			resultHours = getHours.executeQuery();
			while(resultHours.next()){
				booking.HoursOfRooms hoursForRoom = new booking.HoursOfRooms();
				String dbDate = resultHours.getString("start_time");
				String dbDateTwo = resultHours.getString("end_time");
				//java.util.Date dateConverted = new java.util.Date(dbDate.getTime());
				//java.util.Date dateConvertedTwo = new java.util.Date(dbDateTwo.getTime());
				hoursForRoom.setAmenitiesID(resultHours.getInt("amenities_id"));
				hoursForRoom.setID(resultHours.getInt("id"));
				hoursForRoom.setStartAndEnd(dbDate);
				hoursForRoom.setStartAndEnd(dbDateTwo);
				hoursForRoom.setRoomID(resultHours.getInt("room_id"));

				hours.add(hoursForRoom);

			}} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}



		Collections.sort(hours, Hours_Order);
		Collections.reverse(hours);
		return hours;

	}
	public List<booking.HoursOfRooms> Hours(int roomid){
		String roomID = Integer.toString(roomid);
		List<booking.HoursOfRooms> hours = new ArrayList<booking.HoursOfRooms>();

		try {
			getHours=conn.prepareStatement("select * from bookings where room_id=?");
			//getHours.setString(1, roomID);
			getHours.setInt(1,roomid);
			resultHours = getHours.executeQuery();
			while(resultHours.next()){
				booking.HoursOfRooms hoursForRoom = new booking.HoursOfRooms();
				String dbDate = resultHours.getString("start_time");
				String dbDateTwo = resultHours.getString("end_time");
				//java.util.Date dateConverted = new java.util.Date(dbDate.getTime());
				//java.util.Date dateConvertedTwo = new java.util.Date(dbDateTwo.getTime());
				hoursForRoom.setAmenitiesID(resultHours.getInt("amenities_id"));
				hoursForRoom.setID(resultHours.getInt("id"));
				hoursForRoom.setStartAndEnd(dbDate);
				hoursForRoom.setStartAndEnd(dbDateTwo);
				hoursForRoom.setRoomID(resultHours.getInt("room_id"));

				hours.add(hoursForRoom);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return hours;

	}

	//inserts new values(new ooking day and hour) in table bookings.

	public void AddNewHour(String roomID, String date, int userId){

		String startTime= date +":00:00";
		String[] parts =  date.split(" ");
		String hora = "";
		String dia ="";
		int j=0;
		while(j<parts.length-1){
			dia = parts[j];
			j++;
			hora = parts[j];
		}
		int hourInt = Integer.valueOf(hora);
		hourInt++;
		String endHour = String.valueOf(hourInt);
		String endTime = dia + " " + endHour +":00:00";
		int id= Integer.valueOf(roomID);

		try {
			setNewSchedule = conn.prepareStatement("INSERT INTO bookings(start_time, end_time,room_id, user_id) VALUES(?,?,?,?)");
			setNewSchedule.setString(1, startTime);
			setNewSchedule.setString(2, endTime);
			setNewSchedule.setInt(3, id);
			setNewSchedule.setInt(4, userId);
			setNewSchedule.executeUpdate();





		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}



	}
	public int getHourID(String roomID, String date, int userId){
		int hID=0;
		String startTime= date +":00:00";
		String[] parts =  date.split(" ");
		String hora = "";
		String dia ="";
		int j=0;
		while(j<parts.length-1){
			dia = parts[j];
			j++;
			hora = parts[j];
		}
		int hourInt = Integer.valueOf(hora);
		hourInt++;
		String endHour = String.valueOf(hourInt);
		String endTime = dia + " " + endHour +":00:00";
		int id= Integer.valueOf(roomID);
		try {
			getHourID = conn.prepareStatement("Select * from bookings where start_time=? & end_time=? & user_id=?");
			getHourID.setString(1, startTime);
			getHourID.setString(2, endTime);

			getHourID.setInt(3, userId);
			resultHourID=getHourID.executeQuery();
			while(resultHourID.next()){
				hID= resultHourID.getInt("id");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return hID;
	}
	public void UpdateAmenities(int A_id, int bookingid){//aqui esta el problema

		try {
			updateAmenity = conn.prepareStatement("update bookings set amenities_id = ? where id=?");
			updateAmenity.setInt(1,A_id);
			updateAmenity.setInt(2, bookingid);
			updateAmenity.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


	}

	public void DeleteReservation(String bookingId){
		int bookID = Integer.parseInt(bookingId);
		try {
			deleteBookingRecord = conn.prepareStatement("DELETE FROM bookings WHERE id=?");
			deleteBookingRecord.setInt(1,bookID);
			deleteBookingRecord.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}



	}


	public void AddAmenities(String hdmi, String usb, String markers, String other){



		try {
			setAmenities = conn.prepareStatement("INSERT INTO amenities(USB_cable, markers,other_requests, HDMI_cable) VALUES(?,?,?,?)");
			setAmenities.setString(1, usb);
			setAmenities.setString(2, markers);
			setAmenities.setString(3, other);
			setAmenities.setString(4, hdmi);
			setAmenities.executeUpdate();		



		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}



	}


	//Make changes in rooms
	public void EditRoom(String oldRoomName, int admin, String roomName, String location, String seating, String building){
		int seatingi = Integer.valueOf(seating);

		try {
			editRoom = conn.prepareStatement("update room set room_name = ?, location=?, seating=?,fk_admin_id=?, building=? where room_name=?");
			editRoom.setString(1, roomName);
			editRoom.setString(2, location);
			editRoom.setInt(3, seatingi);
			editRoom.setInt(4, admin);
			editRoom.setString(5, building);
			editRoom.setString(6, oldRoomName);
			editRoom.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	//delete from Room
	public void DeleteRoom(String roomName){

		try {
			removeRoom = conn.prepareStatement("DELETE FROM room WHERE room_name=?");
			removeRoom.setString(1, roomName);
			removeRoom.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	//Add new room
	public void AddRoom(int adminIDArray, String roomName, String location, String seating, String building){


		int seatingi = Integer.parseInt(seating);	
		try {
			addNewRoom = conn.prepareStatement("INSERT INTO room(room_name, location,seating, history_id,fk_admin_id,building) VALUES(?,?,?,?,?,?)");
			addNewRoom.setString(1, roomName);
			addNewRoom.setString(2, location);
			addNewRoom.setInt(3, seatingi);
			addNewRoom.setInt(4, 0);
			addNewRoom.setInt(5, adminIDArray);
			addNewRoom.setString(6, building);
			addNewRoom.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}



	public int GetAmenId(String hdmi, String usb, String markers, String other){
		int A_id = 0;
		try {
			setAmenities = conn.prepareStatement("SELECT * FROM amenities ORDER BY id DESC LIMIT 1");
			/*		setAmenities.setString(1, usb);
		setAmenities.setString(2, markers);
		setAmenities.setString(3, other);
		setAmenities.setString(4, hdmi);*/
			amenityid = setAmenities.executeQuery();
			while(amenityid.next()){

				A_id = amenityid.getInt("id");

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return A_id;

	}
	static final Comparator<HoursOfRooms> Hours_Order = new Comparator<HoursOfRooms>(){
		public int compare(HoursOfRooms hourOne, HoursOfRooms hourTwo) {
			if(hourOne.getRoomID()== hourTwo.getRoomID()){

				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				try{
					Date value1 = sdf.parse(hourOne.getDate(0));
					Date value2 = sdf.parse(hourTwo.getDate(0));
					if(value1.after(value2)){
						return -1;

					}
					else if(value1.before(value2)){
						return 1;
					}
				}catch (Exception e){

				}
			}
			if(hourOne.getRoomID()> hourTwo.getRoomID()){
				return -1;
			}
			return 1;


		}
	};

	//public int getHourID(String roomID, String date, int userId){
	//	int hID=0;
	//	String startTime= date +":00:00";
	//	String[] parts =  date.split(" ");
	//	String hora = "";
	//	String dia ="";
	//	int j=0;
	//	while(j<parts.length-1){
	//		dia = parts[j];
	//		j++;
	//		hora = parts[j];
	//	}
	//	int hourInt = Integer.valueOf(hora);
	//	hourInt++;
	//	String endHour = String.valueOf(hourInt);
	//	String endTime = dia + " " + endHour +":00:00";
	//	int id= Integer.valueOf(roomID);
	//	try {
	//		getHourID = conn.prepareStatement("select id from bookings order by id desc limit 1");
	//		
	//		resultHourID=getHourID.executeQuery();
	//		while(resultHourID.next()){
	//			hID= resultHourID.getInt("id");
	//		}
	//	} catch (SQLException e) {
	//		// TODO Auto-generated catch block
	//		e.printStackTrace();
	//	}
	//		return hID;
	//	}

	public void UpdateUser(int user_id, int bookingid) {
		try {
			updateUser = conn.prepareStatement("update bookings set user_id = ? where id=?");
			updateUser.setInt(1,user_id);
			updateUser.setInt(2, bookingid);
			updateUser.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


	}

	public void AddNewBooking(HoursOfRooms newBooking) {

		int startHour= Integer.valueOf(newBooking.getFirstHour(0));
		String startTime= newBooking.getDate(0);
		int endHour = startHour+1;
		String test = newBooking.getFirstDate(0);
		String endTime = test + " " + endHour +":00:00";
		int room_id= newBooking.getRoomID();
		int user_id = newBooking.getUserID();
		int amenities_id = newBooking.getAmentiesID();

		try {
			setNewSchedule = conn.prepareStatement("INSERT INTO bookings(start_time, end_time,room_id,amenities_id,user_id) VALUES(?,?,?,?,?)");
			setNewSchedule.setString(1, startTime);
			setNewSchedule.setString(2, endTime);
			setNewSchedule.setInt(3, room_id);
			setNewSchedule.setInt(4, amenities_id);
			setNewSchedule.setInt(5, user_id);
			setNewSchedule.executeUpdate();


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


	}
}


