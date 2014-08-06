package uprovr

import com.twitter.reader.TwitterSearch;

class AbmBattleController {

    def getTweets() {
		try{
			def content = TwitterSearch.getTweets(params.text, params.lang)
			def json = [total: content.data.size(),data:content.data]
			response.setStatus(200)
			render (contentType: "text/json"){
				json
			}
		}catch(e){
			println e.getMessage()
			log.error(e.getMessage())
		}
	}
}
