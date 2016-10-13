
<%@ page import="armentiaTest.Reserva" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reserva.label', default: 'Reserva')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-reserva" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-reserva" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list reserva">
			
				<g:if test="${reservaInstance?.horaInicio}">
				<li class="fieldcontain">
					<span id="horaInicio-label" class="property-label"><g:message code="reserva.horaInicio.label" default="Hora Inicio" /></span>
					
						<span class="property-value" aria-labelledby="horaInicio-label"><g:formatDate date="${reservaInstance?.horaInicio}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${reservaInstance?.horaFin}">
				<li class="fieldcontain">
					<span id="horaFin-label" class="property-label"><g:message code="reserva.horaFin.label" default="Hora Fin" /></span>
					
						<span class="property-value" aria-labelledby="horaFin-label"><g:formatDate date="${reservaInstance?.horaFin}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${reservaInstance?.nombreBanda}">
				<li class="fieldcontain">
					<span id="nombreBanda-label" class="property-label"><g:message code="reserva.nombreBanda.label" default="Nombre Banda" /></span>
					
						<span class="property-value" aria-labelledby="nombreBanda-label"><g:fieldValue bean="${reservaInstance}" field="nombreBanda"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reservaInstance?.integranteQueReservo}">
				<li class="fieldcontain">
					<span id="integranteQueReservo-label" class="property-label"><g:message code="reserva.integranteQueReservo.label" default="Integrante Que Reservo" /></span>
					
						<span class="property-value" aria-labelledby="integranteQueReservo-label"><g:fieldValue bean="${reservaInstance}" field="integranteQueReservo"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:reservaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${reservaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
