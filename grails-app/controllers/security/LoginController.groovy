package security

import groovy.sql.Sql

class LoginController {
	def dataSource;
	
    def auth() { 
		def sql=new Sql(dataSource)
		def result=sql.rows("select * from PERSON where ssn='${params.ssn}'")
		def user=result[0];
		if(user?.password?.equals(params.password)){
			session.user=user;
			String uri=params.requestUri
			redirect uri:uri,absolute:true;
		}
		else{
			redirect action:'login',params: [requestUri: params.requestUri,error:true]
		}
	}
	def login(){
		String uri=params.requestUri;
		render view:'login',model:[requestUri:uri]
	}
	def logout(){
		session.invalidate()
		redirect uri:'/';
	}
}