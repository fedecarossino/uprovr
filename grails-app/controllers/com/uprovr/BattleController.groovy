package com.uprovr



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class BattleController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def sentimentService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Battle.list(params), model:[battleInstanceCount: Battle.count()]
    }

    def show(Battle battleInstance) {
        respond battleInstance
    }

    def create() {
        respond new Battle(params)
    }

    @Transactional
    def save(Battle battleInstance) {
        def map = [categoryId: params."category.id", findTags: params.findTags, query:params.query, topic:params.topic, lang:params.lang, siteId:params.siteId, name1:params.name0, name2:params.name1, urlImage1:params.urlImage0, urlImage2:params.urlImage1]
        sentimentService.getPoints(map)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'battle.label', default: 'Battle'), battleInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    def edit(Battle battleInstance) {
        respond battleInstance
    }

    @Transactional
    def update(Battle battleInstance) {
        if (battleInstance == null) {
            notFound()
            return
        }

        if (battleInstance.hasErrors()) {
            respond battleInstance.errors, view:'edit'
            return
        }

        battleInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Battle.label', default: 'Battle'), battleInstance.id])
                redirect battleInstance
            }
            '*'{ respond battleInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Battle battleInstance) {

        if (battleInstance == null) {
            notFound()
            return
        }

        battleInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Battle.label', default: 'Battle'), battleInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'battle.label', default: 'Battle'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
