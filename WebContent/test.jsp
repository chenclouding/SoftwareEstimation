<html>
<head>
<title>Dynamically create input fields- jQuery</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
// Calling jQuery Library hosted on Google's CDN
<script type="text/javascript">
	$(function() {
		var addDiv = $('#addinput');
		var i = $('#addinput p').size() + 1;

		$('#addNew').live('click',function() {
			$(
				'<p><input type="text" id="p_new" size="40" name="p_new_' + i +'" value="" placeholder="I am New" /><a href="#" id="remNew">Remove</a> </p>')
				.appendTo(addDiv);
				i++;
				return false;
			});

		$('#remNew').live('click', function() {
			if (i > 2) {
				$(this).parents('p').remove();
				i--;
			}
			return false;
		});
	});
</script>

</head>
<body>
<table width="100%" border="1" cellspacing="1" cellpadding="0">
<tr>
<td colspan="3"> </td>
</tr>
<tr>
<td rowspan="5"> </td>
<td> </td>
<td> </td>
</tr>
<tr>
<td> </td>
<td> </td>
</tr>
<tr>
<td> </td>
<td> </td>
</tr>
<tr>
<td> </td>
<td> </td>
</tr>
<tr>
<td> </td>
<td> </td>
</tr>
</table>

</body>
</html>
</html>