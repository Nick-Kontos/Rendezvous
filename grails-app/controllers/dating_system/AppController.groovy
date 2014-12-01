package dating_system

import information.Profile;

class AppController {

	def geoIpService

	def index() {
		redirect action:'dashboard';
	}
	def changeActiveProfile(){

		String p=params.newProfileId;
		//Geolocation
		String ip = request.getHeader("X-Forwarded-For");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		if(ip){
			session.geolocation = geoIpService.getLocation( ip )
			println session.geolocation.longitude
			println session.geolocation.longitude
			
		}
		session.activeProfileId=params.newProfileId;
		redirect controller:'profile',action:'show',id:session.activeProfileId;
	}

	def dashboard(){
		def profiles=Profile.findAllWhere(owner:session.user);
		render view:'dashboard',model:[profiles:profiles];
	}
}
