
<%@ page import="armentiaTest.Sala" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'sala.label', default: 'Sala')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-sala" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
<%--				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--%>
			</ul>
		</div>
		<div id="list-sala" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nombreSala" title="${message(code: 'sala.armentia.label', default: 'Armentia')}" />						
					
						<g:sortableColumn property="nombreSala" title="${message(code: 'sala.nombreSala.label', default: 'Nombre de la Sala')}" />
						
						<th><g:message code="sala.precioPorHora.label" default="Precio Por Hora" /></th>
						
					</tr>
				</thead>
				<tbody>
				<g:each in="${salaInstanceList}" status="i" var="salaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link controller="armentia" action="show" id="${salaInstance.armentia.id}">${fieldValue(bean: salaInstance, field: "armentia.nombre")}</g:link></td>
					
						<td><g:link action="show" id="${salaInstance.id}">${fieldValue(bean: salaInstance, field: "nombreSala")}</g:link></td>
					
						<td>${fieldValue(bean: salaInstance, field: "precioPorHora")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${salaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
