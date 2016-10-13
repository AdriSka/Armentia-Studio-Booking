package armentiaTest

class Armentia {

	String nombre
	String direccion
	String barrioLocalidad
	
	static hasMany = [salas: Sala]
	
	static constraints = {
		direccion nullable:false, blank:false
		barrioLocalidad nullable:false, blank:false
		salas nullable:true
	}
	
}
