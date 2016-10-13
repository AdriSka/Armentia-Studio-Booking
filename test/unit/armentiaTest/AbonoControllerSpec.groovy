package armentiaTest



import grails.test.mixin.*
import spock.lang.*

@TestFor(AbonoController)
@Mock(Abono)
class AbonoControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.abonoInstanceList
            model.abonoInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.abonoInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def abono = new Abono()
            abono.validate()
            controller.save(abono)

        then:"The create view is rendered again with the correct model"
            model.abonoInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            abono = new Abono(params)

            controller.save(abono)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/abono/show/1'
            controller.flash.message != null
            Abono.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def abono = new Abono(params)
            controller.show(abono)

        then:"A model is populated containing the domain instance"
            model.abonoInstance == abono
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def abono = new Abono(params)
            controller.edit(abono)

        then:"A model is populated containing the domain instance"
            model.abonoInstance == abono
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/abono/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def abono = new Abono()
            abono.validate()
            controller.update(abono)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.abonoInstance == abono

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            abono = new Abono(params).save(flush: true)
            controller.update(abono)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/abono/show/$abono.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/abono/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def abono = new Abono(params).save(flush: true)

        then:"It exists"
            Abono.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(abono)

        then:"The instance is deleted"
            Abono.count() == 0
            response.redirectedUrl == '/abono/index'
            flash.message != null
    }
}
