package dating_system

import information.Employee;
import information.Profile;

import java.util.Date;

class SuggestedBy implements Serializable {
	Employee custRep
	Profile	profileB,profileC
	Date dateTime
    static constraints = {
    }
	static mapping={
		table 'SuggestedBy'
		id composite: ['custRep', 'profileB','profileC','dateTime'],generator:'assigned'
		version false
		custRep column:'CustRep'
		profileB column:'Profile1'
		profileC column:'Profile2'
		dateTime column:'Date_Time'
	}
}
