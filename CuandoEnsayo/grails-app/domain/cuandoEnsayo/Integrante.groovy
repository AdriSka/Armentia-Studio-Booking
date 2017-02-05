package cuandoEnsayo

class Integrante {

	String nombre
	String mail
	String telefono
	String banda
	
	static belongsTo = [banda: Banda]
	
	static constraints = {
		nombre nullable:false, blank:false
		mail email:true, nullable:false
		telefono nullable:false, blank:false
		banda nullable:false, blank:false
	}
	
}
