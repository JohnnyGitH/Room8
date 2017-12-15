package booking;


import java.sql.Timestamp;
import java.util.Date;

public class HoursOfRooms {
	
	private int id;
private String []startAndEnd= new String[2];
	private int roomID;
	private int amenitiesID;
	private int count=0;
	private int countTwo = 0;
	private String []date=new String[2];
	private String []hour=new String[2];
	private int userID;
	
	
	public void setID(int passedid){id= passedid;}
	public void setUserID(int user){
		userID = user;
	}
public void setStartAndEnd(String startOrEnd){
		
	startAndEnd[count] = startOrEnd;
	String []parts= startOrEnd.split(" ");
	int j = 0;
	while(j<parts.length -1){
		 date[count] = parts[j];
		j++;
		 hour[count] = parts[j];
	

	}
		if(count==1){
			count=0;
			
		}
		count++;
		if(count == 2){
			count = 0;
		}
	}
	public void setAmenitiesID(int amenities){amenitiesID = amenities;}
	public void setRoomID(int room){
		roomID =room;
	}
	
	
	public int getUserID(){
		return userID;
		
	}
	public int getID(){
		
		return id;
	}
	public String getDate(int row){
		return startAndEnd[row];
	}
	public String getFirstDate(int row){
		return date[row];
	}
	public String getFirstHour(int row){
		String []parts= hour[row].split(":");
		String theHour="";
		
		theHour = parts[0];
		
		return theHour;
	}
	public int getAmentiesID(){return amenitiesID;}
	public int getRoomID(){
		return roomID;
	}
}
