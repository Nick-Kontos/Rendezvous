package rendezvous

class RendezvousTagLib {
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
	def sidebar={attrs, body ->
		String type="user";
		if(session.user)
		out << render(template:"/taglib_templates/sidebar_menu", model:[type:type]);
	}
}
