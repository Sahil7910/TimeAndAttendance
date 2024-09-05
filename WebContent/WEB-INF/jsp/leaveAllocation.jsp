<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fun" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.distna.utility.DateTime"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="javascript/department.js"></script>

<title>Leave Allocation</title>

</head>

<%
String dateFormat = "dd-MM-yyyy";
String dateNow = DateTime.CurrentDate(dateFormat);
Calendar c_month = Calendar.getInstance();
Calendar c_week = Calendar.getInstance();
SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
int month = Calendar.MONTH;
int day = Calendar.DATE;
c_month.add(Calendar.MONTH, -1);
c_week.add(Calendar.DATE, -7);
String lastMonthDate = sdf.format(c_month.getTime());
String lastWeekDate = sdf.format(c_week.getTime());
String year = dateNow.substring(7, 10);
String month1 = dateNow.substring(3, 5);
int iYear = Integer.parseInt(year);
String loginUser = (String) session.getAttribute("loginUser");
%>


<body id="public">
	<div id="container" class="ltr">
		<form:form class="wufoo leftLabel page" commandName="leaveAllocation"
			action="addLeaveAllocation.htm?Id=${Id}" method="POST">


			<form:hidden path="leaveApplicationId" value="${Id}" />


			<ul>
				<%--   <tr><td colspan="2">
	<form:errors path="*" cssStyle="color : red;"/></td></tr> --%>
				<c:forEach items="${leaveApplicationObj}" var="newApplication">
					<li id="foli23" class="notranslate      "><label class="desc"
						id="title23" for="Field23"> Employee <span id="req_23"
							class="req">*</span>
					</label>
						<div>
							<%
							int count = 0;
							%>
							<c:forEach items="${employeeList}" var="employeeListVar">
								<c:if
									test="${newApplication.singleEmployeeId==employeeListVar.employeeId}">
									<%
									if (count < 1) {
									%>
	         	 ${employeeListVar.firstName} ${employeeListVar.lastName}
	         <%
	         count++;
	         }
	         %>
								</c:if>
							</c:forEach>
							<form:hidden path="employee_id"
								value="${newApplication.singleEmployeeId}" />
						</div></li>



					<li id="foli23" class="notranslate      "><label class="desc"
						id="title23" for="Field23"> Status <span id="req_23"
							class="req">*</span>
					</label>
						<div>
							<form:select class="field select medium" path="allocationStatus"
								id="leaveStatus" name="leaveStatus">
								<form:option value="0">Select</form:option>
								<c:forEach items="${statusList}" var="statusListVar">
									<form:option value="${statusListVar.id}">${statusListVar.status_name}</form:option>
								</c:forEach>
							</form:select>
						</div> <form:errors path="allocationStatus" cssStyle="color : red;" /></li>




					<li id="foli23" class="notranslate      "><label class="desc"
						id="title23" for="Field23"> Requested From Date: </label>
						<div>${newApplication.from_date}</div> <form:hidden
							path="fromdate" value="${newApplication.from_date}" /></li>



					<li id="foli23" class="notranslate      "><label class="desc"
						id="title23" for="Field23"> Requested To Date: </label>
						<div>${newApplication.to_date}</div> <form:hidden path="todate"
							value="${newApplication.to_date}" /></li>


					<li id="foli23" class="notranslate      "><label class="desc"
						id="title23" for="Field23"> Approved From Date <span
							id="req_23" class="req">*</span>
					</label>
						<div>
							<form:input class="field text medium" path="approved_fromdate"
								type="text" id="approvedfromdate" name="approvedfromdate"
								value="${newApplication.from_date}" readonly="true"></form:input>
							&nbsp;&nbsp;<img id="dobImage1" src="images/cal.gif" alt="cal"
								onClick="setYears(1990, 2050);showCalender(this, 'approvedfromdate',-350,-270);"></img>
						</div> <form:errors path="approved_fromdate" cssStyle="color : red;" />
					</li>


					<li id="foli23" class="notranslate      "><label class="desc"
						id="title23" for="Field23"> Approved To Date <span
							id="req_23" class="req">*</span>
					</label>
						<div>
							<form:input class="field text medium" path="approved_todate"
								type="text" id="approvedtodate" name="approvedtodate"
								value="${newApplication.to_date}" readonly="true"></form:input>
							&nbsp;&nbsp;<img id="dobImage1" src="images/cal.gif" alt="cal"
								onClick="setYears(1990, 2050);showCalender(this, 'approvedtodate',-350,-270);"></img>
						</div> <form:errors path="approved_todate" cssStyle="color : red;" /></li>

					<li id="foli23" class="notranslate      "><label class="desc"
						id="title23" for="Field23"> Leave Type <span id="req_23"
							class="req">*</span>
					</label>
						<div>
							<form:select class="field select medium" path="typeofleave">
								<form:option value="0">Select</form:option>
								<c:forEach items="${leaveList}" var="leaveVar">

									<c:if test="${newApplication.leaveStatus==leaveVar.id}">
										<form:option selected="selected" value="${leaveVar.id}">${leaveVar.name}</form:option>
									</c:if>
									<form:option value="${leaveVar.id}">${leaveVar.name}</form:option>
								</c:forEach>
							</form:select>
						</div> <form:errors path="typeofleave" cssClass="error"></form:errors></li>


					<li id="foli23" class="notranslate "><label class="desc"
						id="title23" for="Field23"> No of days Allocated <span
							id="req_23" class="req">*</span>
					</label>
						<div>
							<form:input class="field text medium" name="value_value"
								path="value" value="${duration}"></form:input>
						</div> <form:errors path="value" cssClass="error"></form:errors></li>



					<li id="foli23" class="notranslate      "><label class="desc"
						id="title23" for="Field23"> Description</label>

						<div>
							<form:textarea class="field textarea medium" path="description"
								name="value_description" value="${newApplication.to_date}"></form:textarea>
						</div></li>


					<li id="foli23" class="notranslate      "><label class="desc"
						id="title23" for="Field23"> Expiration Date </label>
						<div>
							<form:input class="field text medium" type="text"
								id="expirationdate" name="expirationdate" path="expiration_date"
								value="<%=dateNow%>" readonly="true" size="15" />
							&nbsp;&nbsp;<img id="dobImage1" src="images/cal.gif" alt="cal"
								onClick="setYears(1990, 2050);showCalender(this, 'expirationdate',-350,-270);"></img>
						</div></li>




					<li id="foli23" class="notranslate      "><label class="desc"
						id="title23" for="Field23"> Created On </label>
						<div>
							<%=dateNow%></div> <form:hidden path="created_on" value="<%=dateNow%>" />
					</li>
				</c:forEach>



			</ul>
			<INPUT class="btTxt submit" value=Save type=submit>
			<input class="btTxt submit" value=Reset type=reset>


			<TABLE id="calenderTable">
				<TBODY id="calenderTableHead">
					<tr>
						<td align="center" colSpan="4"><SELECT class="form"
							id="selectMonth"
							onChange="showCalenderBody(createCalender(document.getElementById('selectYear').value,&#13;&#10;&#9;this.selectedIndex, false));"
							name='select' style="width: 90px;">
								<OPTION value=0 selected>Jan</OPTION>
								<OPTION value=1>Feb</OPTION>
								<OPTION value=2>Mar</OPTION>
								<OPTION value=3>Apr</OPTION>
								<OPTION value=4>May</OPTION>
								<OPTION value=5>Jun</OPTION>
								<OPTION value=6>Jul</OPTION>
								<OPTION value=7>Aug</OPTION>
								<OPTION value=8>Sep</OPTION>
								<OPTION value=9>Oct</OPTION>
								<OPTION value=10>Nov</OPTION>
								<OPTION value=11>Dec</OPTION>
						</SELECT></td>
						<td align="center" colSpan=2><SELECT id=selectYear
							style="width: 55px;"
							onChange="showCalenderBody(createCalender(this.value, &#13;&#10;&#9;&#9;&#9;&#9;document.getElementById('selectMonth').selectedIndex, false));"
							name=select></SELECT></td>
						<td align="center"><a onclick="closeCalender();"
							href="javascript://"> <FONT color=#003333 size=+1>X</FONT></a></td>
					</tr>
				</TBODY>
				<tbody id=calenderTableDays>
					<tr>
						<TD>Sun</TD>
						<TD>Mon</TD>
						<TD>Tue</TD>
						<TD>Wed</TD>
						<TD>Thu</TD>
						<TD>Fri</TD>
						<TD>Sat</TD>
					</tr>
				</tbody>
				<tbody id="calender" style="color: black;">
					<tr>
						<td></td>
					</tr>
				</tbody>
			</TABLE>

		</form:form>
	</div>
</body>
</html>
