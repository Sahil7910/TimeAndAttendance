\<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.distna.utility.DateTime"%>
<!-- <script type="text/javascript" src="calendar/js/calendar.js"></script>
<link rel="stylesheet" href="calendar/css/calendar.css" type="text/css">
<script type="text/javascript" src="calendar/js/CalendarPopup.js"></script> -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <script type="text/javascript" src="javascript/displayPages.js"></script> -->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Wise Report</title>
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
	String loginUser=(String)session.getAttribute("loginUser");
%>
<body id="public">
<div id="container" class="ltr">
<form:form name="EmployeeWiseReport" class="wufoo leftLabel page" id="EmployeeWiseReport" target="_blank">
<input type="hidden" id="employeeReportType"/>
<ul>
<li id="foli346" class="notranslate  threeColumns     ">
<label id="title346" class="desc">
Select a Choice
</label>
<div>
<input id="radioDefault_346" name="Field346" type="hidden" value="" />
<span>
<input type="radio" name="employeeWise" onclick="showRespectiveDiv('multiple','showEmployeeTypeView.htm?');" class="radio"/>
<label class="choice" for="Field346_0" >
Multiple</label>
</span>
<span>
<input class="radio" type="radio" name="employeeWise" onclick="showRespectiveDiv('single','showEmployeeTypeView.htm?');"/>
<label class="choice" for="Field346_1" >
Single</label>
</span>
<span>
<input class="radio"type="radio" name="employeeWise" onclick="showRespectiveDiv('all','showEmployeeTypeView.htm?');"/>
<label class="choice" for="Field346_2" >
All Employees</label>
</span>
</div>
</li>
<div id="SelectEmployeeView">
<input type="hidden" name="employeeNo" id="employeeNo" value="0">
</div>


<li id="foli110" 
class="notranslate      ">
<label class="desc" id="title110" for="Field110">
Start Date
<span id="req_23" class="req">*</span>
</label>
<div>
<input type="text" id="datefrom" name="datefrom" 
	value="<%=dateNow%>" readonly="readonly" class="field text medium"/>
	<img
	id="dobImageDateFrom" src="images/cal.gif" alt="cal"
	onClick="setYears(1950, 2050);showCalender(this, 'datefrom',-350,-270);"></img>
</div>
</li>

<li id="foli110" 
class="notranslate      ">
<label class="desc" id="title110" for="Field110">
End Date
<span id="req_23" class="req">*</span>
</label>
<div>
<input type="text" id="dateTo" name="dateTo" 
	value="<%=dateNow%>" readonly="readonly" class="field text medium"/>
	<img
	id="dobImageDateTo" src="images/cal.gif" alt="cal"
	onClick="setYears(1950, 2050);showCalender(this, 'dateTo',-350,-270);"></img>
</div>
</li>

<li id="foli110" 
class="notranslate      ">
<label class="desc" id="title110" for="Field110">
</label>
<div>
<label class="mandatory" id="title110" for="Field110">
${ErrorMsg}
</label>
</div>
</li>

<li class="buttons ">
<div>
<!-- <input class="btTxt submit" type="button" value="Generate To Pdf" onclick="return generateReport('generateEmployeeWiseExceptionReport.htm?');"/>
<input class="btTxt submit" type="button" value="Generate To Excel" onclick="return generateReport('generateEmployeeWiseExceptionReportInXSL.htm?');"/>
<input class="btTxt submit" type="button" value="Generate To Word" onclick="return generateReport('generateEmployeeWiseExceptionReportInDocx.htm?');"/>
 -->
 <img  src="images/pdf.png" height="35" width="35" onclick="return generateReport('generateEmployeeWiseExceptionReport.htm?');">
<img  src="images/logo-excel.png" height="35" width="35" onclick="return generateReport('generateEmployeeWiseExceptionReportInXSL.htm?');">
<img  src="images/word.jpg" height="35" width="35" onclick="return generateReport('generateEmployeeWiseExceptionReportInDocx.htm?');">
</div>
</li>
</ul>


<%-- <tr>
<td align="left">Start Date</td>
<td align="left"><input type="text" id="datefrom" name="datefrom" 
	value="<%=dateNow%>" readonly="readonly" size="15"/> </td>
	<td align="left">
	<div id="DateFromDiv">
	<img
	id="dobImageDateFrom" src="images/cal.gif" alt="cal"
	onClick="setYears(1955, 2015);showCalender(this, 'datefrom',-5,-130);"></img>
	</div>
	</td>
</tr>

<tr>
<td align="left">End Date</td>
<td align="left">
	</div>
	</td>
</tr> --%>
<TABLE id="calenderTable">
			<TBODY id="calenderTableHead">
				<tr>
					<td align="left" align="center" colSpan="4"><SELECT class="form"
						id="selectMonth"
						onChange="showCalenderBody(createCalender(document.getElementById('selectYear').value,&#13;&#10;&#9;this.selectedIndex, false));"
						name='select'>
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
					<td align="left" align="center" colSpan=2><SELECT id=selectYear
						onChange="showCalenderBody(createCalender(this.value, &#13;&#10;&#9;&#9;&#9;&#9;document.getElementById('selectMonth').selectedIndex, false));"
						name=select></SELECT></td>
					<td align="left" align="center"><a onclick="closeCalender();"href="javascript://"> <FONT color=#003333 size=+1>X</FONT></a></td>
				</tr>
			</TBODY>
			<tbody id=calenderTableDays>
				<tr>
					<td align="left">Sun</TD>
					<td align="left">Mon</TD>
					<td align="left">Tue</TD>
					<td align="left">Wed</TD>
					<td align="left">Thu</TD>
					<td align="left">Fri</TD>
					<td align="left">Sat</TD>
				</tr>
			</tbody>
			<tbody id="calender" style="color: black;">
				<tr>
					<td align="left"></td>
				</tr>
			</tbody>
		</TABLE>

</form:form>
</div>
</body>
</html>