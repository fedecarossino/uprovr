<script src="http://code.highcharts.com/highcharts.js"></script>
<%--<script src="http://code.highcharts.com/modules/exporting.js"></script>--%>

<div id="${battle.name.replace(' ','-')}" style="min-width: 310px; height: 200px; max-width: 600px; margin: 0 auto"></div>
<script>
$(function () {
    $('#${battle.name.replace(' ','-')}').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false
        },
        title: {
            text: null
        },
        credits:{
        	enabled: false
        },
        tooltip: {
    	    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    }
                }
            }
        },
        series: [{
            type: 'pie',
            name: 'Win',
            data: [
                   ['${battle.adversarios[1].name}', ${battle.adversarios[1].tendencia}],
                   {
                       name: '${battle.adversarios[0].name}',
                       y: ${battle.adversarios[0].tendencia},
                       sliced: true,
                       selected: true
                   }
            ]
        }]
    });
});
    

</script>