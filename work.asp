
<!DOCTYPE html>
<%@ CODEPAGE=65001%>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html;charset=UTF-8">
<TITLE>tab_additional</TITLE>
</HEAD>
<html>
<body>

<%
Set Conn = Server.CreateObject("ADODB.Connection")
DSNtest="DRIVER={Microsoft Access Driver (*.mdb)}; "
DSNtest=dsntest & "DBQ=c:\inetpub\wwwroot\aanademo\aananlp.mdb" 
Conn.Open DSNtest
%>
<%  Assamese_String=""
    set rs = Server.CreateObject("ADODB.recordset")%>
    
    <table border="1" width="10%" ><FONT FACE="GIST-SND-DVOTDhruv" COLOR=#000000>
	<% Response.Write("string in english is: "+Request.QueryString("eng_text")) %>
	<% eng_str=Request.QueryString("eng_text")
	   eng_array=split(eng_str," ")
	   sglr=0
	   plrl=0
	   heavy=0
	   light=0
	   firstperson=0
	   secondperson=0
	   thirdperson=0
	   pst=0
	   prst=0
	   ftre=0
	   mainverb=0
	   tense=""
	   For each elm in eng_array
	    if Instr(elm,"ing") > 0 Then
		  prst=1
		    Response.Write(left(elm,Instr(elm,"ing")-1))	
		   mainverb=left(elm,Instr(elm,"ing")-1)
           tense="prst"
         end if 		
	    if Instr(elm,"ed") > 0 Then
		 pst=1
		 Response.Write(left(elm,Instr(elm,"ed")-1))
		   mainverb=left(elm,Instr(elm,"ed")-1)
		   tense="pst"
        end if
	  
	' if StrComp(elm,"you") =0  Then
	  ' secondperson=1
	  ' sglr=1
	' end if
	' if StrComp(elm,"he") =0  or StrComp(elm,"she")=0 Then
	  ' thirdperson=1
	  ' sglr=1
	' end if
	' if StrComp(elm,"i")=0 or StrComp(elm,"me")=0 or StrComp(elm,"myself")=0 Then
	  ' firstperson=1
	  ' sglr=1
	' end if
	' if StrComp(elm,"we")= 0 Then
	  ' firstperson=1
	  ' plrl=1
	' end if
	' if StrComp(elm,"they") =0 or StrComp(elm,"them")=0 Then
	  ' thirdperson=1
	  ' plrl=1
	' end if
	' if StrComp(elm,"will") = 0 or StrComp(elm,"would") =0 or StrComp(elm,"can") =0 or StrComp(elm,"could") =0 or StrComp(elm,"shall") =0 or StrComp(elm,"should") = 0 Then
		  ' ftre=1
		  ' tense="ftre"
		  ' ' rs.Open "Select future from tab_verb where verbs='"+mainverb+"_firstperson'", Conn 
           ' ' Assamese_String=Assamese_String+rs.Fields(0).value+" " 
           ' ' rs.close
	' end if
	' if StrComp(elm,"had") = 0 or StrComp(elm,"have") =0 or StrComp(elm,"have been")=0 or StrComp(elm,"had been") = 0 Then
		  ' pst=1
		  ' tense="pst"
		 
	' end if
	
	' foundto=0
	' Next
	' For Each itm in eng_array
	    ' if foundto=1  then
		 ' mainverb=itm
		 ' ftre=1
		 ' end if
		
	    ' if StrComp(itm,"to",0) =0 then
		  ' Response.Write "found"
		  ' foundto=1
	    ' end if
	 
	
	Next
	Response.Write mainverb
	conn.close
	%>
	<br/> The generated context is: 
	<table border=1>
	<tr>
	  <td> singular </td><td> plural</td><td>firstperson </td><td> secondperson</td><td> thirdperson</td><td> heavy</td><td> light</td><td>prst </td><td> pst </td><td> ftre</td>
	</tr>
	<tr>
	 <td><%Response.Write(sglr)%></td> 
    <td><%Response.Write(plrl)%></td> 
	<td><%Response.Write(firstperson)%></td> 
	<td><%Response.Write(secondperson)%></td>
	<td><%Response.Write(thirdperson)%></td>
	<td><%Response.Write(heavy)%></td> 
	<td><%Response.Write(light)%></td>
	 <td><%Response.Write(prst)%></td> 
	 <td><%Response.Write(pst)%></td> 
	 <td><% Response.Write(ftre)%></td>
	 </tr>
	 </table>
	 <% ' future 
	    conn.open
		if firstperson =0 and secondperson =0  and thirdperson=0 then
		  firstperson=1
		  end if
	    ' if ftre=1 and firstperson=1 Then
	    ' rs.Open "Select future from tab_verb where verbs='"+mainverb+"_firstperson'", Conn 
        ' Assamese_String=Assamese_String+rs.Fields(0).value+" " 
        ' rs.close
		' elseif ftre=1 and secondperson=1 Then
		' rs.Open "Select future from tab_verb where verbs='"+mainverb+"_secondperson'", Conn 
        ' Assamese_String=Assamese_String+rs.Fields(0).value+" " 
        ' rs.close
	    ' endif
		' else if ftre=1 and thirdperson=1 Then
		' rs.Open "Select future from tab_verb where verbs='"+mainverb+"_thirdperson'", Conn 
        ' Assamese_String=Assamese_String+rs.Fields(0).value+" " 
        ' rs.close
		
		' ' present 
		' else if prst=1 and firstperson=1 Then
	    ' rs.Open "Select present from tab_verb where verbs='"+mainverb+"_firstperson'", Conn 
        ' Assamese_String=Assamese_String+rs.Fields(0).value+" " 
        ' rs.close
		' end if
		' else if prst=1 and secondperson=1 Then
		' rs.Open "Select present from tab_verb where verbs='"+mainverb+"_secondperson'", Conn 
        ' Assamese_String=Assamese_String+rs.Fields(0).value+" " 
        ' rs.close
		' end if
		' else if prst=1 and thirdperson=1 Then
		' rs.Open "Select present from tab_verb where verbs='"+mainverb+"_thirdperson'", Conn 
        ' Assamese_String=Assamese_String+rs.Fields(0).value+" " 
        ' rs.close
		' end if
		' ' past 
		' else if pst=1 and firstperson=1 Then
	    ' rs.Open "Select past from tab_verb where verbs='"+mainverb+"_firstperson'", Conn 
        ' Assamese_String=Assamese_String+rs.Fields(0).value+" " 
        ' rs.close
		' end if
		' else if pst=1 and secondperson=1 Then
		' rs.Open "Select past from tab_verb where verbs='"+mainverb+"_secondperson'", Conn 
        ' Assamese_String=Assamese_String+rs.Fields(0).value+" " 
        ' rs.close
		' end if
		' else if pst=1 and thirdperson=1 Then
		' rs.Open "Select past from tab_verb where verbs='"+mainverb+"_thirdperson'", Conn 
        ' Assamese_String=Assamese_String+rs.Fields(0).value+" " 
        ' rs.close
		' end if
		
		
	'end if
	conn.close
	 %>
	<br/> The generated Assamese Translation is: <br/>
	<% Response.Write(Assamese_String) %>
 


</body>
</html>