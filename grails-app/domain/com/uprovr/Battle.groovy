package com.uprovr

import java.util.List;

class Battle {
	
	String name
	String findTags
	String siteId
	Date lastUpdate
	Integer totalVotes
    Categories category

//	List adversarios
//	SortedSet adversarios
	
	static hasMany = [adversarios:Adversario]

    static constraints = {
		findTags nullable:true, blank:true
		siteId nullable:true, blank:true
		lastUpdate nullable:true, blank:true
		totalVotes nullable:true, blank:true
        category nullable:true, blank:true
    }
}
