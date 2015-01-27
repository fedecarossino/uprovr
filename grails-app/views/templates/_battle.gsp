<style>
#loading {
	background: url("images/spinner.gif") no-repeat scroll center center #FFF;
	position: absolute;
	height: 10%;
	margin-top: 0px;
	margin-bottom: 20px;
    display: none;
}
</style>
<div id="allBattles">
	<facebook:initJS appId="${facebookContext.app.id}">
		// Put here any JS code to be executed after Facebook JS initialization
	</facebook:initJS>
	<g:each in="${battle}">
		<g:render template="/templates/battleDiv" model="['battle':it]" />
	</g:each>
</div>

<div class="container container-margin" id="loading"></div>

<g:if test="${g.cookie(name: 'upsite') == ''}">
	<g:render template="/templates/modalSelectCountry"/>
</g:if>

<script type="text/javascript">
	$(document).ready(function () { 
	<%--		 $('#timeline').scroll(function() {--%>
	<%--			 	console.log("buenaa")--%>
	<%--				if ( $(document).scrollTop() == ( $(document).height() - $(window).height() ) {--%>
	<%--					  console.log("end")--%>
	<%--				}--%>
	<%--		    }--%>
	
		 $( window ).scroll(function() {
			if ( $(document).scrollTop() == ( $(document).height() - $(window).height() )) {
                    if($("#offsetinput").val() == 404){
                        $("#loading").hide()
                        return
                    }
					var offset = 2
					if($("#offsetinput").val() != "0"){
						$("#offsetinput").val(parseInt($("#offsetinput").val())+offset)
					}else{
						$("#offsetinput").val(offset)
					}
					offset = $("#offsetinput").val()
					console.log(offset)
			  		$("#loading").show()
<%--						${remoteFunction(controller:'nextBattles', params: "'offset='+offset", onSuccess:'addBattles(data)')};--%>
					jQuery.ajax({type:'GET',data:'offset='+offset, url:'/nextBattles?exc=${exc}&textSearch=${textSearch}',
                        success:function(data){
                            if(data.data == ""){
                                $("#offsetinput").val(404);$("#loading").hide()
                            };
                            console.log(data);addBattles(data);
                        },
                        error:function(XMLHttpRequest,textStatus,errorThrown){console.log("ENTRO POR ACA");$("#offsetinput").val(404)}});;
				}
		 })

	})
	 function addBattles(data){
			$("#allBattles").append(data.data)
			$("#loading").hide()
	 }
</script>