package dating_system

import information.Employee
import information.Profile
import java.util.Date;

class UserDate implements Serializable{
	Profile profile1,profile2
	Employee custRep
	Date dateTime
	String location
	int bookingFee
	String comments
	int user1Rating
	int user2Rating
    static constraints = {
    }
	static mapping={
		table 'Date'
		id composite: ['profile1', 'profile2','dateTime'],generator:'assigned'
		version false
		profile1 column:'Profile1'
		profile2 column:'Profile2'
		custRep column:'CustRep'
		dateTime column:'Date_Time'
		location column:'Location'
		bookingFee column:'BookingFee'
		comments column:'Comments'
		user1Rating column:'User1Rating'
		user2Rating column:'User2Rating'
	}
}
