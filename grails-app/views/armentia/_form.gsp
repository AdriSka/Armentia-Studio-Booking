<%@ page import="armentiaTest.Armentia" %>


<div class="fieldcontain ${hasErrors(bean: armentiaInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="armentia.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${armentiaInstance?.nombre}"/>

</div>


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


<g:if test="${puedeCrearSalas}" >
<div class="fieldcontain ${hasErrors(bean: armentiaInstance, field: 'salas', 'error')} ">
	<label for="salas">
		<g:message code="armentia.salas.label" default="Salas" />
	</label>

	<ul class="one-to-many">
		<g:if test="${armentiaInstance?.salas}" >
			<g:each in="${armentiaInstance?.salas?}" var="i">
			    <li><g:link controller="sala" action="show" id="${i.id}">${i?.nombreSala?.encodeAsHTML()}</g:link></li>
			</g:each>
		</g:if>
		<g:else>
			<div id="sinSalas">
				<font size="3" color="red"><i>Debe agregar al menos una sala</i></font>
			</div>
		</g:else>
	</ul>

</div>
</g:if>


