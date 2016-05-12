package armentiaProject



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SalaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Sala.list(params), model:[salaInstanceCount: Sala.count()]
    }

    def show(Sala salaInstance) {
        respond salaInstance
    }

    def create() {
        respond new Sala(params)
    }

    @Transactional
    def save(Sala salaInstance) {
        if (salaInstance == null) {
            notFound()
            return
        }

        if (salaInstance.hasErrors()) {
            respond salaInstance.errors, view:'create'
            return
        }

        salaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'sala.label', default: 'Sala'), salaInstance.id])
                redirect salaInstance
            }
            '*' { respond salaInstance, [status: CREATED] }
        }
    }

    def edit(Sala salaInstance) {
        respond salaInstance
    }

    @Transactional
    def update(Sala salaInstance) {
        if (salaInstance == null) {
            notFound()
            return
        }

        if (salaInstance.hasErrors()) {
            respond salaInstance.errors, view:'edit'
            return
        }

        salaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Sala.label', default: 'Sala'), salaInstance.id])
                redirect salaInstance
            }
            '*'{ respond salaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Sala salaInstance) {

        if (salaInstance == null) {
            notFound()
            return
        }

        salaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Sala.label', default: 'Sala'), salaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'sala.label', default: 'Sala'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
