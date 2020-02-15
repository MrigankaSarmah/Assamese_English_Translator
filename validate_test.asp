<!DOCTYPE html>
<%@ CODEPAGE=65001%>

<html>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html;charset=UTF-8">
<TITLE>Translation Test Page</TITLE>
</HEAD>



<body>
<h3>Translator-Developed at Assam down town University(Funded by Assam Association of North America)</h3>
/Test results -all
<% 
	 
	 
	 Set Conn = Server.CreateObject("ADODB.Connection")
DSNtest1="DRIVER={Microsoft Access Driver (*.mdb)}; "
DSNtest1=dsntest1 & "DBQ=D:\INETPUB\VHOSTS\aanaadtu.com\httpdocs\aananlp.mdb" 
Conn.Open DSNtest1
		sl=1
		set rs = Server.CreateObject("ADODB.recordset")
		rs.open "Select * from tab_test",Conn
		
			Response.write("<table border=1>")
			Response.write("<th>Sl.</th><th>English</th><th>Assamese</th>")
		Do While Not rs.EOF 
		Response.write("<tr><td>")
			Response.write(sl)
		Response.write("</td><td>")
			Response.write(rs.Fields(0).value)
			Response.write("</td><td>")
			Response.write(rs.Fields(1).value)
			Response.write("</td></tr>")
		
		rs.MoveNext
		sl=sl+1
		Loop
		
		Response.write("</table>")
		rs.close
		Conn.close
%>

</body>
</html>