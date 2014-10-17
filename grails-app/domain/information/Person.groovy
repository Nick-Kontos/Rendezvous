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
}
