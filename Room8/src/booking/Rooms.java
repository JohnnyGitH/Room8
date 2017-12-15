package booking;

public class Rooms {
	private int id;
	private String roomName;
	private String location;
	private int seating;
	private String availability;
	private int historyID;
	private int adminID;
	
	public void setId(int i){
		
		id= i;
	}
	public void setRoomName(String i){
		
		roomName= i;
	}
	public void setLocation(String i){
		
		location= i;
	}
	public void setSeating(int i){
		
		seating= i;
	}
	public void setBuilding(String i){
		
		availability= i;
	}
	public void setHistoryId(int i){
		
		historyID= i;
	}
	public void setAdminId(int i){
		
		adminID= i;
	}
	
	public int getId(){
		return id;
	}
	public String getRoomName(){
		return roomName;
	}
	public String getLocation(){
		return location;
	}
	public int getSeating(){
		return seating;
	}
	public String getBuilding(){
		return availability;
	}
	public int getHistory(){
		return historyID;
	}
	public int getAdmin(){
		return adminID;
	}
}
