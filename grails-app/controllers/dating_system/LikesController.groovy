package dating_system



import static org.springframework.http.HttpStatus.*
import information.Profile
import dating_system.Likes
import grails.transaction.Transactional

@Transactional(readOnly = true)
class LikesController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		
		def activeProfile = Profile.findByProfileId(session.activeProfileId)
		
		def c = Likes.createCriteria()
		def youLike = c.list {
				eq('liker', activeProfile)
        }
		def c1 = Likes.createCriteria()
		def likesYou = c1.list {
				eq('likee', activeProfile)
		}
        
		
		render view:'index', model:[likesInstanceCount: Likes.count(), yLike: youLike, lYou: likesYou, activeProfileId: session.activeProfileId]
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
