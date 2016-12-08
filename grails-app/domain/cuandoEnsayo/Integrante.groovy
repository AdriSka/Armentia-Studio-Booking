package cuandoEnsayo

class Integrante {

	String nombre
	String mail
	String telefono
	
	static belongsTo = [banda: Banda]
	
	static constraints = {
		nombre nullable:false, blank:false
		mail email:true, nullable:false
		telefono nullable:true, blank:true
		banda nullable:false
	}
	
}
