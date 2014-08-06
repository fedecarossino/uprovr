  <link rel="stylesheet" href="${resource(dir:'css',file:'jquery-jvectormap-1.2.2.css')}" />
  <g:javascript src="jquery-jvectormap-1.2.2.min.js" />
  <g:javascript src="jquery-jvectormap-world-mill-en.js"/>
<div id="world-map" class="map-size"></div>
<script>
  $(function(){
	  var gdpData = {
			  "AR": 10,
			  "US": 0,
			  "BR": 0,
			  "MX": 0,
			  "CO": 0,
			  "NI": 0,
			  "HN": 0,
			  "ES": 0,
			  "FR": 0,
			  "BO": 0,
			  "PY": 0,
			  "UY": 0,
			  "CL": 0,
			  "PE": 0,
			  "EC": 0,
			  "VE": 0,
			  "GY": 0,
			  "SR": 0,
		      "IT": 0,
		      "CA": 0,
		      "PT": 0
		};
    $('#world-map').vectorMap({
    	map: 'world_mill_en',
        zoomButtons : false,
        zoomOnScroll: false,
        series: {
            regions: [{
              values: gdpData,
<%--              scale: ['#C8EEFF', '#0071A4'],--%>
            scale: ['#A6CDD4', '#669ca5'],
              normalizeFunction: 'polynomial'
            }]
          },
		onRegionClick: function(event, code){
	    	console.log(code)
	    }
     });
  });
</script>
