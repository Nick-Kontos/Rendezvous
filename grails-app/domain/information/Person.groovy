package information

class Person {
	String ssn;
	String password
	String firstName
	String lastName
	String street
	String city
	String state
	int zipCode
	String email
	String telephone
    static constraints = {
    }
	static mapping={
		table 'Person'
		id name: 'ssn',type:'string',generator:'assigned',column:'SSN'
		version false
		tablePerHierarchy false
		password column: 'Password'
		firstName column: 'FirstName'
		lastName column: 'LastName'
		street column: 'Street'
		city column: 'City'
		state column: 'State'
		zipCode column: 'Zipcode'
		email column: 'Email'
		telephone column: 'Telephone'
	}
	
	public static boolean isUser(Person p){
		return p instanceof User;
	}
	public static boolean isEmployee(Person p){
		return p instanceof Employee;
	}
	public static boolean isManager(Person p){
		if(p instanceof Employee){
			Employee e=(Employee)p;
			return e.role.equals("Manager");
		}
		return false;
	}
}
