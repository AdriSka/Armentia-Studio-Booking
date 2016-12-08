package cuandoEnsayo



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class IntegranteController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Integrante.list(params), model:[integranteInstanceCount: Integrante.count()]
    }

    def show(Integrante integranteInstance) {
        respond integranteInstance
    }

    def create() {
        respond new Integrante(params)
    }

    @Transactional
    def save(Integrante integranteInstance) {
        if (integranteInstance == null) {
            notFound()
            return
        }

        if (integranteInstance.hasErrors()) {
            respond integranteInstance.errors, view:'create'
            return
        }

        integranteInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'integrante.label', default: 'Integrante'), integranteInstance.nombre])
                redirect integranteInstance
            }
            '*' { respond integranteInstance, [status: CREATED] }
        }
    }

    def edit(Integrante integranteInstance) {
        respond integranteInstance
    }

    @Transactional
    def update(Integrante integranteInstance) {
        if (integranteInstance == null) {
            notFound()
            return
        }

        if (integranteInstance.hasErrors()) {
            respond integranteInstance.errors, view:'edit'
            return
        }

        integranteInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Integrante.label', default: 'Integrante'), integranteInstance.nombre])
                redirect integranteInstance
            }
            '*'{ respond integranteInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Integrante integranteInstance) {

        if (integranteInstance == null) {
            notFound()
            return
        }

        integranteInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Integrante.label', default: 'Integrante'), integranteInstance.nombre])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'integrante.label', default: 'Integrante'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
