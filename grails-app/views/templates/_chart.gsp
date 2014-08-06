<script src="http://code.highcharts.com/highcharts.js"></script>
<%--<script src="http://code.highcharts.com/modules/exporting.js"></script>--%>

<div id="${battle}" style="min-width: 310px; height: 200px; max-width: 600px; margin: 0 auto"></div>
<script>
$(function () {
    $('#${battle}').highcharts({
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
                ['${name2}',   ${porc2}],
                {
                    name: '${name1}',
                    y: ${porc1},
                    sliced: true,
                    selected: true
                }
            ]
        }]
    });
});
    

</script>