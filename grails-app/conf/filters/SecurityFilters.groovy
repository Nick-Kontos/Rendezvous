package filters

import information.Employee
import information.Person
import information.User

class SecurityFilters {
	def filters = {
		userControllerCheck(controller:'user',action:'*'){
			before={
				if(!session.user&&(actionName=='create'||actionName=='save'))return true
				else if(User.isEmployee(session.user)||User.isManager(session.user))return true;
				else if(session.user&&(actionName=='edit'||actionName=='save'||actionName=='update'))return true;
				else {
					redirect(controller:'login',action: 'login')
					return false
				}
			}
		}
		accountControllerCheck(controller:'account',action:'*'){
			before={
				if(session.user&&User.isUser(session.user)){
					return true;
				}
				else{
					redirect(controller:'login',action: 'login')
					return false
				}
			}
		}
		appLoginCheck(controller: 'app|referral|userDate|likes|profile', action: '*') {
			before = {

				if (!session.user && !actionName.equals('login')&&!Person.isUser(session.user)) {
					session.invalidate()
					String u=request.forwardURI;
					u=u.substring(u.indexOf('/', 1));
					redirect(controller:'login',action: 'login', params: [requestUri: u])
					return false
				}
				else if(controllerName.equals("profile")&&(actionName.equals("create")||actionName=='save')){
					return true;
				}
				else if(!session.activeProfileId&&!actionName.equals('dashboard')&&!actionName.equals('changeActiveProfile')){
					redirect controller:'app',action:'dashboard';
					return false
				}
			}
		}
		employeeLoginCheck(controller: 'customerRepresentative', action: '*') {
			before = {
				if (!session.user && !actionName.equals('login')&&!Person.isEmployee(session.user)) {
					session.invalidate()
					String u=request.forwardURI;
					u=u.substring(u.indexOf('/', 1));
					redirect(controller:'login',action: 'login', params: [requestUri: u])
					return false
				}
			}
		}
		managerLoginCheck(controller: 'employeeManager|employee', action: '*') {
			before = {
				if (!session.user && !actionName.equals('login')&&!Person.isManager(session.user)) {
					session.invalidate()
					String u=request.forwardURI;
					u=u.substring(u.indexOf('/', 1));
					redirect(controller:'login',action: 'login', params: [requestUri: u])
					return false
				}
			}
		}
	}
}
