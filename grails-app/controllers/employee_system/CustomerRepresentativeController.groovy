package employee_system

import dating_system.UserDate;
import information.User;

class CustomerRepresentativeController {

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
		def dateList=UserDate.findAllWhere(custRep:null);
		
		render view:'recordDate',model:[dateList:dateList];
	}
	def viewProfile(){
		
	}
}
