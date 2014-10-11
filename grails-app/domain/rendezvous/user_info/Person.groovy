package rendezvous.user_info

class Person {
	String ssn
	String password
	String	firstName
	String	lastName	
	String street	
	String city	
	String state	
	int zipcode	
	String email	
	String telephone
    static constraints = {
		
    }
	static mapping={
		id name: 'ssn'
	}
}
