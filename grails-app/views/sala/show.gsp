
<%@ page import="armentiaTest.Sala" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'sala.label', default: 'Sala')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-sala" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
<%--				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--%>
			</ul>
		</div>
		<div id="show-sala" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list sala">

				<g:if test="${salaInstance?.armentia}">
				<li class="fieldcontain">
					<span id="armentia-label" class="property-label"><g:message code="sala.armentia.label" default="Armentia" /></span>
					
						<span class="property-value" aria-labelledby="armentia-label"><g:link controller="armentia" action="show" id="${salaInstance?.armentia?.id}">${salaInstance?.armentia?.nombre?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${salaInstance?.nombreSala}">
				<li class="fieldcontain">
					<span id="nombreSala-label" class="property-label"><g:message code="sala.nombreSala.label" default="Nombre de la Sala" /></span>
					
						<span class="property-value" aria-labelledby="nombreSala-label"><g:fieldValue bean="${salaInstance}" field="nombreSala"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${salaInstance?.precioPorHora}">
				<li class="fieldcontain">
					<span id="precioPorHora-label" class="property-label"><g:message code="sala.precioPorHora.label" default="Precio Por Hora" /></span>
					
						<span class="property-value" aria-labelledby="precioPorHora-label"><g:fieldValue bean="${salaInstance}" field="precioPorHora"/></span>
					
				</li>
				</g:if>
				
				<g:if test="${salaInstance?.reservas}">
				<li class="fieldcontain">
					<span id="reservas-label" class="property-label"><g:message code="sala.reservas.label" default="Reservas" /></span>
					
						<g:each in="${salaInstance.reservas}" var="r">
						<span class="property-value" aria-labelledby="reservas-label"><g:link controller="reserva" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:salaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${salaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
