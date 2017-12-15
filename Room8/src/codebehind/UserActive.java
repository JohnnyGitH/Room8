package codebehind;

import java.util.ArrayList;
import java.util.List;
import booking.HoursOfRooms;


public class UserActive {
		private int user_num;
		private String first_name;
		private String last_name;
		private String password;
		private int incidents;
		private int rating;
		private String type_of_user;
		private int hours_booked;
		private int id_user;
		private ArrayList<booking.HoursOfRooms> hoursAllReadyBooked = new ArrayList<booking.HoursOfRooms>();
		private int maxHours;
//		
//		public void setHoursBook(int hours){
//			hoursBooked = hours;
//		}
		public void setUserNum(int username){
			
			user_num = username;
		}
		
		public void setFirstName(String firstName){
			first_name= firstName;
		}
		public void setLastName(String lastname){
			last_name = lastname;
		}
		public void setPassword(String pass){
			password = pass;
		}
		public void setIncidents(int incident){
			incidents = incident;
		}
		public void setRating(int rating){
			this.rating = rating;
		}
		public void setTypeOfUser(String typeuser){
			type_of_user = typeuser;
		}
		public void setId(int id){
			id_user = id;
			
		}

        public void setHoursBooked(int hours_booked){
			this.hours_booked = hours_booked;
		}
		
		public void setMaxHours(int maxHours){
			this.maxHours = maxHours;
		}

		public void setHoursAllReadyBooked(ArrayList<HoursOfRooms> meep){
			hoursAllReadyBooked= meep;
		}
		public void AddAetHoursAllReadyBooked(HoursOfRooms hours){
			hoursAllReadyBooked.add(hours);
		}
		
		public ArrayList<HoursOfRooms> getAllHoursBooked(){
			
			return hoursAllReadyBooked;
		}
		

		
		public int getId(){
			return id_user;
		}
		public int getUserNumber(){
			return user_num;
		}

		public String getPassword(){
			return password;
		}
		public String getFirstName(){
			return first_name;
		}
		public String getLastName(){
			return last_name;
		}
		public int getIncidents(){
			return incidents;
		}
		public int getRating(){
			return rating;
		}
		public String getTypeOfUser(){
			return type_of_user;
		}
		public int getHoursBooked(){
			return hours_booked;
		}
		
		public int getMaxHours(){
			return maxHours;
		}
		
		public UserActive getUser(){
			return this;
		}
}

