package dating_system



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class LikesController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Likes.list(params), model:[likesInstanceCount: Likes.count()]
    }
	
	def like(){
		
	}

    def show(Likes likesInstance) {
        respond likesInstance
    }

    def create() {
        respond new Likes(params)
    }

    @Transactional
    def save(Likes likesInstance) {
        if (likesInstance == null) {
            notFound()
            return
        }

        if (likesInstance.hasErrors()) {
            respond likesInstance.errors, view:'create'
            return
        }

        likesInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'likes.label', default: 'Likes'), likesInstance.id])
                redirect likesInstance
            }
            '*' { respond likesInstance, [status: CREATED] }
        }
    }

    def edit(Likes likesInstance) {
        respond likesInstance
    }

    @Transactional
    def update(Likes likesInstance) {
        if (likesInstance == null) {
            notFound()
            return
        }

        if (likesInstance.hasErrors()) {
            respond likesInstance.errors, view:'edit'
            return
        }

        likesInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Likes.label', default: 'Likes'), likesInstance.id])
                redirect likesInstance
            }
            '*'{ respond likesInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Likes likesInstance) {

        if (likesInstance == null) {
            notFound()
            return
        }

        likesInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Likes.label', default: 'Likes'), likesInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'likes.label', default: 'Likes'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
