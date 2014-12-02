package dating_system



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import information.Profile
import information.Account
import information.User
import java.text.SimpleDateFormat

@Transactional(readOnly = true)
class UserDateController {

	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		//def dateList = UserDate.findAllByProfile1OrProfile2(Profile.findByProfileId(session.activeProfileId))
		def activeProfile = Profile.findByProfileId(session.activeProfileId)
		def now = new Date()
		def c = UserDate.createCriteria()
		def pendingResults = c.list{
			and{
				eq('accepted', false)
				eq('profile1', activeProfile)
			}
		}
		def c1 = UserDate.createCriteria()
		def upcomingResults = c1.list{
			or{
				eq('profile1', activeProfile)
				eq('profile2', activeProfile)
			}
			ge('dateTime', now)
			eq('accepted', true)
		}
		def c2 = UserDate.createCriteria()
		def previousResults = c2.list{
			or{
				eq('profile1', activeProfile)
				eq('profile2', activeProfile)
			}
			lt('dateTime', now)
		}
		def c3 = UserDate.createCriteria()
		def requestResults = c3.list{
			and{
				eq('profile2', activeProfile)
				eq('accepted', false)
			}
		}
		render view:'index', model:[userDateInstanceCount: UserDate.count(), upcomingDateList: upcomingResults, previousDateList: previousResults, pendingDateList: pendingResults, requestDateList: requestResults, activeProfileId: session.activeProfileId]
	}
	@Transactional
	def acceptDate(){
		Date d = Date.parse('yyyy-MM-dd HH:mm:ss', params.acceptedDateDate)
		UserDate date = UserDate.findByProfile1AndProfile2AndDateTime(Profile.findByProfileId(params.acceptedDateProf1), Profile.findByProfileId(params.acceptedDateProf2), d)
		date.accepted = true
		date.save(flush:true)
		redirect controller: 'UserDate', action: 'index'
	}
	
	def dateSuggestions(){
		Profile activeProfile = Profile.findByProfileId(session.activeProfileId)
		def c = Profile.createCriteria()
		def superSuggestions = c.list{
			ne('mf', activeProfile.mf)
			between('age', activeProfile.datingAgeRangeStart, activeProfile.datingAgeRangeEnd)
			owner{
				eq('ppp', 'Super-User')
			}	
		}
		c = Profile.createCriteria()
		def goodSuggestions = c.list{
			ne('mf', activeProfile.mf)
			between('age', activeProfile.datingAgeRangeStart, activeProfile.datingAgeRangeEnd)
			owner{
				eq('ppp', 'Good-User')
			}
		}
		c = Profile.createCriteria()
		def userSuggestions = c.list{
			ne('mf', activeProfile.mf)
			between('age', activeProfile.datingAgeRangeStart, activeProfile.datingAgeRangeEnd)
			owner{
				eq('ppp', 'User-User')
			}
		}
		def suggestions = []
		suggestions.addAll(superSuggestions)
		suggestions.addAll(goodSuggestions)
		suggestions.addAll(userSuggestions)
		render view: 'suggestions', model: [suggestions: suggestions]
		
	}
	
	def payDate(){

		def accountList = Account.findAllByOwner(User.findBySsn(Profile.findByProfileId(session.activeProfileId).owner.ssn))
		render view: 'payDate', model:[accountList: accountList, payedDateProf1: params.payedDateProf1, payedDateProf2: params.payedDateProf2, payedDateDate: params.payedDateDate]
	}
	@Transactional
	def cancelDate(){
		Date d = Date.parse('yyyy-MM-dd HH:mm:ss', params.canceledDateDate)
		UserDate.findByProfile1AndProfile2AndDateTime(Profile.findByProfileId(params.canceledDateProf1), Profile.findByProfileId(params.canceledDateProf2), d).delete(flush: true)
		redirect controller: 'UserDate', action: 'index'
	}
	@Transactional
	def finalizePayment(){
		Date d = Date.parse('yyyy-MM-dd HH:mm:ss', params.payedDateDate)
		UserDate date = UserDate.findByProfile1AndProfile2AndDateTime(Profile.findByProfileId(params.payedDateProf1), Profile.findByProfileId(params.payedDateProf2), d)
		if(date.profile1.profileId == session.activeProfileId){
			date.profile1Paid = true
		}else{
			date.profile2Paid = true
		}
		date.save(flush: true)
		redirect controller: 'UserDate', action: 'index'
	}
	
	def requestForm(){
		render view: 'requestDate', model: [profile2: params.profile2]
	}
	
	@Transactional
	def requestDate(){
		SimpleDateFormat sdf = new SimpleDateFormat('MM-dd-yyyy HH:mm')
		Date d = sdf.parse(params.date_month + "-" + params.date_day + "-" + params.date_year + " " + params.date.hours + ":" + params.date.minutes)
		UserDate userDate = new UserDate(profile1: Profile.findByProfileId(session.activeProfileId), profile2: Profile.findByProfileId(params.profile2), 
			location: params.location, dateTime: d, comments: 'None')
		try{
			userDate.validate();
			
			userDate.save(flush:true)
			print userDate.errors
		}catch(Exception e){
			println e
		}
		redirect controller: 'UserDate', action: 'index'
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
