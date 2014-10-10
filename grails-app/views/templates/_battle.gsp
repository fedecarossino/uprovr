<div>
	<g:each in="${battle}">
		<div class="row" style="margin-bottom: 50px; border: 1px solid #EEEEEE;">
               <div class="well well-sm" style="border-radius: 0px;"><span class="glyphicon glyphicon-calendar"></span>  Messi vs CR7</div>
               <div class="col-md-12">
				<div class="col-md-4">
					<div style=" margin-left: auto ;margin-right: auto ;text-align: center;">
			          <img class="img-circle" src="${it.adversarios[0].urlImage }" alt="Generic placeholder image" style="width: 140px; height: 140px;">
			          <h2>${it.adversarios[0].name}</h2>
			          <g:if test="${it.adversarios[0].battleResult == it.adversarios[1].battleResult}">
			          	DRAW
			          </g:if>
			          <g:elseif test="${it.adversarios[0].battleResult > it.adversarios[1].battleResult}">
			          	WIN
			          </g:elseif>
			          <g:else>
			          	LOSE
			          </g:else>
			          <p><input type="button" value="votar"/></p>
					</div>
				</div>
				<div class="col-md-4">
					<g:render template="/templates/chart" model="[battle:it]"></g:render>									
				</div>							
				<div class="col-md-4">
					<div style=" margin-left: auto ;margin-right: auto ;text-align: center;">
			          <img class="img-circle" src="${it.adversarios[1].urlImage }" alt="Generic placeholder image" style="width: 140px; height: 140px;">
			          <h2>${it.adversarios[1].name}</h2>
			          <g:if test="${it.adversarios[1].battleResult == it.adversarios[0].battleResult}">
			          	DRAW
			          </g:if>
			          <g:elseif test="${it.adversarios[1].battleResult > it.adversarios[0].battleResult}">
			          	WIN
			          </g:elseif>
			          <g:else>
			          	LOSE
			          </g:else>
			          <p><input type="button" value="votar"/></p>
			         </div>
				</div>							
			</div>
            <div class="col-md-12">
                <p class="bg-info" style="padding: 10px;border-radius: 5px;"><span class="glyphicon glyphicon-exclamation-sign" style="color:#31708f;"></span> Last Update: 12-12-2014</p>
            </div>
		</div>
	</g:each>
</div>