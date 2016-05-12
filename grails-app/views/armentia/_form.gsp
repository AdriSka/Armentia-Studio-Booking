<%@ page import="armentiaProject.Armentia" %>



<div class="fieldcontain ${hasErrors(bean: armentiaInstance, field: 'direccion', 'error')} required">
	<label for="direccion">
		<g:message code="armentia.direccion.label" default="Direccion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="direccion" required="" value="${armentiaInstance?.direccion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: armentiaInstance, field: 'barrioLocalidad', 'error')} required">
	<label for="barrioLocalidad">
		<g:message code="armentia.barrioLocalidad.label" default="Barrio Localidad" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="barrioLocalidad" required="" value="${armentiaInstance?.barrioLocalidad}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: armentiaInstance, field: 'salas', 'error')} required">
	<label for="salas">
		<g:message code="armentia.salas.label" default="Salas" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="salas" name="salas.id" from="${armentiaProject.Sala.list()}" optionKey="id" required="" value="${armentiaInstance?.salas?.id}" class="many-to-one"/>

</div>

