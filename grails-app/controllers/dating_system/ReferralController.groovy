package dating_system



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ReferralController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Referral.list(params), model:[referralInstanceCount: Referral.count()]
    }
	
	def refer(){
		
	}

    def show(Referral referralInstance) {
        respond referralInstance
    }

    def create() {
        respond new Referral(params)
    }

    @Transactional
    def save(Referral referralInstance) {
        if (referralInstance == null) {
            notFound()
            return
        }

        if (referralInstance.hasErrors()) {
            respond referralInstance.errors, view:'create'
            return
        }

        referralInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'referral.label', default: 'Referral'), referralInstance.id])
                redirect referralInstance
            }
            '*' { respond referralInstance, [status: CREATED] }
        }
    }

    def edit(Referral referralInstance) {
        respond referralInstance
    }

    @Transactional
    def update(Referral referralInstance) {
        if (referralInstance == null) {
            notFound()
            return
        }

        if (referralInstance.hasErrors()) {
            respond referralInstance.errors, view:'edit'
            return
        }

        referralInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Referral.label', default: 'Referral'), referralInstance.id])
                redirect referralInstance
            }
            '*'{ respond referralInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Referral referralInstance) {

        if (referralInstance == null) {
            notFound()
            return
        }

        referralInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Referral.label', default: 'Referral'), referralInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'referral.label', default: 'Referral'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
