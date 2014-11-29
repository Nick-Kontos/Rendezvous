package dating_system



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import information.Profile

@Transactional(readOnly = true)
class UserDateController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		//def dateList = UserDate.findAllByProfile1OrProfile2(Profile.findByProfileId(session.activeProfileId))
		def activeProfile = Profile.findByProfileId(session.activeProfileId)
		def now = new Date()
		def c = UserDate.createCriteria()	
		def upcomingResults = c.list{
			or{
				eq('profile1', activeProfile)
				eq('profile2', activeProfile)			
			}
			ge('dateTime', now)
		}
		def c2 = UserDate.createCriteria()
		def previousResults = UserDate.createCriteria().list{
			or{
				eq('profile1', activeProfile)
				eq('profile2', activeProfile)
			}
			lt('dateTime', now)
		}
        render view:'index', model:[userDateInstanceCount: UserDate.count(), upcomingDateList: upcomingResults, previousDateList: previousResults, activeProfileId: session.activeProfileId]		
    }
	
	def payDate(){
		
	}
	
	def cancelDate(){
		
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
	
	def suggestions(){
		render view:'suggestions',model:[];
	}
	
	def getLocationSuggestions(){
		
	}
}
