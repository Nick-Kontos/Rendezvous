package dating_system

import information.Profile;

class AppController {

	def index() {
		render view:'index'
	}
	def changeActiveProfile(){		
		String p=params.newProfileId;
		session.activeProfileId=params.newProfileId;
		redirect controller:'profile',action:'show',id:session.activeProfileId;
	}
	def dashboard(){
		def profiles=Profile.findAllWhere(owner:session.user);
		render view:'dashboard',model:[profiles:profiles];
	}
}
