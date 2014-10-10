<div>
	<g:each in="${battle}">
		<g:render template="/templates/battleDiv" model="['battle':it]" />
	</g:each>
</div>