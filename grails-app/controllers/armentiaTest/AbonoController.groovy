package armentiaTest



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AbonoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Abono.list(params), model:[abonoInstanceCount: Abono.count()]
    }

    def show(Abono abonoInstance) {
        respond abonoInstance
    }

    def create() {
        respond new Abono(params)
    }

    @Transactional
    def save(Abono abonoInstance) {
        if (abonoInstance == null) {
            notFound()
            return
        }

        if (abonoInstance.hasErrors()) {
            respond abonoInstance.errors, view:'create'
            return
        }

        abonoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'abono.label', default: 'Abono'), abonoInstance.alias])
                redirect abonoInstance
            }
            '*' { respond abonoInstance, [status: CREATED] }
        }
    }

    def edit(Abono abonoInstance) {
        respond abonoInstance
    }

    @Transactional
    def update(Abono abonoInstance) {
        if (abonoInstance == null) {
            notFound()
            return
        }

        if (abonoInstance.hasErrors()) {
            respond abonoInstance.errors, view:'edit'
            return
        }

        abonoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Abono.label', default: 'Abono'), abonoInstance.alias])
                redirect abonoInstance
            }
            '*'{ respond abonoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Abono abonoInstance) {

        if (abonoInstance == null) {
            notFound()
            return
        }

        abonoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Abono.label', default: 'Abono'), abonoInstance.alias])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'abono.label', default: 'Abono'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
