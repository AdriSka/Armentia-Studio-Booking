<%@ page import="armentiaProject.Banda" %>



<div class="fieldcontain ${hasErrors(bean: bandaInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="banda.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${bandaInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: bandaInstance, field: 'integrantes', 'error')} required">
	<label for="integrantes">
		<g:message code="banda.integrantes.label" default="Integrantes" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="integrantes" name="integrantes.id" from="${armentiaProject.Integrante.list()}" optionKey="id" required="" value="${bandaInstance?.integrantes?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: bandaInstance, field: 'abono', 'error')} required">
	<label for="abono">
		<g:message code="banda.abono.label" default="Abono" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="abono" name="abono.id" from="${armentiaProject.Abono.list()}" optionKey="id" required="" value="${bandaInstance?.abono?.id}" class="many-to-one"/>

</div>

