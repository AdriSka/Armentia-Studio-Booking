package armentiaProject

class Armentia {

	String direccion
	String barrioLocalidad
	Sala salas
	
	static hasMany = [salas: Sala]
	
	static constraints = {
		direccion nullable:false, blank:false
		barrioLocalidad nullable:false, blank:false
		salas nullable:false
	}
	
}
