<%@ page import="armentiaProject.Integrante" %>



<div class="fieldcontain ${hasErrors(bean: integranteInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="integrante.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${integranteInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: integranteInstance, field: 'apellido', 'error')} required">
	<label for="apellido">
		<g:message code="integrante.apellido.label" default="Apellido" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apellido" required="" value="${integranteInstance?.apellido}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: integranteInstance, field: 'mail', 'error')} required">
	<label for="mail">
		<g:message code="integrante.mail.label" default="Mail" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="mail" required="" value="${integranteInstance?.mail}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: integranteInstance, field: 'telefono', 'error')} ">
	<label for="telefono">
		<g:message code="integrante.telefono.label" default="Telefono" />
		
	</label>
	<g:textField name="telefono" value="${integranteInstance?.telefono}"/>

</div>

