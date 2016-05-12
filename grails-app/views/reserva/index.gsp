
<%@ page import="armentiaProject.Reserva" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reserva.label', default: 'Reserva')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-reserva" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-reserva" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="horaInicio" title="${message(code: 'reserva.horaInicio.label', default: 'Hora Inicio')}" />
					
						<g:sortableColumn property="horaFin" title="${message(code: 'reserva.horaFin.label', default: 'Hora Fin')}" />
					
						<g:sortableColumn property="nombreBanda" title="${message(code: 'reserva.nombreBanda.label', default: 'Nombre Banda')}" />
					
						<g:sortableColumn property="integranteQueReservo" title="${message(code: 'reserva.integranteQueReservo.label', default: 'Integrante Que Reservo')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${reservaInstanceList}" status="i" var="reservaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${reservaInstance.id}">${fieldValue(bean: reservaInstance, field: "horaInicio")}</g:link></td>
					
						<td><g:formatDate date="${reservaInstance.horaFin}" /></td>
					
						<td>${fieldValue(bean: reservaInstance, field: "nombreBanda")}</td>
					
						<td>${fieldValue(bean: reservaInstance, field: "integranteQueReservo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${reservaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
