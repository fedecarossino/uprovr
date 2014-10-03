package com.uprovr

import java.util.List;

class Battle {
	
	String name
	
	List adversarios
	
	static hasMany = [adversarios:Adversario]
	
    static constraints = {
    }
}
