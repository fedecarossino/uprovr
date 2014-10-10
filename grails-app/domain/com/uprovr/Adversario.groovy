package com.uprovr

class Adversario {
	
	String name
	Integer posSocial
	Integer negSocial
	Integer neuSocial
	String urlImage
	Integer pos = 0
	Integer neg = 0
	Integer battleResult
	Integer tendencia

	static transients = ["battleResult","tendencia"]
	
	static belongsTo = Battle
	
	static mapping = {
	 }
	
    static constraints = {
		pos nullable:true, blank:true
		neg nullable:true, blank:true
    }
}
