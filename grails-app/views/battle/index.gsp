
<%@ page import="com.uprovr.Battle" %>
<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'battle.label', default: 'Battle')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-battle" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-battle" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>

                        <g:sortableColumn property="name" title="${message(code: 'battle.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="siteId" title="${message(code: 'battle.siteId.label', default: 'Site Id')}" />
					
						<g:sortableColumn property="lastUpdate" title="${message(code: 'battle.lastUpdate.label', default: 'Last Update')}" />
					
						<g:sortableColumn property="totalVotes" title="${message(code: 'battle.totalVotes.label', default: 'Total Votes')}" />
					
						<th><g:message code="battle.category.label" default="Category" /></th>
					

					
					</tr>
				</thead>
				<tbody>
				<g:each in="${battleInstanceList}" status="i" var="battleInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${battleInstance.id}">${fieldValue(bean: battleInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: battleInstance, field: "siteId")}</td>
					
						<td><g:formatDate date="${battleInstance.lastUpdate}" /></td>
					
						<td>${fieldValue(bean: battleInstance, field: "totalVotes")}</td>
					
						<td>${fieldValue(bean: battleInstance, field: "category.name")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${battleInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
