package employee_system

import java.text.SimpleDateFormat;

import dating_system.UserComparator
import dating_system.UserDate;
import groovy.sql.Sql
import information.Employee;
import information.Profile;
import information.User;

class EmployeeManagerController {
	def dataSource;
	static final int MAX_RESULT_DASHBOARD=10;
	def index() {
		def employee=Employee.findWhere(ssn:session.user.ssn);
		def sql=new Sql(dataSource)
		def result=sql.rows("""SELECT 		U.SSN
			FROM 		User U INNER JOIN Profile P ON U.SSN=P.OwnerSSN INNER JOIN 
			Date D ON P.ProfileID=D.Profile1 OR P.ProfileID=D.Profile2 INNER JOIN Person PR
			ON		PR.SSN=U.SSN
			GROUP BY 		U.SSN
			ORDER BY 		COUNT(*) DESC
			""");
		def mostActive=new ArrayList();
		for(int i=0;i<result.size()&&i<MAX_RESULT_DASHBOARD;i++){
			def r=result[i];
			mostActive.add(User.findWhere(ssn:r[0]));
		}
		result=sql.rows("""SELECT P.SSN, SUM(D.BookingFee) AS BookingFees 
			FROM Person P INNER JOIN Profile Pro ON Pro.OwnerSSN=P.SSN 
			INNER JOIN Date D ON D.Profile1=Pro.ProfileID OR D.Profile2=Pro.ProfileID
			GROUP BY P.SSN
			ORDER BY BookingFees DESC""");
		def mostRevenue=new ArrayList();
		def revenue=new ArrayList();
		for(int i=0;i<result.size()&&i<MAX_RESULT_DASHBOARD;i++){
			def r=result[i];
			mostRevenue.add(User.findWhere(ssn:r[0]));
			revenue.add(r[1]);
		}
		result=sql.rows("""SELECT 		DateAvg.CalMonth, DateAvg.CalDay, avg(DateAvg.RatingSum) AS 
			RatingSumAvg
			FROM 		(SELECT 		MONTH(D.Date_Time) AS CalMonth, 
			DAY(D.Date_Time) AS CalDay, 
			(D.User1Rating+D.User2Rating) AS RatingSum
			FROM 		Date D) DateAvg
			GROUP BY 		DateAvg.CalMonth,DateAvg.CalDay
			ORDER BY 		avg(DateAvg.RatingSum) DESC
			""");
		def highestRatedDates=new ArrayList();
		for(int i=0;i<result.size()&&i<MAX_RESULT_DASHBOARD;i++){
			def r=result[i];
			SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd");
			def d=dateFormat.parse(r[0]+"/"+r[1]);
			dateFormat = new SimpleDateFormat("MMMM dd");
			highestRatedDates.add(dateFormat.format(d));
		}


		render view:'index',model:[employee:employee,mostActiveUsers:mostActive,mostRevenueUsers:mostRevenue,
			mostRevenueRevenues:revenue,highestRatedDates:highestRatedDates];
	}
	def salesReport(){
		render view:'salesReport';
	}

	def renderSalesReport(){
		def sql=new Sql(dataSource)
		def result=sql.rows("""SELECT 		sum(D.BookingFee) as TotalSales 
			FROM 		Date D 
			WHERE 		MONTH(D.Date_Time)=${params.month} AND YEAR(D.Date_Time)=${params.year}
			""");
		def userDates=UserDate.executeQuery("""FROM UserDate D WHERE MONTH(D.dateTime)=${params.month} AND YEAR(D.dateTime)=${params.year} ORDER BY D.dateTime DESC""")

		BigDecimal totalSales=result[0][0];
		if(!totalSales)totalSales=0;
		SimpleDateFormat dateFormat = new SimpleDateFormat("MM/yyyy");
		def d=dateFormat.parse(params.month+"/"+params.year);
		dateFormat = new SimpleDateFormat("MMMM yyyy");
		render template:'monthySalesReportTemplate',model:[dateString:dateFormat.format(d),totalSales:totalSales,
			userDates:userDates];
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
		render view:'calendarDateStats';
	}
	def renderCalendarStats(){
		SimpleDateFormat sdf=new SimpleDateFormat("MM/dd/yyyy");

		def dateSelected=sdf.parse(params.month+"/"+params.day+"/"+params.year);
		def userDates=UserDate.findAllByDateTimeBetween(dateSelected, dateSelected+1);
		def totalRevenue=0.0;
		for(u in userDates){
			totalRevenue+=u.bookingFee;
		}
		render template:'calendarStats',model:[dateSelected:dateSelected,userDates:userDates,totalRevenue:totalRevenue];
	}
	def employeeMenu(){
		render view:'employeeMenu'
	}
}
