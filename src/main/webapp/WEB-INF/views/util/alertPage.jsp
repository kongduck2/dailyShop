<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
Swal.fire({icon: 'info',text: '${message}'});
if ('${url}'=='')
	history.back();
else 
	location.href='${url}'
</script>