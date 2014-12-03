package information



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import information.User

@Transactional(readOnly = true)
class UserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model:[userInstanceCount: User.count()]
    }

    def show(User userInstance) {
        respond userInstance
    }

    def create() {
        respond new User(params)
    }

    @Transactional
    def save() {
        User p = new User()
		
		// String
		p.ssn = params.ssn;
		p.password = params.password;
		p.firstName = params.firstName;
		p.lastName = params.lastName;
		p.street = params.street;
		p.city = params.city;
		p.state = params.state;
		p.email = params.email;
		p.telephone = params.telephone;
		p.ppp = params.ppp;
		
		// Integer
		p.zipCode = Integer.parseInt(params.zipCode);

		// Dates
		p.dateOfLastAct = new Date();
		
		p.save flush:true
		session.user=p;
		redirect controller:"profile", action:"create"
    }

    def edit() {
        def userInstance= User.findWhere(ssn:session.user.ssn);
		render view:'edit',model:[userInstance:userInstance];
    }

    @Transactional
    def update() {
        
		def p = User.findWhere(ssn:session.user.ssn);
		
		// String
		p.city = params.city;
		p.email = params.email;
		p.firstName = params.firstName;
		p.lastName = params.lastName;
		p.password = params.password;
		p.ppp = params.ppp;
		p.ssn = params.ssn;
		p.state = params.state;
		p.street = params.street;
		p.telephone = params.telephone;
		
		// Integer
		p.zipCode = Integer.parseInt(params.zipCode);

		p.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = "Account Successfully Updated";
                redirect action:"edit", model:[userInstance:p]
            }
            '*'{ respond p, [status: OK] }
        }
    }

    @Transactional
    def delete(User userInstance) {

        if (userInstance == null) {
            notFound()
            return
        }

        userInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
