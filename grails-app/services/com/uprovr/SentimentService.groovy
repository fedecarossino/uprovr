package com.uprovr

import com.sentiment.SentimentAPICalculator;
import com.twitter.reader.TwitterSearch;

import grails.transaction.Transactional
import groovyx.net.http.RESTClient
import static groovyx.gpars.GParsPool.executeAsync
import static groovyx.gpars.GParsPool.withPool

@Transactional
class SentimentService {
	
	def getPoints(json){
		def points = getTweets(json)
		def adversarios = []
		
		def battle = new Battle()
		battle.name = "${json.name1} vs ${json.name2}"
		
		points.each{key,value ->
			def adv = new Adversario()
			def enemy = points.get(key)
			adv.name = key
			adv.posSocial = enemy.positivo
			adv.negSocial = enemy.negativo
			adv.neuSocial = enemy.neutral
			if(key == json.name1)
				adv.urlImage = json.urlImage1
			else
				adv.urlImage = json.urlImage2
			adv.save(flush:true)
			battle.addToAdversarios(adv)
		}
		
		battle.save(flush:true)
		
		return points
	}

    def getSentiment(json, query) {
		def rest = new RESTClient("http://www.sentiment140.com/api/bulkClassifyJson?query=${query}")
		def responseData = rest.post(
			body: json,
			requestContentType: "application/json"
		)
		int pos = 0
		int neg = 0
		int neu = 0
		
		responseData.getData().data.each{
			if(it.polarity == 0)
				neg +=1
			else if(it.polarity == 2)
				neu +=1
			else if(it.polarity == 4)
				pos +=1
		}
		
//		json.data.each{
//			def calculator = new SentimentAPICalculator()
//			def senti = calculator.calculateSentiValue(it.text)
//		}
		
		return [positivo:pos, neutral:neu, negativo:neg]
    }
	
	def getTweets(json){
		def content
		def map = [:]
		withPool(2){
			[json.name1,json.name2].eachParallel{
				def tweets = TwitterSearch.getTweets(it, json.lang, json.topic)
				tweets.putAt "language", json.lang
				map.put it, getSentiment(tweets, json.query)
			}
		}
		return map
	}
}
