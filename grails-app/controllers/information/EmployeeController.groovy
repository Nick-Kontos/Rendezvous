package information



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EmployeeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Employee.list(params), model:[employeeInstanceCount: Employee.count()]
    }

    def show(Employee employeeInstance) {
        respond employeeInstance
    }

    def create() {
        respond new Employee(params)
    }

    @Transactional
    def save(Employee employeeInstance) {
        if (employeeInstance == null) {
            notFound()
            return
        }

        if (employeeInstance.hasErrors()) {
            respond employeeInstance.errors, view:'create'
            return
        }
        employeeInstance.save flush:true

        redirect controller:'employee',action:'index'
    }

    def edit() {
		Employee employeeInstance=Employee.findWhere(ssn:params.id);
		if(!employeeInstance)render "Invalid SSN"
        render view:'edit',model:[employeeInstance:employeeInstance];
    }

    @Transactional
    def update() {
		
		Employee employeeInstance=Employee.findWhere(ssn:params.ssn);		
		
		employeeInstance.email=params.email;
		employeeInstance.firstName=params.firstName;
		employeeInstance.lastName=params.lastName;
		employeeInstance.hourlyRate=Integer.parseInt(params.hourlyRate);
		String sd=params.startDate;
		employeeInstance.startDate=params.startDate;
		employeeInstance.street=params.street;
		employeeInstance.city=params.city;
		employeeInstance.state=params.state;
		employeeInstance.zipCode=Integer.parseInt(params.zipCode);
		employeeInstance.telephone=params.telephone;

        if (employeeInstance.hasErrors()) {
            respond employeeInstance.errors, view:'edit'
            return
        }

        employeeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Employee.label', default: 'Employee'), employeeInstance.id])
                redirect employeeInstance
            }
            '*'{ respond employeeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Employee employeeInstance) {

        if (employeeInstance == null) {
            notFound()
            return
        }
		def p=Person.findWhere(ssn:employeeInstance.ssn);
		p.delete(flush:true);
        employeeInstance.delete flush:true
		
        redirect controller:'employeeManager',action:'employeeMenu';
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'employee.label', default: 'Employee'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
