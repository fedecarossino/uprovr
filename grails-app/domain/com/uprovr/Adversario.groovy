package com.uprovr

class Adversario {
	
	String name
	Integer posSocial
	Integer negSocial
	Integer neuSocial
	String urlImage
	Integer pos
	Integer neg

	static belongsTo = Battle
	
    static constraints = {
    }
}
