package employee_system

import dating_system.UserComparator
import dating_system.UserDate;
import information.Employee;
import information.Profile;
import information.User;

class EmployeeManagerController {

	def index() {
		def employee=Employee.findWhere(ssn:session.user.ssn);
		render view:'index',model:[employee:employee];
	}
	def salesReport(){
	}
	def allUsers(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		def uList;
		if(params.sort.equals("revenue")){
			def l=User.list();
			l.sort(new UserComparator("revenue", params.order.equals("asc")))
			int offset=0;
			if(params.offset)offset=Integer.parseInt(params.offset);
			int toIndex=offset+max;
			if(toIndex>l.size()-1)toIndex=l.size()-1;
			l=l.subList(offset,toIndex);
			uList=l;
		}
		else if(params.sort.equals("numDates")){
			def l=User.list();
			l.sort(new UserComparator("numDates", params.order.equals("asc")))
			int offset=0;
			if(params.offset)offset=Integer.parseInt(params.offset);
			int toIndex=offset+max;
			if(toIndex>l.size()-1)toIndex=l.size()-1;
			l=l.subList(offset,toIndex);
			uList=l;
		}
		else{
			uList=User.list(params);
		}
		render view: 'allUserList',model:[userList:uList,userInstanceCount:User.count()];
	}
	def viewUserDetail(User u){
		def profiles=Profile.findAllWhere(owner:u);
		def dates=new ArrayList();
		def totalRevenue=0.0;
		def customersDated=new ArrayList();
		for(p in profiles){
			def pDates = UserDate.createCriteria().list{
				or{
					eq('profile1', p)
					eq('profile2', p)
				}
				order("dateTime", "desc")
			}
			for(d in pDates){
				Profile datedProfile;
				if(d.profile1.owner.ssn.equals(u.ssn)){
					datedProfile=d.profile2;
				}
				else{
					datedProfile=d.profile1;
				}
				User datedUser=User.findWhere(ssn:datedProfile.owner.ssn);
				customersDated.add(datedUser);
				totalRevenue+=d.bookingFee;
			}
			dates.addAll(pDates);
		}
		render view:'viewUserDetail',model:[user:u,userDates:dates,customersDated:customersDated]
	}
	def calendarDateStats(){
	}
}
