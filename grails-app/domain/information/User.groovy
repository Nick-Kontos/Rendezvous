package information

import java.util.Date;

class User extends Person{
	String ppp
	int rating
	Date dateOfLastAct
    static constraints = {
		
    }
	static mapping={	
		id column: 'SSN',type:'string'
		version false
		ppp column: 'PPP'
		rating column: 'Rating'
		dateOfLastAct column: 'DateOfLastAct'
	}
}
