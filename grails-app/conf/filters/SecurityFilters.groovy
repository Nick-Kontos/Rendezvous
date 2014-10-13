package filters

class SecurityFilters {
	def filters = {
		appLoginCheck(controller: 'app', action: '*') {
			before = {
				if (!session.user && !actionName.equals('login')) {
					String u=request.forwardURI;
					u=u.substring(u.indexOf('/', 1));
					redirect(controller:'login',action: 'login', params: [requestUri: u])
					return false
				}
			}
		}	
		employeeLoginCheck(controller: 'customerRepresentative', action: '*') {
			before = {
				if (!session.user && !actionName.equals('login')&&isEmployee(session.user.SSN)) {
					String u=request.forwardURI;
					u=u.substring(u.indexOf('/', 1));
					redirect(controller:'login',action: 'login', params: [requestUri: u])
					return false
				}
			}
		}
		managerLoginCheck(controller: 'employeeManagementRepresentative', action: '*') {
			before = {
				if (!session.user && !actionName.equals('login')&&isManager(session.user.SSN)) {
					String u=request.forwardURI;
					u=u.substring(u.indexOf('/', 1));
					redirect(controller:'login',action: 'login', params: [requestUri: u])
					return false
				}
			}
		}
	}
	private boolean isEmployee(String ssn){
		
	}
	private boolean isManager(String ssn){
		
	}
}
