package information

import java.util.Date;

class Account implements Serializable{
	String cardNumber
	String acctNum
	Date acctCreationDate
    static belongsTo = [owner:User]
	static constraints = {
	}
	static mapping={
		id composite: ['cardNumber', 'acctNum','owner'],generator:'assigned'
		version false
		owner column:'OwnerSSN'
		cardNumber column:'CardNumber'
		acctNum column:'AcctNum'
		acctCreationDate column:'AcctCreationDate'
	}
}
