import java.util.Date;

import information.Employee
import information.User

class BootStrap {

	def init = { servletContext ->
		new Employee(ssn:'111-11-1111',
		password:'111@11',
		firstName:'Veronica',
		lastName:'Alvarado',
		street:'45 Rockefeller Plaza',
		city:'New York',
		state:'New York',
		zipCode:10111,
		email:'Fusce@velitPellentesque.net',
		telephone:'(612) 506-2244',
		role:"Manager",
		startDate:new Date(),
		hourlyRate:250
		).save(failOnError:true);
		new User(ssn:'777-77-7777',
		password:'777@77',
		firstName:'Malachi',
		lastName:'Vazquez',
		street:'700 Health Sciences Dr',
		city:'Stony Brook',
		state:'New York',
		zipCode:11790,
		email:'tellus.lorem.eu@atlacus.org',
		telephone:'(226) 193-8257',
		ppp:"Good-User",rating:4,dateOfLastAct:new Date()).save(failOnError:true);
	}
	def destroy = {
	}
}
