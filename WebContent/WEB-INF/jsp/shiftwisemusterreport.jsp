<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.distna.utility.DateTime"%>
<%@ page  language="java" import="java.util.*,java.text.*"%>
<!-- <script type="text/javascript" src="calendar/js/calendar.js"></script>
<link rel="stylesheet" href="calendar/css/calendar.css" type="text/css">
<script type="text/javascript" src="calendar/js/CalendarPopup.js"></script> -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%
 /* int iYear=nullIntconv(request.getParameter("iYear"));
 int iMonth=nullIntconv(request.getParameter("iMonth")); */
 int iYear=0;
int iMonth=0;
 /*  int iYear=(Integer)pageContext.getAttribute("iYearVar");
 int iMonth=(Integer)pageContext.getAttribute("iMonthVar");;  */

 Calendar ca = new GregorianCalendar();
 int iTDay=ca.get(Calendar.DATE);
 int iTYear=ca.get(Calendar.YEAR);
 int iTMonth=ca.get(Calendar.MONTH);

 if(iYear==0)
 {
	  iYear=iTYear;
	  iMonth=iTMonth;
 }
 GregorianCalendar cal = new GregorianCalendar (iYear, iMonth, 1); 
 int days=cal.getActualMaximum(Calendar.DAY_OF_MONTH);
 int weekStartDay=cal.get(Calendar.DAY_OF_WEEK);
 cal = new GregorianCalendar (iYear, iMonth, days); 
 int iTotalweeks=cal.get(Calendar.WEEK_OF_MONTH);
 
 /* System.out.println("iTDay="+iTDay);//today's Date
 System.out.println("iTYear="+iTYear);// current year
 System.out.println("iTMonth="+iTMonth);//current month which starts from 0   i.e 0-Jan,1-Feb... 
 System.out.println("iTotalweeks="+iTotalweeks);//tolal no of weeks in the current selected month
 System.out.println("iYear="+iYear);//selected year
 System.out.println("iMonth="+iMonth);//selected month
 System.out.println("days="+days);//total days in the selected month
 System.out.println("weekStartDay="+weekStartDay);//the weaks starting day's position  
 System.out.println("iTotalweeks="+iTotalweeks);*/
%>
<body id="public">
<div id="container" class="ltr">
<form:form name="EmployeeWiseReport" class="wufoo leftLabel page" id="EmployeeWiseReport" method="POST" action="generateShiftWiseMusterReport.htm" target="_blank">
<%-- <form:form name="MonthlyAttendanceReport"  method="POST" action="generateMonthlyAttendanceReport.htm"> --%>



<ul>
<li id="foli110" 
class="notranslate      ">
<label class="desc" id="title110" for="Field110">
Year
<span id="req_23" class="req">*</span>
</label>
<div>
<select name="iYear" id="iYear" class="field select medium">
        <%
		// start year and end year in combo box to change year in calendar
	    for(int iy=iTYear-30;iy<=iTYear+30;iy++)
		{
		  if(iy==iYear)
		  {
		    %>
          <option value="<%=iy%>" selected="selected"><%=iy%></option>
          <%
		  }
		  else
		  {
		    %>
          <option value="<%=iy%>"><%=iy%></option>
          <%
		  }
		}
	   %>
        </select>
</div>
</li>

<li id="foli110" 
class="notranslate      ">
<label class="desc" id="title110" for="Field110">
Month
<span id="req_23" class="req">*</span>
</label>
<div>
<select name="iMonth" id="iMonth" class="field select medium">
		
        <%
		// print month in combo box to change month in calendar
	    for(int im=0;im<=11;im++)
		{
		  if(im==iMonth)
		  {
	     %>
          <option value="<%=im%>" selected="selected"><%=new SimpleDateFormat("MMMM").format(new Date(2021,im,30))%></option>
          <%
		  }
		  else
		  {
		    %>
          <option value="<%=im%>"><%=new SimpleDateFormat("MMMM").format(new Date(2021,im,30))%></option>
          <%
		  }
		}
	   %>
        </select>
</div>
</li>


<li id="foli110" 
class="notranslate      ">
<label class="desc" id="title110" for="Field110">
Select Shift
<span id="req_23" class="req">*</span>
</label>
<div>
<select name="shiftName" id="shiftName" class="field select medium">
		<option value="0" label="Select">Select</option>
		<c:forEach items="${shiftMasterList}" var="shiftMasterVar" varStatus="status">
		<option value="${shiftMasterVar.shiftid}" label="${shiftMasterVar.shiftname}" >${shiftMasterVar.shiftname}</option>
		</c:forEach>
	</select>
</div>
</li>


<li class="buttons ">
<div>
<input class="btTxt submit" type="submit" value="Generate" onclick="if(document.getElementById('shiftName').value==0){alert('Shift Not Selected');return false;}"/>
</div>
</li>


</ul>


<%-- <table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
        <td width="25%" align="left">Year</td>
        <td width="25%" align="left">
    
		<select name="iYear" onchange="goTo('${employeeId}')  ">
		<select name="iYear" id="iYear" >
        <%
		// start year and end year in combo box to change year in calendar
	    for(int iy=iTYear-70;iy<=iTYear+70;iy++)
		{
		  if(iy==iYear)
		  {
		    %>
          <option value="<%=iy%>" selected="selected"><%=iy%></option>
          <%
		  }
		  else
		  {
		    %>
          <option value="<%=iy%>"><%=iy%></option>
          <%
		  }
		}
	   %>
        </select></td>
        <td width="25%" align="left">Month</td>
        <td width="25%" align="left">
		<select name="iMonth" onchange="goTo('${employeeId}')">
		<select name="iMonth" id="iMonth" >
		
        <%
		// print month in combo box to change month in calendar
	    for(int im=0;im<=11;im++)
		{
		  if(im==iMonth)
		  {
	     %>
          <option value="<%=im%>" selected="selected"><%=new SimpleDateFormat("MMMM").format(new Date(2008,im,01))%></option>
          <%
		  }
		  else
		  {
		    %>
          <option value="<%=im%>"><%=new SimpleDateFormat("MMMM").format(new Date(2008,im,01))%></option>
          <%
		  }
		}
	   %>
        </select>
        </td>
      </tr>
<tr>

<tr>
<td align="left">Select Shift</td>
<td align="left"><select name="shiftName" id="shiftName">
		<option value="0" label="Select">Select</option>
		<c:forEach items="${shiftMasterList}" var="shiftMasterVar" varStatus="status">
		<option value="${shiftMasterVar.shiftid}" label="${shiftMasterVar.shiftname}" >${shiftMasterVar.shiftname}</option>
		</c:forEach>
	</select>
</td>
</tr>
</table>
<table width="100%">
<tr><td>&nbsp;</td></tr>
<tr><td align="left"></td></tr></table> --%>
</form:form>
</div>
</body>
</html>

