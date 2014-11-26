package com.uprovr

import grails.plugin.facebooksdk.FacebookGraphClient
import org.codehaus.groovy.grails.web.pages.GroovyPagesTemplateEngine;

import uprovr.AbstractLoginUserController
import uprovr.Scored
import uprovr.UserFacebook;

class HomeController extends AbstractLoginUserController{
	
	GroovyPagesTemplateEngine groovyPagesTemplateEngine

    def index() {
		params.site_id = g.cookie(name: 'upsite')
		def battle = getBattles(params)
		
		battle.each{
			it = getBattleInfo(it)
		}
		
		[battle:battle]
	}
	
	def vote(){
		def battle = Battle.findById(params.battleId)
		UserFacebook user
		if(facebookContext.authenticated){
			user = saveUser()
		}else
			render template:"/templates/battleDiv", model:[battle:battle]
			
		def idAdv = params.notLike ?: params.like
		
		if(!user.scored.find{it.advId == idAdv.toInteger()}){
			
		def adversarios = Adversario.findById(idAdv)
			if(params.notLike){
				adversarios.neg = adversarios.neg+1
				def scored = new Scored(vote: "negative", advId: adversarios.id)
				scored.save()
				user.addToScored(scored)
				user.save()
			}else if(params.like){
				adversarios.pos = adversarios.pos+1
				def scored = new Scored(vote: "positive", advId: adversarios.id)
				scored.save()
				user.addToScored(scored)
				user.save()
			}
		}
		battle = getBattleInfo(battle)
		
		battle.lastUpdate = new Date()
		battle.save(flush:true)
		
		render template:"/templates/battleDiv", model:[battle:battle]
	}
	
	def getBattleInfo(battle){
		def user = saveUser()
		if(user){
			battle.adversarios.each{advAux ->
				def aux = user.scored.find{it.advId == advAux.id}
				if(aux){
					def vote = aux.vote
					advAux.button=vote
				}
			}
		}
		
		int totalVotosTweets = battle.adversarios[0].posSocial+battle.adversarios[0].negSocial+battle.adversarios[1].posSocial+battle.adversarios[1].negSocial
		
		int porcTweets = battle.adversarios[0].posSocial*100/totalVotosTweets
		battle.adversarios[0].battleResult = (totalVotosTweets*porcTweets/100)+battle.adversarios[0].pos
		
		porcTweets = battle.adversarios[1].posSocial*100/totalVotosTweets
		battle.adversarios[1].battleResult = (totalVotosTweets*porcTweets/100)+battle.adversarios[1].pos
		
		if(battle.adversarios[0].id > battle.adversarios[1].id){
			battle.adversarios[0].battleResult = battle.adversarios[0].battleResult/(battle.adversarios[1].battleResult+battle.adversarios[0].battleResult)*100
			battle.adversarios[1].battleResult = 100-battle.adversarios[0].battleResult
		}else{
			battle.adversarios[1].battleResult = battle.adversarios[1].battleResult/(battle.adversarios[1].battleResult+battle.adversarios[0].battleResult)*100
			battle.adversarios[0].battleResult = 100-battle.adversarios[1].battleResult
		}
		
		battle.adversarios.each{advAux ->
			def tendencia = (advAux.posSocial+advAux.pos-advAux.negSocial-advAux.neg)/(advAux.posSocial+advAux.pos+advAux.negSocial+advAux.neg)*100
			advAux.tendencia = tendencia
//			println "tendencia ${advAux.name}: "+advAux.tendencia
		}
		return battle
	}
	
	def getBattles(params){
		def siteId = params.site_id.toUpperCase()
		def offset = params.offset ?: 0
		def battle
		if(siteId){
			battle = Battle.createCriteria().list(max: 2, offset: offset.toInteger()) {
					eq('siteId', siteId)
					order('lastUpdate', 'desc')
					order('totalVotes', 'desc')
			}
		}else{
			battle = Battle.createCriteria().list(max: 2, offset: offset.toInteger()) {
					order('lastUpdate', 'desc')
					order('totalVotes', 'desc')
			}
		}
		return battle
	}
	
	def nextBattles(){
		params.site_id = g.cookie(name: 'upsite')
		def battle = getBattles(params)
		if(battle.isEmpty()){
			response.setStatus(200)
			render (contentType: "text/json"){
				[data:""]
			}
		}	
		def myTemplateString = g.render(template: "/templates/nextBattles", model: [battle: battle]).toString()
		response.setStatus(200)
		render (contentType: "text/json"){
			[data:myTemplateString]
		}
	}
	
	def saveUser(){
		def user= null
		if(facebookContext.authenticated){
			user = UserFacebook.findByFacebookId(facebookContext.user.id)
			if(!user){
				def userAux
				try{
					def userAccessToken = facebookContext.user.token
					def facebookClient = new FacebookGraphClient(userAccessToken)
					userAux = facebookClient.fetchObject("me")
				}catch(e){
					return null
				}
				user = new UserFacebook()
				user.facebookId = userAux.id.toString()
				user.firstName = userAux.first_name
				user.lastName = userAux.last_name
				user.locale = userAux.locale
				user.link = userAux.link
				user.gender = userAux.gender
				user.email = userAux.email
				
				user.save(flush:true)
				return user
			}
		}
		return user
	}

}
