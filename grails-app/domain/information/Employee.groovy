package information

import java.util.Date;

class Employee extends Person{
	String role
	Date startDate
	int	hourlyRate
    static constraints = {
    }
	static mapping={
		table 'Employee'
		id column: 'SSN',type:'string'
		version false
		role column: 'Role'
		startDate column: 'StartDate'
		hourlyRate column: 'HourlyRate'
	}
}
