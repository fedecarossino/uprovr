package uprovr

import com.uprovr.Adversario;

class UserFacebook {
	
	String facebookId
	String firstName
	String lastName
	String locale
	String link
	String gender
	String email
	
	List scored
	
	static hasMany = [scored:Scored]
	
	static mapping = {
		scored lazy: false
	}

    static constraints = {
		firstName nullable:true, blank: true
		lastName nullable:true, blank: true
		locale nullable:true, blank: true
		link nullable:true, blank: true
		gender nullable:true, blank: true
		email nullable:true, blank: true
    }
}
