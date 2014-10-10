package uprovr

import com.twitter.reader.TwitterSearch;

class AbmBattleController {
	
	def sentimentService
	
	def saveBattle(){
		try{
			Map requestJson
			try {
				requestJson = request?.getJSON()
			}catch (e) {
				log.error(e.getMessage())
			}
			def content = sentimentService.getPoints(requestJson)
			response.setStatus(201)
			render (contentType: "text/json"){
				content
			}
		}catch(e){
			log.error(e.getMessage())
		}
	}
	
    def getTweets() {
		try{
			def content = TwitterSearch.getTweets(params.text, params.lang)
			def json = [total: content.data.size(),data:content.data]
			response.setStatus(200)
			render (contentType: "text/json"){
				json
			}
		}catch(e){
			log.error(e.getMessage())
		}
	}
}
