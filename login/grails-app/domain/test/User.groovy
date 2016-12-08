package test

class User {

	String nombreUsuario
	String contrasenia
	String nombreCompleto
	String toString() {
		"${nombreCompleto}"
	}
	
    static constraints = {
		nombreCompleto blank:true 
		nombreUsuario unique:false
		contrasenia password: true
    }
}
