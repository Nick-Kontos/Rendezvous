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

	def show() {
		String ssn=params.id;
		User u=User.findWhere(ssn:ssn);
		if(!u)render "User not found";
		respond u
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

	def upgradeForm(){
		accountList = Account.findAllByOwner(User.findBySsn(Profile.findByProfileId(session.activeProfileId).owner.ssn))
		render view: '/profile/payUpgrade', model: [accountList: accountList]
	}

	@Transactional
	def upgrade(){
		User u = session.user
		u.ppp = params.InputUserType
		u.save(flush:true)
		session.user = u
		redirect controller: 'User', view: 'edit'
	}

    def edit() {
        def userInstance= User.findWhere(ssn:session.user.ssn);
		def accounts=Account.findAllWhere(owner:session.user);
		render view:'edit',model:[userInstance:userInstance,accounts:accounts];
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
    def delete() {
		def p=Account.findAllWhere(owner:session.user);
        p.delete flush:true
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Profile.label', default: 'Profile'), p.id])
                redirect action:"edit", controller:"user", method:"GET"
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
