package dating_system

import grails.transaction.Transactional
import information.Profile

@Transactional
class DateService {

    def getDateSuggestions(String profileId){
		Profile activeProfile = Profile.findByProfileId(profileId)
		if(!activeProfile)throw new Exception("Profile not found")
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
		return suggestions;
	}
}
