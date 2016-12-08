<%@ page import="cuandoEnsayo.Sala" %>



<div class="fieldcontain ${hasErrors(bean: salaInstance, field: 'precioPorHora', 'error')} required">
	<label for="precioPorHora">
		<g:message code="sala.precioPorHora.label" default="Precio Por Hora" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="precioPorHora" type="number" min="1" value="${salaInstance.precioPorHora}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: salaInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="sala.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${salaInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: salaInstance, field: 'complejo', 'error')} required">
	<label for="complejo">
		<g:message code="sala.complejo.label" default="Complejo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="complejo" required="" value="${salaInstance?.complejo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: salaInstance, field: 'direccion', 'error')} required">
	<label for="direccion">
		<g:message code="sala.direccion.label" default="Direccion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="direccion" required="" value="${salaInstance?.direccion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: salaInstance, field: 'barrioLocalidad', 'error')} required">
	<label for="barrioLocalidad">
		<g:message code="sala.barrioLocalidad.label" default="Barrio Localidad" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="barrioLocalidad" required="" value="${salaInstance?.barrioLocalidad}"/>

</div>

