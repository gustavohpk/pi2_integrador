$(document).ready(function(){
	$("input[name='event[base_price]']").priceFormat({
		prefix: '',
		centsSeparator: ',',
		thousandsSeparator: '.'
	});
});