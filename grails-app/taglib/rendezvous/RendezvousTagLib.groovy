package rendezvous

import information.Person;
import information.Profile;

class RendezvousTagLib {
	//static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
	def sidebar={attrs, body ->
			out << render(template:"/taglib_templates/sidebar_menu");
	}
	def isUser={attrs,body->
		if(Person.isUser(session.user)){
			out<<body();
		}
	}
	def isEmployee={attrs,body->
		if(Person.isEmployee(session.user))
			out<<body();
	}
	
	def profileSelector={attrs,body->
		if(Person.isUser(session.user))
		{
			def profiles=Profile.findAllWhere(owner:session.user);
			out << render(template:"/taglib_templates/profile_selector",model:[profiles:profiles]);
		}
	}

}
