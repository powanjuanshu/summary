<%@taglib uri="/WEB-INF/tiles-jsp.tld" prefix="tiles"%>
<table>
<tr><td><tiles:insertAttribute name="header"></tiles:insertAttribute></td></tr>
<tr><td><tiles:insertAttribute name="sidebar"></tiles:insertAttribute></td></tr>
<tr><td><tiles:insertAttribute name="contant"></tiles:insertAttribute></td></tr>
<tr><td><tiles:insertAttribute name="footer"></tiles:insertAttribute></td></tr>
</table>