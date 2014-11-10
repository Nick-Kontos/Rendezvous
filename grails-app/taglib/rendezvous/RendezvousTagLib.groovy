package rendezvous

import information.Person;

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

}
