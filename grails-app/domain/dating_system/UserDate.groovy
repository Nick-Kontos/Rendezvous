package dating_system

import information.Employee
import information.Profile
import java.util.Date;

class UserDate implements Serializable{
	Profile profile1,profile2
	Employee custRep
	Date dateTime
	String location
	BigDecimal bookingFee
	String comments
	Integer user1Rating
	Integer user2Rating
	boolean accepted
	boolean profile1Paid;
	boolean profile2Paid;
    static constraints = {
		custRep nullable: true
		comments nullable:true
		user1Rating nullable: true
		user2Rating nullable: true
		accepted defaultValue:false
		profile1Paid defaultValue:false
		profile2Paid defaultValue:false
		bookingFee nullable: true
		location blank: true
    }
	static mapping={
		table 'Date'
		id composite: ['profile1', 'profile2','dateTime'],generator:'assigned'
		version false
		profile1 column:'Profile1'
		profile2 column:'Profile2'
		custRep  column:'CustRep'
		dateTime column:'Date_Time'
		location column:'Location'
		bookingFee column:'BookingFee'
		comments column:'Comments'
		user1Rating column:'User1Rating'
		user2Rating column:'User2Rating'
	}
}
