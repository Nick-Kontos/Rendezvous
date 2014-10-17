package dating_system

import information.Profile
import java.util.Date;

class Likes implements Serializable {
	Profile liker
	Profile likee
	Date dateTime
    static constraints = {
    }
	static mapping={
		table 'Likes'
		id composite: ['liker', 'likee','dateTime'],generator:'assigned'
		version false
		liker column:'Liker'
		likee column:'Likee'
		dateTime column:'Date_Time'
	}
}
