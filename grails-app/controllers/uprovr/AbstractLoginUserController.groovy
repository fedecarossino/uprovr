package uprovr

import com.restfb.exception.FacebookOAuthException
import grails.util.Environment

import grails.plugin.facebooksdk.FacebookContext
import grails.plugin.facebooksdk.FacebookGraphClient

abstract class AbstractLoginUserController {
	
	FacebookContext facebookContext
	
	def beforInterceptor = {
		params.user_id = facebookContext.user.id
	}
	
	def afterInterceptor = { model ->
		model.facebookContext = facebookContext
		model.site_id = params.site_id
		
		if (facebookContext.authenticated) {
			String token = facebookContext.user.token
			if (token) {
				FacebookGraphClient facebookGraphClient = new FacebookGraphClient(token)
				try {
					model.user = facebookGraphClient.fetchObject(facebookContext.user.id.toString())
				} catch (FacebookOAuthException exception) {
					facebookContext.user.invalidate()
				}
			}
		}
	}
}
