package cuandoEnsayo

class Sala {

	int precioPorHora
	String nombre
	String correo
	String telefono
	String complejo
	String direccion
	String barrioLocalidad
	
	static constraints = {
		precioPorHora nullable:false, min:1
		nombre nullable:false, blank:false
		correo nulleable:false, email:true
		telefono nulleable:false, size: 8..15  
		complejo nullable:false, blank:false
		direccion nullable:false, blank:false
		barrioLocalidad nullable:false, blank:false
	}
	
}
