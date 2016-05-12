package armentiaProject



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class BandaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Banda.list(params), model:[bandaInstanceCount: Banda.count()]
    }

    def show(Banda bandaInstance) {
        respond bandaInstance
    }

    def create() {
        respond new Banda(params)
    }

    @Transactional
    def save(Banda bandaInstance) {
        if (bandaInstance == null) {
            notFound()
            return
        }

        if (bandaInstance.hasErrors()) {
            respond bandaInstance.errors, view:'create'
            return
        }

        bandaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'banda.label', default: 'Banda'), bandaInstance.id])
                redirect bandaInstance
            }
            '*' { respond bandaInstance, [status: CREATED] }
        }
    }

    def edit(Banda bandaInstance) {
        respond bandaInstance
    }

    @Transactional
    def update(Banda bandaInstance) {
        if (bandaInstance == null) {
            notFound()
            return
        }

        if (bandaInstance.hasErrors()) {
            respond bandaInstance.errors, view:'edit'
            return
        }

        bandaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Banda.label', default: 'Banda'), bandaInstance.id])
                redirect bandaInstance
            }
            '*'{ respond bandaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Banda bandaInstance) {

        if (bandaInstance == null) {
            notFound()
            return
        }

        bandaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Banda.label', default: 'Banda'), bandaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'banda.label', default: 'Banda'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
