package cuandoEnsayo

class User {

	String nombreUsuario
	String password
	
	static constraints = {
		
		nombreUsuario nullable:false, blank:false
		password nullable:false, blank:false
		
		}
	
}
