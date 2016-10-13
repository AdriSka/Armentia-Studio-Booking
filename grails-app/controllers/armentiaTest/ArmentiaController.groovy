package armentiaTest



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ArmentiaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Armentia.list(params), model:[armentiaInstanceCount: Armentia.count()]
    }

    def show(Armentia armentiaInstance) {
        respond armentiaInstance
    }

    def create() {
        respond new Armentia(params)
    }

    @Transactional
    def save(Armentia armentiaInstance) {
        if (armentiaInstance == null) {
            notFound()
            return
        }

        if (armentiaInstance.hasErrors()) {
            respond armentiaInstance.errors, view:'create'
            return
        }

        armentiaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'armentia.label', default: 'Armentia'), armentiaInstance.nombre])
                redirect armentiaInstance
            }
            '*' { respond armentiaInstance, [status: CREATED] }
        }
    }

    def edit(Armentia armentiaInstance) {
        respond armentiaInstance
    }

    @Transactional
    def update(Armentia armentiaInstance) {
        if (armentiaInstance == null) {
            notFound()
            return
        }

        if (armentiaInstance.hasErrors()) {
            respond armentiaInstance.errors, view:'edit'
            return
        }

        armentiaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Armentia.label', default: 'Armentia'), armentiaInstance.nombre])
                redirect armentiaInstance
            }
            '*'{ respond armentiaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Armentia armentiaInstance) {

        if (armentiaInstance == null) {
            notFound()
            return
        }

        armentiaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Armentia.label', default: 'Armentia'), armentiaInstance.nombre])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'armentia.label', default: 'Armentia'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
