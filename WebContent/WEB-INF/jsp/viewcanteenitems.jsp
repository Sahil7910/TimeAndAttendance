<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Canteen Items</title>
</head>
<body>
<div id=maincontent>
<form:form name="check" method="POST">
<div class="CSSTableGeneratorOutter">
<div class="CSSTableGenerator">
	<table >
		<tr>
			<td>&nbsp;</td>
			<td>Item Name</td>
			<td>Short Name</td>
			<td>Employee Contribution</td>
			<td>Employer Contribution</td>
		</tr>
		<c:forEach items="${canteenItemsList}" var="canteenItemsListVar">
		<tr>
			<td><input type="radio" name="radionm" id="radioid" value="<c:out value="${canteenItemsListVar.itemsId}"/>"/></td>
			<td>${canteenItemsListVar.itemName}</td>
			<td>${canteenItemsListVar.itemShortName}</td>
			<td>${canteenItemsListVar.employeeContribution}</td>
			<td>${canteenItemsListVar.employerContribution}</td>
		</tr>
		</c:forEach>
	</table>
</div></div>

<table  width="100%"  style=" margin-top: 2%;">
	<tr>
		<td ><input type="button" style="background-color:lightgray; margin-right: 2%;" name="method" value="UPDATE" onclick="return updateDelete(${canteenItemsListSize},'showupdatecanteenitems.htm');"/><input type="button" style="background-color:lightgray; margin-right: 2%;" name="method" value="DELETE" onclick="return updateDelete(${canteenItemsListSize},'deletecanteenitems.htm');"/></td>
	</tr>
</table>

</form:form>
</div>
</body>
</html>