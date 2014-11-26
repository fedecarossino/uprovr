<div class="row" id="${(battle.name+'_div').replace(' ','-')}" style="margin-bottom: 50px; border: 1px solid #EEEEEE;">
			<input name="battleId" value="${battle.id}" hidden="true">
	            <div class="well well-sm" style="border-radius: 0px;"><span class="glyphicon glyphicon-calendar"></span>  ${battle.name }</div>
	            <div class="col-md-12">
		<div class="col-md-4">
			<div style=" margin-left: auto ;margin-right: auto ;text-align: center;">
	          <img class="img-circle" src="${battle.adversarios[0].urlImage }" alt="Generic placeholder image" style="width: 140px; height: 140px;">
	          <h2>${battle.adversarios[0].name}</h2>
	          <g:if test="${battle.adversarios[0].tendencia <= 33.33 && battle.adversarios[0].tendencia > -33.33}">
	          	<img src="http://oi61.tinypic.com/2lux6p.jpg"><!-- Yellow -->
	          </g:if>
	          <g:elseif test="${battle.adversarios[0].tendencia > 33.33 && battle.adversarios[0].tendencia < 66.66}">
	          	<img src="http://oi61.tinypic.com/2dawr9t.jpg"><!-- Yellow-green -->
	          </g:elseif>
	          <g:elseif test="${battle.adversarios[0].tendencia >= 66.66}">
	          	<img src="http://oi62.tinypic.com/t7ocjt.jpg"><!-- Green -->
	          </g:elseif>
              <g:elseif test="${battle.adversarios[0].tendencia > -66.66 && battle.adversarios[0].tendencia < -33.33}">
	          	<img src="http://oi59.tinypic.com/ig9cts.jpg"><!-- Orange -->
	          </g:elseif>
              <g:elseif test="${battle.adversarios[0].tendencia <= -66.66}">
	          	<img src="http://oi61.tinypic.com/157ci1w.jpg"><!-- Red -->
	          </g:elseif>
	          <p>
	          	<g:if test="${g.cookie(name: 'upsite') == ''}">
	          		<br>
	          		<button class="btn btn-primary" data-toggle="modal" data-target="#votarModel">
					  Votar
					</button>
	          	</g:if>
	          	<g:else>
       				<g:if test="${!facebookContext.authenticated}">
       					<br>
			          	<facebook:loginLink appPermissions="${facebookContext.app.permissions}" elementClass="btn btn-primary">Votar</facebook:loginLink>
					</g:if>
					<g:else>
						<g:if test="${battle.adversarios[0].button}">
							<div>
								<g:if test="${battle.adversarios[0].button == 'positive'}">
									<button type="button" class="btn btn-success" disabled="disabled">Me va</button>
								</g:if>
								<g:else>
									<button type="button" class="btn btn-danger" disabled="disabled">No me va</button>
								</g:else>
							</div>
						</g:if>
						<g:else>
				          	<g:formRemote name="myForm" url="[controller: 'vote', action: '',params: [battleId:battle.id, like:battle.adversarios[0].id]]" update="${(battle.name+'_div').replace(' ','-')}">
				          		<g:actionSubmit value="Me va" class="btn btn-success" action="${'like_'+battle.adversarios[0].id}" />
				          	</g:formRemote>
				          	<g:formRemote name="myForm" url="[controller: 'vote', action: '',params: [battleId:battle.id, notLike:battle.adversarios[0].id]]" update="${(battle.name+'_div').replace(' ','-')}">
				          		<g:actionSubmit value="No me va" class="btn btn-danger" style="margin-top: 6px;" action="${'notLike_'+battle.adversarios[0].id}" />
				          	</g:formRemote>
			          	</g:else>
		          	</g:else>
	          	</g:else>
	          </p>
			</div>
		</div>
		<div class="col-md-4">
			<g:render template="/templates/chart" model="[battle:battle]"></g:render>									
		</div>							
		<div class="col-md-4">
			<div style=" margin-left: auto ;margin-right: auto ;text-align: center;">
	          <img class="img-circle" src="${battle.adversarios[1].urlImage }" alt="Generic placeholder image" style="width: 140px; height: 140px;">
	          <h2>${battle.adversarios[1].name}</h2>
	          <g:if test="${battle.adversarios[1].tendencia <= 33.33 && battle.adversarios[1].tendencia > -33.33}">
	          	<img src="http://oi61.tinypic.com/2lux6p.jpg"><!-- Yellow --> 
	          </g:if>
	          <g:elseif test="${battle.adversarios[1].tendencia > 33.33 && battle.adversarios[1].tendencia < 66.66}">
	          	<img src="http://oi61.tinypic.com/2dawr9t.jpg"><!-- Yellow-green -->
	          </g:elseif>
	          <g:elseif test="${battle.adversarios[1].tendencia >= 66.66}">
	          	<img src="http://oi62.tinypic.com/t7ocjt.jpg"><!-- Green -->
	          </g:elseif>
              <g:elseif test="${battle.adversarios[1].tendencia > -66.66 && battle.adversarios[1].tendencia < -33.33}">
	          	<img src="http://oi59.tinypic.com/ig9cts.jpg"><!-- Orange -->
	          </g:elseif>
              <g:elseif test="${battle.adversarios[1].tendencia <= -66.66}">
	          	<img src="http://oi61.tinypic.com/157ci1w.jpg"><!-- Red -->
	          </g:elseif>
	          <p>
   	          	<g:if test="${g.cookie(name: 'upsite') == ''}">
   	          		<br>
					<button class="btn btn-primary" data-toggle="modal" data-target="#votarModel">
					  Votar
					</button>
	          	</g:if>
	          	<g:else>
       				<g:if test="${!facebookContext.authenticated}">
       					<br>
			          	<facebook:loginLink appPermissions="${facebookContext.app.permissions}" elementClass="btn btn-primary">Votar</facebook:loginLink>
					</g:if>
					<g:else>
						<g:if test="${battle.adversarios[1].button}">
							<div>
								<g:if test="${battle.adversarios[1].button == 'positive'}">
									<button type="button" class="btn btn-success" disabled="disabled">Me va</button>
								</g:if>
								<g:else>
									<button type="button" class="btn btn-danger" disabled="disabled">No me va</button>
								</g:else>
							</div>
						</g:if>
						<g:else>
			      		 	<g:formRemote name="myForm" url="[controller: 'vote', action: '',params: [battleId:battle.id, like:battle.adversarios[1].id]]" update="${(battle.name+'_div').replace(' ','-')}">
				          		<g:actionSubmit value="Me va" class="btn btn-success" action="${'like_'+battle.adversarios[1].id}" />
				          	</g:formRemote>
				          	<g:formRemote name="myForm" url="[controller: 'vote', action: '',params: [battleId:battle.id, notLike:battle.adversarios[1].id]]" update="${(battle.name+'_div').replace(' ','-')}">
				          		<g:actionSubmit value="No me va" class="btn btn-danger" style="margin-top: 6px;" action="${'notLike_'+battle.adversarios[1].id}" />
				          	</g:formRemote>
						</g:else>
		          	</g:else>
		        </g:else>
	          </p>
	         </div>
			</div>							
		</div>
	
    <div class="col-md-12">
        <p class="bg-info" style="padding: 10px;border-radius: 5px;"><span class="glyphicon glyphicon-exclamation-sign" style="color:#31708f;"></span> Algo como para cortar</p>
     </div>
</div>
