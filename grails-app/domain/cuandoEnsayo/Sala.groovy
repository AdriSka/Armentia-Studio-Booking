package cuandoEnsayo

class Sala {

	int precioPorHora
	String nombre
	String complejo
	String direccion
	String barrioLocalidad
	
	static constraints = {
		precioPorHora nullable:false, min:1
		nombre nullable:false, blank:false
		complejo nullable:false, blank:false
		direccion nullable:false, blank:false
		barrioLocalidad nullable:false, blank:false
	}
	
}
