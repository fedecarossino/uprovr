package com.uprovr

class HomeController {

    def index() {
		def battle = Battle.findAll()
		
		battle.each{aux ->
			aux.adversarios.each{advAux ->
				int totalVotosTweets = advAux.posSocial+advAux.negSocial
				int porcTweets = advAux.posSocial*100/totalVotosTweets
				
				advAux.battleResult = (totalVotosTweets*porcTweets/100)+advAux.pos
			}
			def tendencia = ((aux.adversarios[0].posSocial+aux.adversarios[0].pos)/(aux.adversarios[1].posSocial+aux.adversarios[1].pos))*100
			aux.adversarios[0].tendencia = tendencia
			aux.adversarios[1].tendencia = 100-tendencia
		}
		[battle:battle]
	}
}
