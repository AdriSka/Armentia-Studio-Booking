
<%@ page import="armentiaTest.Armentia" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'armentia.label', default: 'Armentia')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-armentia" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-armentia" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list armentia">

				<g:if test="${armentiaInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="armentia.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${armentiaInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${armentiaInstance?.direccion}">
				<li class="fieldcontain">
					<span id="direccion-label" class="property-label"><g:message code="armentia.direccion.label" default="Direccion" /></span>
					
						<span class="property-value" aria-labelledby="direccion-label"><g:fieldValue bean="${armentiaInstance}" field="direccion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${armentiaInstance?.barrioLocalidad}">
				<li class="fieldcontain">
					<span id="barrioLocalidad-label" class="property-label"><g:message code="armentia.barrioLocalidad.label" default="Barrio Localidad" /></span>
					
						<span class="property-value" aria-labelledby="barrioLocalidad-label"><g:fieldValue bean="${armentiaInstance}" field="barrioLocalidad"/></span>
					
				</li>
				</g:if>

				<li class="fieldcontain">
					<span id="salas-label" class="property-label"><g:message code="armentia.salas.label" default="Salas" /></span>
					<g:if test="${armentiaInstance?.salas}">
						<g:each in="${armentiaInstance.salas}" var="i">
							<span class="property-value" aria-labelledby="salas-label"><g:link controller="sala" action="show" id="${i.id}">${i?.nombreSala?.encodeAsHTML()}</g:link></span>
						</g:each>
					</g:if>
					<g:else>
						<span class="property-value" aria-labelledby="salas-label"><font size="3" color="red"><i>Debe agregar al menos una sala</i></font></span>
					</g:else>
				</li>
			
			</ol>
			<g:form url="[resource:armentiaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${armentiaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
