package com.uprovr

import com.sentiment.SentimentAPICalculator;
import com.twitter.reader.TwitterSearch;

import grails.transaction.Transactional
import groovyx.net.http.RESTClient

@Transactional
class SentimentService {
	
	def getPoints(json){
		def tweets = getTweets(json)
		return getSentiment(tweets, json.query)
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
		def content = TwitterSearch.getTweets(json.name1, json.lang, json.topic)
		content.putAt "language", json.lang
		return content
	}
}
