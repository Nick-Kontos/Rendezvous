package dating_system



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserDateController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond UserDate.list(params), model:[userDateInstanceCount: UserDate.count()]		
    }

    def show(UserDate userDateInstance) {
        respond userDateInstance
    }

    def create() {
        respond new UserDate(params)
    }

    @Transactional
    def save(UserDate userDateInstance) {
        if (userDateInstance == null) {
            notFound()
            return
        }

        if (userDateInstance.hasErrors()) {
            respond userDateInstance.errors, view:'create'
            return
        }

        userDateInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'userDate.label', default: 'UserDate'), userDateInstance.id])
                redirect userDateInstance
            }
            '*' { respond userDateInstance, [status: CREATED] }
        }
    }

    def edit(UserDate userDateInstance) {
        respond userDateInstance
    }

    @Transactional
    def update(UserDate userDateInstance) {
        if (userDateInstance == null) {
            notFound()
            return
        }

        if (userDateInstance.hasErrors()) {
            respond userDateInstance.errors, view:'edit'
            return
        }

        userDateInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'UserDate.label', default: 'UserDate'), userDateInstance.id])
                redirect userDateInstance
            }
            '*'{ respond userDateInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(UserDate userDateInstance) {

        if (userDateInstance == null) {
            notFound()
            return
        }

        userDateInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'UserDate.label', default: 'UserDate'), userDateInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'userDate.label', default: 'UserDate'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
