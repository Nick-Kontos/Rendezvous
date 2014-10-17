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
		profileB column:'ProfileB'
		profileC column:'ProfileC'
		dateTime column:'Date_Time'
	}
}
