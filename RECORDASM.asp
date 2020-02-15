
<!DOCTYPE html>
<%@ CODEPAGE=65001%>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html;charset=UTF-8">
<TITLE> Assamese To English</TITLE>
</HEAD>
<html>

<body>
<h1 align=center>APP for converting English conversation into Assamese and vice-versa</h1>
<h2 align=center>Funded project by Assam Association of North America(AANA)</h2>
<h5 align=center>Project No. : ASDN/CP-004/DEVELOP-AAP/AANA/2018</h5>
<h4 align=center>Developed by Department of Computer Science and Engineering</h4>
<h4 align=center>Assam down town University</h4>
<p align=center><img src="logo.jpg" height=80 width=80/></br>
<p align=center >
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
	  Response.Write("string in assamese is: <font face=ariel color=black size=5 >"+Request.QueryString("as_text")+"</font>") 
	Assamese_str=Request.QueryString("as_text")+" ;"
	Assamese_str="; "+Assamese_str
	Assamese_array=split(Assamese_str," ")
	StatusArray=Array(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
	
	ParseArray=Array(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
	
	
	
	for Iteration=0 to 1 
	
	singplrl=""
	singplrl1=-1
	plrl1done=0
	plrl1="is"
	singplrl2=-1
	plrl2done=0
	plrl2="is"
	singplrl3=-1
	plrl3done=0
	plrl3="is"
	DATADONE=0
	DOER_=""
	DONE_=""
	OBJECT_=""
	TOPERFORMACTION_=""
	WHICHBELONGSTO_=""
	DURING_=""
	FORWHOM_=""
	BELONGSTO_=""
	LOC_=""
	Drink=0
	EatDrink=0
	NEEDGIVEWANTTAKE_=""
	QH_=""
	question=0
	ElementCount=0
	FoundR=0
    AAAAdone=0
	AAAAPNdone=0
	PNDone=0
	
	
	VarTense=""
	VarVoice=""
	PosNeg=""
	SearchString=""
	
	FirstNoun=""
	SecondNoun=""
	ThirdNoun=""
	FirstVerb=""
	SecondVerb=""
	ThirdVerb=""
	foundFirstNoun=0
	foundSecondNoun=0
	foundThirdNoun=0
	foundFirstVerb=0
	foundSecondVerb=0
	foundThirdVerb=0
	Negvrse=0 
	Negvrsenxt=0 
	Negvrseprv=0
	TagKarmaDone=-1
	
	
	 
	
	
	for each elem in Assamese_array
		TotalCount=TotalCount+1
	next
	' ' ' Response.Write "<font color=red> TotalCount:"
	' ' ' Response.Write TotalCount
	' ' ' Response.Write "</font>"
	
	ConnectorArray=Array("","","","","","","","","","","","","","","","","","")
	connectorPointer=0
	
	TermArray=Array("","","","","","","","","","","","","","","","","","","","")
	termPointer=0
	
	qhArray=Array("","","","","","","","","","","","","","","","","","","","","","")
	qhPointer=0
	
	kartaArray=Array("","","","","","","","","","","","","","","","","","","","","","")
	kartaPointer=0
	
	kriyaArray=Array("","","","","","","","","","","","","","","","","","","","","","")
	kriyaPointer=0
	
	karmaArray=Array("","","","","","","","","","","","","","","","","","","","","","")
	karmaPointer=0
	
	
	for each elem in Assamese_array
	         ' ' ' Response.Write "ArrayData/"+Assamese_array(ElementCount)
			 ' ' ' Response.Write "elem:"+elem
		      DATADONE=0
			  VarTense=""
				VarVoice=""
				PosNeg=""
				SearchString=""
			    
			  ' if karmaPointer=0 Then
				 ' karmaPointer=1
			  ' end if
			  ' if kartaPointer=0 Then
				 ' kartaPointer=1
			  ' end if
			  ''''''''''''''''''''''''''''''''''''''''''''''''''''''''
				''''''''''''''''''PREPROCESSING BEGINS HERE''''''''''''''
				''''''''''''''''''''''''''''''''''''''''''''''''''''''
			  if  elem="তোমাৰ"  or Right(elem,3)="জনৰ" or Right(elem,4)="জনীৰ" or Right(elem,3)="খনৰ" or elem="সিহঁতৰ" or elem="মোৰ" or elem="আপোনাৰ" or elem="তাইৰ" or elem="তেঁওৰ" or elem="আমাৰ" or Right(elem,4)="বোৰৰ" or Right(elem,4)="সকলৰ" Then
				TagKarmaDone=0
			  end if
				
			  if elem="আৰু" or elem="কিন্তু" or elem="যদি" or elem="বাবে" or elem="যেতিয়ালৈ"or elem="তেতিয়া"or elem="বা"or elem="যে"or elem="কবা"or elem="কৈছিলো" or elem="কলে"  Then
				rs.open "select translation  from tab_asadditional where term='"+elem+"'",Conn
				if rs.eof Then
					'pass
				else
					    if elem="কবা" or elem="কলে" or elem="কৈছিলো" Then
							kartaArray(kartaPointer)=rs.Fields(0).value
							kartaPointer=kartaPointer+1
						    ' ' Response.write "6"
							
						
						else
							ConnectorArray(connectorPointer)=rs.Fields(0).value
							connectorPointer=connectorPointer+1
							DATADONE=1
						end if
				end if
				rs.close
				
			  end if
			   
			   if DATADONE=0 and elem="খাম" or elem="খাঁও"or elem="খাইছিলো" or elem="খাবা" or elem="খাব" or elem="খালা " or elem="খাই" or elem="খালো" and elem<>";" Then
			     EatDrink=1
				 
			   end if
			   if DATADONE=0 and elem="পানী" or elem="কফি" or elem="গাখীৰ" or elem="চাহ" or elem="বটল" and elem<>";" Then
			     Drink=1
				 
			   end if
			   
			   if DATADONE=0 and ( Right(elem,4)="জনীৰ" or Right(elem,3)="জনৰ" or Right(elem,3)="টোৰ" ) Then
				DATADONE=1
				
				if Right(elem,3)="জনৰ" or Right(elem,3)="টোৰ" Then
					tempelm=Left(elem,len(elem)-3)
				elseif Right(elem,4)="জনীৰ" Then
					tempelm=Left(elem,len(elem)-4)
				end if
				
				rs.open "select english from tab_asnoun where assamese='"+tempelm+"'",Conn
				if rs.eof Then
					'nothing
				else
					' Response.write TagKarmaDone
					if TagKarmaDone=0 Then
						karmaArray(karmaPointer-1)=karmaArray(karmaPointer-1)+" of the "+rs.Fields(0).value
						TagKarmaDone=1
						
					else
						
						kartaArray(kartaPointer)=rs.Fields(0).value
						kartaPointer=kartaPointer+1
					end if
				end if
				
				rs.close
			   end if
			   if  DATADONE=0 and ( Right(elem,2)="নে" or Right(elem,2)="নি" or Right(elem,2)="কৈ" )  Then
				   
					localval=0
					rs.open "select assamese_pronoun,translation from tab_aspronoun where assamese_pronoun='"+elem+"'",Conn
					if rs.eof Then
					else
						localval=1
						
							
					end if
					rs.close
					tempelm=Left(elem,len(elem)-2)
					
					rs.open "select assamese_verb from tab_asverb where assamese_verb='"+tempelm+"'",Conn
				    if rs.eof Then 
					 ' pass
					 
					  if localval=0 Then
							rs.close
							
							rs.open "select translation from tab_asadditional where term='"+tempelm+"'",Conn
							if rs.eof Then
							
							else
							
							kriyaArray(kriyaPointer)=rs.Fields(0).value
							kriyaPointer=kriyaPointer+1
							DATADONE=1
							
							end if
							rs.close
							
					  else
			          rs.close
					  end if
					elseif localval=1 Then
					   
					   
					  'Nothing
					  rs.close
						
					end if
					
					localval=0
			   end if
			   if  DATADONE=0 and Right(elem,4)="নিকি"  Then
				    question=1
				    elem=Left(elem,len(elem)-4)
					
			   end if
			   if  DATADONE=0 and Right(elem,3)="পৰা"  Then
				    
				    
					rs.open "select translation,sing_plrl,voice from tab_aspronoun where assamese_pronoun='"+elem+"'",Conn
					if rs.eof Then
					else
						DATADONE=1
						
						karmaArray(karmaPointer)=rs.Fields(0).value
						karmaPointer=karmaPointer+1
						
						
						
						
						if foundFirstNoun=0 Then
							FirstNoun=rs.Fields(0).value
							foundFirstNoun=1
							StatusArray(ElementCount)="N"
					    elseif foundSecondNoun=0 Then
							SecondNoun=rs.Fields(0).value
							foundSecondNoun=1
							StatusArray(ElementCount)="N"
						elseif foundThirdNoun=0 Then
							ThirdNoun=rs.Fields(0).value
							foundThirdNoun=1
							StatusArray(ElementCount)="N"
						end if
		  
						if singplrl1=-1 Then
					       
						   singplrl=rs.Fields(1).value
						   if singplrl="s" Then
								plrl1="is"
						   elseif singplrl="p" Then
								plrl1="are"
						   end if
						   singplrl1=1
						elseif singplrl2=-1 Then
						   singplrl2=1
						   singplrl=rs.Fields(1).value
						   if singplrl="s" Then
								plrl2="is"
						   elseif singplrl="p" Then
								plrl2="are"
						   end if
						elseif singplrl3=-1 Then 
						   
						   singplrl3=1
						   singplrl=rs.Fields(1).value
						   if singplrl="s" Then
								plrl3="is"
						   elseif singplrl="p" Then
								plrl3="are"
						   end if
						end if
		  
					end if
					rs.close
					
			   end if
			   if  DATADONE=0 and Right(elem,5)="ৰপৰা"  Then
				    
				   tempstr=Left(elem,len(elem)-5)
				   ' ' ' Response.Write "/022/"
				   ' ' ' Response.Write tempstr
				  
				   elem=tempstr
					
					
			   end if
			   
			   ''''''''''''''''''''''''''''''''''''''''''''''''''''''''
				''''''''''''''''''PREPROCESSING ENDS HERE''''''''''''''
				''''''''''''''''''''''''''''''''''''''''''''''''''''''
				
				
				if   DATADONE=0 and (Right(elem,4)="বোৰক" or Right(elem,4)="সকলক" or Right(elem,4)="খিনি" ) and len(elem)>4 and elem<>";" Then
			      
				  ' ' ' Response.Write "?<>?"
				  tempstr=Left(elem,len(elem)-4)
				  ' ' ' Response.Write tempstr
				  rs.open "select plural_modifier  from tab_asnoun where assamese='"+tempstr+"'",Conn
				  if rs.eof Then 
				  'do nothing
					
				  else
						DATADONE=1
						
						karmaArray(karmaPointer)=rs.Fields(0).value
						karmaPointer=karmaPointer+1
						
						
						' ' ' Response.Write rs.Fields(0).value
				       'OBJECT_=OBJECT_+" "+rs.Fields(0).value+" are "
		                if foundFirstNoun=0 Then
							FirstNoun=rs.Fields(0).value
							foundFirstNoun=1
							StatusArray(ElementCount)="N"
					    elseif foundSecondNoun=0 Then
							SecondNoun=rs.Fields(0).value
							foundSecondNoun=1
							StatusArray(ElementCount)="N"
						elseif foundThirdNoun=0 Then
							ThirdNoun=rs.Fields(0).value
							foundThirdNoun=1
							StatusArray(ElementCount)="N"
						end if
				        if singplrl1=-1 Then
					       plrl1="are"
						   singplrl1=1
						elseif singplrl2=-1 Then
						   plrl2="are"
						   singplrl2=1
						elseif singplrl3=-1 Then 
						   plrl3="are"
						   singplrl3=1
						end if
				   end if
				   
				   rs.close
				   
	           elseif DATADONE=0 and (Right(elem,3)="মখা" or Right(elem,3)= "বোৰ" or Right(elem,3)="সকল"   )  and len(elem)>3 and elem<>";" Then
			      
				  tempstr=Left(elem,len(elem)-3)
				  ' ' ' Response.Write tempstr
				  rs.open "select plural_modifier  from tab_asnoun where assamese='"+tempstr+"'",Conn
				   if rs.eof Then 
				      'do nothing
				   else
						DATADONE=1
			          'OBJECT_=OBJECT_+" "+rs.Fields(0).value+" are "
					  if TagKarmaDone=0 Then
						  karmaArray(karmaPointer-1)= karmaArray(karmaPointer-1)+" "+rs.Fields(0).value
						  TagKarmaDone=1
						  '' no increment in pointer...append prev. karmabibhakti
					  else
						  kartaArray(kartaPointer)=rs.Fields(0).value
						  kartaPointer=kartaPointer+1
						  ' ' Response.write "4"
					  end if
					  
					  
		              if foundFirstNoun=0 Then
							FirstNoun=rs.Fields(0).value
							foundFirstNoun=1
							StatusArray(ElementCount)="N"
					    elseif foundSecondNoun=0 Then
							SecondNoun=rs.Fields(0).value
							foundSecondNoun=1
							StatusArray(ElementCount)="N"
						elseif foundThirdNoun=0 Then
							ThirdNoun=rs.Fields(0).value
							foundThirdNoun=1
							StatusArray(ElementCount)="N"
						end if
				      if singplrl1=-1 Then
					       plrl1="are"
						   singplrl1=1
						elseif singplrl2=-1 Then
						   plrl2="are"
						   singplrl2=1
						elseif singplrl3=-1 Then 
						   plrl3="are"
						   singplrl3=1
						end if
				   end if
				   rs.close
				   ' ' ' Response.Write "/"+FirstNoun
				   
		  elseif DATADONE=0 and Right(elem,3)="টোক" or Right(elem,3)="পৰা"  or Right(elem,3)="জনক"  and len(elem)>3 and elem<>";" Then
				 
				 tempstr=Left(elem,len(elem)-3)
				 ' ' ' Response.Write "/020/"
				  ' ' ' Response.Write tempstr
				  rs.open "select english  from tab_asnoun where assamese='"+tempstr+"'",Conn
				   if rs.eof Then 
				      'do nothing
				   else
						DATADONE=1
						
						
						karmaArray(karmaPointer)=rs.Fields(0).value
						karmaPointer=karmaPointer+1
						
						
						
						
						' ' ' Response.Write rs.Fields(0).value
			          'OBJECT_=OBJECT_+" "+rs.Fields(0).value+" are "
		              if foundFirstNoun=0 Then
							FirstNoun=rs.Fields(0).value
							foundFirstNoun=1
							StatusArray(ElementCount)="N"
					    elseif foundSecondNoun=0 Then
							SecondNoun=rs.Fields(0).value
							foundSecondNoun=1
							StatusArray(ElementCount)="N"
						elseif foundThirdNoun=0 Then
							ThirdNoun=rs.Fields(0).value
							foundThirdNoun=1
							StatusArray(ElementCount)="N"
						end if
				      if singplrl1=-1 Then
					       plrl1="are"
						   singplrl1=1
						elseif singplrl2=-1 Then
						   plrl2="are"
						   singplrl2=1
						elseif singplrl3=-1 Then 
						   plrl3="are"
						   singplrl3=1
						end if
				   end if
				   rs.close
		  elseif DATADONE=0 and (Right(elem,2)="টো" or Right(elem,2)="কণ"  or  Right(elem,2)="লৈ"  or  Right(elem,2)="খন" or Right(elem,2)="জন" or Right(elem,2)="ৱে") and Right(elem,4)<>"খনলৈ" and len(elem)>2 and elem<>";" Then
			     
				  ' ' ' Response.Write elem
			      tempstr=Left(elem,len(elem)-2)
				   ' ' ' Response.Write "\??"+tempstr+"\"
			      rs.open "select english  from tab_asnoun where assamese='"+tempstr+"'",Conn
			       if rs.eof Then 
				      'do nothin
					  
				   else
					 DATADONE=1
					 
				     'OBJECT_=OBJECT_+" "+rs.Fields(0).value+" is "
					 
					    if Right(elem,2)="লৈ"  Then
							karmaArray(karmaPointer)=rs.Fields(0).value
							karmaPointer=karmaPointer+1
						else
							if TagKarmaDone=0 Then
								karmaArray(karmaPointer-1)=karmaArray(karmaPointer-1)+" "+rs.Fields(0).value
								TagKarmaDone=1
							else
								kartaArray(kartaPointer)=rs.Fields(0).value
								kartaPointer=kartaPointer+1
							end if
							
							
							elem=Left(elem,len(elem)-2)
							
							if foundFirstNoun=0 Then
								FirstNoun=rs.Fields(0).value
								foundFirstNoun=1
								StatusArray(ElementCount)="N"
								if Right(elem,2)="লৈ" Then
								   FirstNoun="to "+FirstNoun
								end if
							elseif foundSecondNoun=0 Then
								SecondNoun=rs.Fields(0).value
								foundSecondNoun=1
								StatusArray(ElementCount)="N"
								if Right(elem,2)="লৈ" Then
								   SecondNoun="to "+SecondNoun
								end if
							elseif foundThirdNoun=0 Then
								ThirdNoun=rs.Fields(0).value
								foundThirdNoun=1
								StatusArray(ElementCount)="N"
								if Right(elem,2)="লৈ" Then
								   ThirdNoun="to "+ThirdNoun
								end if
							end if
						end if
					    
				    if singplrl1=-1 Then
					       plrl1="is"
						   singplrl1=1
						elseif singplrl2=-1 Then
						   plrl2="is"
						   singplrl2=1
						elseif singplrl3=-1 Then 
						   plrl3="is"
						   singplrl3=1
						end if
				   end if
				   rs.close
	        elseif  DATADONE=0 and ( Right(elem,4)="যোপা" or Right(elem,4)="খনলৈ" or Right(elem,4)="টোল‍ৈ" or Right(elem,4)="টোৱে" ) and len(elem)>4 and elem<>";"  Then
			      
				  tempstr=Left(elem,len(elem)-4)
				  ' ' ' Response.Write tempstr
			      rs.open "select english  from tab_asnoun where assamese='"+tempstr+"'",Conn
			       if rs.eof Then 
				  'do nothing
				   else
				   
						if Right(elem,4)="খনলৈ" or Right(elem,4)="টোল‍ৈ" Then
						
							karmaArray(karmaPointer)=rs.Fields(0).value
							karmaPointer=karmaPointer+1
						else
						        if TagKarmaDone=0 Then
									karmaArray(karmaPointer-1)=karmaArray(karmaPointer-1)+" "+rs.Fields(0).value
									TagKarmaDone=1
								else
								
									kartaArray(kartaPointer)=rs.Fields(0).value
									kartaPointer=kartaPointer+1
									' ' Response.write "3"
								end if
								
								
								DATADONE=1
							  'OBJECT_=OBJECT_+" "+rs.Fields(0).value+" are "
								if foundFirstNoun=0 Then
									FirstNoun=rs.Fields(0).value
									foundFirstNoun=1
									StatusArray(ElementCount)="N"
								elseif foundSecondNoun=0 Then
									SecondNoun=rs.Fields(0).value
									foundSecondNoun=1
									StatusArray(ElementCount)="N"
								elseif foundThirdNoun=0 Then
									ThirdNoun=rs.Fields(0).value
									foundThirdNoun=1
									StatusArray(ElementCount)="N"
								end if
								if singplrl1=-1 Then
								   plrl1="is"
								   singplrl1=1
								elseif singplrl2=-1 Then
								   plrl2="is"
								   singplrl2=1
								elseif singplrl3=-1 Then 
								   plrl3="is"
								   singplrl3=1
								end if
						end if
				  end if
				  rs.close
			 elseif DATADONE=0 and (Right(elem,5)="বোৰল‍ৈ" or Right(elem,5)="সকলল‍ৈ" )and len(elem)>5 and elem<>";" Then
			      
				  tempstr=Left(elem,len(elem)-5)
				  ' ' ' Response.Write tempstr
			      rs.open "select english  from tab_asnoun where assamese='"+tempstr+"'",Conn
			       if rs.eof Then 
				  'do nothing
				   else
						DATADONE=1
						
						karmaArray(karmaPointer)=rs.Fields(0).value
						karmaPointer=karmaPointer+1
						
				      'OBJECT_=OBJECT_+" "+rs.Fields(0).value+" are "
		                if foundFirstNoun=0 Then
							FirstNoun=rs.Fields(0).value
							foundFirstNoun=1
							StatusArray(ElementCount)="N"
					    elseif foundSecondNoun=0 Then
							SecondNoun=rs.Fields(0).value
							foundSecondNoun=1
							StatusArray(ElementCount)="N"
						elseif foundThirdNoun=0 Then
							ThirdNoun=rs.Fields(0).value
							foundThirdNoun=1
							StatusArray(ElementCount)="N"
						end if
				       if singplrl1=-1 Then
					       plrl1="are"
						   singplrl1=1
						elseif singplrl2=-1 Then
						   plrl2="are"
						   singplrl2=1
						elseif singplrl3=-1 Then 
						   plrl3="are"
						   singplrl3=1
						end if
				  end if
				  rs.close
			elseif  DATADONE=0 and elem<>";" Then
			        ' ' ' Response.Write "/ErrorRegion1/"
					' ' ' Response.Write elem
					
					rs.open "select english from tab_asnoun where assamese='"+elem+"'",Conn
			        if rs.eof Then 
				      'do nothing
					    ' ' ' Response.Write "/ErrorRegion2/"
						rs.close
				    else
						DATADONE=1
						if TagKarmaDone=0 Then
							karmaArray(karmaPointer-1)=karmaArray(karmaPointer-1)+" "+rs.Fields(0).value
							TagKarmaDone=1
						else
						
							kartaArray(kartaPointer)=rs.Fields(0).value
							kartaPointer=kartaPointer+1
						end if
						' ' ' Response.Write "/ErrorRegion3/"
				      'OBJECT_=OBJECT_+" "+rs.Fields(0).value+" are "
		                if foundFirstNoun=0 Then
							FirstNoun=rs.Fields(0).value
							foundFirstNoun=1
							StatusArray(ElementCount)="N"
					    elseif foundSecondNoun=0 Then
							SecondNoun=rs.Fields(0).value
							foundSecondNoun=1
							StatusArray(ElementCount)="N"
						elseif foundThirdNoun=0 Then
							ThirdNoun=rs.Fields(0).value
							foundThirdNoun=1
							StatusArray(ElementCount)="N"
						end if
						rs.close
				      sing=1
				    end if
				    
			end if
	 
	
		' ' ' Response.Write "/REgion/"
		
		if elem=";" Then
		   'donothing
		   ' ' ' Response.Write "/Semi_colon/"
	    elseif DATADONE=0 and elem="মই"  or elem="আমি" or elem="সিহঁত" or elem="তাই" or elem="সি" or elem="আপোনি" or elem="আপোনাক" or elem="আপোনালোকক" or elem="আপোনালোক" Then
			DATADONE=1
			
			
				 
				 rs.open "select translation,sing_plrl from tab_aspronoun where assamese_pronoun='"+elem+"'",Conn
				  'DOER_=DOER_+" "+rs.Fields(0).value
				  
				  if elem="আপোনাক" or elem="আপোনালোকক" Then
						karmaArray(karmaPointer)=rs.Fields(0).value
						karmaPointer=karmaPointer+1
					else
					     if TagKarmaDone=0 Then
							karmaArray(karmaPointer-1)=karmaArray(karmaPointer-1)+" "+rs.Fields(0).value
							TagKarmaDone=1
						 else
						 
							 kartaArray(kartaPointer)=rs.Fields(0).value
							 kartaPointer=kartaPointer+1
							 ' ' Response.write "2"
						end if
					end if
								
								
								if foundFirstNoun=0 Then
									FirstNoun=rs.Fields(0).value
									foundFirstNoun=1
									StatusArray(ElementCount)="N"
								elseif foundSecondNoun=0 Then
									SecondNoun=rs.Fields(0).value
									foundSecondNoun=1
									StatusArray(ElementCount)="N"
								elseif foundThirdNoun=0 Then
									ThirdNoun=rs.Fields(0).value
									foundThirdNoun=1
									StatusArray(ElementCount)="N"
								end if
				  
								if singplrl1=-1 Then
								   
								   singplrl=rs.Fields(1).value
								   if singplrl="s" Then
										plrl1="is"
								   elseif singplrl="p" Then
										plrl1="are"
								   end if
								   singplrl1=1
								elseif singplrl2=-1 Then
								   singplrl2=1
								   singplrl=rs.Fields(1).value
								   if singplrl="s" Then
										plrl2="is"
								   elseif singplrl="p" Then
										plrl2="are"
								   end if
								elseif singplrl3=-1 Then 
								   
								   singplrl3=1
								   singplrl=rs.Fields(1).value
								   if singplrl="s" Then
										plrl3="is"
								   elseif singplrl="p" Then
										plrl3="are"
								   end if
								end if
					
		  
		  rs.close 
			
		elseif DATADONE=0 and elem="মোক" or elem="আমাক" or elem="সিহঁতক" or elem="তাক" or elem="তোমাক"  Then
		   DATADONE=1
		   rs.open "select translation,sing_plrl from tab_aspronoun where assamese_pronoun='"+elem+"'",Conn
		   'FORWHOM_= FORWHOM_+rs.Fields(0).value
						
						karmaArray(karmaPointer)=rs.Fields(0).value
						karmaPointer=karmaPointer+1
						
						
						if foundFirstNoun=0 Then
							FirstNoun=rs.Fields(0).value
							foundFirstNoun=1
							StatusArray(ElementCount)="N"
					    elseif foundSecondNoun=0 Then
							SecondNoun=rs.Fields(0).value
							foundSecondNoun=1
							StatusArray(ElementCount)="N"
						elseif foundThirdNoun=0 Then
							ThirdNoun=rs.Fields(0).value
							foundThirdNoun=1
							StatusArray(ElementCount)="N"
						end if
						if singplrl1=-1 Then
					       
						   singplrl=rs.Fields(1).value
						   if singplrl="s" Then
								plrl1="is"
						   elseif singplrl="p" Then
								plrl1="are"
						   end if
						   singplrl1=1
						elseif singplrl2=-1 Then
						   singplrl2=1
						   singplrl=rs.Fields(1).value
						   if singplrl="s" Then
								plrl2="is"
						   elseif singplrl="p" Then
								plrl2="are"
						   end if
						elseif singplrl3=-1 Then 
						   
						   singplrl3=1
						   singplrl=rs.Fields(1).value
						   if singplrl="s" Then
								plrl3="is"
						   elseif singplrl="p" Then
								plrl3="are"
						   end if
						end if
		   rs.close
			
		elseif  DATADONE=0 and elem="আমাৰ" or elem="তাৰ" or elem="সিহঁতৰ" or elem="মোৰ" or elem="তোমাৰ" or elem="তুমি" or elem="আপুনি" or elem="সিহঁতে"  Then
		   DATADONE=1
		   rs.open "select translation,sing_plrl from tab_aspronoun where assamese_pronoun='"+elem+"'",Conn
		   'BELONGSTO_=BELONGSTO_+" "+rs.Fields(0).value
						
						if elem="তুমি" or elem="সিহঁতে" or elem="আপুনি" Then
						   
							kartaArray(kartaPointer)=rs.Fields(0).value
							kartaPointer=kartaPointer+1
							' ' Response.write "1"
						else
							karmaArray(karmaPointer)=rs.Fields(0).value
							karmaPointer=karmaPointer+1
							' ' Response.write "1"
						end if
						
						
						if foundFirstNoun=0 Then
							FirstNoun=rs.Fields(0).value
							foundFirstNoun=1
							StatusArray(ElementCount)="N"
					    elseif foundSecondNoun=0 Then
							SecondNoun=rs.Fields(0).value
							foundSecondNoun=1
							StatusArray(ElementCount)="N"
						elseif foundThirdNoun=0 Then
							ThirdNoun=rs.Fields(0).value
							foundThirdNoun=1
							StatusArray(ElementCount)="N"
						end if
					' ' ' Response.Write "BELONGSTO_"
						if singplrl1=-1 Then
					       
						   singplrl=rs.Fields(1).value
						   if singplrl="s" Then
								plrl1="is"
						   elseif singplrl="p" Then
								plrl1="are"
						   end if
						   singplrl1=1
						elseif singplrl2=-1 Then
						   singplrl2=1
						   singplrl=rs.Fields(1).value
						   if singplrl="s" Then
								plrl2="is"
						   elseif singplrl="p" Then
								plrl2="are"
						   end if
						elseif singplrl3=-1 Then 
						   
						   singplrl3=1
						   singplrl=rs.Fields(1).value
						   if singplrl="s" Then
								plrl3="is"
						   elseif singplrl="p" Then
								plrl3="are"
						   end if
						end if
		   rs.close
			
		elseif DATADONE=0 and elem="তাৰপৰা" or elem="ইয়ালৈ" or elem="ইয়াৰপৰা" or elem="তালৈ" Then
		   DATADONE=1
		   rs.open "select translation from tab_aspronoun where assamese_pronoun='"+elem+"'",Conn
		   'LOC_=LOC_+" "+rs.Fields(0).value
		   
						karmaArray(karmaPointer)=rs.Fields(0).value
						karmaPointer=karmaPointer+1
						
		   
						if foundFirstNoun=0 Then
							FirstNoun=rs.Fields(0).value
							foundFirstNoun=1
							StatusArray(ElementCount)="N"
					    elseif foundSecondNoun=0 Then
							SecondNoun=rs.Fields(0).value
							foundSecondNoun=1
							StatusArray(ElementCount)="N"
						elseif foundThirdNoun=0 Then
							ThirdNoun=rs.Fields(0).value
							foundThirdNoun=1
							StatusArray(ElementCount)="N"
						end if
		   rs.close
			
		elseif DATADONE=0 and elem="কি" or elem="কিয়" or elem="কেতিয়া" or elem="কেনেকৈ" or elem="কেনে" or elem="ক’ত" or elem="কিমান" or elem="কোনে" Then
		   DATADONE=1
		   ' ' ' Response.Write "QH:"+elem
		   rs.open "select translation from tab_aspronoun where assamese_pronoun='"+elem+"'",Conn
		   '' ' ' Response.Write rs.Fields(0).value
		   QH_=QH_+" "+rs.Fields(0).value
		   StatusArray(ElementCount)="Q"
		   question=1
		   ' ' ' Response.Write QH_
		   
		   if elem="কেতিয়া" Then
				karmaArray(karmaPointer-1)="at"+" "+karmaArray(karmaPointer-1)
		   end if
		   qhArray(qhPointer)=rs.Fields(0).value
		   qhPointer=qhPointer+1
		   
		   if plrl="" Then
			plrl="is"
		   end if
		   rs.close
		elseif DATADONE=0 and elem="যি" or elem="যেতিয়া" or elem="যেনেকৈ" or elem="য’ত" or elem="যিমান" or elem="যোনে" Then
		   DATADONE=1
		   ' ' ' Response.Write "QH:"+elem
		   rs.open "select translation from tab_aspronoun where assamese_pronoun='"+elem+"'",Conn
		   '' ' ' Response.Write rs.Fields(0).value
		   Terms=Terms+" "+rs.Fields(0).value
		   StatusArray(ElementCount)="Q"
		   question=0
		   ' ' ' Response.Write Terms
		   
		   TermArray(termPointer)=rs.Fields(0).value
		   termPointer=termPointer+1
		   
		   if plrl="" Then
			plrl="is"
		   end if
		   rs.close 
		elseif DATADONE=0 and Right(elem,1)="ত" Then
			tempstr=Left(elem,len(elem)-1)
			' Response.write tempstr
			rs.open "select english  from tab_asnoun where assamese='"+tempstr+"'",Conn
			if rs.eof Then
				rs.close
				rs.open "select root  from tab_asverb where assamese_verb='"+tempstr+"'",Conn
				if rs.eof Then
					'nothing
				else
					 
					kriyaArray(kriyaPointer)="in "+kriyaArray(kriyaPointer)+" "+rs.Fields(0).value
					kriyaPointer=kriyaPointer+1
				end if
				
				rs.close
			elseif FoundR=1 Then
			    
				karmaArray(karmaPointer-1)="in "+karmaArray(karmaPointer-1)+" "+rs.Fields(0).value
			    karmaArray(karmaPointer)=""
				karmaPointer=karmaPointer-1
				rs.close
			else
			    karmaArray(karmaPointer)="in "+kartaArray(kartaPointer-1)+" "+rs.Fields(0).value
			    
				karmaPointer=karmaPointer+1
	
				kartaArray(kartaPointer)=""
				kartaPointer=kartaPointer-1
			   rs.close
			end if
			
	    elseif DATADONE=0 and Right(elem,1)="ৰ" Then
			tempstr=Left(elem,len(elem)-1)
			FoundR=1
			' Response.write tempstr+" "
			rs.open "select english  from tab_asnoun where assamese='"+tempstr+"'",Conn
			if rs.eof Then
				rs.close
				rs.open "select root  from tab_asverb where assamese_verb='"+tempstr+"'",Conn
				if rs.eof Then
					'nothing
					rs.close
					
					
					rs.open "select translation from tab_aspronoun where assamese_pronoun='"+tempstr+"'",Conn
					if rs.eof Then
						'nothing
						rs.close
						
						rs. open "select translation from tab_asadditional where term='"+tempstr+"'",Conn
						if rs.eof Then
							rs.close
							'do nothing
						else 
							karmaArray(karmaPointer)="from "+rs.Fields(0).value
							karmaPointer=karmaPointer+1
							DATADONE=1
							rs.close
						
						end if
					else
						
						karmaArray(karmaPointer)=rs.Fields(0).value
						karmaPointer=karmaPointer+1
						DATADONE=1
						rs.close
					end if
					
					
				else
					kriyaArray(kriyaPointer)="from "+rs.Fields(0).value
					kriyaPointer=kriyaPointer+1
					DATADONE=1
					rs.close
				end if
				
				
			else
				karmaArray(karmaPointer)="from "+rs.Fields(0).value
				karmaPointer=karmaPointer+1
				DATADONE=1
				rs.close
			end if
			
			
			
		elseif DATADONE=0 and elem="সেইবোৰ" or elem="সেই" or elem="এই" or elem="এইবোৰ"   Then
				DATADONE=1
		      rs.open "select translation,sing_plrl  from tab_aspronoun where assamese_pronoun='"+elem+"'",Conn
			  'PRONOUN_=PRONOUN_+" "+rs.Fields("translation").value
			  'OBJECT_=PRONOUN_+OBJECT_
			  
			            if TagKarmaDone=0 Then
							karmaArray(karmaPointer-1)=karmaArray(karmaPointer-1)+" "+rs.Fields(0).value
							TagKarmaDone=1
						else
						
							kartaArray(kartaPointer)=rs.Fields(0).value
							kartaPointer=kartaPointer+1
						end if
						
						if foundFirstNoun=0 Then
							FirstNoun=rs.Fields(0).value
							foundFirstNoun=1
							StatusArray(ElementCount)="N"
					    elseif foundSecondNoun=0 Then
							SecondNoun=rs.Fields(0).value
							foundSecondNoun=1
							StatusArray(ElementCount)="N"
						elseif foundThirdNoun=0 Then
							ThirdNoun=rs.Fields(0).value
							foundThirdNoun=1
							StatusArray(ElementCount)="N"
						end if
						if singplrl1=-1 Then
					       
						   singplrl=rs.Fields(1).value
						   if singplrl="s" Then
								plrl1="is"
						   elseif singplrl="p" Then
								plrl1="are"
						   end if
						   singplrl1=1
						elseif singplrl2=-1 Then
						   singplrl2=1
						   singplrl=rs.Fields(1).value
						   if singplrl="s" Then
								plrl2="is"
						   elseif singplrl="p" Then
								plrl2="are"
						   end if
						elseif singplrl3=-1 Then 
						   singplrl3=1
						   singplrl=rs.Fields(1).value
						   
						   if singplrl="s" Then
								plrl3="is"
						   elseif singplrl="p" Then
								plrl3="are"
						   end if
						end if
		      rs.close
		   	  
		elseif DATADONE=0 and elem<>";" Then   
		
				' ' ' Response.Write "/Verb$%/"
				' ' ' Response.Write plrl1
				' ' ' Response.Write plrl2
				' ' ' Response.Write plrl3
			    ' ' ' Response.Write "/last"+elem+"/"
				' ' ' Response.Write Assamese_array(ElementCount+1)
		
				'// FOR OTHER TERMS
			    
				
				'***   FOR VERBS
				if EatDrink=1 and Drink=1 Then
					   elem="প"+elem
			    end if
				
				if plrl1="is" and plrl1done=0 Then
					SINGPLRLDATA="adjective_s"
					plrl1done=1
				elseif plrl1="are" and plrl1done=0  Then
					SINGPLRLDATA="adjective_p"
					plrl1done=1
				
				end if
				
				
				
				              '' ''''''''''''''''''''''''''''''''''''''''''''''
							  '''''''For Determining Tense and Voice''''''''''''
							  ''''''''''''''''''''''''''''''''''''''''''''''''''
				
				if Assamese_array(ElementCount+1)="হৈছো" Then
				    VarTense="prst"
					VarVoice="1p"
					
				elseif Assamese_array(ElementCount+1)="হৈছা" Then
				    VarTense="prst"
					VarVoice="2p"
				elseif Assamese_array(ElementCount+1)="হৈছে" Then
				    VarTense="prst"
					VarVoice="3p"
				elseif Assamese_array(ElementCount+1)="হ’ল" Then
				    VarTense="prst"
					VarVoice="3p"
				elseif Assamese_array(ElementCount+1)="হৈছিলোঁ" Then
				    VarTense="pst"
					VarVoice="1p"
				elseif Assamese_array(ElementCount+1)="হলা" Then
				    VarTense="pst"
					VarVoice="2p"
				elseif Assamese_array(ElementCount+1)="হলে" Then
				    VarTense="pst"
					VarVoice="3p"
				elseif Assamese_array(ElementCount+1)="হম" Then
				    VarTense="ftre"
					VarVoice="1p"
				elseif Assamese_array(ElementCount+1)="হবা" Then
				    VarTense="ftre"
					VarVoice="2p"
				elseif Assamese_array(ElementCount+1)="হব" Then
				    VarTense="ftre"
					VarVoice="3p"	
							'''''''''''''''''''''
				elseif Assamese_array(ElementCount+1)="নহৈছো" Then
				    VarTense="prst"
					VarVoice="1p"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)="নহৈছা" Then
				    VarTense="prst"
					VarVoice="2p"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)="নহৈছে" Then
				    VarTense="prst"
					VarVoice="3p"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)="নহৈছিলোঁ" Then
				    VarTense="pst"
					VarVoice="1p"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)="নহলা" Then
				    VarTense="pst"
					VarVoice="2p"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)="নহলে" Then
				    VarTense="pst"
					VarVoice="3p"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)="নহম" Then
				    VarTense="ftre"
					VarVoice="1p"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)="নহবা" Then
				    VarTense="ftre"
					VarVoice="2p"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)="নঽব" Then
				    VarTense="ftre"
					VarVoice="3p"
					PosNeg="n"					
							'''''''''''''''''''''
				elseif Assamese_array(ElementCount+1)="আছো" Then
				    VarTense="prst"
					VarVoice="1p"
					
				elseif Assamese_array(ElementCount+1)="আছা" Then
				    VarTense="prst"
					VarVoice="2p"
				elseif Assamese_array(ElementCount+1)="আছে" Then
				    VarTense="prst"
					VarVoice="3p"
				elseif Assamese_array(ElementCount+1)="কৰিছিলোঁ" Then
				    VarTense="pst"
					VarVoice="1p"
				elseif Assamese_array(ElementCount+1)="কৰিলা" Then
				    VarTense="pst"
					VarVoice="2p"
				elseif Assamese_array(ElementCount+1)="কৰিছিলে" Then
				    VarTense="pst"
					VarVoice="3p"
				elseif Assamese_array(ElementCount+1)="কৰিম" Then
				    VarTense="ftre"
					VarVoice="1p"
				elseif Assamese_array(ElementCount+1)="কৰিবা" Then
				    VarTense="ftre"
					VarVoice="2p"
				elseif Assamese_array(ElementCount+1)="কৰিব" Then
				    VarTense="ftre"
					VarVoice="3p"	
							'''''''''''''''''''''
				
				elseif Assamese_array(ElementCount+1)="আনিছো" Then
				    VarTense="prst"
					VarVoice="1p"
				elseif Assamese_array(ElementCount+1)="আনিছা" Then
				    VarTense="prst"
					VarVoice="2p"
				elseif Assamese_array(ElementCount+1)="আনিছে" Then
				    VarTense="prst"
					VarVoice="3p"
				elseif Assamese_array(ElementCount+1)="আনিছিলোঁ" Then
				    VarTense="pst"
					VarVoice="1p"
				elseif Assamese_array(ElementCount+1)="আনিছিলা" Then
				    VarTense="pst"
					VarVoice="2p"
				elseif Assamese_array(ElementCount+1)="আনিছিলে" Then
				    VarTense="pst"
					VarVoice="3p"
				elseif Assamese_array(ElementCount+1)="আনিম" Then
				    VarTense="ftre"
					VarVoice="1p"
				elseif Assamese_array(ElementCount+1)="আনিবা" Then
				    VarTense="ftre"
					VarVoice="2p"	
				elseif Assamese_array(ElementCount+1)="আনিব" Then
				    VarTense="ftre"
					VarVoice="3p"
									'''''''''''''''
				elseif Assamese_array(ElementCount+1)="কৰিছো" Then
				    VarTense="prst"
					VarVoice="1p"
				elseif Assamese_array(ElementCount+1)="কৰিছা" Then
				    VarTense="prst"
					VarVoice="2p"
				elseif Assamese_array(ElementCount+1)="কৰিছে" Then
				    VarTense="prst"
					VarVoice="3p"
				
									'''''''''''''''	
				elseif Assamese_array(ElementCount+1)="পাইছো" Then
				    VarTense="prst"
					VarVoice="1p"
				elseif Assamese_array(ElementCount+1)="পাওঁ" Then
				    VarTense="prst"
					VarVoice="1p"
				elseif Assamese_array(ElementCount+1)="পাইছা" Then
				    VarTense="prst"
					VarVoice="2p"
				elseif Assamese_array(ElementCount+1)="পাইছে" Then
				    VarTense="prst"
					VarVoice="3p"
				elseif Assamese_array(ElementCount+1)="পাইছিলো" Then
				    VarTense="pst"
					VarVoice="1p"
				elseif Assamese_array(ElementCount+1)="পাইছিলা" Then
				    VarTense="pst"
					VarVoice="2p"
				elseif Assamese_array(ElementCount+1)="পাইছিলে" Then
				    VarTense="pst"
					VarVoice="3p"
				elseif Assamese_array(ElementCount+1)="পাম" Then
				    VarTense="ftre"
					VarVoice="1p"
				elseif Assamese_array(ElementCount+1)="পাবা" Then
				    VarTense="ftre"
					VarVoice="2p"	
				elseif Assamese_array(ElementCount+1)="পাব" Then
				    VarTense="ftre"
					VarVoice="3p"
									'''''''''''''''
				elseif Assamese_array(ElementCount+1)="হয়" Then
				    VarTense="prst"
					VarVoice="1p"
				
									'''''''''''''''
				elseif Assamese_array(ElementCount+1)="কৰো" Then
				    VarTense="prst"
					VarVoice="1p"
				elseif Assamese_array(ElementCount+1)="কৰা" Then
				    VarTense="prst"
					VarVoice="2p"
				elseif Assamese_array(ElementCount+1)="কৰে" Then
				    VarTense="prst"
					VarVoice="3p"
				
									'''''''''''''''	
				elseif Assamese_array(ElementCount+1)=" লাগে" Then
				    VarTense="prst"
					VarVoice="xx"
				
				elseif Assamese_array(ElementCount+1)="লাগিছিল" Then
				    VarTense="pst"
					VarVoice="xx"
				
				elseif Assamese_array(ElementCount+1)="লাগিব" Then
				    VarTense="ftre"
					VarVoice="xx"
					
				
				
									'''''''''''''''
				elseif Assamese_array(ElementCount+1)="থাকো" Then
				    VarTense="prst"
					VarVoice="1p"
				elseif Assamese_array(ElementCount+1)="থাকা" Then
				    VarTense="prst"
					VarVoice="2p"
				elseif Assamese_array(ElementCount+1)="থাকে" Then
				    VarTense="prst"
					VarVoice="3p"
				elseif Assamese_array(ElementCount+1)="থাকিছিলো" Then
				    VarTense="pst"
					VarVoice="1p"
				elseif Assamese_array(ElementCount+1)="থাকিছিলা" Then
				    VarTense="pst"
					VarVoice="2p"
				elseif Assamese_array(ElementCount+1)="থাকিছিলে" Then
				    VarTense="pst"
					VarVoice="3p"
				elseif Assamese_array(ElementCount+1)="থাকিম" Then
				    VarTense="ftre"
					VarVoice="1p"
				elseif Assamese_array(ElementCount+1)="থাকিবা" Then
				    VarTense="ftre"
					VarVoice="2p"	
				elseif Assamese_array(ElementCount+1)="থাকিব" Then
				    VarTense="ftre"
					VarVoice="3p"
									'''''''''''''''
									
				elseif Assamese_array(ElementCount+1)="নাথাকো" Then
				    VarTense="prst"
					VarVoice="1p"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)="নাথাকা" Then
				    VarTense="prst"
					VarVoice="2p"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)="নাথাকে" Then
				    VarTense="prst"
					VarVoice="3p"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)="নাথাকিছিলো" Then
				    VarTense="pst"
					VarVoice="1p"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)="নাথাকিছিলা" Then
				    VarTense="pst"
					VarVoice="2p"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)="নাথাকিছিলে" Then
				    VarTense="pst"
					VarVoice="3p"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)="নাথাকিম" Then
				    VarTense="ftre"
					VarVoice="1p"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)="নাথাকিবা" Then
				    VarTense="ftre"
					VarVoice="2p"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)="নাথাকিব" Then
				    VarTense="ftre"
					VarVoice="3p"
					PosNeg="n"
									'''''''''''''''
				elseif Assamese_array(ElementCount+1)="নেথাকো" Then
				    VarTense="prst"
					VarVoice="1p"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)="নেথাকা" Then
				    VarTense="prst"
					VarVoice="2p"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)="নেথাকে" Then
				    VarTense="prst"
					VarVoice="3p"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)="নেথাকিছিলো" Then
				    VarTense="pst"
					VarVoice="1p"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)="নেথাকিছিলা" Then
				    VarTense="pst"
					VarVoice="2p"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)="নেথাকিছিলে" Then
				    VarTense="pst"
					VarVoice="3p"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)="নেথাকিম" Then
				    VarTense="ftre"
					VarVoice="1p"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)="নেথাকিবা" Then
				    VarTense="ftre"
					VarVoice="2p"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)="নেথাকিব" Then
				    VarTense="ftre"
					VarVoice="3p"
					PosNeg="n"
									'''''''''''''''

				elseif Assamese_array(ElementCount+1)="নকৰা" Then
				    VarTense="prst"
					VarVoice="1p"
					PosNeg="n"
				
				elseif Assamese_array(ElementCount+1)="নাছিলোঁ" Then
				    VarTense="pst"
					VarVoice="1p"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)="নাছিলা" Then
				    VarTense="pst"
					VarVoice="2p"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)="নাছিলে" Then
				    VarTense="pst"
					VarVoice="3p"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)=" নকৰো" Then
				    VarTense="ftre"
					VarVoice="1p"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)="নকৰিবা" Then
				    VarTense="ftre"
					VarVoice="2p"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)="নকৰিব" Then
				    VarTense="ftre"
					VarVoice="3p"	
					PosNeg="n"
							'''''''''''''''''''''
				elseif Assamese_array(ElementCount+1)="নাই" Then
				    VarTense="prst"
					VarVoice="1p"
					PosNeg="n"
				
				
							'''''''''''''''''''''
				elseif Assamese_array(ElementCount+1)="নোপোৱা" Then
				    VarTense="xxx"
					VarVoice="xx"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)=" নেপাওঁ" Then
				    VarTense="ftre"
					VarVoice="1p"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)="নেপাবা" Then
				    VarTense="ftre"
					VarVoice="2p"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)="নেপাব" Then
				    VarTense="ftre"
					VarVoice="3p"	
					PosNeg="n"
							''''''''''''''''
				elseif Assamese_array(ElementCount+1)="নমৰা" Then
				    VarTense="xxx"
					VarVoice="xx"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)="নেমাৰো" Then
				    VarTense="ftre"
					VarVoice="1p"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)="নেমৰিবা" Then
				    VarTense="ftre"
					VarVoice="2p"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)="নেমৰিব" Then
				    VarTense="ftre"
					VarVoice="3p"	
					PosNeg="n"
								''''''''''''''''
				elseif Assamese_array(ElementCount+1)="নহয়" Then
				    VarTense="prst"
					VarVoice="xx"
					PosNeg="n"
				'''''''''''''''
				
				elseif Assamese_array(ElementCount+1)="নকৰিছিলোঁ" Then
				    VarTense="pst"
					VarVoice="1p"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)="নকৰিছিলা" Then
				    VarTense="pst"
					VarVoice="2p"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)="নকৰিছিলে" Then
				    VarTense="pst"
					VarVoice="3p"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)="নকৰিম" Then
				    VarTense="ftre"
					VarVoice="1p"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)="নকৰিবা" Then
				    VarTense="ftre"
					VarVoice="2p"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)="নকৰিব" Then
				    VarTense="ftre"
					VarVoice="3p"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)="নকৰিবলৈ" Then
				    VarTense="ftre"
					VarVoice="3p"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)="নকৰিবৰ" Then
				    VarTense="ftre"
					VarVoice="3p"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)="নকৰে" Then
				    VarTense="ftre"
					VarVoice="3p"
					PosNeg="n"
									'''''''''''''''
				
				
				
				elseif Assamese_array(ElementCount+1)="নেলাগে" Then
				    VarTense="prst"
					VarVoice="xx"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)=" নালাগিছিল" Then
				    VarTense="pst"
					VarVoice="xx"
					PosNeg="n"
				
				elseif Assamese_array(ElementCount+1)="নালাগিব" Then
				    VarTense="ftre"
					VarVoice="xx"
					PosNeg="n"
				
									'''''''''''''''
				
				elseif Assamese_array(ElementCount+1)="নিদিছিলোঁ" Then
				    VarTense="pst"
					VarVoice="1p"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)="নিদিছিলা" Then
				    VarTense="pst"
					VarVoice="2p"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)="নিদিছিলে" Then
				    VarTense="pst"
					VarVoice="3p"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)="নিদিম" Then
				    VarTense="ftre"
					VarVoice="1p"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)="নিদিবা" Then
				    VarTense="ftre"
					VarVoice="2p"
					PosNeg="n"
				elseif Assamese_array(ElementCount+1)="নিদিব" Then
				    VarTense="ftre"
					VarVoice="3p"
					PosNeg="n"
				end if
									'''''''''''''''''''''''''''''
									'''''''Format second'''''''''''
				                                                         
				if Assamese_array(ElementCount-1)="হৈছো" Then                             '''' কৰি দিয়া হৈছো      লৈ গৈ  আছে       লৈ দিয়া হ’ল   ...etc
				    VarTense="prst"
					VarVoice="1p"
					
				elseif Assamese_array(ElementCount-1)="হৈছা" Then
				    VarTense="prst"
					VarVoice="2p"
				elseif Assamese_array(ElementCount-1)="হৈছে" Then
				    VarTense="prst"
					VarVoice="3p"
				elseif Assamese_array(ElementCount-1)="হৈছিলোঁ" Then
				    VarTense="pst"
					VarVoice="1p"
				elseif Assamese_array(ElementCount-1)="হলা" Then
				    VarTense="pst"
					VarVoice="2p"
				elseif Assamese_array(ElementCount-1)="হলে" Then
				    VarTense="pst"
					VarVoice="3p"
				elseif Assamese_array(ElementCount-1)="হম" Then
				    VarTense="ftre"
					VarVoice="1p"
				elseif Assamese_array(ElementCount-1)="হবা" Then
				    VarTense="ftre"
					VarVoice="2p"
				elseif Assamese_array(ElementCount-1)="ঽব" Then
				    VarTense="ftre"
					VarVoice="3p"	
							'''''''''''''''''''''
				elseif Assamese_array(ElementCount-1)="নহৈছো" Then
				    VarTense="prst"
					VarVoice="1p"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)="নহৈছা" Then
				    VarTense="prst"
					VarVoice="2p"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)="নহৈছে" Then
				    VarTense="prst"
					VarVoice="3p"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)="নহৈছিলোঁ" Then
				    VarTense="pst"
					VarVoice="1p"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)="নহলা" Then
				    VarTense="pst"
					VarVoice="2p"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)="নহলে" Then
				    VarTense="pst"
					VarVoice="3p"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)="নহম" Then
				    VarTense="ftre"
					VarVoice="1p"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)="নহবা" Then
				    VarTense="ftre"
					VarVoice="2p"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)="নঽব" Then
				    VarTense="ftre"
					VarVoice="3p"
					PosNeg="n"					
							'''''''''''''''''''''
				
				elseif Assamese_array(ElementCount-1)="আছো" Then
				    VarTense="prst"
					VarVoice="1p"
				elseif Assamese_array(ElementCount-1)="আছা" Then
				    VarTense="prst"
					VarVoice="2p"
				elseif Assamese_array(ElementCount-1)="আছে" Then
				    VarTense="prst"
					VarVoice="3p"
				elseif Assamese_array(ElementCount-1)="কৰিছিলোঁ" Then
				    VarTense="pst"
					VarVoice="1p"
				elseif Assamese_array(ElementCount-1)="কৰিলা" Then
				    VarTense="pst"
					VarVoice="2p"
				elseif Assamese_array(ElementCount-1)="কৰিছিলে" Then
				    VarTense="pst"
					VarVoice="3p"
				elseif Assamese_array(ElementCount-1)="কৰিম" Then
				    VarTense="ftre"
					VarVoice="1p"
				elseif Assamese_array(ElementCount-1)="কৰিবা" Then
				    VarTense="ftre"
					VarVoice="2p"
				elseif Assamese_array(ElementCount-1)="কৰিব" Then
				    VarTense="ftre"
					VarVoice="3p"	
							'''''''''''''''''''''
				
				elseif Assamese_array(ElementCount-1)="আনিছো" Then
				    VarTense="prst"
					VarVoice="1p"
				elseif Assamese_array(ElementCount-1)="আনিছা" Then
				    VarTense="prst"
					VarVoice="2p"
				elseif Assamese_array(ElementCount-1)="আনিছে" Then
				    VarTense="prst"
					VarVoice="3p"
				elseif Assamese_array(ElementCount-1)="আনিছিলোঁ" Then
				    VarTense="pst"
					VarVoice="1p"
				elseif Assamese_array(ElementCount-1)="আনিছিলা" Then
				    VarTense="pst"
					VarVoice="2p"
				elseif Assamese_array(ElementCount-1)="আনিছিলে" Then
				    VarTense="pst"
					VarVoice="3p"
				elseif Assamese_array(ElementCount-1)="আনিম" Then
				    VarTense="ftre"
					VarVoice="1p"
				elseif Assamese_array(ElementCount-1)="আনিবা" Then
				    VarTense="ftre"
					VarVoice="2p"	
				elseif Assamese_array(ElementCount-1)="আনিব" Then
				    VarTense="ftre"
					VarVoice="3p"
									'''''''''''''''
				elseif Assamese_array(ElementCount-1)="কৰিছো" Then
				    VarTense="prst"
					VarVoice="1p"
				elseif Assamese_array(ElementCount-1)="কৰিছা" Then
				    VarTense="prst"
					VarVoice="2p"
				elseif Assamese_array(ElementCount-1)="কৰিছে" Then
				    VarTense="prst"
					VarVoice="3p"
				
									'''''''''''''''	
				elseif Assamese_array(ElementCount-1)="পাইছো" Then
				    VarTense="prst"
					VarVoice="1p"
				elseif Assamese_array(ElementCount-1)="পাইছা" Then
				    VarTense="prst"
					VarVoice="2p"
				elseif Assamese_array(ElementCount-1)="পাইছে" Then
				    VarTense="prst"
					VarVoice="3p"
				elseif Assamese_array(ElementCount-1)="পাইছিলো" Then
				    VarTense="pst"
					VarVoice="1p"
				elseif Assamese_array(ElementCount-1)="পাইছিলা" Then
				    VarTense="pst"
					VarVoice="2p"
				elseif Assamese_array(ElementCount-1)="পাইছিলে" Then
				    VarTense="pst"
					VarVoice="3p"
				elseif Assamese_array(ElementCount-1)="পাম" Then
				    VarTense="ftre"
					VarVoice="1p"
				elseif Assamese_array(ElementCount-1)="পাবা" Then
				    VarTense="ftre"
					VarVoice="2p"	
				elseif Assamese_array(ElementCount-1)="পাব" Then
				    VarTense="ftre"
					VarVoice="3p"
									'''''''''''''''
				elseif Assamese_array(ElementCount-1)="হয়" Then
				    VarTense="prst"
					VarVoice="1p"
				
									'''''''''''''''
				elseif Assamese_array(ElementCount-1)="কৰো" Then
				    VarTense="prst"
					VarVoice="1p"
				elseif Assamese_array(ElementCount-1)="কৰা" Then
				    VarTense="prst"
					VarVoice="2p"
				elseif Assamese_array(ElementCount-1)="কৰে" Then
				    VarTense="prst"
					VarVoice="3p"
				
									'''''''''''''''	
				elseif Assamese_array(ElementCount-1)=" লাগিছে" Then
				    VarTense="prst"
					VarVoice="xx"
				
				elseif Assamese_array(ElementCount-1)="লাগিছিল" Then
				    VarTense="pst"
					VarVoice="xx"
				
				elseif Assamese_array(ElementCount-1)="লাগিব" Then
				    VarTense="ftre"
					VarVoice="xx"
				
									'''''''''''''''
				elseif Assamese_array(ElementCount-1)="থাকো" Then
				    VarTense="prst"
					VarVoice="1p"
				elseif Assamese_array(ElementCount-1)="থাকা" Then
				    VarTense="prst"
					VarVoice="2p"
				elseif Assamese_array(ElementCount-1)="থাকে" Then
				    VarTense="prst"
					VarVoice="3p"
				elseif Assamese_array(ElementCount-1)="থাকিছিলো" Then
				    VarTense="pst"
					VarVoice="1p"
				elseif Assamese_array(ElementCount-1)="থাকিছিলা" Then
				    VarTense="pst"
					VarVoice="2p"
				elseif Assamese_array(ElementCount-1)="থাকিছিলে" Then
				    VarTense="pst"
					VarVoice="3p"
				elseif Assamese_array(ElementCount-1)="থাকিম" Then
				    VarTense="ftre"
					VarVoice="1p"
				elseif Assamese_array(ElementCount-1)="থাকিবা" Then
				    VarTense="ftre"
					VarVoice="2p"	
				elseif Assamese_array(ElementCount-1)="থাকিব" Then
				    VarTense="ftre"
					VarVoice="3p"
									'''''''''''''''
									
				elseif Assamese_array(ElementCount-1)="নাথাকো" Then
				    VarTense="prst"
					VarVoice="1p"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)="নাথাকা" Then
				    VarTense="prst"
					VarVoice="2p"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)="নাথাকে" Then
				    VarTense="prst"
					VarVoice="3p"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)="নাথাকিছিলো" Then
				    VarTense="pst"
					VarVoice="1p"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)="নাথাকিছিলা" Then
				    VarTense="pst"
					VarVoice="2p"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)="নাথাকিছিলে" Then
				    VarTense="pst"
					VarVoice="3p"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)="নাথাকিম" Then
				    VarTense="ftre"
					VarVoice="1p"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)="নাথাকিবা" Then
				    VarTense="ftre"
					VarVoice="2p"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)="নাথাকিব" Then
				    VarTense="ftre"
					VarVoice="3p"
					PosNeg="n"
									'''''''''''''''
				elseif Assamese_array(ElementCount-1)="নেথাকো" Then
				    VarTense="prst"
					VarVoice="1p"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)="নেথাকা" Then
				    VarTense="prst"
					VarVoice="2p"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)="নেথাকে" Then
				    VarTense="prst"
					VarVoice="3p"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)="নেথাকিছিলো" Then
				    VarTense="pst"
					VarVoice="1p"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)="নেথাকিছিলা" Then
				    VarTense="pst"
					VarVoice="2p"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)="নেথাকিছিলে" Then
				    VarTense="pst"
					VarVoice="3p"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)="নেথাকিম" Then
				    VarTense="ftre"
					VarVoice="1p"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)="নেথাকিবা" Then
				    VarTense="ftre"
					VarVoice="2p"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)="নেথাকিব" Then
				    VarTense="ftre"
					VarVoice="3p"
					PosNeg="n"
									'''''''''''''''

				elseif Assamese_array(ElementCount-1)="নকৰা" Then
				    VarTense="prst"
					VarVoice="1p"
					PosNeg="n"
				
				elseif Assamese_array(ElementCount-1)="নাছিলোঁ" Then
				    VarTense="pst"
					VarVoice="1p"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)="নাছিলা" Then
				    VarTense="pst"
					VarVoice="2p"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)="নাছিলে" Then
				    VarTense="pst"
					VarVoice="3p"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)=" নকৰো" Then
				    VarTense="ftre"
					VarVoice="1p"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)="নকৰিবা" Then
				    VarTense="ftre"
					VarVoice="2p"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)="নকৰিব" Then
				    VarTense="ftre"
					VarVoice="3p"	
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)="নকৰিবলৈ" Then
				    VarTense="ftre"
					VarVoice="3p"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)="নকৰিবৰ" Then
				    VarTense="ftre"
					VarVoice="3p"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)="নকৰে" Then
				    VarTense="ftre"
					VarVoice="3p"
					PosNeg="n"
							'''''''''''''''''''''
				elseif Assamese_array(ElementCount-1)="নাই" Then
				    VarTense="prst"
					VarVoice="1p"
					PosNeg="n"
				
				
							'''''''''''''''''''''
				elseif Assamese_array(ElementCount-1)="নোপোৱা" Then
				    VarTense="xxx"
					VarVoice="xx"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)=" নেপাওঁ" Then
				    VarTense="ftre"
					VarVoice="1p"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)="নেপাবা" Then
				    VarTense="ftre"
					VarVoice="2p"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)="নেপাব" Then
				    VarTense="ftre"
					VarVoice="3p"	
					PosNeg="n"
							''''''''''''''''
				elseif Assamese_array(ElementCount-1)="নমৰা" Then
				    VarTense="xxx"
					VarVoice="xx"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)="নেমাৰো" Then
				    VarTense="ftre"
					VarVoice="1p"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)="নেমৰিবা" Then
				    VarTense="ftre"
					VarVoice="2p"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)="নেমৰিব" Then
				    VarTense="ftre"
					VarVoice="3p"	
					PosNeg="n"
								''''''''''''''''
				elseif Assamese_array(ElementCount-1)="নহয়" Then
				    VarTense="prst"
					VarVoice="xx"
					PosNeg="n"
				'''''''''''''''
				
				elseif Assamese_array(ElementCount-1)="নকৰিছিলোঁ" Then
				    VarTense="pst"
					VarVoice="1p"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)="নকৰিছিলা" Then
				    VarTense="pst"
					VarVoice="2p"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)="নকৰিছিলে" Then
				    VarTense="pst"
					VarVoice="3p"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)="নকৰিম" Then
				    VarTense="ftre"
					VarVoice="1p"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)="নকৰিবা" Then
				    VarTense="ftre"
					VarVoice="2p"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)="নকৰিব" Then
				    VarTense="ftre"
					VarVoice="3p"
					PosNeg="n"
									'''''''''''''''
				
				elseif Assamese_array(ElementCount-1)="নালাগে" Then
				    VarTense="prst"
					VarVoice="xx"
					PosNeg="n"
				
				elseif Assamese_array(ElementCount-1)="নেলাগে" Then
				    VarTense="prst"
					VarVoice="xx"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)=" নালাগিছিল" Then
				    VarTense="pst"
					VarVoice="xx"
					PosNeg="n"
				
				elseif Assamese_array(ElementCount-1)="নালাগিব" Then
				    VarTense="ftre"
					VarVoice="xx"
					PosNeg="n"
				
									'''''''''''''''
				
				elseif Assamese_array(ElementCount-1)="নিদিছিলোঁ" Then
				    VarTense="pst"
					VarVoice="1p"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)="নিদিছিলা" Then
				    VarTense="pst"
					VarVoice="2p"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)="নিদিছিলে" Then
				    VarTense="pst"
					VarVoice="3p"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)="নিদিম" Then
				    VarTense="ftre"
					VarVoice="1p"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)="নিদিবা" Then
				    VarTense="ftre"
					VarVoice="2p"
					PosNeg="n"
				elseif Assamese_array(ElementCount-1)="নিদিব" Then
				    VarTense="ftre"
					VarVoice="3p"
					PosNeg="n"
				end if
									'''''''''''''''
				'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
				''''''''''''''''''''' Create a SearchString '''''''''''''''''''
				'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
				
				if VarTense="xxx" Then
					VarTense="prst"
				end if
				if VarVoice="xx" Then
					VarVoice="3p"
				end if
				if PosNeg="" Then
					SearchString=elem+"_"+VarVoice+"_"+VarTense
				elseif PosNeg="n" Then
					SearchString=elem+"_"+PosNeg+"_"+VarVoice+"_"+VarTense
				end if
				' ' ' Response.Write "<br/>/"
				 ' Response.Write SearchString
				' Response.Write "/</br>"
				'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
				''''''''''''''''''''' SearchString Created '''''''''''''''''''
				'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
				
				
				if elem=";" or elem="" Then
				  'pass
				  ' ' ' Response.Write "passing"
			    else
					
					if ( ParseArray(ElementCount+1)=0  and ParseArray(ElementCount-1)=0 ) or Iteration=0 or (Iteration=1 and ParseArray(ElementCount-1)=0)   Then   'doable
						' Response.write ":"+elem
						rs.open "select adjective_s,adjective_p,root  from tab_asverb where assamese_verb='"+SearchString+"'",Conn
						
						if rs.eof Then
								'aaaa not done
									rs.close
									if EatDrink=1 and Drink=1 Then
									   elem="প"+elem
									end if
									' ' ' Response.Write "00001"
									rs.open "select adjective_s,adjective_p,root  from tab_asverb where assamese_verbmod='"+SearchString+"'",Conn
									if rs.eof Then
											 ' passing
											 ' ' ' Response.Write "0100"
									elseif rs.Fields(1).value="xxx" Then
												DATADONE=1
												ParseArray(ElementCount)=1
												kriyaArray(kriyaPointer)=rs.Fields("root").value
												kriyaPointer=kriyaPointer+1
												
												
												''' Response.Write rs.Fields("root").value
											   'DONE_=DONE_+" "+rs.Fields("root").value
												if foundFirstVerb=0 Then
													FirstVerb=rs.Fields("root").value
													foundFirstVerb=1
													StatusArray(ElementCount)="V"
													AAAAdone=1
												elseif foundSecondVerb=0 Then
													SecondVerb=rs.Fields("root").value
													foundSecondVerb=1
													StatusArray(ElementCount)="V"
													AAAAdone=1
												elseif foundThirdVerb=0 Then
													ThirdVerb=rs.Fields("root").value
													foundThirdVerb=1
													StatusArray(ElementCount)="V"
													AAAAdone=1
												end if
									elseif rs.Fields(1).value<>"xxx" Then
												DATADONE=1
												ParseArray(ElementCount)=1
												' ' ' Response.Write "//Data//"
												
												kriyaArray(kriyaPointer)=rs.Fields(SINGPLRLDATA).value+" "+rs.Fields("root").value
												kriyaPointer=kriyaPointer+1
												
												'DONE_=DONE_+" "+rs.Fields("adjective_s").value+" "+rs.Fields("root").value
												if foundFirstVerb=0 Then
													FirstVerb=rs.Fields(SINGPLRLDATA).value+" "+rs.Fields("root").value
													foundFirstVerb=1
													StatusArray(ElementCount)="V"
													AAAAdone=1
												elseif foundSecondVerb=0 Then
													SecondVerb=rs.Fields(SINGPLRLDATA).value+" "+rs.Fields("root").value
													foundSecondVerb=1
													StatusArray(ElementCount)="V"
													AAAAdone=1
												elseif foundThirdVerb=0 Then
													ThirdVerb=rs.Fields(SINGPLRLDATA).value+" "+rs.Fields("root").value
													foundThirdVerb=1
													StatusArray(ElementCount)="V"
													AAAAdone=1
												end if
									
									end if
									rs.close
									' ' ' Response.Write "0000"
						else    'FOR NEWLY MODIFIED SPELLED WORDS
							if EatDrink=1 and Drink=1 Then
							   elem="প"+elem
							end if
							' ' ' Response.Write "/.lllll"
							' ' ' Response.Write rs.Fields("root").value	   
							
							
							
							if rs.Fields(1).value="xxx" Then
										DATADONE=1
										
										
										ParseArray(ElementCount)=1
									   ' Response.write rs.Fields("root").value
									   
									   kriyaArray(kriyaPointer)=rs.Fields("root").value	
										kriyaPointer=kriyaPointer+1
									   
										if foundFirstVerb=0 Then
											FirstVerb=rs.Fields("root").value
											foundFirstVerb=1
											StatusArray(ElementCount)="V"
											AAAAdone=1
										elseif foundSecondVerb=0 Then
											SecondVerb=rs.Fields("root").value
											foundSecondVerb=1
											StatusArray(ElementCount)="V"
											AAAAdone=1
										elseif foundThirdVerb=0 Then
											ThirdVerb=rs.Fields("root").value
											foundThirdVerb=1
											StatusArray(ElementCount)="V"
											AAAAdone=1
										end if
							elseif rs.Fields(1).value<>"xxx" Then
								DATADONE=1
								ParseArray(ElementCount)=1
								'DONE_=DONE_+" "+rs.Fields("adjective_s").value+" "+rs.Fields("root").value
								kriyaArray(kriyaPointer)=rs.Fields(SINGPLRLDATA).value+" "+rs.Fields("root").value	
								kriyaPointer=kriyaPointer+1
							
							
								if foundFirstVerb=0 Then
											FirstVerb=rs.Fields(SINGPLRLDATA).value+" "+rs.Fields("root").value
											foundFirstVerb=1
											StatusArray(ElementCount)="V"
											AAAAdone=1
										elseif foundSecondVerb=0 Then
											SecondVerb=rs.Fields(SINGPLRLDATA).value+" "+rs.Fields("root").value
											foundSecondVerb=1
											StatusArray(ElementCount)="V"
											AAAAdone=1
										elseif foundThirdVerb=0 Then
											ThirdVerb=rs.Fields(SINGPLRLDATA).value+" "+rs.Fields("root").value
											foundThirdVerb=1
											StatusArray(ElementCount)="V"
											AAAAdone=1
								end if
							
							end if
							rs.close
						end if
				end if   '' END of ParseArray
						
			end if          'end of Verb Search 
		' ' ' Response.Write "Verb Searched Successfuly"
				
	    end if  '' end of valid data search
		' ' ' Response.Write "Search Bot"
		'
		' The SearchString is for verbs only
		'
		'
		'
		'
		'
		
		
		
		if DATADONE=0 and elem<>";" Then
			
			rs.open "select translation,type  from tab_asadditional where term='"+elem+"'",Conn
			if rs.eof Then
				'pass
			else
				
				TermArray(termPointer)=rs.Fields(0).value
				termPointer=termPointer+1
				if rs.Fields(1).value = "v" Then
					StatusArray(ElementCount)="V"
					ParseArray(ElementCount)=1
				end if
				DATADONE=1
			end if
			rs.close
		end if
		ElementCount=ElementCount+1
		
	next
	
	next
	 %>
    <%
		    
	Conn.close
	' ' ' Response.Write "/FirstNoun/"+FirstNoun+"/"
	' ' ' Response.Write "/FirstVerb/"+FirstVerb+"/"
	' ' ' Response.Write "/SecondNoun/"+SecondNoun+"/"
	' ' ' ' Response.Write "/SecondVerb/"+SecondVerb+"/"
	'' ' ' Response.Write "/ThirdNoun/"+ThirdNoun+"/"
	' ' ' ' Response.Write "/ThirdVerb/"+ThirdVerb+"/"%>
	
	
	<br/> The generated English Translation is: <br/>
	<% 
	Done=0
	' if FirstNoun="your" or FirstNoun="their" or FirstNoun="his" or FirstNoun="her" and Done=0 Then
		' if FirstVerb="will be needed" Then
			' ' ' ' Response.Write("<font face=ariel color=blue size=8 >"+FirstNoun+" "+SecondNoun+" "+FirstVerb+" "+ThirdNoun+"</font>")
			' Done=1
		' end if
	' end if
	
	' ' ' ' Response.Write "<br/>"
	plrl1=""
	plrl2=""
	plrl3=""
	' ' NNNVVV
	' if question=0 and Done=0 and foundThirdNoun=1 and foundThirdVerb=1 Then
	     ' ' ' ' Response.Write("<font face=ariel color=blue size=8 >"+Terms+" "+FirstNoun+" "+plrl1+" "+ThirdVerb+" "+SecondNoun+" "+plrl2+" "+SecondVerb+" "+ThirdNoun+" "+FirstVerb+"</font>")
	    ' ' ' ' Response.Cookies("EngStrUtchnew")=Terms+" "+FirstNoun+" "+plrl1+" "+ThirdVerb+" "+SecondNoun+" "+plrl2+" "+SecondVerb+" "+ThirdNoun+" "+FirstVerb
	' 'VNN
	' elseif question=0 and Done=0 and foundThirdNoun=0 and foundSecondNoun=1 and foundSecondVerb=0 and foundFirstVerb=1 Then
	     ' ' ' ' Response.Write("<font face=ariel color=blue size=8 >"+Terms+" "+FirstNoun+" "+plrl1+" "+FirstVerb+" "+SecondNoun+" "+plrl2+"</font>")
	    ' ' ' ' Response.Cookies("EngStrUtchnew")=Terms+" "+FirstNoun+" "+plrl1+" "+FirstVerb+" "+SecondNoun+" "+plrl2
	' 'NV
	' elseif question=0 and Done=0 and foundFirstNoun=1 and foundFirstVerb=1 and foundSecondNoun=0 and foundSecondVerb=0 Then
		' ' ' ' Response.Write("<font face=ariel color=blue size=8 >"+Terms+" "+FirstNoun+" "+plrl1+" "+FirstVerb+"</font>")
	    ' ' ' ' Response.Cookies("EngStrUtchnew")=Terms+" "+FirstNoun+" "+plrl1+" "+FirstVerb
	' 'NNVV
	' elseif question=0 and Done=0 and foundThirdNoun=0 and foundSecondNoun=1 and foundSecondVerb=1 and foundThirdVerb=0 Then
	     ' ' ' ' Response.Write("<font face=ariel color=black size=5  >"+Terms+" "+FirstNoun+" "+plrl1+" "+FirstVerb+" "+SecondVerb+" "+plrl2+" "+SecondNoun+"</font>")
	    ' ' ' ' Response.Cookies("EngStrUtchnew")=Terms+" "+FirstNoun+" "+plrl1+" "+FirstVerb+" "+SecondVerb+" "+plrl2+" "+SecondNoun
	' 'NVVV
	' elseif question=0 and Done=0 and foundfirstNoun=1 and foundSecondNoun=0  and foundThirdVerb=1 Then
	     ' ' ' ' Response.Write("<font face=ariel color=blue size=8 >"+Terms+" "+FirstNoun+" "+plrl1+" "+ThirdVerb+" "+SecondVerb+" "+plrl2+" "+FirstVerb+"</font>")
	    ' ' ' ' Response.Cookies("EngStrUtchnew")=Terms+" "+FirstNoun+" "+plrl1+" "+ThirdVerb+" "+SecondVerb+" "+plrl2+" "+FirstVerb
	' 'NVV
	' elseif question=0 and Done=0 and foundSecondNoun=0 and foundFirstNoun=1 and foundSecondVerb=1 and foundThirdVerb=0 Then
	     ' ' ' ' Response.Write("<font face=ariel color=blue size=8 >"+Terms+" "+FirstNoun+" "+plrl1+" "+SecondVerb+" "+FirstVerb+"</font>")
	    ' ' ' ' Response.Cookies("EngStrUtchnew")=Terms+" "+FirstNoun+" "+plrl1+" "+SecondVerb+" "+FirstVerb
	' 'N
	' elseif question=0 and Done=0 and foundSecondNoun=0 and foundFirstNoun=1 and foundFirstVerb=0 Then
	     ' ' ' ' Response.Write("<font face=ariel color=blue size=8 >"+Terms+" "+FirstNoun+" "+plrl1+"</font>")
	    ' ' ' ' Response.Cookies("EngStrUtchnew")=Terms+" "+FirstNoun+" "+plrl1
	' 'V
	' elseif question=0 and Done=0 and foundFirstNoun=0 and foundFirstVerb=1 and foundSecondVerb=0 Then
	     ' ' ' ' Response.Write("<font face=ariel color=blue size=8 >"+Terms+" "+FirstVerb+"</font>")
	    ' ' ' ' Response.Cookies("EngStrUtchnew")=Terms+" "+FirstVerb
	' 'VV
	' elseif question=0 and Done=0 and foundFirstVerb=1 and foundSecondVerb=1 and foundFirstNoun=0 Then
	     ' ' ' ' Response.Write("<font face=ariel color=blue size=8 >"+Terms+" "+SecondVerb+" "+FirstVerb+"</font>")
	    ' ' ' ' Response.Cookies("EngStrUtchnew")=Terms+" "+SecondVerb+" "+FirstVerb
	' 'NN
	' elseif question=0 and Done=0 and foundFirstVerb=0 and foundSecondNoun=1 and foundFirstNoun=1 Then
	     ' ' ' ' Response.Write("<font face=ariel color=blue size=8 >"+Terms+" "+FirstNoun+" "+plrl1+" "+SecondNoun+"</font>")
	    ' ' ' ' Response.Cookies("EngStrUtchnew")=Terms+" "+FirstNoun+" "+plrl1+" "+econdNoun
	' 'NNNV
	' elseif question=0 and Done=0 and foundFirstVerb=1 and foundSecondVerb=0 and foundThirdNoun=1 Then
	     ' ' ' ' Response.Write("<font face=ariel color=blue size=8 >"+Terms+" "+FirstNoun+" "+plrl1+" "+FirstVerb+" "+SecondNoun+" "+plrl2+" "+ThirdNoun+"</font>")
	    ' ' ' ' Response.Cookies("EngStrUtchnew")=Terms+" "+FirstNoun+" "+plrl1+" "+FirstVerb+" "+SecondNoun+" "+plrl2+" "+ThirdNoun
	' 'NNNVV
	' elseif question=0 and Done=0 and foundFirstVerb=1 and foundSecondVerb=1 and foundThirdVerb=0 and foundThirdNoun=1 Then
	     ' ' ' ' Response.Write("<font face=ariel color=blue size=8 >"+Terms+" "+ThirdNoun+" "+SecondVerb+" "+plrl1+" "+SecondNoun+" "+FirstVerb+" "+plrl2+" "+FirstNoun+"</font>")
	    ' ' ' ' Response.Cookies("EngStrUtchnew")=Terms+" "+ThirdNoun+" "+SecondVerb+" "+plrl1+" "+SecondNoun+" "+FirstVerb+" "+plrl2+" "+FirstNoun
	' 'NNVVV
	' elseif question=0 and Done=0 and foundThirdVerb=1 and foundThirdNoun=0 and foundSecondNoun=1 Then
	     ' ' ' ' Response.Write("<font face=ariel color=blue size=8 >"+Terms+" "+SecondNoun+" "+FirstVerb+" "+plrl1+" "+FirstNoun+" "+SecondVerb+" "+plrl2+" "+ThirdVerb+"</font>")
	    ' ' ' ' Response.Cookies("EngStrUtchnew")=Terms+" "+SecondNoun+" "+FirstVerb+" "+plrl1+" "+FirstNoun+" "+SecondVerb+" "+plrl2+" "+ThirdVerb
	
	
	' 'Questions
   ' 'NNNVVV  
	' elseif question=1 and Done=0 and foundThirdNoun=1 and foundThirdVerb=1 Then
	     ' ' ' ' Response.Write("<font face=ariel color=blue size=8 >"+QH_+" "+Terms+" "+FirstNoun+" "+plrl1+" "+ThirdVerb+" "+SecondNoun+" "+plrl2+" "+SecondVerb+" "+ThirdNoun+" "+FirstVerb+"</font>")
	    ' ' ' ' Response.Cookies("EngStrUtchnew")=QH_+" "+Terms+" "+FirstNoun+" "+plrl1+" "+ThirdVerb+" "+SecondNoun+" "+plrl2+" "+SecondVerb+" "+ThirdNoun+" "+FirstVerb
	' 'VNN
	' elseif question=1 and Done=0 and foundThirdNoun=0 and foundSecondNoun=1 and foundSecondVerb=0 and foundFirstVerb=1 Then
	     ' ' ' ' Response.Write("<font face=ariel color=blue size=8 >"+QH_+" "+Terms+" "+FirstNoun+" "+plrl1+" "+FirstVerb+" "+SecondNoun+" "+plrl2+"</font>")
	    ' ' ' ' Response.Cookies("EngStrUtchnew")=QH_+" "+Terms+" "+" "+FirstNoun+" "+plrl1+" "+FirstVerb+" "+SecondNoun+" "+plrl2
	' 'NV
	' elseif question=1 and Done=0 and foundFirstNoun=1 and foundFirstVerb=1 and foundSecondNoun=0 and foundSecondVerb=0 Then
		' ' ' ' Response.Write("<font face=ariel color=blue size=8 >"+QH_+" "+Terms+" "+FirstNoun+" "+plrl1+" "+FirstVerb+"</font>")
	    ' ' ' ' Response.Cookies("EngStrUtchnew")=QH_+" "+Terms+" "+" "+FirstNoun+" "+plrl1+" "+FirstVerb
	' 'NNVV
	' elseif question=1 and Done=0 and foundThirdNoun=0 and foundSecondNoun=1 and foundSecondVerb=1 and foundThirdVerb=0 Then
	     ' ' ' ' Response.Write("<font face=ariel color=black size=5  >"+QH_+" "+Terms+" "+FirstNoun+" "+plrl1+" "+FirstVerb+" "+SecondVerb+" "+plrl2+" "+SecondNoun+"</font>")
	    ' ' ' ' Response.Cookies("EngStrUtchnew")=QH_+" "+Terms+" "+FirstNoun+" "+plrl1+" "+FirstVerb+" "+SecondVerb+" "+plrl2+" "+SecondNoun
	' 'NVV
	' elseif question=1 and Done=0 and foundSecondNoun=0 and foundFirstNoun=1 and foundSecondVerb=1 and foundThirdVerb=0 Then
	     ' ' ' ' Response.Write("<font face=ariel color=blue size=8 >"+QH_+" "+Terms+" "+" "+FirstNoun+" "+plrl1+" "+SecondVerb+" "+FirstVerb+"</font>")
	    ' ' ' ' Response.Cookies("EngStrUtchnew")=QH_+" "+Terms+" "+" "+FirstNoun+" "+plrl1+" "+SecondVerb+" "+FirstVerb
	    
	' 'NVVV
	' elseif question=1 and Done=0 and foundfirstNoun=1 and foundSecondNoun=0  and foundThirdVerb=1 Then
	     ' ' ' ' Response.Write("<font face=ariel color=blue size=8 >"+QH_+" "+Terms+" "+FirstNoun+" "+plrl1+" "+ThirdVerb+" "+SecondVerb+" "+plrl2+" "+FirstVerb+"</font>")
	    ' ' ' ' Response.Cookies("EngStrUtchnew")=QH_+" "+Terms+" "+FirstNoun+" "+plrl1+" "+ThirdVerb+" "+SecondVerb+" "+plrl2+" "+FirstVerb
	
	' 'N
	' elseif question=1 and Done=0 and foundSecondNoun=0 and foundFirstNoun=1 and foundFirstVerb=0 Then
	     ' ' ' ' Response.Write("<font face=ariel color=blue size=8 >"+QH_+" "+Terms+" "+FirstNoun+" "+plrl1+"</font>")
	    ' ' ' ' Response.Cookies("EngStrUtchnew")=QH_+" "+Terms+" "+FirstNoun+" "+plrl1
	' 'V
	' elseif question=1 and Done=0 and foundFirstNoun=0 and foundFirstVerb=1 and foundSecondVerb=0 Then
	     ' ' ' ' Response.Write("<font face=ariel color=blue size=8 >"+QH_+" "+Terms+" "+FirstVerb+"</font>")
	    ' ' ' ' Response.Cookies("EngStrUtchnew")=QH_+" "+Terms+" "+FirstVerb
	' 'VV
	' elseif question=1 and Done=0 and foundFirstVerb=1 and foundSecondVerb=1 and foundFirstNoun=0 Then
	     ' ' ' ' Response.Write("<font face=ariel color=blue size=8 >"+QH_+" "+Terms+" "+SecondVerb+" "+FirstVerb+"</font>")
	    ' ' ' ' Response.Cookies("EngStrUtchnew")=QH_+" "+Terms+" "+SecondVerb+" "+FirstVerb
	' 'NN
	' elseif question=1 and Done=0 and foundFirstVerb=0 and foundSecondNoun=1 and foundFirstNoun=1 Then
	     ' ' ' ' Response.Write("<font face=ariel color=blue size=8 >"+QH_+" "+Terms+" "+FirstNoun+" "+plrl1+" "+SecondNoun+"</font>")
	    ' ' ' ' Response.Cookies("EngStrUtchnew")=QH_+" "+Terms+" "+FirstNoun+" "+plrl1+" "+econdNoun
	' 'NNNV
	' elseif question=1 and Done=0 and foundFirstVerb=1 and foundSecondVerb=0 and foundThirdNoun=1 Then
	     ' ' ' ' Response.Write("<font face=ariel color=blue size=8 >"+QH_+" "+Terms+" "+FirstNoun+" "+plrl1+" "+FirstVerb+" "+SecondNoun+" "+plrl2+" "+ThirdNoun+"</font>")
	    ' ' ' ' Response.Cookies("EngStrUtchnew")=QH_+" "+Terms+" "+FirstNoun+" "+plrl1+" "+FirstVerb+" "+SecondNoun+" "+plrl2+" "+ThirdNoun
	' 'NNNVV
	' elseif question=1 and Done=0 and foundFirstVerb=1 and foundSecondVerb=1 and foundThirdVerb=0 and foundThirdNoun=1 Then
	     ' ' ' ' Response.Write("<font face=ariel color=blue size=8 >"+QH_+" "+Terms+" "+ThirdNoun+" "+SecondVerb+" "+plrl1+" "+SecondNoun+" "+FirstVerb+" "+plrl2+" "+FirstNoun+"</font>")
	    ' ' ' ' Response.Cookies("EngStrUtchnew")=QH_+" "+Terms+" "+ThirdNoun+" "+SecondVerb+" "+plrl1+" "+SecondNoun+" "+FirstVerb+" "+plrl2+" "+FirstNoun
	' 'Q
	' elseif question=1 and Done=0 and foundFirstVerb=0 and foundSecondVerb=0 and foundThirdNoun=0 Then
	    ' ' ' ' Response.Write("<font face=ariel color=blue size=8 >"+QH_+"</font>")
	    ' ' ' ' Response.Cookies("EngStrUtchnew")=QH_
	' end if
	
	' if foundFirstVerb=0 Then
		' ' ' ' Response.Write("<font face=ariel color=blue size=8 >"+qhArray(0)+" "+plrl+" "+FirstNoun+" "+FirstVerb+" "+TermArray(0)+" "+ConnectorArray(0)+" "+qhArray(1)+" "+SecondNoun+" "+SecondVerb+" "+TermArray(1)+" "+ConnectorArray(1)+" "+qhArray(2)+" "+ThirdNoun+" "+ThirdVerb+" "+TermArray(2)+" "+ConnectorArray(2)+" "+TermArray(3)+" "+TermArray(4)+" "+TermArray(5)+" "+TermArray(6)+" "+TermArray(7)+" "+TermArray(8)+"</font>")
		' ' ' ' Response.Cookies("EngStrUtchnew")=qhArray(0)+" "+plrl+" "+FirstNoun+" "+FirstVerb+" "+TermArray(0)+" "+qhArray(1)+" "+SecondNoun+" "+SecondVerb+" "+TermArray(1)+" "+qhArray(2)+" "+ThirdNoun+" "+ThirdVerb+" "+TermArray(2)+" "+TermArray(3)+" "+TermArray(4)+" "+TermArray(5)+" "+TermArray(6)+" "+TermArray(7)+" "+TermArray(8)
	' else
		' ' ' ' Response.Write("<font face=ariel color=blue size=8 >"+qhArray(0)+" "+FirstNoun+" "+FirstVerb+" "+TermArray(0)+" "+ConnectorArray(0)+" "+qhArray(1)+" "+SecondNoun+" "+SecondVerb+" "+TermArray(1)+" "+ConnectorArray(1)+" "+qhArray(2)+" "+ThirdNoun+" "+ThirdVerb+" "+TermArray(2)+" "+ConnectorArray(2)+" "+TermArray(3)+" "+TermArray(4)+" "+TermArray(5)+" "+TermArray(6)+" "+TermArray(7)+" "+TermArray(8)+"</font>")
		' ' ' ' Response.Cookies("EngStrUtchnew")=qhArray(0)+" "+FirstNoun+" "+FirstVerb+" "+TermArray(0)+" "+qhArray(1)+" "+SecondNoun+" "+SecondVerb+" "+TermArray(1)+" "+qhArray(2)+" "+ThirdNoun+" "+ThirdVerb+" "+TermArray(2)+" "+TermArray(3)+" "+TermArray(4)+" "+TermArray(5)+" "+TermArray(6)+" "+TermArray(7)+" "+TermArray(8)
	
	' end if
	
	  ' Response.write "  karta <br> "
	
	' for each item in kartaArray
	    
		 ' Response.write item
		 ' Response.write " "
		
	' next
	
	' Response.write " <br> karma <br> "
	' for each item in karmaArray
		' Response.write item
		' Response.write " "
	' next
	
	' Response.write " <br> kriya <br> "
	' for each item in kriyaArray
		' Response.write item
		' Response.write " "
	' next
	
	' Response.write " <br> qh <br> "
	' for each item in qhArray
		' Response.write item
		' Response.write " "
	' next
	
	' Response.write " <br> TermArray <br> "
	' for each item in TermArray
		' Response.write item
		' Response.write " "
	' next
	
	' Response.write " <br> ConnectorArray <br> "
	' for each item in ConnectorArray
		' Response.write item
		' Response.write " "
	' next
	
	' for each item in ParseArray
		' Response.write item
		' Response.write " "
	' next
	Response.write "<br><font face=ariel color=black size=5 >"
	outstr1=qhArray(0)+" "+plrl+" "+ConnectorArray(0)+" "+kartaArray(0)+" "+kriyaArray(0)+" "+karmaArray(0)+" "+TermArray(0)+" "
	outstr2=qhArray(1)+" "+plrl1+" "+kartaArray(1)+" "+kriyaArray(1)+" "+karmaArray(1)+" "+TermArray(1)+" "
	outstr3=qhArray(2)+" "+kartaArray(2)+" "+kriyaArray(2)+" "+karmaArray(2)+" "+TermArray(2)+" "
	outstr4=qhArray(3)+" "+kartaArray(3)+" "+kriyaArray(3)+" "+karmaArray(3)+" "+TermArray(3)+" "
	Response.Write (outstr1)
	Response.Write (outstr2)
	Response.Write (outstr3)
	Response.Write (outstr4)
	Response.write "</font>"
	Response.Cookies("EngStrUtchnew")=outstr1+outstr2+outstr3+outstr4
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
	
	 
	 function tell1()
	 {
	   utter.voice=speechSynthesis.getVoices()[9]  ;
	   txt=""
	   txt=getCookie("EngStrUtchnew")
				for (var i=0;i<400;i++)
				{
				  txt=txt.replace("+"," ");
				}
	   utter.text=txt;
	   speechSynthesis.speak(utter);
	  }
	 
	 </script>
	 <button name="say"  onClick="tell1()">Say it</button>


</body>
</html>