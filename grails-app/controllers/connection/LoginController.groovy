package connection
import grails.converters.JSON
class LoginController {

    def index() { }

    def loginSuccess(){
        session.user=params.fullName
        response.setContentType('application/json')
        def logUser=params.fullName
        try {

            println params
            render("${['status': "OK" ] as JSON}")
            def userName=params.fullName
          }
        catch (RuntimeException exception) {
            log.error "Error during operation " + exception.message,exception
            render(status: 500, "${['status': "Login ERROR"] as JSON}")
        }
    }
    def logout(){
        session.user = null
        redirect(action: 'index')
    }
}
