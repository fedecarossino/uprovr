package com.uprovr

import java.util.List;

class Battle {
	
	String name
	String findTags
	
//	List adversarios
	
	static hasMany = [adversarios:Adversario]
	
    static constraints = {
		findTags nullable:true, blank:true
    }
}
