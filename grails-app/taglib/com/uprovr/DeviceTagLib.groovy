package com.uprovr

import grails.util.Environment

class DeviceTagLib {
	static namespace = 'device'

	static returnObjectForTags = [
		'isTablet',
		'isMobile',
		'supportWebP'
	]

	def isTablet = {  attrs ->
		if ( Environment.getCurrent() == Environment.DEVELOPMENT ) {
			return request.getHeader('User-Agent') ==~ /.*ipad.*/
		}
		return request.getHeader('X-Device-Type') == 'tablet'
	}

	def isMobile = { attrs ->
		if ( Environment.getCurrent() == Environment.DEVELOPMENT ) {
			return request.getHeader('User-Agent') ==~ /.*(iPhone|Android|BlackBerry).*/
		}
		return request.getHeader('X-Device-Type') == 'mobile'
	}

	def supportWebP = { attrs ->
		return request.getHeader('Accept') ==~ /.*image\/webp,.*/
	}
}
