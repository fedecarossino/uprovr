class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
		
		"/new_battle"(controller: "abmBattle", parseRequest: true){
			action = [POST: 'saveBattle']
		}

        "/"(controller:"home")
        "500"(view:'/error')
	}
}
