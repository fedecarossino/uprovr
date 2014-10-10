package com.uprovr

class HomeController {

    def index() {
		def battle = Battle.findAll()
		
		battle.each{
			it = getDateBattle(it)
		}
		[battle:battle]
	}
	
	def vote(){
		println params
		def battle = Battle.findById(params.battleId)
		battle = getDateBattle(battle)
		render template:"/templates/battleDiv", model:[battle:battle]
	}
	
	def getDateBattle(battle){
		battle.adversarios.each{advAux ->
			int totalVotosTweets = advAux.posSocial+advAux.negSocial
			int porcTweets = advAux.posSocial*100/totalVotosTweets
			
			advAux.battleResult = (totalVotosTweets*porcTweets/100)+advAux.pos
		}
		def tendencia = ((battle.adversarios[0].posSocial+battle.adversarios[0].pos)/(battle.adversarios[1].posSocial+battle.adversarios[1].pos))*100
		battle.adversarios[0].tendencia = tendencia
		battle.adversarios[1].tendencia = 100-tendencia
		return battle
	}
}
