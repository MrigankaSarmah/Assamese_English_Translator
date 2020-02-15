
<!DOCTYPE html>
<%@ CODEPAGE=65001%>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html;charset=UTF-8">
<TITLE> Assamese To English</TITLE>
</HEAD>
<html>
<body>

<%
Set Conn = Server.CreateObject("ADODB.Connection")
DSNtest="DRIVER={Microsoft Access Driver (*.mdb)}; "
DSNtest=dsntest & "DBQ=c:\inetpub\wwwroot\aananlp.mdb" 
Conn.Open DSNtest
%>
<%  English_String=""
    set rs = Server.CreateObject("ADODB.recordset")%>
    
    <table border="1" width="10%" ><FONT FACE="GIST-SND-DVOTDhruv" COLOR=#000000></table>
	<% 
	Noun=""
	Nounmodifier=""
	Verb=""
	Subject=""
	SentenceVoice=0
	VerbString=""
	NounString=""
	singplrl=""
	sing=""
	plrl=""
	Tense=""
	Nounnotdone=1
	Verbnotdone=1
	Pronounnotdone=1
	Auxsing=""
	Auxplrl=""
	Auxverb=""
    ' rs.Open "Select * from tab_asverb", Conn 
   	' Do Until rs.eof
       ' for each x in rs.Fields
	    ' Response.Write x.value
	   
	   ' Next
	   ' rs.MoveNext
    ' Loop
	' rs.close
	Response.Write("string in english is: "+Request.QueryString("as_text")) 
	Assamese_str=Request.QueryString("as_text")
	Assamese_array=split(Assamese_str," ")
	
	
	
	for each elem in Assamese_array 
	  if Pronounnotdone=1 Then
	    rs.open "Select translation,voice,sing_plrl from tab_aspronoun where assamese_pronoun='"+elem+"'" ,Conn
	    if not rs.eof Then
	      SentenceVoice=rs.Fields(1).value
		  Subject=rs.Fields(0).value
		  singplrl=rs.Fields(2).value
		  SubjectString=SubjectString+" "+Subject+" "
		  Pronounnotdone=0
	    end if
	    rs.close
	  end if
	  if Verbnotdone=1 Then
	    rs.open "Select adjective_s,root,tense,adjective_s from tab_asverb where assamese_verb='"+elem+"'" ,Conn
	    if not rs.eof Then
	      Tense=rs.Fields(2).value
		  Verb=rs.Fields(1).value
		  sing=rs.Fields(0).value
		  plrl=rs.Fields(3).value
		  Verbnotdone=0
		end if
		rs.close
	  
	  end if
	  
	  'Second Verb or Auxillary verb
	  if Verbnotdone=0 Then
	    rs.open "Select adjective_s,root,tense,adjective_s from tab_asverb where assamese_verb='"+elem+"'" ,Conn
	    if not rs.eof Then
	      Tense=rs.Fields(2).value
		  Auxverb=rs.Fields(1).value
		  Auxsing=rs.Fields(0).value
		  Auxplrl=rs.Fields(3).value
		  Verbnotdone=0
		end if
		rs.close
	  
	  end if
	  
	  if Nounnotdone=1 Then
	    rs.open "Select english,plural_modifier from tab_asnoun where assamese='"+elem+"'" ,Conn
	    if not rs.eof Then
		  Noun=rs.Fields(0).value
		  Nounmodifier=rs.Fields(1).value
		  Nounnotdone=0
		  NounString=NounString+" "+Noun+Nounmodifier
		end if
		rs.close
	  
	  end if
	next
	
	' After Parsing
	if singplrl="s" Then
	  VerbString=VerbString+" "+Auxsing+" "+AuxVerb+","
	elseif singplrl="p" Then
	  VerbString=VerbString+" "+Auxplrl+" "+AuxVerb+","
	end if
	
	'Addition of main verb
	if singplrl="s" Then
	  VerbString=VerbString+" "+sing+" "+Verb
	elseif singplrl="p" Then
	  VerbString=VerbString+" "+plrl+" "+Verb
	end if
	 %>
    <%
		    
	conn.close
	 %>
	<br/> The generated English Translation is: <br/>
	<% Response.Write(SubjectString+" "+VerbString+" "+NounString+" ") %>
 


</body>
</html>