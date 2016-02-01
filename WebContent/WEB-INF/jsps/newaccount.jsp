<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="${pageContext.request.contextPath}/static/css/main.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/script/jquery-1.12.3.min.js"></script>
<script type="text/javascript">
	function checkPasswordsMatch() {
		var password = $("#pass").val();
		var confirmPass = $("#confirm-pass").val();
		if (password != confirmPass) {
			$("#confirm-pass-message").text("<fmt:message key='UnmatchedPasswords.user.password' />");
			$("#confirm-pass-message").addClass("error");
			$("#confirm-pass-message").removeClass("valid");
			$("#form-submit").prop("disabled", true);
		} else {
			$("#confirm-pass-message").text("<fmt:message key='MatchedPasswords.user.password' />");
			$("#confirm-pass-message").addClass("valid");
			$("#confirm-pass-message").removeClass("error");
			$("#form-submit").prop("disabled", false);
		}
	}

	function onLoad() {
		$("pass").keyup(checkPasswordsMatch);
		$("#confirm-pass").keyup(checkPasswordsMatch);
	}
	$(document).ready(onLoad);
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create New Account</title>
</head>
<body>
	<sf:form method="post"
		action="${pageContext.request.contextPath}/createAccount"
		commandName="user">
		<table class="formtable">
			<tr>
				<td class="label">Username:</td>
				<td><sf:input class="control" path="username" /><br />
					<div class="error">
						<sf:errors path="username"></sf:errors>
					</div></td>
			</tr>
			<tr>
				<td class="label">Email:</td>
				<td><sf:input class="control" path="email" /><br /> <sf:errors
						path="email" cssClass="error"></sf:errors></td>
			</tr>
			<tr>
				<td class="label">Password:</td>
				<td><sf:input id="pass" class="control" path="password" /><br />
					<sf:errors path="password" cssClass="error"></sf:errors></td>
			</tr>
			<tr>
				<td class="label">Confirm Password:</td>
				<td><input id="confirm-pass" class="control" path="confirmpass" /><br />
					<div id="confirm-pass-message"></div></td>
			</tr>
			<tr>
				<td class="label"></td>
				<td><input id="form-submit" class="control"
					value="Create Account" type="submit" /></td>
			</tr>
		</table>
	</sf:form>
</body>
</html>