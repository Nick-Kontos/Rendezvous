package information

import java.util.Date;

class Profile {
	String profileId
	int datingAgeRangeStart
	int datingAgeRangeEnd
	int datinGeoRange
	String mf	
	String hobbies
	double height
	int weight
	String hairColor
	Date creationDate
	Date lastModDate
	static belongsTo = [owner:User]
	static constraints = {
	}
	static mapping={
		table 'Profile'
		id name: 'profileId',type:'string',generator:'assigned'
		version false
		profileId column:'ProfileID'
		owner column:'OwnerSSN'
		datingAgeRangeStart column: 'DatingAgeRangeStart'
		datingAgeRangeEnd column: 'DatingAgeRangeEnd'
		datinGeoRange column: 'DatinGeoRange'
		mf column: 'M_F'
		hobbies column: 'Hobbies'
		height column: 'Height'
		weight column: 'Weight'
		hairColor column: 'HairColor'
		creationDate column: 'CreationDate'
		lastModDate column: 'LastModDate'
	}
}
