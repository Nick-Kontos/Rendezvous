package information

import static org.springframework.http.HttpStatus.*
import dating_system.UserDate;
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

	def searchForm(){
		render view: 'search'
	}

	def search(){
		def c = Profile.createCriteria()
		def resultList = c.list{
			if(params.InputId && params.InputId != ''){
				ilike('profileId', "%" + params.InputId + "%")
			}
			if(params.InputMinAge && params.InputMaxAge){
				int minAge = Integer.parseInt(params.InputMinAge)
				int maxAge = Integer.parseInt(params.InputMaxAge)
				between('age', minAge, maxAge)
			}
			if(params.InputMinHeight && params.InputMaxHeight){
				double minHeight = Double.parseDouble(params.InputMinHeight)
				double maxHeight = Double.parseDouble(params.InputMaxHeight)
				le('height', maxHeight)
				ge('height', minHeight)
			}
			if(params.InputMinWeight && params.InputMaxWeight){
				int minWeight = Integer.parseInt(params.InputMinWeight)
				int maxWeight = Integer.parseInt(params.InputMaxWeight)
				between('weight', minWeight, maxWeight)
			}
			if(params.InputHobby){
				ilike('hobbies', "%" + params.InputHobby + "%")
			}
			if(params.InputGender){
				eq('mf', params.InputGender)
			}
			if(params.InputHair){
				eq('hairColor', params.InputHair, [ignoreCase: true])
			}
		}
		render view: "searchList", model: [resultList: resultList]
	}

	@Transactional
	def save() {
		println "Save"
		Profile p = new Profile()

		p.owner = session.user;

		// Dates
		p.creationDate = new Date();
		p.lastModDate= new Date();

		// Strings
		p.profileId = params.profileId;
		p.mf = params.mf;
		p.hobbies = params.hobbies;
		p.hairColor = params.hairColor;

		// integer
		p.datinGeoRange= Integer.parseInt(params.datinGeoRange);
		p.datingAgeRangeStart= Integer.parseInt(params.datingAgeRangeStart);
		p.datingAgeRangeEnd= Integer.parseInt(params.datingAgeRangeEnd);
		p.weight= Integer.parseInt(params.weight);
		p.age=Integer.parseInt(params.age);
		// double
		p.height = Double.parseDouble(params.height);

		p.save flush:true
		println p.errors

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.created.message', args: [
					message(code: 'profile.label', default: 'Profile'),
					p.id
				])
				redirect action:"edit", model:[profileInstance:p]
			}
			'*' { respond p, [status: CREATED] }
		}
	}


	def edit() {
		def profileInstance= Profile.findWhere(profileId:session.activeProfileId);
		render view:'edit',model:[profileInstance:profileInstance];
	}

	@Transactional
	def update() {

		def p = Profile.findWhere(profileId:session.activeProfileId);

		// Dates
		p.lastModDate= new Date();

		// Strings
		p.mf = params.mf;
		p.hobbies = params.hobbies;
		p.hairColor = params.hairColor;

		// integer
		p.datinGeoRange= Integer.parseInt(params.datinGeoRange);
		p.datingAgeRangeStart= Integer.parseInt(params.datingAgeRangeStart);
		p.datingAgeRangeEnd= Integer.parseInt(params.datingAgeRangeEnd);
		p.weight= Integer.parseInt(params.weight);

		// double
		p.height = Double.parseDouble(params.height);

		p.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'Profile.label', default: 'Profile'),
					p.profileId
				])
				redirect action:"edit", model:[profileInstance:p]
			}
			'*'{ respond p, [status: OK] }
		}
	}

	@Transactional
	def delete() {

		def p = Profile.findWhere(profileId:session.activeProfileId);
		if(UserDate.findWhere(profile1:p)!=null||UserDate.findWhere(profile2:p)!=null){
			request.withFormat {
				form multipartForm {
					flash.message ="Cannot delete profile."
					redirect action:"edit", controller:"profile",id:p.profileId, method:"GET"
				}
				'*'{ render status: NO_CONTENT }
			}
		}
		else{
			p.delete flush:true

			request.withFormat {
				form multipartForm {
					flash.message = message(code: 'default.deleted.message', args: [
						message(code: 'Profile.label', default: 'Profile'),
						p.id
					])
					redirect action:"index", controller:"app", method:"GET"
				}
				'*'{ render status: NO_CONTENT }
			}
		}
	}

	protected void notFound() {
		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.not.found.message', args: [
					message(code: 'profile.label', default: 'Profile'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
}
