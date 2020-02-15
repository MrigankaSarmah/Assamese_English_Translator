
<!DOCTYPE html>
<%@ CODEPAGE=65001%>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html;charset=UTF-8">
<TITLE> Assamese To English</TITLE>
</HEAD>
<html>
<body>
<script>
document.cookie="EngStrUtch=x;"
document.cookie="QHStrUtch=y;"
</script>
<%
Set Conn = Server.CreateObject("ADODB.Connection")
DSNtest1="DRIVER={Microsoft Access Driver (*.mdb)}; "
DSNtest1=dsntest1 & "DBQ=D:\INETPUB\VHOSTS\aanaadtu.com\httpdocs\aananlp.mdb" 
Conn.Open DSNtest1
%>
<%  English_String=""
    set rs = Server.CreateObject("ADODB.recordset")%>
    
    <table border="1" width="10%" ><FONT FACE="GIST-SND-DVOTDhruv" COLOR=#000000></table>
	<%
	Limit=0
	 rs.open "Select count(*) from tab_assentences WHERE category='"+Request.QueryString("Pgrq")+"'", Conn
		if rs.eof Then
			'pass
		else
			Limit=rs.Fields(0).value
		end if
	 rs.close
	 rs.open "select Assamese,English,EnglishUtcharan,Category from tab_assentences WHERE Category='"+Request.QueryString("Pgrq")+"'ORDER BY English", Conn 
			if rs.eof Then
				'Do Search
				
			else
			     Response.write ("<h1 align=center>English to Assamese  Translation</h1>")
				 Response.Write ("<h3 align=center>Chosen Category   &nbsp&nbsp:"+Request.QueryString("Pgrq")+"</h1><br/><br/>")
				 Response.write ("<table name=tab id=englishtable border=1 align=center>")
				 Response.write ("<tr>")
				  
				 Response.Write ("<th>অসমীয়া  বাক্য <br/>(Assamese Sentence)</th>")
				 Response.Write ("<th>ঈংৰাজী অনুবাদ <br/>(English Translation)</th>")
				 Response.Write ("<th>ঈংৰাজী  উচ্চাৰণ<br/> (English Pronunciation)</th>")
				  Response.Write ("<th>শুনা <br/>(Listen)</th>")
				 Response.Write ("</tr>")
				  for count=0 to Limit-1
					Response.Write ("<tr>")
						
						Response.Write ("<td>")
							Response.Write rs.Fields(0).value
						Response.Write ("</td>")
						Response.Write ("<td>")
							Response.Write rs.Fields(1).value
						Response.Write ("</td>")
						Response.Write ("<td>")
							Response.Write rs.Fields(2).value
						Response.Write ("</td>")
						Response.Write ("<td>")
						    
							Response.Write("<button name=say id=btn")
							Response.write (count)
							Response.write (" onClick=tell1(")
							Response.write (count)
							Response.write (")>Say it</button>")
						Response.Write ("</td>")
					Response.Write ("</tr>")
					rs.movenext
				 next
				 Response.write ("</table>")
				 
				 
				 
			end if
	   rs.close
	   Conn.close
	%>
	<script>
	 var txt=""
	 var utter=new SpeechSynthesisUtterance();
	 utter.voice=speechSynthesis.getVoices()[9]  ;
	 function getCookie(cname)
	 {
	    var name=cname+"=";
		var decodedCookie=decodeURIComponent(document.cookie);
		var ca=decodedCookie.split(';');
		for(var i=0; i< ca.length;i++)
		{	
			var c=ca[i];
			while(c.charAt(0)==' '){
				c=c.substring(1);
			}
			if(c.indexOf(name)==0)
			{
				var DATASPK=c.substring(name.length,c.length);
				
				return DATASPK;
			}
		}
	 }
	
	 
	 function tell1(count)
	 {
	   utter.voice=speechSynthesis.getVoices()[9]  ;
	   x=document.getElementById("englishtable").rows[count+1].cells[1].innerHTML;
	   EngStrUtchnew=x;
	   txt="";
	   txt=x;
	   utter.text=txt;
	   speechSynthesis.speak(utter);
	   
	  }
	 
	 </script>
	
     

</body>
</html>