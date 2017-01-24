
<%@ page import="cuandoEnsayo.Reserva" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reserva.label', default: 'Reserva')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		
		<link rel='stylesheet' href='fullcalendar/fullcalendar.css' />

		<g:javascript src="fullcalendar.js" />
		<g:javascript src="fullcalendar.min.js" />
		<g:javascript src="gcal.js" />
<%--		<g:javascript src="jquery-1.11.1.min.js" />--%>
				<g:javascript>
		$(document).ready(function() {
    // page is now ready, initialize the calendar...

    $('#calendar').fullCalendar({
        // put your options and callbacks here
    })

});
		</g:javascript>
		
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
					
						<g:sortableColumn property="duracion" title="${message(code: 'reserva.duracion.label', default: 'Duracion')}" />
					
						<g:sortableColumn property="nombreBanda" title="${message(code: 'reserva.nombreBanda.label', default: 'Nombre Banda')}" />
					
						<g:sortableColumn property="integranteQueReservo" title="${message(code: 'reserva.integranteQueReservo.label', default: 'Integrante Que Reservo')}" />
					
						<th><g:message code="reserva.sala.label" default="Sala" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${reservaInstanceList}" status="i" var="reservaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${reservaInstance.id}">${fieldValue(bean: reservaInstance, field: "horaInicio")}</g:link></td>
					
						<td>${fieldValue(bean: reservaInstance, field: "duracion")}</td>
					
						<td>${fieldValue(bean: reservaInstance, field: "nombreBanda")}</td>
					
						<td>${fieldValue(bean: reservaInstance, field: "integranteQueReservo")}</td>
					
						<td>${fieldValue(bean: reservaInstance, field: "sala")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${reservaInstanceCount ?: 0}" />
			</div>
		</div>
		

<%--<div id='calendar'></div>--%>
<fullcal:calendar id="calendar">
    header: { left: "", center: "", right: "prev, today, next" },
    columnFormat: { week: 'ddd d/M' },
    timeFormat: 'HH:mm{ - HH:mm}'
</fullcal:calendar>
		
		</body>
</html>
