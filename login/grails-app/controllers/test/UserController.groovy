package test

class UserController {

    def index() {
		redirect(action:"login")
	}

	def scaffold = User
	
	def login = {}
	
	def authenticate = {
		
	  def user = User.findByNombreUsuarioAndContrasenia(params.nombreUsuario, params.contrasenia)
	  if(user){

		session.user = user
		flash.message = "Hola, ${user.nombreCompleto}!"
		redirect(action:"login")
	  }else{
		flash.message = "Fallo el ingreso, ${params.nombreUsuario}. Intente nuevamente."
		redirect(action:"login")
	  }
	}
	
	def logout = {
	  flash.message = "Sesion cerrada ${session.user.nombreCompleto}"
	  session.user = null
	  redirect(controller:"entry", action:"list")
	}
}
