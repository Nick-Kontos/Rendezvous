package dating_system

import information.Employee
import information.Profile
import java.util.Date;

class UserDate implements Serializable{
	Profile profile1,profile2
	Employee custRep
	Date dateTime
	String location
	double bookingFee
	String comments
	int user1Rating
	int user2Rating
	boolean accepted
	boolean profile1Paid;
	boolean profile2Paid;
    static constraints = {
    }
	static mapping={
		table 'Date'
		id composite: ['profile1', 'profile2','dateTime'],generator:'assigned'
		version false
		profile1 column:'Profile1'
		profile2 column:'Profile2'
		custRep column:'CustRep', nullable: true
		dateTime column:'Date_Time'
		location column:'Location', nullable:true
		bookingFee column:'BookingFee', nullable: true
		comments column:'Comments', nullable: true
		user1Rating column:'User1Rating' , nullable: true
		user2Rating column:'User2Rating', nullable: true
		accepted defaultValue:false
		profile1Paid defaultValue:false
		profile2Paid defaultValue:false
	}
}
