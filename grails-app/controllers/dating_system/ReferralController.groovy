package dating_system



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import information.Profile

@Transactional(readOnly = true)
class ReferralController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
		Profile currentProfile = Profile.findByProfileId(session.activeProfileId)
		def c = Referral.createCriteria()
		def referralList = c.list{
			eq('profileC', currentProfile)
		}
		def c1 = Referral.createCriteria()
		def myReferredList = c1.list{
			eq('profileA', currentProfile)
		}
        def c2 = SuggestedBy.createCriteria()
		def repReferralList = c2.list{
			eq('profileC', currentProfile)
		}
        render view: 'index', model:[referralList: referralList, myReferredList: myReferredList, repReferralList: repReferralList]
    }
	
	def referForm(){
		Profile b = Profile.findByProfileId(params.profileId)
		def c = Profile.createCriteria()
		def profileList = c.list{
			ne('mf', b.mf)
			ne('profileId', session.activeProfileId)
		}
		println profileList
		render view: '/profile/referList', model: [profileList: profileList, profileB: params.profileId]
	}
	
	@Transactional
	def refer(){
		Date d = new Date()
		Referral r = new Referral(profileA: Profile.findByProfileId(session.activeProfileId), profileB: Profile.findByProfileId(params.profileB), 
			profileC: Profile.findByProfileId(params.profileC), dateTime: d)
		if(!(r.save(flush:true)) )
			println r.errors
		redirect controller: 'Referral', action: 'index'
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
