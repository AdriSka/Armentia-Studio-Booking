package armentiaTest



import grails.test.mixin.*
import spock.lang.*

@TestFor(ReservasSchedulerController)
@Mock(ReservasScheduler)
class ReservasSchedulerControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.reservasSchedulerInstanceList
            model.reservasSchedulerInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.reservasSchedulerInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def reservasScheduler = new ReservasScheduler()
            reservasScheduler.validate()
            controller.save(reservasScheduler)

        then:"The create view is rendered again with the correct model"
            model.reservasSchedulerInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            reservasScheduler = new ReservasScheduler(params)

            controller.save(reservasScheduler)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/reservasScheduler/show/1'
            controller.flash.message != null
            ReservasScheduler.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def reservasScheduler = new ReservasScheduler(params)
            controller.show(reservasScheduler)

        then:"A model is populated containing the domain instance"
            model.reservasSchedulerInstance == reservasScheduler
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def reservasScheduler = new ReservasScheduler(params)
            controller.edit(reservasScheduler)

        then:"A model is populated containing the domain instance"
            model.reservasSchedulerInstance == reservasScheduler
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/reservasScheduler/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def reservasScheduler = new ReservasScheduler()
            reservasScheduler.validate()
            controller.update(reservasScheduler)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.reservasSchedulerInstance == reservasScheduler

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            reservasScheduler = new ReservasScheduler(params).save(flush: true)
            controller.update(reservasScheduler)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/reservasScheduler/show/$reservasScheduler.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/reservasScheduler/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def reservasScheduler = new ReservasScheduler(params).save(flush: true)

        then:"It exists"
            ReservasScheduler.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(reservasScheduler)

        then:"The instance is deleted"
            ReservasScheduler.count() == 0
            response.redirectedUrl == '/reservasScheduler/index'
            flash.message != null
    }
}
