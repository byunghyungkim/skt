<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script>
	// javascript here
</script>
</head>
<body>
	<h1>Landing for the SKT Path/Traffic Monitoring</h1>
	<div id="links">
		<ul>
			<li><a href="<c:url value='/login'/>">Login</a></li>
			<li><a href="<c:url value='/signup'/>">Signup</a></li>
			<li><a href="<c:url value='/a/'/>">Admin Features - Login required</a></li>
			<li><a href="<c:url value='/dashboard/'/>">Dashboard - Login required</a></li>
		</ul>
	</div>
</body>
</html>

