package uprovr

import grails.util.Environment

import grails.plugin.facebooksdk.FacebookContext

abstract class AbstractLoginUserController {
	
	FacebookContext facebookContext
	
	def beforInterceptor = {
		params.user_id = facebookContext.user.id
	}
}
