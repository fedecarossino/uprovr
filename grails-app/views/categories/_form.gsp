<%@ page import="com.uprovr.Categories" %>



<div class="fieldcontain ${hasErrors(bean: categoriesInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="categories.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${categoriesInstance?.name}"/>

</div>

