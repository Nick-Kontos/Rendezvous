package dating_system

import information.Profile

class Referral implements Serializable{
	Profile profileA	
	Profile profileB
	Profile	profileC	
	Date dateTime
    static constraints = {
    }
	static mapping={
		table 'BlindDate'
		id composite: ['profileA', 'profileB','profileC','dateTime'],generator:'assigned'
		version false
		profileA column:'ProfileA'
		profileB column:'ProfileB'
		profileC column:'ProfileC'
		dateTime column:'Date_Time'
	}
}
