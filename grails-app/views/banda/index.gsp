
<%@ page import="armentiaTest.Banda" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'banda.label', default: 'Banda')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-banda" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-banda" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'banda.nombre.label', default: 'Nombre')}" />
					
						<th><g:message code="banda.abono.label" default="Abono" /></th>
						
						<th><g:message code="banda.integrantesAmount.label" default="Cantidad de Integrantes" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${bandaInstanceList}" status="i" var="bandaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${bandaInstance.id}">${fieldValue(bean: bandaInstance, field: "nombre")}</g:link></td>
					
						<g:if test="${bandaInstance.abono}">
							<td>${fieldValue(bean: bandaInstance, field: "abono.alias")}</td>
						</g:if>						
						<g:else>
							<td><font size="3"><i>-Sin abono asignado-</i></font></td>
						</g:else>
					
						<g:if test="${bandaInstance.integrantes.size()}">
							<td>${bandaInstance.integrantes.size()}</td>
						</g:if>						
						<g:else>
							<td><font size="3" color="red"><i>DEBE AGREGARSE AL MENOS UN INTEGRANTE</i></font></td>
						</g:else>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${bandaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
