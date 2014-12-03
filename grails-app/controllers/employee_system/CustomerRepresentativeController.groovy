package employee_system

import java.text.SimpleDateFormat;

import dating_system.UserDate;
import information.Profile;
import information.User;

class CustomerRepresentativeController {
	def dateService;
	def index() {
		render view:'index',model:[employee:session.user]
	}
	def mailingList(){
		def ulist=User.list(params);
		render view:'mailingList',model:[userList:ulist];
	}
	def customerMenu(){
		render view:'customerMenu';
	}
	def recordDate(){
		def dateList=UserDate.createCriteria().list{
			and{
				isNull('custRep')
				eq("accepted",true)
			}
			order('dateTime',"asc")
		};

		render view:'recordDate',model:[dateList:dateList];
	}
	def adoptDateForm(){
		String d=params.date;
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
		Date date=sdf.parse(d);
		Profile p1=Profile.findWhere(profileId:params.profile1);
		Profile p2=Profile.findWhere(profileId:params.profile2);
		UserDate userDate=UserDate.findWhere(dateTime:date,profile1:p1,profile2:p2);
		render view:'adoptDateForm',model:[date:userDate];
	}
	def adoptDate(){
		UserDate date=retrieveFromParams();
		try{
			if(params.bookingFee.isEmpty())throw new Exception("Enter booking fee");
			date.bookingFee=new BigDecimal(params.bookingFee);
			if(date.bookingFee<0)throw new Exception("Booking fee cannot be negative");
			date.custRep=session.user;
			date.profile1Paid=false;
			date.profile2Paid=false;
			if(date.hasErrors()){
				throw new Exception(date.errors)
			}
			else
			date.save(flush:true);
			redirect action:'recordDate';
		}
		catch(Exception e){
			def m=e.getMessage();
			render view:'adoptDateForm',model:[date:date,errorMessage:e.getMessage()]
		}
	}

	def viewProfileSuggestions(){
		render view:'viewProfileSuggestions';
	}

	def getSuggestions(){
		try{
			String profileId=params.profileId;
			def suggestions=dateService.getDateSuggestions(profileId);
			render template:'suggestionList',model:[suggestions:suggestions];
		}
		catch(Exception ex){
			render ex.getMessage();
		}
	}

	private UserDate retrieveFromParams(){
		String d=params.date;
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
		Date date=sdf.parse(d);
		Profile p1=Profile.findWhere(profileId:params.profile1);
		Profile p2=Profile.findWhere(profileId:params.profile2);
		UserDate userDate=UserDate.findWhere(dateTime:date,profile1:p1,profile2:p2);
		return userDate;
	}
}
