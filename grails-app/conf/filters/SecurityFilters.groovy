package filters

import org.junit.After;

import information.Employee
import information.Person
import information.User

class SecurityFilters {
	def filters = {
		appLoginCheck(controller: 'app', action: '*') {
			before = {
				if (!session.user && !actionName.equals('login')&&!Person.isUser(session.user)) {
					session.invalidate()
					String u=request.forwardURI;
					u=u.substring(u.indexOf('/', 1));
					redirect(controller:'login',action: 'login', params: [requestUri: u])
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
