package information

import java.util.Date;

import dating_system.UserDate;

class User extends Person{
	String ppp
	int rating
	Date dateOfLastAct
	static constraints = {
	}
	static mapping={
		table 'User'
		id column: 'SSN',type:'string'
		version false
		ppp column: 'PPP'
		rating column: 'Rating'
		dateOfLastAct column: 'DateOfLastAct'
	}
	public double getRevenue(){
		def rev=UserDate.createCriteria().get {
			projections { sum("bookingFee") }
			or{
				profile1{
					owner{
						eq("ssn",this.ssn)
					}
				}
				profile2{
					owner{
						eq("ssn",this.ssn)
					}
				}
			}
		}
		if(rev){
			return Math.round(rev*100.0)/100.0;
		}
		return 0;
	}
	public int getNumDates(){
		def n=UserDate.createCriteria().get {
			projections { count("comments") }
			or{
				profile1{
					owner{
						eq("ssn",this.ssn)
					}
				}
				profile2{
					owner{
						eq("ssn",this.ssn)
					}
				}
			}
		}
		if(n)return n;
		return 0;
	}
}
