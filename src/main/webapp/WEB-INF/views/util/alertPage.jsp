<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<meta charset="UTF-8">
<title>댕냥이의 일상</title>
</head>
<body>
<script type="text/javascript">
Swal.fire({icon: 'info',
	text: '${message}',	}).then(function(){
if ('${url}'=='')
	history.back();
else 
	location.href='${url}'
	})
</script>
</body>
</html>