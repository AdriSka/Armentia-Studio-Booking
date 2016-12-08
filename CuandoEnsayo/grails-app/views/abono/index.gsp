
<%@ page import="cuandoEnsayo.Abono" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'abono.label', default: 'Abono')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-abono" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-abono" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="alias" title="${message(code: 'abono.alias.label', default: 'Alias')}" />
					
						<g:sortableColumn property="inicioAbono" title="${message(code: 'abono.inicioAbono.label', default: 'Inicio Abono')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${abonoInstanceList}" status="i" var="abonoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${abonoInstance.id}">${fieldValue(bean: abonoInstance, field: "alias")}</g:link></td>
					
						<td><g:formatDate date="${abonoInstance.inicioAbono}"/></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${abonoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
