package information



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ProfileController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def show(Profile profileInstance) {
		boolean owns=session.activeProfileId.equals(profileInstance.profileId);
        render view:'show',model:[profile:profileInstance,profileOwner:owns];
    }

    def create() {
        respond new Profile(params)
    }

    @Transactional
    def save() {
		Profile p=new Profile()
		p.owner = session.user;
		p.creationDate = new Date();
		p.profileId=params.profileId;
		p.datinGeoRange=params.datinGeoRange;
		p.datingAgeRangeStart=params.datingAgeRangeStart;
		p.datingAgeRangeEnd=params.datingAgeRangeEnd;
		p.hairColor=params.hairColor;
		p.height=params.height;
		p.hobbies=params.hobbies;
		p.lastModDate=params.lastModDate;
		p.mf=params.mf;
		p.weight=params.weight;
		
		p.save flush:true
		
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'profile.label', default: 'Profile'), profileInstance.id])
                redirect p
            }
            '*' { respond p, [status: CREATED] }
        }
    }

    def edit() {
		def profileInstance= Profile.findWhere(profileId:session.activeProfileId);
		render view:'edit',model:[profileInstance:profileInstance];
    }

    @Transactional
    def update(Profile profileInstance) {
        if (profileInstance == null) {
            notFound()
            return
        }

        if (profileInstance.hasErrors()) {
            respond profileInstance.errors, view:'edit'
            return
        }

        profileInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Profile.label', default: 'Profile'), profileInstance.id])
                redirect profileInstance
            }
            '*'{ respond profileInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Profile profileInstance) {

        if (profileInstance == null) {
            notFound()
            return
        }

        profileInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Profile.label', default: 'Profile'), profileInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'profile.label', default: 'Profile'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
