package uprovr

import grails.util.Environment

import grails.plugin.facebooksdk.FacebookContext

abstract class AbstractLoginUserController {
	
	FacebookContext facebookContext
	
	def beforInterceptor = {
		params.user_id = facebookContext.user.id
	}
	
	def afterInterceptor = { model ->
		model.facebookContext = facebookContext
		model.site_id = params.site_id
	}
}
