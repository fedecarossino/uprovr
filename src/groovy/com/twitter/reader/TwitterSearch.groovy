package com.twitter.reader


import twitter4j.*

import com.sentiment.SentiStrengthCalculator
import com.sentiment.SentimentAPICalculator

// github.com/yusuke/twitter4j/blob/master/twitter4j-core/src/main/java/twitter4j/Query.java
// http://blog.woodylabs.com/2011/12/ip-to-location-alternative-javascript-using-js-to-find-browser-country-location-not-from-ip/
//http://stackoverflow.com/questions/16481121/jvectormap-show-div-onregionclick


class TwitterSearch {

	public static def getTweets(String args, String lang, topic = null) {
		Twitter twitter = new TwitterFactory().getInstance();
		def map = [:]
		def mapArray = []
		try {
			Query query = new Query(args);
			query.setLang(lang)
			QueryResult result;
			def first = true
			result = twitter.search(query);
			def i = 0
			while(result && i < 2){
				if(!first)
					result = twitter.search(query);
				else
					first = false
				List<Status> tweets = result.getTweets();
				tweets.each{tweet ->
//					def calculator = new SentimentAPICalculator()
//					def senti = calculator.calculateSentiValue(tweet.getText().toString())
//					map = [user:tweet?.getUser()?.getScreenName(), text:tweet.getText(), lang: tweet?.getLang(), senti: senti]
					
					if(topic)
						map = [user:tweet?.getUser()?.getScreenName(), text:tweet.getText(), topic: topic]
					else
						map = [user:tweet?.getUser()?.getScreenName(), text:tweet.getText()]
					mapArray.addAll(map)
				}
				query = result.nextQuery()
				i++
			}
			return [data:mapArray]
		} catch (TwitterException te) {
			te.printStackTrace();
			println("Failed to search tweets: " + te.getMessage());
		}
	}
}
