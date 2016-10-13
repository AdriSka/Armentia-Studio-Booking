package armentiaTest



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ReservasSchedulerController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ReservasScheduler.list(params), model:[reservasSchedulerInstanceCount: ReservasScheduler.count()]
    }

    def show(ReservasScheduler reservasSchedulerInstance) {
        respond reservasSchedulerInstance
    }

    def create() {
        respond new ReservasScheduler(params)
    }

    @Transactional
    def save(ReservasScheduler reservasSchedulerInstance) {
        if (reservasSchedulerInstance == null) {
            notFound()
            return
        }

        if (reservasSchedulerInstance.hasErrors()) {
            respond reservasSchedulerInstance.errors, view:'create'
            return
        }

        reservasSchedulerInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'reservasScheduler.label', default: 'ReservasScheduler'), reservasSchedulerInstance.id])
                redirect reservasSchedulerInstance
            }
            '*' { respond reservasSchedulerInstance, [status: CREATED] }
        }
    }

    def edit(ReservasScheduler reservasSchedulerInstance) {
        respond reservasSchedulerInstance
    }

    @Transactional
    def update(ReservasScheduler reservasSchedulerInstance) {
        if (reservasSchedulerInstance == null) {
            notFound()
            return
        }

        if (reservasSchedulerInstance.hasErrors()) {
            respond reservasSchedulerInstance.errors, view:'edit'
            return
        }

        reservasSchedulerInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ReservasScheduler.label', default: 'ReservasScheduler'), reservasSchedulerInstance.id])
                redirect reservasSchedulerInstance
            }
            '*'{ respond reservasSchedulerInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ReservasScheduler reservasSchedulerInstance) {

        if (reservasSchedulerInstance == null) {
            notFound()
            return
        }

        reservasSchedulerInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ReservasScheduler.label', default: 'ReservasScheduler'), reservasSchedulerInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'reservasScheduler.label', default: 'ReservasScheduler'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
