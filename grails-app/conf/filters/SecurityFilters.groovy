package filters

import information.Employee
import information.Person
import information.User

class SecurityFilters {
	def filters = {
		noProfileCheck(controller:'app',action:'dashboard'){
			
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
		managerLoginCheck(controller: 'employeeManagement', action: '*') {
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
