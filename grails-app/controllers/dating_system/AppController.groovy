package dating_system

import information.Profile;

class AppController {

	def index() {
		render view:'index'
	}
	def changeActiveProfile(){		
		session.activeProfileId=params.newProfileId;
	}
	def dashboard(){
		def profiles=Profile.findAllWhere(owner:session.user);
		render view:'dashboard',model:[profiles:profiles];
	}
}
