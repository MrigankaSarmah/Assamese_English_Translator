<!DOCTYPE html>
<%@ CODEPAGE=65001%>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html;charset=UTF-8">
<TITLE>Translation</TITLE>
</HEAD>
<html>
<body>
<script>
document.cookie="AsStrUtch=x;"
document.cookie="QHStrUtch=y;"
</script>
<%

%>
<%  

	%>
    
    <table border="1" width="10%" ><FONT FACE="GIST-SND-DVOTDhruv" COLOR=#000000>
	<%' ' Response.write "<style>"
	  ' ' Response.write ".table {text-align:center; width:100%; height:100%;}"
	  ' ' Response.write ".cell {text-align:center;width:100%; height:100%;}"
	  ' ' Response.write "html,body { }"
	  ' ' Response.write "</style>"
	%>
	<% 	' ' Response.write "<div class='table'>"
		' ' Response.write "<div class='cell'>"
		
		
	%>
	
	
	<% ' ' ' Response.Write(" <font face=ariel color=black size=5 >English Sentence:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp   "+Request.QueryString("eng_text")+"</font>") %>
	
	<% 
	 For MessageLocal=1 to 100
	 
	   Set Conn = Server.CreateObject("ADODB.Connection")
DSNtest1="DRIVER={Microsoft Access Driver (*.mdb)}; "
DSNtest1=dsntest1 & "DBQ=D:\INETPUB\VHOSTS\aanaadtu.com\httpdocs\aananlp.mdb" 
Conn.Open DSNtest1
		Assamese_String=""
		Assamese_StringUtcharan=""
		set rs = Server.CreateObject("ADODB.recordset")


	   eng_str=LCase(Request.Form("Testmsg"+CStr(MessageLocal))+" ;")
	   eng_arrayDemo=split(eng_str," ")
	   eng_arrayTemp=Array("","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","")
	   
	   cntst=0
	   Close=0
	  for each itm in eng_arrayDemo
		' ' ' Response.write eng_arrayDemo(cntst)+"/"
		if itm<>"" Then
			if itm=";" Then Close=1 end if
			eng_arrayTemp(cntst)=itm
			cntst=cntst+1
		elseif Close=0 Then
		elseif Close=1 Then
			'eng_arrayTemp(cntst)="."
			
		end if
		
	  next
	  cntst=0
	  StringSearchFind=""
	  for each itm in eng_arrayTemp
		
		if itm<>";" Then
			''Response.write eng_arrayTemp(cntst)
			StringSearchFind=StringSearchFind+itm+" "
			cntst=cntst+1
		end if
	  next
	  ''Response.write "\?"+StringSearchFind
	   Final=0
	   rs.open "select Assamese,AssameseUtcharan from tab_sentences where English='"+StringSearchFind+"'", Conn 
			if rs.eof Then
				'Do Search
				
			else
				 Final=1
				 ' Response.Write("<br/><font face=ariel color=black size=3>The Generated Assamese Translation is</font><br/>")
			     ' Response.Write("<font face=ariel color=black size=5>"+rs.Fields(0).value+" "+" </font><br/>")
				 ' Response.Write("(<font face=ariel color=black size=5>"+rs.Fields(1).value+" "+" </font>)")
				 ' Response.Cookies("AsStrUtchnew")=rs.Fields(1).value
				 ' Response.Cookies("QHStrUtchnew")=""
				 ThirdStringValued=rs.Fields(0).value
				 ThirdStringValuedUtcharan=rs.Fields(1).value
			end if
	   rs.close
	   
	   
	   
	   'Finding Phrases in a Sentence(Max. 3)
	   ' separators such as for/if/and/but/because/until/unless
	  
	   
	   
	if Final=0 Then
	   
	   AmbiguityTermExist=1
	   AmbiguityTermDone=1
	   AmbiguityTerm=0
	   FoundatleastoneQH=0
	   FrontQHType=0
	   ThanConjDone=0
       Do                 '' To Find the string upto max. three ambigous terms
		
		Assamese_String=""                      '' The connective terms and phrases have to be preprocessed
	    Assamese_StringUtcharan=""              '' Overuse of computation time and can cause loss of execution time
		Assamese_StringFinal=""
			Assamese_StringUtcharanFinal=""
			
	   AmbTermOne=""
		AmbTermOneUtch=""
		AmbTermOneMeaning=""
		AmbTermTwo=""
		AmbTermTwoUtch=""
		AmbTermTwoMeaning=""
		AmbTermThree=""
		AmbTermThreeUtch=""
		AmbTermThreeMeaning=""
       Phrases1=""   'not ";" but only on event of connection
	   Phrases2=""
	   Phrases3=""
	   ConnectiveTermONE=""
	   ConnectiveTermTWO=""
	   ConnectiveTermTHREE=""
	   count=0
	   tempcount=0
	   posto=0
	   posnot=-1
	   foundperson=0
	    FirstStringValued=""
		SecondStringValued=""
		ThirdStringValued=""
		FirstStringValuedUtcharan=""
		SecondStringValuedUtcharan=""
		ThirdStringValuedUtcharan=""
	   
	   
					AuxVerbTermONE=""
				  AuxVerbTermONEUtcharan=""
				  AuxVerbTermTWO=""
				  AuxVerbTermTWOUtcharan=""
				  VerbTermONEUtcharan=""
				  VerbTermTwoUtcharan=""
	   
	   for each elm in eng_arrayTemp
		    if elm="as" Then
			  elm="because"
			end if
			if elm="not" Then
				posnot=count
			end if
			if elm="that" or elm="than" or elm="to" or elm="while" or elm="with"  or elm="before"or elm="after" or elm="for" or elm="but" or elm="because" or elm="untill" or elm="unless" or elm="if" or elm="and" Then
				'' ' ' Response.Write "TOHere.."
				if elm="to" Then
				   posto=count
				end if
				'' ' ' Response.Write posto
				if Phrases1="" and eng_arrayTemp(0)<> elm Then
					ConnectiveTermONE=elm
					For i=0 to count-1
						Phrases1=Phrases1+eng_arrayTemp(i)
						if eng_arrayTemp(i)<> elm Then
							Phrases1=Phrases1+" "
						end if
						tempcount=tempcount+1
					Next
					
				elseif Phrases2="" and eng_arrayTemp(0)<> elm Then
					ConnectiveTermTWO=elm
					For i=tempcount+1 to count-1
						Phrases2=Phrases2+eng_arrayTemp(i)
						
						if eng_arrayTemp(i)<> elm Then
							Phrases2=Phrases2+" "
						end if
						tempcount=tempcount+1
					Next
					
				end if
				
			elseif elm=";" and Phrases1="" and eng_arrayTemp(0)<> elm Then
					ConnectiveTermTHREE=elm
					For i=tempcount to count
						Phrases3=Phrases3+eng_arrayTemp(i)
						if eng_arrayTemp(i)<>";" Then
							Phrases3=Phrases3+" "
						end if
						tempcount=tempcount+1
					Next
					
			elseif elm=";" and Phrases2<>"" and eng_arrayTemp(0)<> elm Then
					ConnectiveTermTHREE=elm
					For i=tempcount+2 to count
						Phrases3=Phrases3+eng_arrayTemp(i)
						if eng_arrayTemp(i)<>";" Then
							Phrases3=Phrases3+" "
						end if
						tempcount=tempcount+1
					Next
					
			elseif elm=";" and eng_arrayTemp(0)<> elm Then
					For i=tempcount+1 to count
						Phrases3=Phrases3+eng_arrayTemp(i)
						if eng_arrayTemp(i)<>";" Then
							Phrases3=Phrases3+" "
						end if
						tempcount=tempcount+1
					Next
			end if
			count=count+1
	   next
	   Phrases1=Phrases1+";"
	   Phrases2=Phrases2+";"
	  ' ' ' ' Response.Write("//First Phrase is: <font face=ariel color=cyan size=2 >"+Phrases1+"</font>//")
	  ' ' ' ' Response.Write("//Second Phrase is: <font face=ariel color=cyan size=2 >"+Phrases2+"</font>//")
	  ' ' ' ' Response.Write("//Third Phrase is: <font face=ariel color=cyan size=2 >"+Phrases3+"</font>//")
	  ' ' ' ' Response.Write("//ConnectiveTerm ONE is: <font face=ariel color=cyan size=2 >"+ConnectiveTermONE+"</font>//")
	  ' ' ' ' Response.Write("//ConnectiveTerm TWO is: <font face=ariel color=cyan size=2 >"+ConnectiveTermTWO+"</font>//")
	  ' ' ' ' Response.Write("//Total Count is: <font face=ariel color=dark green size=2 >")
	  ' ' ' ' Response.Write (count)
	  ' ' ' ' Response.Write("</font>//")
	   
	   'Phrase connection initialization
	   TermONEDONE=0
	   TermTWODONE=0
	   ConnectiveTermONETranslation="" 
		ConnectiveTermONETranslationUtcharan=""
		ConnectiveTermTWOTranslation="" 
		ConnectiveTermTWOTranslationUtcharan=""
	    have_=0
		actor1=-1
	   actor2=-1
	   actor3=-1
		SuperCounter=0
		MasterNoun=0
		MasterVerb=0
		
	 '''''''''''''''''Verb preprocessed'''''''''''''''''	
	 nextElement=0	
	 FoundtoafterVerb=0   
	 FoundtoafterVerb_VerbRoot=""		 
	 for each item in eng_arrayTemp
	                          if item<>";" Then
								  nextElement=nextElement+1
								  rs.Open "Select root from tab_tenseverb where english='"+item+"'", Conn 
								  if rs.EOF Then
								  'do nothing
								   
								  else
									  if eng_arrayTemp(nextElement)="to" Then
										FoundtoafterVerb=1
										FoundtoafterVerb_VerbRoot=rs.Fields(0).value
									  end if
									
								  end if
								  rs.close
							  end if
	 next
	 
	  For CountingPhrases=1 to 3       
	   Assamese_String=""
	   Assamese_StringUtcharan=""
	   Assamese_String=""                      '' The connective terms and phrases have to be preprocessed
	    Assamese_StringUtcharan=""              '' Overuse of computation time and can cause loss of execution time
		Assamese_StringFinal=""
		Assamese_StringUtcharan=""
		
	   ''''DATA
	   WordDonewith=0
	   ElementCount=0
	   sglr=0
	   plrl=0
	   heavy=0
	   light=0
	   foundthis=0
	   founda=0	          'correction on   13.3.19
	  
	   callsay=0
	   personcallsay=0
	   firstperson=0
	   secondperson=0
	   thirdperson=0
	   firstpersonaux=0
	   secondpersonaux=0
	   thirdpersonaux=0
	   pst=0
	   prst=0
	   ftre=0
	   pstaux=0
	   prstaux=0
	   ftreaux=0
	   mainverb=""
	   onlyRoot=0
	   auxverb=""
	   tense=""
	   tenseauxverb=""
	   noun=""
	   foundto=0
	   founddo=0
	   affirverb=0  
	   nounafterto=0
	   locafterto=0
	   personafterto=0
	   foundpronoun=0
	   theafterto=0
	   translationnounafterto=""
	   verbafterto=0
	   QHString=""
	   foundfrom=0
	   foundof=0
	   Foundwherefrom=0
	   Foundwhere=0
	   tempto=0
	   moneymatters=0
	   foundhowwhat=0
	   foundhow=0
	   foundare=0
	   FoundMy=0
	   FoundI=0
	   FoundIyouMy=0
	   Foundhebeforehim=0
	   Foundhimbeforehe=0
	   Foundherbeforeshe=0
	   Foundshebeforeher=0
	   foundmoney=0
	   foundnoun=0
	   foundQH=0
	   Foundkeep=0
	   FoundMebeforeyou=0
	   foundnot=0
	   foundauxnot=0
	   foundTHE=0
	   foundMove=0
	   foundthisdone=0
	   foundadone=0
	   mainverbPOSITION=-1
	   auxverbPOSITION=-1
	   Foundtimeverbmodifier=0
       BeginQst=0
	   AgeDetector=0
		ENDSTRING=""
		ENDSTRINGUtcharan=""
	   NounTerm=""
	   PronounTerm=""
	   AUXPronounTerm=""
                 VerbTerm=""
                 ArticleTerm=""
                 AdjectiveTerm=""
        Foundhaddefault=0
		Foundhowlong=""
		Foundhavedefault=0
		donotbe=0		  
		Foundhowfar=0
		FoundSlowDown=0
                 ConnectiveTerm=""
		ModBe=0
		''''''Assamese_String   ##IGNORE RESTART
		'''''Assamese_StringUtcharan ##IGNORE RESTART
		NounTermUtcharan=""
	   PronounTermUtcharan=""
	   AUXPronounTermUtcharan=""
                 VerbTermUtcharan=""
                 ArticleTermUtcharan=""
                 AdjectiveTermUtcharan=""
                 AuxVerbTermUtcharan=""
                 ConnectiveTermUtcharan=""
		QHStringUtcharan=""
		LOC_StringONE=""
		LOC_StringTWO=""
		NounTermONE=""
		NounTermONEUtcharan=""
		NounTermTWO=""
		NounTermTWOUtcharan=""
		VerbTermONE=""
		VerbTermONEUtcharan=""
		VerbTermTWO=""
		VerbTermTWOUtcharan=""
		ENDSTRINGONE=""
		ENDSTRINGTWO=""
		foundLOC_StringONE=0
		foundLOC_StringTWO=0
		foundNounTermONE=0
		foundNounTermTWO=0
		foundVerbTermONE=0
		foundVerbTermTWO=0
		foundENDSTRINGONE=0
		foundENDSTRINGTWO=0
	    qualityConcern=0
		Foundat=0
		Foundin=0
		Foundwhowhomtense=0
		dayaft=0
		daybfr=0
		 foundsomenot=0
		 WordDonewith=0
		 MasterNoundone=0
		 Foundthat=0
		 Foundwith=0
		 Foundwiththat=0
		 FoundFemale=0
		 ToExists=0
		 ForDone=0
		 FoundThinking=0
		 Foundsay=0
		 Foundwork=0
	   '''
	   
	    
	   if CountingPhrases=1 and Phrases1<>" ;" Then
						eng_array=split(Phrases1," ")
						rs. Open "Select translation,translationUtcharan from tab_additional where english='"+ConnectiveTermONE+"'", Conn 
						  if rs.EOF Then
						  'do nothing
						  else
							  ConnectiveTermONETranslation=rs.Fields(0).value+" " 
							  ConnectiveTermONETranslationUtcharan=rs.Fields(1).value+" " 
							   
							   '' ' ' Response.Write ConnectiveTermONETranslation
							   WordDone=1
						   end if
						   rs.close
	   elseif CountingPhrases=2 and Phrases2<>" ;" Then
						eng_array=split(Phrases2," ")
						rs. Open "Select translation,translationUtcharan from tab_additional where english='"+ConnectiveTermTWO+"'", Conn 
						 if rs.EOF Then
						  'do nothing
						  else
								  ConnectiveTermTWOTranslation=rs.Fields(0).value+" " 
								  ConnectiveTermTWOTranslationUtcharan=rs.Fields(1).value+" " 
								  '' ' ' Response.Write ConnectiveTermTWOTranslation
								   WordDone=1
						  end if
						  rs.close
	   elseif CountingPhrases=3 and Phrases3<>" ;"  Then
					 eng_array=split(Phrases3," ")  
	   end if
	   
	   
	  ' ' ' ' Response.Write "/First Element is:/"+eng_array(0)+"/"
	   
	   
	   For each elm in eng_array
		'	' ' Response.Write elm+" "
			if elm="how"  Then
				Foundhowfar=0.5
			end if
			
	   next
	
	   For each elm in eng_array
		'	' ' Response.Write elm+" "
			if  elm="long" and Foundhowfar=0.5 Then
				Foundhowlong="long"
			end if
			if  elm="is" and Foundhowlong="long" Then
				Foundhowlong="long"
			end if
			if  (elm="it" or elm="does" or elm="that" or elm="to" )and Foundhowlong="long" Then
				Foundhowlong="time"
			end if
	   next
	   
	   
	   For each elm in eng_array
		'	' ' Response.Write elm+" "
			if (elm="far" or elm="much" or elm="long" or elm="old" or elm="many") and Foundhowfar=0.5 Then
			    if elm="old" Then
					Foundhowfar=0.60
				
				else
					Foundhowfar=1
				end if
			end if
			
			
			
	   next
	   For each elm in eng_array
		'	' ' Response.Write elm+" "
			if elm="him" and Foundhebeforehim=0 Then
				Foundhimbeforehe=0.5
			elseif elm="he" and Foundhimbeforehe=0.5  Then
				Foundhimbeforehe=1
			elseif elm="he" and Foundhimbeforehe=0  Then
				Foundhebeforehim=0.5
			elseif elm="him" and Foundhebeforehim=0.5  Then
				Foundhebeforehim=1
			elseif elm="her" and Foundshebeforeher=0 Then
				Foundherbeforeshe=0.5
			elseif elm="she" and Foundherbeforeshe=0.5  Then
				Foundherbeforeshe=1
			elseif elm="she" and Foundherbeforeshe=0 Then
				Foundshebeforeher=0.5
			elseif elm="her" and Foundshebeforeher=0.5  Then
				Foundshebeforeher=1
			end if
			
	   next
	   
	   For each elm in eng_array
		'	' ' Response.Write elm+" "
			if elm="think" or elm="thinking" or elm="thought" Then
				FoundThinking=1
			elseif elm="talk" or elm="talking" or elm="talked" Then
				Foundsay=1
			elseif elm="say" or elm="saying" or elm="said" Then
				Foundsay=1
			elseif elm="work" or elm="working" or elm="worked" Then
				Foundwork=1
			end if
			
	   next
	   
	   For each elm in eng_array
		'	' ' Response.Write elm+" "
			if elm="slow" or elm="slowed" or elm="slowing"  Then
				FoundSlowDown=0.5
			end if
			
	   next
	   For each elm in eng_array
		'	' ' Response.Write elm+" "
			if elm="down" and FoundSlowDown=0.5 Then
				FoundSlowDown=1
			end if
			
	   next
	   
	   For each elm in eng_array
		'	' ' Response.Write elm+" "
			if elm="keep"  Then
				Foundkeep=1
			end if
			
	   next
	   For each elm in eng_array
		'	' ' Response.Write elm+" "
			if elm="i"  Then
				FoundIyouMy=0.2
			end if
			
	   next
	   For each elm in eng_array
		'	' ' Response.Write elm+" "
			if elm="you" and FoundIyouMy=0.2 Then
				FoundIyouMy=0.5
			end if
			
	   next
	   For each elm in eng_array
		'	' ' Response.Write elm+" "
			if elm="my" and FoundIyouMy=0.5 Then
				FoundIyouMy=1
			end if
			
	   next
	   
	   For each elm in eng_array
		'	' ' Response.Write elm+" "
			if elm="feeling" or elm="feel" or elm="felt" or elm="health" Then
				qualityConcern=1     ''this section of code is  needed....
				WordDone=0
			end if
			
	   next
	   
	   For each elm in eng_array
		'	' ' Response.Write elm+" "
			if elm="at" and eng_array(0)<>"at" Then
				Foundat=1
				
			end if
			
	   next
	   For each elm in eng_array
		'	' ' Response.Write elm+" "
			if elm="had"  Then
				Foundhaddefault=1
				
			end if
			
	   next
	   For each elm in eng_array
		'	' ' Response.Write elm+" "
			if elm="have"  Then
				Foundhavedefault=1
				
			end if
			
	   next
	   For each elm in eng_array
		'	' ' Response.Write elm+" "
			if elm="in"  Then
				Foundin=1
				
			end if
			
	   next
	    For each elm in eng_array
		'	' ' Response.Write elm+" "
			if elm="who" or elm="whom" Then
				Foundwhowhomtense=1
				
			end if
			
	   next
	   For each elm in eng_arrayTemp
		'	' ' Response.Write elm+" "
			if elm="with" Then
				Foundwith=1
				
			end if
			
	   next
	   For each elm in eng_array
		'	' ' Response.Write elm+" "
			if elm="that" Then
				Foundthat=1
				
			end if
			
	   next
	   
	   For each elm in eng_array
		'	' ' Response.Write elm+" "
			if Foundwith=1 Then
				if elm="that" Then
				  Foundwiththat=1
				
			    end if
				
			end if
			
	   next
	   For each elm in eng_array
		
			if elm="where"  Then
				Foundwhere=1
				
			end if
			
	   next
	   
	   For each elm in eng_array
		'	' ' Response.Write elm+" "
			
				if elm="from" and Foundwhere=1 Then
				  Foundwherefrom=1
				
			    end if
				
			
			
	   next
	   For each elm in eng_array
		'	' ' Response.Write elm+" "
			
										
							  rs.Open "Select root,tense from tab_tenseverb where english='"+elm+"'", Conn 
							  if rs.EOF Then
							  'do nothing
							   
							  else
							   MasterVerb=1
							    
							  end if
							  rs.close
				
		
	   next
	  
	   identificationTag=0
	   Meaning_Array=Array("","","","","","","","","","","","","","","","","")
	   '' ' Response.Write "Assamese Phrase:"
	   AmbTermOne=""
	   AmbTermTwo=""
	   AmbTerThree=""
	   
	   
	   '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	   '''''''''''''''''''''''''''''WORD PROCESSING BEGINS HERE''''''''''''''''''''''
	   '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	   
	   
	   For each elm in eng_array                
	        WordDone=0
			Curr_Term=""
		  SuperCounter=SuperCounter+1
		  ElementCount=ElementCount+1
		  
		  ' ' ' Response.write elm
		  ' ' ' Response.write SuperCounter
		'  ' ' Response.Write "/"+elm+"/#"
		 ' ' ' Response.Write ElementCount
		  
		  '' ' Response.Write "/Actors/"
		  '' ' Response.Write actor1
		  '' ' Response.Write actor2
		  '' ' Response.Write actor3
		  '' ' Response.Write "/"
			AmbTermOne=""                           ''Reset few variables to null
			AmbTermOneUtch=""
			AmbTermOneMeaning=""
			AmbTermTwo=""
			AmbTermTwoUtch=""
			AmbTermTwoMeaning=""
			AmbTermThree=""
			AmbTermThreeUtch=""
			AmbTermThreeMeaning=""
			elmisNum=-1
			' identification of ambigous words
			
	      
		 ' for numbers
		 elmisNum=isNumeric(Right(elm,1))
		 lengthNumber=len(elm)
		 ' ' Response.write elmisNum
		 ' ' Response.Write " "
		 ' ' Response.write elm
		 
		 if elmisNum=True Then
			Data=Left(elm,1)
			Do
				if lengthNumber > 2 Then
					
					
					Data=Data*(10 ^ (lengthNumber-1) )
					' ' Response.write Data
					rs. Open "Select translation,translationUtcharan from tab_additional where english='"+CStr(Data)+"'", Conn 
							  if rs.EOF Then
							  'do nothing
							  else
								   DataString=DataString+rs.Fields(0).value
								   DataStringUtcharan=DataStringUtcharan+rs.Fields(1).value
								   '' ' Response.Write ConnectiveTermONETranslation
								   WordDone=1
							   end if
					rs.close
					lengthNumber=lengthNumber-1
					Data=Right(elm,lengthNumber)
					
				else
					
				end if
			Loop While(lengthNumber>2)
			if lengthNumber=2 or lengthNumber<2 Then
					rs. Open "Select translation,translationUtcharan from tab_additional where english='"+CStr(Data)+"'", Conn 
							  if rs.EOF Then
							  'do nothing
							  else
								   DataString=DataString+rs.Fields(0).value
								   DataStringUtcharan=DataStringUtcharan+rs.Fields(1).value
								   '' ' Response.Write ConnectiveTermONETranslation
								   WordDone=1
							   end if
					rs.close
					Assamese_String=DataString
					Assamese_StringUtcharan=DataStringUtcharan
					
			end if
		 end if   ' end of numeric test
		  
		  
		  ' ' Response.Write "Number:"
		  ' ' Response.Write DataString
		  
		  ' for complex words (2 words/3 words composite forms)
		  if elm="high" Then
			if eng_array(ElementCount)="school" Then
					WordDone=1
					
					
			end if
		  end if
		  if elm="good" Then
			
				if eng_array(ElementCount)="afternoon" Then
					WordDone=1
					
					Assamese_String=Assamese_String+" "+"গোড আফ্তাৰ্নুন"
					Assamese_StringUtcharan=Assamese_StringUtcharan+" "+"good afternoon"
				elseif eng_array(ElementCount)="morning" Then
					WordDone=1
					
					Assamese_String=Assamese_String+" "+"সুপ্ৰভাত"
					Assamese_StringUtcharan=Assamese_StringUtcharan+" "+"xuprobhat"
				elseif eng_array(ElementCount)="night" Then
					WordDone=1
					
					Assamese_String=Assamese_String+" "+"সুভ ৰাত্ৰী"
					Assamese_StringUtcharan=Assamese_StringUtcharan+" "+"xubho ratri"
				elseif eng_array(ElementCount)="evening" Then
					WordDone=1
					
					Assamese_String=Assamese_String+" "+"সুভ সন্ধীয়া"
					Assamese_StringUtcharan=Assamese_StringUtcharan+" "+"xubho xondhiya"
				end if
		  end if
		 
		 
		 if  ThanConjDone=0 and (ConnectiveTermONE="than" and ( (CountingPhrases=2 and Phrases2<>";") or (CountingPhrases=3 and Phrases2=";") )) or (ConnectiveTermTWO="than" and CountingPhrases=3)  Then
			if elm="you" Then
				WordDone=1
				ThanConjDone=1
				  if actor1=-1 Then
				   PronounTerm=PronounTerm+" তোমাতকৈ"
				   PronounTermUtcharan=PronounTermUtcharan+" tumatkoi"
				   secondperson=1
							
				   sglr=1
				   foundpronoun=1
				   actor1=1
				   
				  elseif actor1=1 Then
					AUXPronounTerm=AUXPronounTerm+" তোমাতকৈ"
					AUXPronounTermUtcharan=AUXPronounTermUtcharan+" tumatkoi"
					secondpersonaux=1
					actor2=1
					
				 end if
			elseif elm="him" Then
				
				WordDone=1
				ThanConjDone=1
				  if actor1=-1 Then
				   PronounTerm=PronounTerm+" তাতকৈ"
				   PronounTermUtcharan=PronounTermUtcharan+" tatkoi"
				   thirdperson=1
							
				   sglr=1
				   foundpronoun=1
				   actor1=1
				   
				  elseif actor1=1 Then
					AUXPronounTerm=AUXPronounTerm+" তাতকৈ"
					AUXPronounTermUtcharan=AUXPronounTermUtcharan+" tatkoi"
					thirdpersonaux=1
					actor2=1
					
				 end if
			elseif elm="her" Then
				
				WordDone=1
				ThanConjDone=1
				  if actor1=-1 Then
				   PronounTerm=PronounTerm+" তাইতকৈ"
				   PronounTermUtcharan=PronounTermUtcharan+" taaitkoi"
				   thirdperson=1
							
				   sglr=1
				   foundpronoun=1
				   actor1=1
				   
				  elseif actor1=1 Then
					AUXPronounTerm=AUXPronounTerm+" তাইতকৈ"
					AUXPronounTermUtcharan=AUXPronounTermUtcharan+" taaitkoi"
					thirdpersonaux=1
					actor2=1
					
				 end if
			elseif elm="them" Then
				
				WordDone=1
				ThanConjDone=1
				  if actor1=-1 Then
				   PronounTerm=PronounTerm+" তাহাততকৈ"
				   PronounTermUtcharan=PronounTermUtcharan+" taahatotkoi"
				   thirdperson=1
							
				   sglr=1
				   foundpronoun=1
				   actor1=1
				   
				  elseif actor1=1 Then
					AUXPronounTerm=AUXPronounTerm+" তাহাততকৈ"
					AUXPronounTermUtcharan=AUXPronounTermUtcharan+" taahatotkoi"
					thirdpersonaux=1
					actor2=1
					
				 end if
			elseif elm="me" or elm="myself" Then
				
				WordDone=1
				ThanConjDone=1
				  if actor1=-1 Then
				   PronounTerm=PronounTerm+" মোতকৈ"
				   PronounTermUtcharan=PronounTermUtcharan+" mutkoi"
				   firstperson=1
							
				   sglr=1
				   foundpronoun=1
				   actor1=1
				   
				  elseif actor1=1 Then
					AUXPronounTerm=AUXPronounTerm+" মোতকৈ"
					AUXPronounTermUtcharan=AUXPronounTermUtcharan+" mutkoi"
					firstpersonaux=1
					actor2=1
					
				 end if
			elseif elm="ourself" Then
				
				WordDone=1
				ThanConjDone=1
				  if actor1=-1 Then
				   PronounTerm=PronounTerm+" আমাতকৈ"
				   PronounTermUtcharan=PronounTermUtcharan+" amaatkoi"
				   third=1
							
				   sglr=1
				   foundpronoun=1
				   actor1=1
				   
				  elseif actor1=1 Then
					AUXPronounTerm=AUXPronounTerm+" আমাতকৈ"
					AUXPronounTermUtcharan=AUXPronounTermUtcharan+" amaatkoi"
					thirdpersonaux=1
					actor2=1
					
				 end if
			elseif elm="theirself" or elm="themselves" Then
				
				WordDone=1
				ThanConjDone=1
				  if actor1=-1 Then
				   PronounTerm=PronounTerm+" তাহাততকৈ"
				   PronounTermUtcharan=PronounTermUtcharan+" tahatotkoi"
				   thirdperson=1
							
				   sglr=1
				   foundpronoun=1
				   actor1=1
				   
				  elseif actor1=1 Then
					AUXPronounTerm=AUXPronounTerm+" তাহাততকৈ"
					AUXPronounTermUtcharan=AUXPronounTermUtcharan+" tahatotkoi"
					thirdpersonaux=1
					actor2=1
					
				 end if
			else
				
				
				
				ThanConjDone=0.5   ' than conjunction token not placed
				  
			end if
		 end if
		 
		 if count>1 and elm="down" Then
			if ( eng_array(ElementCount-2)="slow" or eng_array(ElementCount-2)="slowed" or eng_array(ElementCount-2)="slowing" ) Then
				WordDone=1
			end if
		 end if 
		  if count>1 and elm="evening"   Then
		    if  eng_array(ElementCount-2)="good" Then
				WordDone=1
			end if
		  elseif count>1 and elm="morning"  Then
			if  eng_array(ElementCount-2)="good" Then
				WordDone=1
			end if
		  elseif count>1 and elm="afternoon" Then
			if  eng_array(ElementCount-2)="good" Then
				WordDone=1
			end if
		  elseif count>1 and elm="night" Then
			if  eng_array(ElementCount-2)="good" Then
				WordDone=1
			end if
		  end if
		  
		  
		   ' for noun words
		  
		  
		  
		  if ElementCount=1 Then 
				  if  StrComp(eng_array(0),"is",0)=0 or StrComp(eng_array(0),"are",0)=0  or StrComp(eng_array(0),"will",0)=0  or StrComp(eng_array(0),"would",0)=0 or StrComp(eng_array(0),"shall",0)=0 or StrComp(eng_array(0),"should",0)=0 or StrComp(eng_array(0),"can",0)=0 or StrComp(eng_array(0),"could",0)=0 Then
				QHString=QHString+" হ’বনে"
				QHStringUtcharan=QHStringUtcharan+" hobone "
				BeginQst=1         
				WordDone=1
			   end if
			   if (StrComp(eng_array(0),"do")=0  or StrComp(eng_array(0),"does")=0 ) and WordDone=0 Then
				QHString=QHString+" হ’বনে "
				QHStringUtcharan=QHStringUtcharan+" hobone "
				 ftre=1 
				 BeginQst=1
				 WordDone=1
			   end if
			   if  StrComp(eng_array(0),"did")=0 or StrComp(eng_array(0),"was",0)=0 or StrComp(eng_array(0),"were",0)=0 and WordDone=0 Then
				QHString=QHString+" আছিলনে "
				QHStringUtcharan=QHStringUtcharan+" asilne "
				 pst=1 
				 BeginQst=1
				 WordDone=1
			   end if
			   if (StrComp(eng_array(0),"have")=0  or StrComp(eng_array(0),"had")=0 or StrComp(eng_array(0),"has")=0 ) and WordDone=0 Then
					QHString="হয়"
					QHStringUtcharan="hoi"
					BeginQst=1
					 pst=1     
					WordDone=1
			   end if
		  end if
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  if elm="let" Then
		    Assamese_String=Assamese_String+"মানি লোঁৱা"
			Assamese_StringUtcharan=Assamese_StringUtcharan+"mani lua"
			WordDone=1
		  end if
		 
		 if elm="day" and  Count-ElementCount>3  then
			if eng_array(ElementCount)="after" and eng_array(ElementCount+1)="tomorrow" Then
				dayaft=1
				rs.Open "Select translation,translationUtcharan from tab_additional where english='dayaftertomorrow'", Conn 
					if rs.eof Then
						'nothing
					else
						Assamese_String=Assamese_String+rs.Fields(0).value
						Assamese_StringUtcharan=Assamese_StringUtcharan+rs.Fields(1).value
					end if
				rs.close
				WordDone=1
			elseif eng_array(ElementCount)="before" and eng_array(ElementCount+1)="yesterday" Then
				daybfr=1
				rs.Open "Select translation,translationUtcharan from tab_additional where english='daybeforeyesterday'", Conn 
					if rs.eof Then
						'nothing
					else
						Assamese_String=Assamese_String+rs.Fields(0).value
						Assamese_StringUtcharan=Assamese_StringUtcharan+rs.Fields(1).value
					end if
				rs.close
				WordDone=1
			end if
			WordDone=1
		 end if
		 if elm="the" Then
			fdthe=1
			WordDone=1
		 elseif elm="this" Then
			fdthis=1
			WordDone=1
		 elseif elm="is" Then
			fdis=1
			WordDone=1
		 elseif elm="was" Then
			fdwas=1
			WordDone=1
		 elseif elm="did" Then
		    fddid=1
			WordDone=1
			pst=1
			prst=0
			ftre=0
		 elseif elm="do" Then
		    fddo=1
			WordDone=1
		 end if
	  
		
        
		 
	if (ConnectiveTermONE="with" ) and WordDonewith=0 and (CountingPhrases=2 or CountingPhrases=3)  Then
	   
		
		if elm="me" Then
				  ConnectiveTermONETranslation=""
				 ConnectiveTermONETranslationUtcharan=""
		          ConnectiveTermONETranslation="মোৰ"+" "+"সৈতে"
		  		  ConnectiveTermONETranslationUtcharan="muur"+" "+"xoite"
				  WordDonewith=1
				  WordDone=1
				  '' ' Response.Write "/WordDone2/"
		elseif elm="you" Then
					ConnectiveTermONETranslation="তোমাৰ"+" "+ConnectiveTermONETranslation
		  		  ConnectiveTermONETranslationUtcharan="tumar"+" "+ConnectiveTermONETranslationUtcharan
				  WordDonewith=1
				  WordDone=1
		else
		         ' ConnectiveTermONETranslation=ConnectiveTermONETranslation
		  		  ' ConnectiveTermONETranslationUtcharan=ConnectiveTermONETranslationUtcharan
				  ' WordDonewith=1
				  ' WordDone=1
		end if
		
	
	elseif (ConnectiveTermTWO="with") and WordDonewith=0 and (CountingPhrases=2 or CountingPhrases=3) Then
	    
		if elm="me" Then
		        ConnectiveTermTWOTranslation=""
				ConnectiveTermTWOTranslationUtcharan=""
		        ConnectiveTermTWOTranslation="মোৰ"+" "+"সৈতে"
		  		  ConnectiveTermTWOTranslationUtcharan="muur"+" "+"xoite"
				  WordDonewith=1
				  WordDone=1
				 ' ' ' Response.Write "/WordDone2/"
		elseif elm="you" Then
		           ConnectiveTermTWOTranslation="তোমাৰ"+" "+ConnectiveTermTWOTranslation
		  		  ConnectiveTermTWOTranslationUtcharan="tumar"+" "+ConnectiveTermTWOTranslationUtcharan
				  WordDonewith=1
				  WordDone=1
		else
		        ' ConnectiveTermTWOTranslation=ConnectiveTermTWOTranslation
		  		  ' ConnectiveTermTWOTranslationUtcharan=ConnectiveTermTWOTranslationUtcharan
				  ' WordDonewith=1
				  ' WordDone=1  
		end if
		
	end if
		 
		 
		 if dayaft=0 and daybfr=0 and (elm="day" or elm="yesterday" or elm="tonight" or elm="today" or elm="night" or elm="tomorrow") Then
			rs.Open "Select translation,translationUtcharan from tab_additional where english='"+elm+"'", Conn 
			if rs.eof Then
			  'nothing
			else
			   WordDone=1
			   Assamese_String=Assamese_String+rs.Fields(0).value+" "
			   Assamese_StringUtcharan=Assamese_StringUtcharan+rs.Fields(1).value+" "
			end if
			rs.close
			
		 end if
		 
		 
		 if (elm="here" or elm="there" ) and ElementCount > 2 Then
			if  eng_array(ElementCount-2)="go" or eng_array(ElementCount-2)="move" or eng_array(ElementCount-2)="run" or eng_array(ElementCount-2)="walk" or eng_array(ElementCount-2)="drive" or eng_array(ElementCount-2)="ride" or eng_array(ElementCount-2)="cycle" Then
		        '' ' Response.Write "/"+elm+"/@"
		        '' ' Response.Write ElementCount
				foundMove=1
			end if
			if  eng_array(ElementCount-2)="going" or eng_array(ElementCount-2)="moving" or eng_array(ElementCount-2)="running" or eng_array(ElementCount-2)="walking" or eng_array(ElementCount-2)="driving" or eng_array(ElementCount-2)="riding" or eng_array(ElementCount-2)="cycling" Then
		        '' ' Response.Write "/"+elm+"/@"
		        '' ' Response.Write ElementCount
				foundMove=1
			end if
			if  eng_array(ElementCount-2)="gone" or eng_array(ElementCount-2)="moved" or eng_array(ElementCount-2)="ran" or eng_array(ElementCount-2)="walked" or eng_array(ElementCount-2)="driven" or eng_array(ElementCount-2)="rode" or eng_array(ElementCount-2)="cycled" Then
		        '' ' Response.Write "/"+elm+"/@"
		        '' ' Response.Write ElementCount
				foundMove=1
			end if
			WordDone=1
		 end if
	     
		   'if StrComp(elm,"do")=0 and StrComp(eng_array(ElementCount),"not")=0 Then
		      ' founddo=0
		    'end if
		  if   StrComp(elm,"cannot")=0 or StrComp(elm,"no")=0 or StrComp(elm,"dont")=0 or StrComp(elm,"don't")=0 or StrComp(elm,"won't")=0 or StrComp(elm,"wont")=0 or StrComp(elm,"cant")=0 or StrComp(elm,"can't")=0 or StrComp(elm,"shan't")=0 or StrComp(elm,"shant")=0 Then
			   WordDone=100
			   
					if mainverb<>"" Then
					   foundauxnot=1
					   if eng_array(ElementCount)="be" Then
							donotbe=1
							
						end if
					else
						foundnot=1
						if eng_array(ElementCount)="be" Then
							donotbe=1
							
						end if
					end if
			   
			   
				ftre=1
				tense="ftre"		   
				 '' ' Response.Write "/NEG/"
				 if elm="don't" Then
				  elm="dont"
				 end if
				 if elm="won't" Then
				  elm="wont"
				 end if
				 if elm="can't" Then
				  elm="cant"
				 end if
		  elseif  StrComp(elm,"not")=0 or StrComp(elm,"never")=0 Then 
				'WordDone=100
				foundnot=1
				if mainverb<>"" Then
					   foundnot=1
					   if eng_array(ElementCount)="be" Then
							donotbe=1
							
						end if
				
				end if
				
				
				   
	       end if
		  if StrComp(elm,"the")=0 or StrComp(elm,"a")=0 Then
		    thirdpersonaux=1
			WordDone=1
		  end if
		  if StrComp(elm,"how")=0 or StrComp(elm,"what")=0 Then
		     foundhowwhat=1
			 
			 WordDone=1
		  end if
	     if StrComp(elm,"are")=0 Then
		  foundare=1
		  WordDone=1
		 end if
		 if StrComp(elm,"money")=0 or StrComp(elm,"cost")=0 or StrComp(elm,"price")=0 or StrComp(elm,"rupees")=0 or StrComp(elm,"charge")=0 Then
		      foundmoney=1
			  WordDone=1
		  end if
	      
		  if StrComp(elm,"from")=0 Then
		    foundfrom=1
            WordDone=1        
	       end if
		   if StrComp(elm,"of")=0 Then
		    foundof=1
            WordDone=1        
	       end if
		   if StrComp(elm,"have")=0 and CountingPhrases=1 and WordDone=0 and StrComp(eng_array(0),"have")<>0 Then
		    have_=1
			
            'WordDone=1        
	       end if
		   if StrComp(elm,"have")=0 and CountingPhrases=2 and WordDone=0 and StrComp(eng_array(0),"have")<>0 Then
		    have_=2
			
            'WordDone=1        
	       end if
		   
		   if foundfrom=1 and ( StrComp(elm,"here")=0 or StrComp(elm,"there")=0 ) Then
                   ' ' ' Response.Write "foundfrom"
						 rs. Open "Select translation,translationUtcharan from tab_additional where english='from_"+elm+"'", Conn 
						  Assamese_String=Assamese_String+rs.Fields(0).value+" " 
						  Assamese_StringUtcharan=Assamese_StringUtcharan+rs.Fields(1).value+" " 
                           rs.close
						if foundLOC_StringONE=0 Then
							LOC_StringONE=Assamese_String
							LOC_StringONEUtcharan=Assamese_StringUtcharan
							foundLOC_StringONE=1
						elseif foundLOC_StringTWO=0 Then
							LOC_StringTWO=Assamese_String
							LOC_StringTWOUtcharan=Assamese_StringUtcharan
							foundLOC_StringTWO=1
						end if
						Assamese_String="" 
						  Assamese_StringUtcharan="" 
						  WordDone=1
           elseif ( StrComp(elm,"there")=0 or StrComp(elm,"here")=0 ) and  foundfrom=0 and ElementCount>2 Then
                    '' ' Response.Write foundfrom
					if eng_array(ElementCount-2)="is" or eng_array(ElementCount-2)="was" or eng_array(ElementCount-2)="it" or eng_array(ElementCount-2)="that" or eng_array(ElementCount-2)="those" or eng_array(ElementCount-2)="them" Then
						rs. Open "Select translation,translationUtcharan from tab_additional where english='pos_"+elm+"'", Conn 
						  Assamese_String=Assamese_String+rs.Fields(0).value+" " 
						  Assamese_StringUtcharan=Assamese_StringUtcharan+rs.Fields(1).value+" " 
                           rs.close
						   if foundLOC_StringONE=0 Then
							LOC_StringONE=Assamese_String
							LOC_StringONEUtcharan=Assamese_StringUtcharan
							foundLOC_StringONE=1
						elseif foundLOC_StringTWO=0 Then
							LOC_StringTWO=Assamese_String
							LOC_StringTWOUtcharan=Assamese_StringUtcharan
							foundLOC_StringTWO=1
						end if
						Assamese_String="" 
						  Assamese_StringUtcharan="" 
					elseif foundMove=0 Then
						 rs. Open "Select translation,translationUtcharan from tab_additional where english='pos_"+elm+"'", Conn 
						  Assamese_String=Assamese_String+rs.Fields(0).value+" "
						  Assamese_StringUtcharan=Assamese_StringUtcharan+rs.Fields(1).value+" "
                          rs.close
						  if foundLOC_StringONE=0 Then
							LOC_StringONE=Assamese_String
							LOC_StringONEUtcharan=Assamese_StringUtcharan
							foundLOC_StringONE=1
						elseif foundLOC_StringTWO=0 Then
							LOC_StringTWO=Assamese_String
							LOC_StringTWOUtcharan=Assamese_StringUtcharan
							foundLOC_StringTWO=1
						end if
						Assamese_String="" 
						  Assamese_StringUtcharan="" 
				    else
						 rs. Open "Select translation,translationUtcharan from tab_additional where english='"+elm+"'", Conn 
						  Assamese_String=Assamese_String+rs.Fields(0).value+" "
						  Assamese_StringUtcharan=Assamese_StringUtcharan+rs.Fields(1).value+" "
                          rs.close
						  if foundLOC_StringONE=0 Then
							LOC_StringONE=Assamese_String
							LOC_StringONEUtcharan=Assamese_StringUtcharan
							foundLOC_StringONE=1
						elseif foundLOC_StringTWO=0 Then
							LOC_StringTWO=Assamese_String
							LOC_StringTWOUtcharan=Assamese_StringUtcharan
							foundLOC_StringTWO=1
						end if
						Assamese_String="" 
						  Assamese_StringUtcharan="" 
					end if
					WordDone=1
	      end if
		  if elm="how" and Foundhowfar>=0.60 Then
			WordDone=1000
			QHString=QHString+" কিমান " 
			QHStringUtcharan=QHStringUtcharan+" kiman " 
		  
		  end if
	      if WordDone<>1000 and ( elm = "where" or elm="how" or elm="which" or elm="when" or elm="what" or elm="why" or elm="who" or elm="whom")  Then
		       	     WordDone=1
					 if ElementCount < 2 Then 
					    FoundatleastoneQH=1
						if elm="what" or elm="where" Then
							FrontQHType=1
						end if
						foundQH=1
						rs.Open "Select translation,translationUtcharan from tab_additional where english='"+elm+"'", Conn 
						if Foundwherefrom=1 Then
							QHString=QHString+" "+"ক’ৰ"
							QHStringUtcharan=QHStringUtcharan+" "+"kor" 
						
						elseif qualityConcern=0 and elm="how" Then
						    '' ' Response.Write "/////QQQQQ........."
							'' ' Response.Write qualityConcern
							QHString=QHString+rs.Fields(0).value+"কৈ" 
							QHStringUtcharan=QHStringUtcharan+rs.Fields(1).value+"koi" 
						elseif qualityConcern=1 and elm="how" Then
							'' ' Response.Write "/////Q1111........."
							'' ' Response.Write qualityConcern
							QHString=QHString+rs.Fields(0).value+"" 
							QHStringUtcharan=QHStringUtcharan+rs.Fields(1).value+"" 
						else
							QHString=QHString+rs.Fields(0).value+" " 
							QHStringUtcharan=QHStringUtcharan+rs.Fields(1).value+" " 
						end if
						rs.close
					elseif eng_array(ElementCount-2)<>"at" and ConnectiveTermONE="" Then    ''at QH _____ 
						foundQH=0
						rs.Open "Select translation,translationUtcharan from tab_additional where english='Je"+elm+"'", Conn 
						QHString=QHString+rs.Fields(0).value+"" 
						QHStringUtcharan=QHStringUtcharan+rs.Fields(1).value+"" 
						rs.close
					elseif eng_array(ElementCount-2)="at" and elm="what" Then
					    foundQH=0
						rs.Open "Select translation,translationUtcharan from tab_additional where english='"+elm+"'", Conn 
						QHString=QHString+rs.Fields(0).value+"মানত " 
						QHStringUtcharan=QHStringUtcharan+rs.Fields(1).value+"manot " 
						rs.close
						Foundtimeverbmodifier=1
					elseif eng_array(ElementCount-2)="at" and elm<>"what" Then
					    foundQH=0
						rs.Open "Select translation,translationUtcharan from tab_additional where english='"+elm+"'", Conn 
						QHString=QHString+rs.Fields(0).value+"মান " 
						QHStringUtcharan=QHStringUtcharan+rs.Fields(1).value+"man " 
						rs.close
						Foundtimeverbmodifier=1
					elseif ConnectiveTermONE="" Then
						foundQH=0
						rs.Open "Select translation,translationUtcharan from tab_additional where english='Je"+elm+"'", Conn 
						QHString=QHString+rs.Fields(0).value+" " 
						QHStringUtcharan=QHStringUtcharan+rs.Fields(1).value+" " 
						rs.close
					else
						foundQH=0
						rs.Open "Select translation,translationUtcharan from tab_additional where english='"+elm+"'", Conn 
						QHString=QHString+rs.Fields(0).value+" " 
						QHStringUtcharan=QHStringUtcharan+rs.Fields(1).value+" " 
						rs.close
					end if
		  end if
		   
			if elm<>";" and WordDone=0 Then   ' worddone validation needed
				   rs.Open "Select root from tab_allnoun where words='"+elm+"'", Conn 
				   if rs.EOF  Then
				   'do nothing
				   
				   elseif Len(rs.Fields(0))>0 Then
						'' ' Response.Write "NNNNNNN"
						noun=rs.Fields(0).value
						
						
						
						foundnoun=1
						'' ' Response.Write "/NOUN:/"+noun
						if verbafterto=1 or foundto=1 Then
						  'nounafterto=1
						 
						end if
						WordDone=1
				   end if			
				   rs.close 
		   end if
		   if elm="god" Then
			actor1=1
		   end if
		   AgeDetector=0
		   if  (elm="you" or elm="me" or elm="I" or elm="myself" or elm="god" or  elm="father" or elm="brother" or elm="sister" or elm="aunt" or elm="uncle" or elm="boy" or elm="man" or elm="woman" or elm="son" or elm="driver" or elm="girl" or elm="parents") Then
				AgeDetector=1
		   else
				AgeDetector=0
		   end if
		   if  (elm="baby" or elm="husband" or elm="wife" or elm="mother-in-law" or elm="father-in-law" or elm="daughter-in-law" or  elm="son-in-law" or elm="human") Then
				AgeDetector=1
		   else
				AgeDetector=0
		   end if
		   if  (elm="babies" or elm="husbands" or elm="wives" or elm="mother-in-laws" or elm="father-in-laws" or elm="daughter-in-laws" or  elm="son-in-laws" or elm="humen") Then
				AgeDetector=1
		   else
				AgeDetector=0
		   end if
		    if  (elm="we" or elm="our" or elm="they" or elm="ourself" or elm="gods" or  elm="fathers" or elm="brothers" or elm="sisters" or elm="aunts" or elm="uncles" or elm="boys" or elm="men" or elm="women" or elm="sons" or elm="drivers" or elm="girls" or elm="parents") Then
				AgeDetector=1
		   else
				AgeDetector=0
		   end if
		   if  AgeDetector=1 and Foundhowfar=0.60 Then
				Assamese_String=Assamese_String+" "+"বয়সত "
				Assamese_StringUtcharan=Assamese_StringUtcharan+" "+"boyokhot"
				
		   end if
		   
		   if  ( elm="baby" or elm="god" or elm="father" or elm="brother" or elm="sister" or elm="aunt" or elm="uncle" or elm="boy" or elm="man" or elm="woman" or elm="son" or elm="driver" or elm="girl" ) and ((ConnectiveTermONE="to" and (CountingPhrases=2 or CountingPhrases=3)) or (ConnectiveTermTWO="to" and CountingPhrases=3)) Then
				personafterto=1
				'WordDone=1
           end if
		   if  ( elm="babies" or elm="gods" or elm="fathers" or elm="brothers" or elm="sisters" or elm="aunts" or elm="uncles" or elm="boys" or elm="men" or elm="women" or elm="sons" or elm="drivers" or elm="girls" ) and ((ConnectiveTermONE="to" and (CountingPhrases=2 or CountingPhrases=3)) or (ConnectiveTermTWO="to" and CountingPhrases=3)) Then
				personafterto=1
				'WordDone=1
           end if
		   if  ( elm="husband" or elm="wife" or elm="mother-in-law" or elm="father-in-law" or elm="daughter-in-law" or  elm="son-in-law" or elm="human") and ((ConnectiveTermONE="to" and (CountingPhrases=2 or CountingPhrases=3)) or (ConnectiveTermTWO="to" and CountingPhrases=3)) Then
				personafterto=1
				'WordDone=1
           end if
		   if  ( elm="husbands" or elm="wives" or elm="mother-in-laws" or elm="father-in-laws" or elm="daughter-in-laws" or  elm="son-in-laws" or elm="humen") and ((ConnectiveTermONE="to" and (CountingPhrases=2 or CountingPhrases=3)) or (ConnectiveTermTWO="to" and CountingPhrases=3)) Then
				personafterto=1
				'WordDone=1
           end if
		   
		   
		   '' ' Response.Write "noun"
			'Subject found before object
			if   (elm="baby" or elm="god" or  elm="father" or elm="brother" or elm="sister" or elm="aunt" or elm="uncle" or elm="boy" or elm="man" or elm="woman" or elm="son" or elm="driver" or elm="girl") Then
				MasterNoun=1
			
				'WordDone=1    correction done 13.3.19
			elseif  (elm="babies" or elm="gods" or  elm="fathers" or elm="brothers" or elm="sisters" or elm="aunts" or elm="uncles" or elm="boys" or elm="men" or elm="women" or elm="sons" or elm="drivers" or elm="girls") Then
				MasterNoun=1
			elseif 	(elm="husband" or elm="wife" or elm="mother" or elm="mother-in-law" or elm="father-in-law" or elm="daughter-in-law" or  elm="son-in-law" or elm="human") Then
				MasterNoun=1
			elseif 	 (elm="god" or  elm="father" or elm="brother" or elm="sister" or elm="aunt" or elm="uncle" or elm="boy" or elm="man" or elm="woman" or elm="son" or elm="driver" or elm="girl") Then
				MasterNoun=1
			
			elseif  (elm="gods" or  elm="fathers" or elm="brothers" or elm="sisters" or elm="aunts" or elm="uncles" or elm="boys" or elm="men" or elm="women" or elm="sons" or elm="drivers" or elm="girls") Then
				MasterNoun=1
			
			elseif 	 (elm="husbands" or elm="wives" or elm="mothers" or elm="mother-in-laws" or elm="father-in-laws" or elm="daughter-in-laws" or  elm="son-in-laws" or elm="humen") Then
				MasterNoun=1
			end if
			
			
			if  (elm="sister" or elm="aunt" or  elm="woman" or elm="girl" or elm="wife" or elm="mother" or elm="mother-in-law" or elm="daughter-in-law")  Then
				FoundFemale=1
           end if
		   
		   if  (elm="sisters" or elm="aunts" or  elm="women" or elm="girls" or elm="wives" or elm="mothers" or elm="mother-in-laws" or elm="daughter-in-laws")  Then
				FoundFemale=1
           end if
			
			if StrComp(elm,noun) = 0 Then
				
				if  (ConnectiveTermONE="to" and (CountingPhrases=2 or CountingPhrases=3)) or (ConnectiveTermTWO="to" and CountingPhrases=3)  Then
				  
					  WordDone=1
					  rs.Open "Select translation,singular,modifier_plural,heavylight,translationUtcharan,singularUtcharan from tab_noun where english='"+noun+"'", Conn 
					  if StrComp(rs.Fields(2),"loc")=0 Then
						locafterto=1
						'' ' Response.Write "//Loc."
					  elseif StrComp(rs.Fields(2),"person")=0 and callsay=1 Then
						personcallsay=1
						'' ' Response.Write "//Loc."
					  
					  else
						nounafterto=1
					  end if
					  rs.close
				else
					rs.Open "Select translation,singular,modifier_plural,heavylight,translationUtcharan,singularUtcharan from tab_noun where english='"+noun+"'", Conn 
					  if StrComp(rs.Fields(2),"loc")=0 Then
						locafterto=1
						'' ' Response.Write "//Loc."
					  elseif StrComp(rs.Fields(2),"person")=0 and callsay=1 Then
						personcallsay=1
						'' ' Response.Write "//Loc."
					  
					  else
						nounafterto=1
					  end if
					  rs.close
				end if
				
				      rs.Open "Select translation,singular,modifier_plural,heavylight,translationUtcharan,singularUtcharan from tab_noun where english='"+noun+"'", Conn 
					  if StrComp(rs.Fields(2),"person")=0  Then
						foundperson=1
						if (elm=babies or elm="baby") Then   'for entries like baby boy / baby girl----- PASS 1
							if ( eng_array(ElementCount)<>"boy" or eng_array(ElementCount)<>"girl" ) Then
								personafterto=0
								foundperson=0
								personcallsay=0
								MasterNoun=0
							elseif ( eng_array(ElementCount)<>"boys" or eng_array(ElementCount)<>"girls" ) Then
								personafterto=0
								foundperson=0
								personcallsay=0
								MasterNoun=0
							end if
						 end if
					  end if
					  rs.close
			end if    
			 
		 
		if StrComp(elm,noun+"s") = 0 or StrComp(elm,noun+"es") = 0 Then
			
			   plural=1
               thirdperson=1
			    WordDone=1
		         rs.Open "Select translation,plural,heavylight,translationUtcharan,pluralUtcharan from tab_noun where english='"+noun+"'", Conn 
		         if foundfrom=1 and ThanConjDone<>0.5 Then
					NounTerm=NounTerm+rs.Fields(0).value+rs.Fields(1).value+"ৰপৰা  "
					NounTermUtcharan=NounTermUtcharan+rs.Fields(3).value+rs.Fields(4).value+"rpora " 
					
					if foundNounTermONE=0 Then
							Curr_Term="NounTermONE"
							NounTermONE=NounTerm
							NounTermTWOUtcharan=NounTermUtcharan
							if personafterto=0 and foundof=0 and  MasterNoun=1 and MasterNoundone=0 Then
								if StrComp((Right(NounTerm,1)),"ো")=0  Then
									NounTermONE=NounTerm+"ৱে"
									NounTermONEUtcharan=NounTermONEUtcharan+"ye"
								elseif StrComp((Right(NounTerm,1)),"ি")=0 or StrComp((Right(NounTerm,1)),"ী")=0 or StrComp((Right(NounTerm,1)),"া")=0 Then
									'no code
								else
								    lenNoun=len(NounTerm)
									NounTermONE=NounTerm+"ে"
									NounTermONEUtcharan=NounTermONEUtcharan+"ye"
								end if
								
								MasterNoundone=1
							end if
							if personafterto=1 and MasterNoundone=0 Then    ' -loi
								NounTermONE=NounTermONE+"ক"
								NounTermONEUtcharan=NounTermONEUtcharan+"k"
								personafterto=0
								MasterNoundone=1
							end if
							if  personcallsay=1 and MasterNoundone=0 Then
								NounTermONE=NounTermONE+"ক"
								NounTermONEUtcharan=NounTermONEUtcharan+"k"
								foundperson=0
								personcallsay=0
								MasterNoundone=1
							end if
							
							foundNounTermONE=1
							NounTerm=""
							NounTermUtcharan=""
						
						elseif foundNounTermTWO=0 Then
							Curr_Term="NounTermTWO"
							NounTermTWO=NounTerm
							NounTermTWOUtcharan=NounTermUtcharan
							if personafterto=0 and MasterNoun=1 and MasterNoundone=0 Then
								if StrComp((Right(NounTerm,1)),"ো")=0  Then
									NounTermTWO=NounTerm+"ৱে"
									NounTermTWOUtcharan=NounTermTWOUtcharan+"ye"
								elseif StrComp((Right(NounTerm,1)),"ি")=0 or StrComp((Right(NounTerm,1)),"ী")=0 or StrComp((Right(NounTerm,1)),"া")=0 Then
									'no code
									
								else
								    lenNoun=len(NounTerm)
									NounTermTWO=NounTerm+"ে"
									NounTermTWOUtcharan=NounTermTWOUtcharan+"ye"
								end if
								
								MasterNoundone=1
							end if
							if personafterto=1 and MasterNoundone=0 Then
								NounTermTWO=NounTermTWO+"ক"
								NounTermTWOUtcharan=NounTermTWOUtcharan+"k"
								personafterto=0
								MasterNoundone=1
							end if
							if  personcallsay=1 and MasterNoundone=0 Then
								NounTermTWO=NounTermTWO+"ক"
								NounTermTWOUtcharan=NounTermTWOUtcharan+"k"
								foundperson=0
								personcallsay=0
								MasterNoundone=1
							end if
							
							foundNounTermTWO=1
							NounTerm=""
							NounTermUtcharan=""
						end if
				 else
				   if foundTHE=0 and ThanConjDone<>0.5 Then
						
						NounTerm=NounTerm+rs.Fields(0).value+rs.Fields(1).value
						NounTermUtcharan=NounTermUtcharan+rs.Fields(3).value+rs.Fields(4).value
						if foundNounTermONE=0 Then
							Curr_Term="NounTermONE"
							NounTermONE=NounTerm
							NounTermONEUtcharan=NounTermUtcharan
							if personafterto=0 and foundof=0 and MasterNoun=1 and MasterNoundone=0 and PronounTerm="" Then
								if StrComp((Right(NounTerm,1)),"ো")=0  Then
									NounTermONE=NounTerm+"ৱে"
									NounTermONEUtcharan=NounTermONEUtcharan+"ye"
								elseif StrComp((Right(NounTerm,1)),"ি")=0 or StrComp((Right(NounTerm,1)),"ী")=0 or StrComp((Right(NounTerm,1)),"া")=0 Then   'for plurals this Test Condition may not be needed but kept for consistency
									if FoundFemale=1 Then
										NounTermONE=NounTerm+"য়ে"
										NounTermONEUtcharan=NounTermONEUtcharan+"ye"
									else
										NounTermONE=NounTerm+"য়ে"
										NounTermONEUtcharan=NounTermONEUtcharan+"ye"
									end if
								end if
							elseif personafterto=0 and foundperson=1 and MasterVerb=1  and PronounTerm="" Then
										lenNoun=len(NounTerm)
										NounTermONE=NounTerm+"য়ে"
										NounTermONEUtcharan=NounTermONEUtcharan+"ye"
							elseif foundof=0  and PronounTerm="" Then
										NounTermONE=NounTerm
										NounTermONEUtcharan=NounTermONEUtcharan
						    elseif foundof=1 Then
								
								NounTermONE=NounTerm+"ৰ"
								NounTermONEUtcharan=NounTermONEUtcharan+"or"
							elseif PronounTerm<>"" and person=1 Then
								
										NounTermONE=NounTerm+"ক"
										NounTermONEUtcharan=NounTermONEUtcharan+"k"
							else
										NounTermONE=NounTerm
										NounTermONEUtcharan=NounTermONEUtcharan
							end if
							
							
							
							if personafterto=1 and MasterNoundone=0 Then
								NounTermONE=NounTermONE+"ক"
								NounTermONEUtcharan=NounTermONEUtcharan+"k"
								personafterto=0
								MasterNoundone=1
							end if
							if  personcallsay=1 and MasterNoundone=0 Then
								NounTermONE=NounTermONE+"ক"
								NounTermONEUtcharan=NounTermONEUtcharan+"k"
								foundperson=0
								personcallsay=0
								MasterNoundone=1
							end if
							if MasterNoundone=0 and ConnectiveTermONE="to" and Phrases1<>";" and (CountingPhrases=2 or CountingPhrases=3) and TermONEDONE=0 Then
								
								    ' Select Constraints
									if (elm=babies or elm="baby") Then   'for entries like baby boy / baby girl----- PASS 1
										if ( eng_array(ElementCount)<>"boy" or eng_array(ElementCount)<>"girl" ) Then
											personafterto=0
											foundperson=0
											personcallsay=0
											MasterNoun=0
										elseif ( eng_array(ElementCount)<>"boys" or eng_array(ElementCount)<>"girls" ) Then
											personafterto=0
											foundperson=0
											personcallsay=0
											MasterNoun=0
										end if
									else
										NounTermONE=NounTermONE+"লৈ"
										NounTermONEUtcharan=NounTermONEUtcharan+"loi"
										TermONEDONE=1
										MasterNoundone=1
									end if
							elseif MasterNoundone=0 and ConnectiveTermTWO="to" and Phrases2<>";" and CountingPhrases=3 and TermTWODONE=0 Then
								' Select Constraints
									if (elm=babies or elm="baby") Then   'for entries like baby boy / baby girl----- PASS 1
										if ( eng_array(ElementCount)<>"boy" or eng_array(ElementCount)<>"girl" ) Then
											personafterto=0
											foundperson=0
											personcallsay=0
											MasterNoun=0
										elseif ( eng_array(ElementCount)<>"boys" or eng_array(ElementCount)<>"girls" ) Then
											personafterto=0
											foundperson=0
											personcallsay=0
											MasterNoun=0
										end if
									else
										NounTermONE=NounTermONE+"লৈ"
										NounTermONEUtcharan=NounTermONEUtcharan+"loi"
										TermONEDONE=1
										MasterNoundone=1
									end if
								
							end if
							MasterNoundone=1
							foundNounTermONE=1
							NounTerm=""
							NounTermUtcharan=""
						elseif foundNounTermTWO=0 Then
							Curr_Term="NounTermTWO"
							NounTermTWO=NounTerm
							NounTermTWOUtcharan=NounTermUtcharan
							if personafterto=0 and foundof=0 and MasterNoun=1 and MasterNoundone=0 and PronounTerm="" Then
								if StrComp((Right(NounTerm,1)),"ো")=0  Then
									NounTermTWO=NounTerm+"ৱে"
								elseif StrComp((Right(NounTerm,1)),"ি")=0 or StrComp((Right(NounTerm,1)),"ী")=0 or StrComp((Right(NounTerm,1)),"া")=0 Then
									if FoundFemale=1 Then
										NounTermTWO=NounTerm+"য়ে"
										NounTermTWOUtcharan=NounTermTWOUtcharan+"ye"
									else
										NounTermTWO=NounTerm+"য়ে"
										NounTermTWOUtcharan=NounTermTWOUtcharan+"ye"
									end if
								end if
							elseif personafterto=0 and foundperson=1 and MasterVerb=1  and PronounTerm="" Then
										lenNoun=len(NounTerm)
										NounTermTWO=NounTerm+"য়ে"
										NounTermTWOUtcharan=NounTermTWOUtcharan+"ye"
							elseif foundof=0   and PronounTerm="" Then
										NounTermTWO=NounTerm
										NounTermTWOUtcharan=NounTermTWOUtcharan
							elseif foundof=1  Then
								
								NounTermTWO=NounTerm+"ৰ"
								NounTermTWOUtcharan=NounTermTWOUtcharan+"or"
							elseif PronounTerm<>"" and person=1 Then
								NounTermTWO=NounTerm+"ক"
								NounTermTWOUtcharan=NounTermTWOUtcharan+"k"
							else
								NounTermTWO=NounTerm
								NounTermTWOUtcharan=NounTermTWOUtcharan
							end if
							
							
							
							if personafterto=1 and MasterNoundone=0 Then
								NounTermTWO=NounTermTWO+"ক"
								NounTermTWOUtcharan=NounTermTWOUtcharan+"k"
								personafterto=0
								MasterNoundone=1
							end if
							if  personcallsay=1 and MasterNoundone=0 Then
								NounTermTWO=NounTermTWO+"ক"
								NounTermTWOUtcharan=NounTermTWOUtcharan+"k"
								foundperson=0
								personcallsay=0
								MasterNoundone=1
							end if
							if MasterNoundone=0 and ConnectiveTermONE="to" and Phrases1<>";" and (CountingPhrases=2 or CountingPhrases=3) and TermONEDONE=0 Then
								' Select Constraints
									if (elm=babies or elm="baby") Then   'for entries like baby boy / baby girl----- PASS 1
										if ( eng_array(ElementCount)<>"boy" or eng_array(ElementCount)<>"girl" ) Then
											personafterto=0
											foundperson=0
											personcallsay=0
											MasterNoun=0
										elseif ( eng_array(ElementCount)<>"boys" or eng_array(ElementCount)<>"girls" ) Then
											personafterto=0
											foundperson=0
											personcallsay=0
											MasterNoun=0
										end if
									else
										NounTermTWO=NounTermTWO+"লৈ"
										NounTermTWOUtcharan=NounTermTWOUtcharan+"loi"
										TermTWODONE=1
										MasterNoundone=1
									end if
								
							elseif MasterNoundone=0 and ConnectiveTermTWO="to" and Phrases2<>";" and CountingPhrases=3 and TermTWODONE=0 Then
								NounTermTWO=NounTermTWO+"লৈ"
								NounTermTWOUtcharan=NounTermTWOUtcharan+"loi"
								TermTWODONE=1
								MasterNoundone=1
							end if
							MasterNoundone=1
							foundNounTermTWO=1
							NounTerm=""
							NounTermUtcharan=""
						end if
					elseif foundTHE=1 and ThanConjDone<>0.5  Then
					    
						NounTerm=NounTerm+rs.Fields(0).value+rs.Fields(1).value
						NounTermUtcharan=NounTermUtcharan+rs.Fields(3).value+rs.Fields(4).value	
						if foundNounTermONE=0 Then
							Curr_Term="NounTermONE"
							NounTermONE=NounTerm
							NounTermONEUtcharan=NounTermUtcharan
							if personafterto=0 and foundof=0 and MasterNoun=1 and MasterNoundone=0 and PronounTerm="" Then
								if StrComp((Right(NounTerm,1)),"ো")=0  Then
									NounTermONE=NounTerm+"ৱে"
									NounTermONEUtcharan=NounTermONEUtcharan+"ye"
								elseif StrComp((Right(NounTerm,1)),"ি")=0 or StrComp((Right(NounTerm,1)),"ী")=0 or StrComp((Right(NounTerm,1)),"া")=0 Then
									if FoundFemale=1 Then
										NounTermONE=NounTerm+"য়ে"
										NounTermONEUtcharan=NounTermONEUtcharan+"ye"
									else
										NounTermONE=NounTerm+"য়ে"
										NounTermONEUtcharan=NounTermONEUtcharan+"ye"
									end if
								end if
							elseif personafterto=0 and foundperson=1 and MasterVerb=1  and PronounTerm="" Then
										lenNoun=len(NounTerm)
										NounTermONE=NounTerm+"য়ে"
										NounTermONEUtcharan=NounTermONEUtcharan+"ye"
							elseif foundof=0   and PronounTerm="" Then
										NounTermONE=NounTerm
										NounTermONEUtcharan=NounTermONEUtcharan
							elseif foundof=1  Then
								
								NounTermONE=NounTerm+"ৰ"
								NounTermONEUtcharan=NounTermONEUtcharan+"or"
							elseif PronounTerm<>"" and person=1  Then
								
										NounTermONE=NounTerm+"ক"
										NounTermONEUtcharan=NounTermONEUtcharan+"k"
							else
										NounTermONE=NounTerm
										NounTermONEUtcharan=NounTermONEUtcharan
							end if
							
							
							
							if personafterto=1 and MasterNoundone=0 Then
								NounTermONE=NounTermONE+"ক"
								NounTermONEUtcharan=NounTermONEUtcharan+"k"
								personafterto=0
								MasterNoundone=1
							end if
							if  personcallsay=1 and MasterNoundone=0 Then
								NounTermONE=NounTermONE+"ক"
								NounTermONEUtcharan=NounTermONEUtcharan+"k"
								foundperson=0
								personcallsay=0
								MasterNoundone=1
							end if
							if MasterNoundone=0 and ConnectiveTermONE="to" and Phrases1<>";" and (CountingPhrases=2 or CountingPhrases=3) and TermONEDONE=0 Then
								if (elm=babies or elm="baby") Then   'for entries like baby boy / baby girl----- PASS 1
										if ( eng_array(ElementCount)<>"boy" or eng_array(ElementCount)<>"girl" ) Then
											personafterto=0
											foundperson=0
											personcallsay=0
											MasterNoun=0
										elseif ( eng_array(ElementCount)<>"boys" or eng_array(ElementCount)<>"girls" ) Then
											personafterto=0
											foundperson=0
											personcallsay=0
											MasterNoun=0
										end if
								else
									NounTermONE=NounTermONE+"লৈ"
									NounTermONEUtcharan=NounTermONEUtcharan+"loi"
									TermONEDONE=1
									MasterNoundone=1
								end if
							elseif MasterNoundone=0 and ConnectiveTermTWO="to" and Phrases2<>";" and CountingPhrases=3 and TermTWODONE=0 Then
								if (elm=babies or elm="baby") Then   'for entries like baby boy / baby girl----- PASS 1
										if ( eng_array(ElementCount)<>"boy" or eng_array(ElementCount)<>"girl" ) Then
											personafterto=0
											foundperson=0
											personcallsay=0
											MasterNoun=0
										elseif ( eng_array(ElementCount)<>"boys" or eng_array(ElementCount)<>"girls" ) Then
											personafterto=0
											foundperson=0
											personcallsay=0
											MasterNoun=0
										end if
								else
									NounTermONE=NounTermONE+"লৈ"
									NounTermONEUtcharan=NounTermONEUtcharan+"loi"
									TermONEDONE=1
									MasterNoundone=1
								end if
							end if
							MasterNoundone=1
							foundNounTermONE=1
							NounTerm=""
							NounTermUtcharan=""
						elseif foundNounTermTWO=0 Then
							Curr_Term="NounTermTWO"
							NounTermTWO=NounTerm
							NounTermTWOUtcharan=NounTermUtcharan
							if personafterto=0 and foundof=0 and MasterNoun=1 and MasterNoundone=0 and PronounTerm="" Then
								if StrComp((Right(NounTerm,1)),"ো")=0  Then
									NounTermTWO=NounTerm+"ৱে"
									NounTermTWOUtcharan=NounTermTWOUtcharan+"ye"
								elseif StrComp((Right(NounTerm,1)),"ি")=0 or StrComp((Right(NounTerm,1)),"ী")=0 or StrComp((Right(NounTerm,1)),"া")=0 Then
									if FoundFemale=1 Then
										NounTermTWO=NounTerm+"য়ে"
										NounTermTWOUtcharan=NounTermTWOUtcharan+"ye"
									else
										NounTermTWO=NounTerm+"য়ে"
										NounTermTWOUtcharan=NounTermTWOUtcharan+"ye"
									end if
								end if
							elseif personafterto=0 and foundperson=1 and MasterVerb=1  and PronounTerm="" Then
										lenNoun=len(NounTerm)
										NounTermTWO=NounTerm+"য়ে"
										NounTermTWOUtcharan=NounTermTWOUtcharan+"ye"
							elseif foundof=0  and PronounTerm="" Then
										NounTermTWO=NounTerm
										NounTermTWOUtcharan=NounTermTWOUtcharan
							elseif foundof=1  Then
								
								NounTermTWO=NounTerm+"ৰ"
								NounTermTWOUtcharan=NounTermTWOUtcharan+"or"
							elseif PronounTerm<>"" and person=1  Then
								NounTermTWO=NounTerm+"ক"
								NounTermTWOUtcharan=NounTermTWOUtcharan+"k"
							else
								NounTermTWO=NounTerm
								NounTermTWOUtcharan=NounTermTWOUtcharan
							end if
							
							
							
							if personafterto=1 and MasterNoundone=0 Then
								NounTermTWO=NounTermTWO+"ক"
								NounTermTWOUtcharan=NounTermTWOUtcharan+"k"
								personafterto=0
								MasterNoundone=1
							end if
							if personcallsay=1  and MasterNoundone=0 Then
								NounTermTWO=NounTermTWO+"ক"
								NounTermTWOUtcharan=NounTermTWOUtcharan+"k"
								foundperson=0
								personcallsay=0
								MasterNoundone=1
							end if
							if MasterNoundone=0 and ConnectiveTermONE="to" and Phrases1<>";" and (CountingPhrases=2 or CountingPhrases=3) and TermONEDONE=0 Then
								if (elm=babies or elm="baby") Then   'for entries like baby boy / baby girl----- PASS 1
										if ( eng_array(ElementCount)<>"boy" or eng_array(ElementCount)<>"girl" ) Then
											personafterto=0
											foundperson=0
											personcallsay=0
											MasterNoun=0
										elseif ( eng_array(ElementCount)<>"boys" or eng_array(ElementCount)<>"girls" ) Then
											personafterto=0
											foundperson=0
											personcallsay=0
											MasterNoun=0
										end if
								else
									NounTermTWO=NounTermTWO+"লৈ"
									NounTermTWOUtcharan=NounTermTWOUtcharan+"loi"
									TermTWODONE=1
									MasterNoundone=1
								end if
							elseif MasterNoundone=0 and ConnectiveTermTWO="to" and Phrases2<>";" and CountingPhrases=3 and TermTWODONE=0 Then
								if (elm=babies or elm="baby") Then   'for entries like baby boy / baby girl----- PASS 1
										if ( eng_array(ElementCount)<>"boy" or eng_array(ElementCount)<>"girl" ) Then
											personafterto=0
											foundperson=0
											personcallsay=0
											MasterNoun=0
										elseif ( eng_array(ElementCount)<>"boys" or eng_array(ElementCount)<>"girls" ) Then
											personafterto=0
											foundperson=0
											personcallsay=0
											MasterNoun=0
										end if
								else
									NounTermTWO=NounTermTWO+"লৈ"
									NounTermTWOUtcharan=NounTermTWOUtcharan+"loi"
									TermTWODONE=1
									MasterNoundone=1
								end if
							end if
							MasterNoundone=1
							foundNounTermTWO=1
							NounTerm=""
							NounTermUtcharan=""
						end if
					foundTHE=0
					elseif ThanConjDone=0.5 Then
					
						NounTerm=NounTerm+rs.Fields(0).value+rs.Fields(1).value
						NounTermUtcharan=NounTermUtcharan+rs.Fields(3).value+rs.Fields(4).value	
						if foundNounTermONE=0 Then
							Curr_Term="NounTermONE"
							NounTermONE=NounTerm
							NounTermONEUtcharan=NounTermUtcharan
							
								NounTermONE=NounTerm+"তকৈ"
								NounTermONEUtcharan=NounTermONEUtcharan+"atkoi"
							
							
							
							
							foundNounTermONE=1
							NounTerm=""
							NounTermUtcharan=""
							ThanConjDone=1
						elseif foundNounTermTWO=0 Then
							Curr_Term="NounTermTWO"
							NounTermTWO=NounTerm
							NounTermTWOUtcharan=NounTermUtcharan
							
							
								NounTermTWO=NounTerm+"তকৈ"
								NounTermTWOUtcharan=NounTermTWOUtcharan+"atkoi"
							
							
							
							
							foundNounTermTWO=1
							NounTerm=""
							NounTermUtcharan=""
							ThanConjDone=1
						end if
					
					end if
			
				 end if
				 if StrComp(rs.Fields(2),"h")=0 Then
			       heavy =1
			     elseif StrComp(rs.Fields(2),"l")=0 Then
			       light=1
			     end if
                 rs.close
				
        elseif StrComp(elm,noun) = 0 Then
						
						WordDone=1
						thirdperson=1
                         rs.Open "Select translation,singular,heavylight,translationUtcharan,singularUtcharan from tab_noun where english='"+noun+"'", Conn 
		                 if foundfrom=1 and ThanConjDone<>0.5 Then
						   NounTerm=NounTerm+rs.Fields(0).value+"ৰপৰা " 
						   NounTermUtcharan=NounTermUtcharan+rs.Fields(3).value+"rpora " 
						   if foundNounTermONE=0 Then
								Curr_Term="NounTermONE"
								NounTermONE=NounTerm
								NounTermONEUtcharan=NounTermUtcharan
								if personafterto=0 and foundof=0 and MasterNoun=1 and MasterNoundone=0 Then
								  
								  if StrComp((Right(NounTerm,1)),"ো")=0  Then
									NounTermONE=NounTerm+"ৱে"
									NounTermONEUtcharan=NounTermONEUtcharan+"ye"
									elseif StrComp((Right(NounTerm,1)),"ি")=0 or StrComp((Right(NounTerm,1)),"ী")=0 or StrComp((Right(NounTerm,1)),"া")=0 Then
										'no code
										
									else
										lenNoun=len(NounTerm)
										NounTermONE=NounTerm+"ে"
										NounTermONEUtcharan=NounTermONEUtcharan+"ye"
									end if
									
									  MasterNoundone=1
							    end if
								if personafterto=1 and MasterNoundone=0 Then
									NounTermONE=NounTermONE+"ক"
									NounTermONEUtcharan=NounTermONEUtcharan+""
									personafterto=0
									MasterNoundone=1
								end if
								if personcallsay=1  and MasterNoundone=0 Then
									NounTermONE=NounTermONE+"ক"
									NounTermONEUtcharan=NounTermONEUtcharan+"k"
									foundperson=0
									personcallsay=0
									MasterNoundone=1
								end if
								if MasterNoundone=0 and ConnectiveTermONE="to" and Phrases1<>";" and (CountingPhrases=2 or CountingPhrases=3) and TermONEDONE=0 Then
									if (elm=babies or elm="baby") Then   'for entries like baby boy / baby girl----- PASS 1
										if ( eng_array(ElementCount)<>"boy" or eng_array(ElementCount)<>"girl" ) Then
											personafterto=0
											foundperson=0
											personcallsay=0
											MasterNoun=0
										elseif ( eng_array(ElementCount)<>"boys" or eng_array(ElementCount)<>"girls" ) Then
											personafterto=0
											foundperson=0
											personcallsay=0
											MasterNoun=0
										end if
									else
										NounTermONE=NounTermONE+"লৈ"
										NounTermONEUtcharan=NounTermONEUtcharan+"loi"
										TermONEDONE=1
										MasterNoundone=1
									end if
								elseif MasterNoundone=0 and ConnectiveTermTWO="to" and Phrases2<>";" and CountingPhrases=3 and TermTWODONE=0 Then
									if (elm=babies or elm="baby") Then   'for entries like baby boy / baby girl----- PASS 1
										if ( eng_array(ElementCount)<>"boy" or eng_array(ElementCount)<>"girl" ) Then
											personafterto=0
											foundperson=0
											personcallsay=0
											MasterNoun=0
										elseif ( eng_array(ElementCount)<>"boys" or eng_array(ElementCount)<>"girls" ) Then
											personafterto=0
											foundperson=0
											personcallsay=0
											MasterNoun=0
										end if
									else
										NounTermONE=NounTermONE+"লৈ"
										NounTermONEUtcharan=NounTermONEUtcharan+"loi"
										TermTWODONE=1
										MasterNoundone=1
									end if
								end if
								
								foundNounTermONE=1
								NounTerm=""
							NounTermUtcharan=""
							elseif foundNounTermTWO=0 Then	
								Curr_Term="NounTermTWO"
								NounTermTWO=NounTerm
							NounTermTWOUtcharan=NounTermUtcharan
							if personafterto=0 and foundof=0 and  MasterNoun=1 and MasterNoundone=0 Then
								if StrComp((Right(NounTerm,1)),"ো")=0  Then
									NounTermTWO=NounTerm+"ৱে"
									NounTermTWOUtcharan=NounTermTWOUtcharan+"ye"
								elseif StrComp((Right(NounTerm,1)),"ি")=0 or StrComp((Right(NounTerm,1)),"ী")=0 or StrComp((Right(NounTerm,1)),"া")=0 Then
									'no code
								else
								    lenNoun=len(NounTerm)
									NounTermTWO=NounTerm+"ে"
									NounTermTWOUtcharan=NounTermTWOUtcharan+"ye"
								end if
								
								MasterNoundone=1
							end if
							if personafterto=1 and MasterNoundone=0 Then
								NounTermTWO=NounTermTWO+"ক"
								NounTermTWOUtcharan=NounTermTWOUtcharan+"k"
								personafterto=0
								MasterNoundone=1
							end if
							if  personcallsay=1  and MasterNoundone=0 Then
								NounTermTWO=NounTermTWO+"ক"
								NounTermTWOUtcharan=NounTermTWOUtcharan+"k"
								foundperson=0
								personcallsay=0
								MasterNoundone=1
							end if
							
							foundNounTermTWO=1
							NounTerm=""
							NounTermUtcharan=""
							end if
						 else
						   if foundTHE=0 and ThanConjDone<>0.5 Then
								
								NounTerm=NounTerm+rs.Fields(0).value
								NounTermUtcharan=NounTermUtcharan+rs.Fields(3).value
								if foundNounTermONE=0 Then
									Curr_Term="NounTermONE"
									NounTermONE=NounTerm
									NounTermONEUtcharan=NounTermUtcharan
									if personafterto=0 and foundof=0 and MasterNoun=1 and MasterNoundone=0 and MasterVerb=1 and PronounTerm="" Then
										if StrComp((Right(NounTerm,1)),"ো")=0  Then
											NounTermONE=NounTerm+"ৱে"
											NounTermONEUtcharan=NounTermONEUtcharan+"ye"
										elseif StrComp((Right(NounTerm,1)),"ি")=0 or StrComp((Right(NounTerm,1)),"ী")=0 or StrComp((Right(NounTerm,1)),"া")=0 Then
											if FoundFemale=1 Then
												NounTermONE=NounTerm+"য়ে"
												NounTermONEUtcharan=NounTermONEUtcharan+"ye"
											else
												
												NounTermONE=NounTerm+"য়ে"
												NounTermONEUtcharan=NounTermONEUtcharan+"ye"
											    
											end if
											
											'' correction needed 13.3.19
										end if
									elseif personafterto=0 and foundperson=1 and MasterVerb=1  and PronounTerm="" Then
										'' ' Response.write "&"
										lenNoun=len(NounTerm)
										NounTermONE=NounTerm+"য়ে"
										NounTermONEUtcharan=NounTermONEUtcharan+"ye"
									elseif foundof=0  and PronounTerm="" Then
										NounTermONE=NounTerm
										NounTermONEUtcharan=NounTermONEUtcharan
									 elseif foundof=1  Then
								
										NounTermONE=NounTerm+"ৰ"
										NounTermONEUtcharan=NounTermONEUtcharan+"or"
									elseif PronounTerm<>"" and person=1 Then
										
												NounTermONE=NounTerm+"ক"
												NounTermONEUtcharan=NounTermONEUtcharan+"k"
									else
												NounTermONE=NounTerm
												NounTermONEUtcharan=NounTermONEUtcharan
									end if
									
									'' ' Response.write callsay
									
									 if personafterto=1 and MasterNoundone=0 Then
										NounTermONE=NounTermONE+"ক"
										NounTermONEUtcharan=NounTermONEUtcharan+"k"
										personafterto=0
										MasterNoundone=1
									end if
									if  personcallsay=1  and MasterNoundone=0 Then
										NounTermONE=NounTermONE+"ক"
										NounTermONEUtcharan=NounTermONEUtcharan+"k"
										foundperson=0
										personcallsay=0
										MasterNoundone=1
									end if
									if MasterNoundone=0 and ConnectiveTermONE="to" and Phrases1<>";" and (CountingPhrases=2 or CountingPhrases=3) and TermONEDONE=0 Then
										if (elm=babies or elm="baby") Then   'for entries like baby boy / baby girl----- PASS 1
											if ( eng_array(ElementCount)<>"boy" or eng_array(ElementCount)<>"girl" ) Then
												personafterto=0
												foundperson=0
												personcallsay=0
												MasterNoun=0
											elseif ( eng_array(ElementCount)<>"boys" or eng_array(ElementCount)<>"girls" ) Then
												personafterto=0
												foundperson=0
												personcallsay=0
												MasterNoun=0
											end if
										else
											NounTermONE=NounTermONE+"লৈ"
											NounTermONEUtcharan=NounTermONEUtcharan+"loi"
											TermONEDONE=1
											MasterNoundone=1
										end if
									elseif MasterNoundone=0 and ConnectiveTermTWO="to" and Phrases2<>";" and CountingPhrases=3 and TermTWODONE=0 Then
										if (elm=babies or elm="baby") Then   'for entries like baby boy / baby girl----- PASS 1
											if ( eng_array(ElementCount)<>"boy" or eng_array(ElementCount)<>"girl" ) Then
												personafterto=0
												foundperson=0
												personcallsay=0
												MasterNoun=0
											elseif ( eng_array(ElementCount)<>"boys" or eng_array(ElementCount)<>"girls" ) Then
												personafterto=0
												foundperson=0
												personcallsay=0
												MasterNoun=0
											end if
										else
											NounTermONE=NounTermONE+"লৈ"
											NounTermONEUtcharan=NounTermONEUtcharan+"loi"
											TermONEDONE=1
											MasterNoundone=1
										end if
									end if
									MasterNoundone=1
									foundNounTermONE=1
									NounTerm=""
									NounTermUtcharan=""
								elseif foundNounTermTWO=0 Then
									Curr_Term="NounTermTWO"
									NounTermTWO=NounTerm
							NounTermTWOUtcharan=NounTermUtcharan
							if personafterto=0 and foundof=0 and MasterNoun=1 and MasterNoundone=0 and MasterVerb=1 and PronounTerm="" Then
								if StrComp((Right(NounTerm,1)),"ো")=0  Then
									NounTermTWO=NounTerm+"ৱে"
									NounTermTWOUtcharan=NounTermTWOUtcharan+"ye"
								elseif StrComp((Right(NounTerm,1)),"ি")=0 or StrComp((Right(NounTerm,1)),"ী")=0 or StrComp((Right(NounTerm,1)),"া")=0 Then
									if FoundFemale=1 Then
										NounTermTWO=NounTerm+"য়ে"
										NounTermTWOUtcharan=NounTermTWOUtcharan+"ye"
									else
										
										NounTermTWO=NounTerm+"য়ে"
										NounTermTWOUtcharan=NounTermTWOUtcharan+"ye"
									end if
								end if
							elseif personafterto=0 and foundperson=1 and MasterVerb=1 and PronounTerm="" Then
										
										lenNoun=len(NounTerm)
										NounTermTWO=NounTerm+"য়ে"
										NounTermTWOUtcharan=NounTermTWOUtcharan+"ye"
							elseif foundof=0  and PronounTerm="" Then
										NounTermTWO=NounTerm
										NounTermTWOUtcharan=NounTermTWOUtcharan
							 elseif foundof=1  Then
								
								NounTermTWO=NounTerm+"ৰ"
								NounTermTWOUtcharan=NounTermTWOUtcharan+"or"
							elseif PronounTerm<>"" and person=1 Then
								NounTermTWO=NounTerm+"ক"
								NounTermTWOUtcharan=NounTermTWOUtcharan+"k"
							else
								NounTermTWO=NounTerm
								NounTermTWOUtcharan=NounTermTWOUtcharan
							end if
							
							
							
							if personafterto=1 and MasterNoundone=0 Then
								NounTermTWO=NounTermTWO+"ক"
								NounTermTWOUtcharan=NounTermTWOUtcharan+"k"
								personafterto=0
								MasterNoundone=1
							end if
							if  personcallsay=1 and MasterNoundone=0 Then
								NounTermTWO=NounTermTWO+"ক"
								NounTermTWOUtcharan=NounTermTWOUtcharan+"k"
								foundperson=0
								personcallsay=0
								MasterNoundone=1
							end if
							if MasterNoundone=0 and ConnectiveTermONE="to" and Phrases1<>";" and (CountingPhrases=2 or CountingPhrases=3) and TermONEDONE=0 Then
								if (elm=babies or elm="baby") Then   'for entries like baby boy / baby girl----- PASS 1
										if ( eng_array(ElementCount)<>"boy" or eng_array(ElementCount)<>"girl" ) Then
											personafterto=0
											foundperson=0
											personcallsay=0
											MasterNoun=0
										elseif ( eng_array(ElementCount)<>"boys" or eng_array(ElementCount)<>"girls" ) Then
											personafterto=0
											foundperson=0
											personcallsay=0
											MasterNoun=0
										end if
								else
									NounTermTWO=NounTermTWO+"লৈ"
									NounTermTWOUtcharan=NounTermTWOUtcharan+"loi"
									TermTWODONE=1
									MasterNoundone=1
								end if
							elseif MasterNoundone=0 and ConnectiveTermTWO="to" and Phrases2<>";" and CountingPhrases=3 and TermTWODONE=0 Then
								if (elm=babies or elm="baby") Then   'for entries like baby boy / baby girl----- PASS 1
										if ( eng_array(ElementCount)<>"boy" or eng_array(ElementCount)<>"girl" ) Then
											personafterto=0
											foundperson=0
											personcallsay=0
											MasterNoun=0
										elseif ( eng_array(ElementCount)<>"boys" or eng_array(ElementCount)<>"girls" ) Then
											personafterto=0
											foundperson=0
											personcallsay=0
											MasterNoun=0
										end if
								else
									NounTermTWO=NounTermTWO+"লৈ"
									NounTermTWOUtcharan=NounTermTWOUtcharan+"loi"
									TermTWODONE=1
									MasterNoundone=1
								end if
							end if
							MasterNoundone=1
							foundNounTermTWO=1
							NounTerm=""
							NounTermUtcharan=""
								end if
							elseif foundTHE=1 and ThanConjDone<>0.5 Then
								
							    NounTerm=NounTerm+rs.Fields(0).value+rs.Fields(1).value
								NounTermUtcharan=NounTermUtcharan+rs.Fields(3).value+rs.Fields(4).value
								if foundNounTermONE=0 Then
									Curr_Term="NounTermONE"
									NounTermONE=NounTerm
									NounTermONEUtcharan=NounTermUtcharan
									if personafterto=0 and foundof=0 and MasterNoun=1 and MasterNoundone=0 and MasterVerb=1 and PronounTerm="" Then
										if StrComp((Right(NounTerm,1)),"ো")=0  Then
											NounTermONE=NounTerm+"ৱে"
											NounTermONEUtcharan=NounTermONEUtcharan+"ye"
										elseif StrComp((Right(NounTerm,1)),"ি")=0 or StrComp((Right(NounTerm,1)),"ী")=0 or StrComp((Right(NounTerm,1)),"া")=0 Then
											if FoundFemale=1 Then
												NounTermONE=NounTerm+"য়ে"
												NounTermONEUtcharan=NounTermONEUtcharan+"ye"
											else
												NounTermONE=NounTerm+"য়ে"
												NounTermONEUtcharan=NounTermONEUtcharan+"ye"
											end if
										end if
								elseif personafterto=0 and foundperson=1 and MasterVerb=1  and PronounTerm="" Then
										lenNoun=len(NounTerm)
										NounTermONE=NounTerm+"য়ে"
										NounTermONEUtcharan=NounTermONEUtcharan+"ye"
								elseif foundof=0  and PronounTerm="" Then
									    
										NounTermONE=NounTerm
										NounTermONEUtcharan=NounTermONEUtcharan
								elseif foundof=1  Then
								
									NounTermONE=NounTerm+"ৰ"
									NounTermONEUtcharan=NounTermONEUtcharan+"or"
								elseif PronounTerm<>"" and person=1 Then
									
											NounTermONE=NounTerm+"ক"
											NounTermONEUtcharan=NounTermONEUtcharan+"k"
								else
											NounTermONE=NounTerm
											NounTermONEUtcharan=NounTermONEUtcharan
								end if
								
								
									
									if personafterto=1 and MasterNoundone=0 Then
										NounTermONE=NounTermONE+"ক"
										NounTermONEUtcharan=NounTermONEUtcharan+"k"
										personafterto=0
										MasterNoundone=1
									end if
									if  personcallsay=1 and MasterNoundone=0 Then
										NounTermONE=NounTermONE+"ক"
										NounTermONEUtcharan=NounTermONEUtcharan+"k"
										foundperson=0
										personcallsay=0
										MasterNoundone=1
									end if
							if MasterNoundone=0 and ConnectiveTermONE="to" and Phrases1<>";" and (CountingPhrases=2 or CountingPhrases=3) and TermONEDONE=0 Then
								if (elm=babies or elm="baby") Then   'for entries like baby boy / baby girl----- PASS 1
										if ( eng_array(ElementCount)<>"boy" or eng_array(ElementCount)<>"girl" ) Then
											personafterto=0
											foundperson=0
											personcallsay=0
											MasterNoun=0
										elseif ( eng_array(ElementCount)<>"boys" or eng_array(ElementCount)<>"girls" ) Then
											personafterto=0
											foundperson=0
											personcallsay=0
											MasterNoun=0
										end if
								else
									NounTermONE=NounTermONE+"লৈ"
									NounTermONEUtcharan=NounTermONEUtcharan+"loi"
									TermONEDONE=1
									MasterNoundone=1
								end if
							elseif MasterNoundone=0 and ConnectiveTermTWO="to" and Phrases2<>";" and CountingPhrases=3 and TermTWODONE=0 Then
								if (elm=babies or elm="baby") Then   'for entries like baby boy / baby girl----- PASS 1
										if ( eng_array(ElementCount)<>"boy" or eng_array(ElementCount)<>"girl" ) Then
											personafterto=0
											foundperson=0
											personcallsay=0
											MasterNoun=0
										elseif ( eng_array(ElementCount)<>"boys" or eng_array(ElementCount)<>"girls" ) Then
											personafterto=0
											foundperson=0
											personcallsay=0
											MasterNoun=0
										end if
								else
									NounTermONE=NounTermONE+"লৈ"
									NounTermONEUtcharan=NounTermONEUtcharan+"loi"
									TermONEDONE=1
									MasterNoundone=1
								end if
							end if
							        MasterNoundone=1
									foundNounTermONE=1
									NounTerm=""
									NounTermUtcharan=""
								elseif foundNounTermTWO=0 Then
									Curr_Term="NounTermTWO"
									NounTermTWO=NounTerm
							NounTermTWOUtcharan=NounTermUtcharan
							if personafterto=0 and foundof=0 and MasterNoun=1 and MasterNoundone=0 and MasterVerb=1 and PronounTerm="" Then
								if StrComp((Right(NounTerm,1)),"ো")=0  Then
									NounTermTWO=NounTerm+"ৱে"
									NounTermTWOUtcharan=NounTermTWOUtcharan+"ye"
								elseif StrComp((Right(NounTerm,1)),"ি")=0 or StrComp((Right(NounTerm,1)),"ী")=0 or StrComp((Right(NounTerm,1)),"া")=0 Then
									if FoundFemale=1 Then
										NounTermTWO=NounTerm+"য়ে"
										NounTermTWOUtcharan=NounTermTWOUtcharan+"ye"
									else
										NounTermTWO=NounTerm+"য়ে"
										NounTermTWOUtcharan=NounTermTWOUtcharan+"ye"
									end if
								end if
							elseif personafterto=0 and foundperson=1 and MasterVerb=1   and PronounTerm="" Then
										lenNoun=len(NounTerm)
										NounTermTWO=NounTerm+"য়ে"
										NounTermTWOUtcharan=NounTermTWOUtcharan+"ye"
							elseif foundof=0   and PronounTerm="" Then
										NounTermTWO=NounTerm
										NounTermTWOUtcharan=NounTermTWOUtcharan
							elseif foundof=1 Then
								
								NounTermTWO=NounTerm+"ৰ"
								NounTermTWOUtcharan=NounTermTWOUtcharan+"or"
							elseif PronounTerm<>"" and person=1 Then
								NounTermTWO=NounTerm+"ক"
								NounTermTWOUtcharan=NounTermTWOUtcharan+"k"
							else
								NounTermTWO=NounTerm
								NounTermTWOUtcharan=NounTermTWOUtcharan
							end if
								
								
							
							if personafterto=1 and MasterNoundone=0 Then
								NounTermTWO=NounTermTWO+"ক"
								NounTermTWOUtcharan=NounTermTWOUtcharan+"k"
								personafterto=0
								MasterNoundone=1
							end if
							if  personcallsay=1 and MasterNoundone=0 Then
								NounTermTWO=NounTermTWO+"ক"
								NounTermTWOUtcharan=NounTermTWOUtcharan+"k"
								foundperson=0
								personcallsay=0
								MasterNoundone=1
							end if
							if MasterNoundone=0 and ConnectiveTermONE="to" and Phrases1<>";" and (CountingPhrases=2 or CountingPhrases=3) and TermONEDONE=0 Then
								if (elm=babies or elm="baby") Then   'for entries like baby boy / baby girl----- PASS 1
										if ( eng_array(ElementCount)<>"boy" or eng_array(ElementCount)<>"girl" ) Then
											personafterto=0
											foundperson=0
											personcallsay=0
											MasterNoun=0
										elseif ( eng_array(ElementCount)<>"boys" or eng_array(ElementCount)<>"girls" ) Then
											personafterto=0
											foundperson=0
											personcallsay=0
											MasterNoun=0
										end if
								else
									NounTermTWO=NounTermTWO+"লৈ"
									NounTermTWOUtcharan=NounTermTWOUtcharan+"loi"
									TermTWODONE=1
									MasterNoundone=1
								end if
							elseif MasterNoundone=0 and ConnectiveTermTWO="to" and Phrases2<>";" and CountingPhrases=3 and TermTWODONE=0 Then
								if (elm=babies or elm="baby") Then   'for entries like baby boy / baby girl----- PASS 1
										if ( eng_array(ElementCount)<>"boy" or eng_array(ElementCount)<>"girl" ) Then
											personafterto=0
											foundperson=0
											personcallsay=0
											MasterNoun=0
										elseif ( eng_array(ElementCount)<>"boys" or eng_array(ElementCount)<>"girls" ) Then
											personafterto=0
											foundperson=0
											personcallsay=0
											MasterNoun=0
										end if
								else
									NounTermTWO=NounTermTWO+"লৈ"
									NounTermTWOUtcharan=NounTermTWOUtcharan+"loi"
									TermTWODONE=1
									MasterNoundone=1
								end if
							end if
							MasterNoundone=1
							foundNounTermTWO=1
							NounTerm=""
							NounTermUtcharan=""
						end if
						foundTHE=0
					elseif ThanConjDone=0.5 Then
					
						NounTerm=NounTerm+rs.Fields(0).value+rs.Fields(1).value
						NounTermUtcharan=NounTermUtcharan+rs.Fields(3).value+rs.Fields(4).value	
						if foundNounTermONE=0 Then
							Curr_Term="NounTermONE"
							NounTermONE=NounTerm
							NounTermONEUtcharan=NounTermUtcharan
							
								NounTermONE=NounTerm+"তকৈ"
								NounTermONEUtcharan=NounTermONEUtcharan+"atkoi"
							
							
							
							
							foundNounTermONE=1
							NounTerm=""
							NounTermUtcharan=""
							ThanConjDone=1
						elseif foundNounTermTWO=0 Then
							Curr_Term="NounTermTWO"
							NounTermTWO=NounTerm
							NounTermTWOUtcharan=NounTermUtcharan
							
							
								NounTermTWO=NounTerm+"তকৈ"
								NounTermTWOUtcharan=NounTermTWOUtcharan+"atkoi"
							
							
							
							
							foundNounTermTWO=1
							NounTerm=""
							NounTermUtcharan=""
							ThanConjDone=1
						end if
					end if    'end of ThanConjDone/foundTHE=0/foundTHE=1.....
            end if      ' end of noun
			if StrComp(rs.Fields(2),"h")=0 Then
			               heavy =1
			             elseif StrComp(rs.Fields(2),"l")=0 Then
			               light=1
			             end if
						 rs.close
		end if   ' end of all noun/noun+S/noun+es
		
		
		'' adjoint words... car racing, guwahati airport, guwahati railway station, bus stand etc..
		' ' Response.Write ElementCount
		if Curr_Term="NounTermTWO" Then
			if ElementCount>3 Then
				if eng_array(ElementCount-3)="at" Then
					NounTermONE=NounTermONE+" "+NounTermTWO
					NounTermONEUtcharan=NounTermONEUtcharan+" "+NounTermTWOUtcharan
					
					NounTermTWO=""
					NounTermTWOUtcharan=""
					foundNounTermTWO=0
				end if
			end if
		end if
		
		
		
		
		''code for "at"
		'' ' Response.write NounTermONE
		if Foundat=1 Then
				if foundNounTermTWO=1 Then
					NounTermTWO=NounTermTWO+"ত"
					NounTermTWOUtcharan=NounTermTWOUtcharan+"ot"
					Foundat=0
				elseif foundNounTermTWO=0 and foundNounTermONE=1 Then
					NounTermONE=NounTermONE+"ত"
					NounTermONEUtcharan=NounTermONEUtcharan+"t"
					Foundat=0
					
				end if
		end if
		
		''code for "in"
		if elm="in"  Then
				Foundin=1
				
		end if
		if Foundin=1 and ( Curr_Term="NounTermTWO" or Curr_Term="NounTermONE") Then
		
			    
				if Curr_Term="NounTermTWO" Then
					if ElementCount>2 Then
						if eng_array(ElementCount-2)="in" or eng_array(ElementCount-3)="in" Then
							NounTermTWO=NounTermTWO+"ত"
							NounTermTWOUtcharan=NounTermTWOUtcharan+"ot"
							Foundin=0
						end if
					end if
				else
					if Curr_Term="NounTermONE" Then
					
						if ElementCount>2 Then
							if eng_array(ElementCount-2)="in" or eng_array(ElementCount-3)="in" Then
								NounTermONE=NounTermONE+"ত"
								NounTermONEUtcharan=NounTermONEUtcharan+"ot"
								Foundin=0
							end if
						end if
					end if
				end if
		end if
		
	' ' Response.Write ElementCount	
	if ElementCount> 2 Then     
		if  Curr_Term="NounTermONE"  Then
		 if eng_array(ElementCount-2)="one" Then
			NounTermONE="এটা"+" "+NounTermONE
			NounTermONEUtcharan="eta" + " "+NounTermONEUtcharan
		  elseif eng_array(ElementCount-2)="two" Then
			NounTermONE="দুটা"+" "+NounTermONE
			NounTermONEUtcharan="duta" + " "+NounTermONEUtcharan
		  elseif eng_array(ElementCount-2)="three" Then
			NounTermONE="তিনিটা"+" "+NounTermONE
			NounTermONEUtcharan="tinita" + " "+NounTermONEUtcharan
		  elseif eng_array(ElementCount-2)="four" Then
			NounTermONE="চাৰিটা"+" "+NounTermONE
			NounTermONEUtcharan="sarita" + " "+NounTermONEUtcharan
		  elseif eng_array(ElementCount-2)="five" Then
			NounTermONE="পাচঁটা"+" "+NounTermONE
			NounTermONEUtcharan="pasta" + " "+NounTermONEUtcharan
		  elseif eng_array(ElementCount-2)="six" Then
			NounTermONE="ছয়টা"+" "+NounTermONE
			NounTermONEUtcharan="soita" + " "+NounTermONEUtcharan
		  elseif eng_array(ElementCount-2)="seven" Then
			NounTermONE="সাতটা"+" "+NounTermONE
			NounTermONEUtcharan="xatta" + " "+NounTermONEUtcharan
		  elseif eng_array(ElementCount-2)="eight" Then
			NounTermONE="আঁঠটা"+" "+NounTermONE
			NounTermONEUtcharan="aathtaa" + " "+NounTermONEUtcharan
		  elseif eng_array(ElementCount-2)="nine" Then
			NounTermONE="নটা"+" "+NounTermONE
			NounTermONEUtcharan="nota" + " "+NounTermONEUtcharan
		  elseif eng_array(ElementCount-2)="ten" Then
			NounTermONE="দহটা"+" "+NounTermONE
			NounTermONEUtcharan="dohta" + " "+NounTermONEUtcharan
		  
		 end if
		end if
		if  Curr_Term="NounTermTWO"  Then
		 if eng_array(ElementCount-2)="one" Then
			NounTermTWO="এটা"+" "+NounTermTWO
			NounTermTWOUtcharan="eta" + " "+NounTermTWOUtcharan
		  elseif eng_array(ElementCount-2)="two" Then
			NounTermTWO="দুটা"+" "+NounTermTWO
			NounTermTWOUtcharan="duta" + " "+NounTermTWOUtcharan
		  elseif eng_array(ElementCount-2)="three" Then
			NounTermTWO="তিনিটা"+" "+NounTermTWO
			NounTermTWOUtcharan="tinita" + " "+NounTermTWOUtcharan
		  elseif eng_array(ElementCount-2)="four" Then
			NounTermTWO="চাৰিটা"+" "+NounTermTWO
			NounTermTWOUtcharan="sarita" + " "+NounTermTWOUtcharan
		  elseif eng_array(ElementCount-2)="five" Then
			NounTermTWO="পাঁচটা"+" "+NounTermTWO
			NounTermTWOUtcharan="pasta" + " "+NounTermTWOUtcharan
		  elseif eng_array(ElementCount-2)="six" Then
			NounTermTWO="ছয়টা"+" "+NounTermTWO
			NounTermTWOUtcharan="soita" + " "+NounTermTWOUtcharan
		  elseif eng_array(ElementCount-2)="seven" Then
			NounTermTWO="সাতটা"+" "+NounTermTWO
			NounTermTWOUtcharan="xatta" + " "+NounTermTWOUtcharan
		  elseif eng_array(ElementCount-2)="eight" Then
			NounTermTWO="আঁঠটা"+" "+NounTermTWO
			NounTermTWOUtcharan="aathtaa" + " "+NounTermTWOUtcharan
		  elseif eng_array(ElementCount-2)="nine" Then
			NounTermTWO="নটা"+" "+NounTermTWO
			NounTermTWOUtcharan="nota" + " "+NounTermTWOUtcharan
		  elseif eng_array(ElementCount-2)="ten" Then
			NounTermTWO="দহটা"+" "+NounTermTWO
			NounTermTWOUtcharan="dohta" + " "+NounTermTWOUtcharan
		  
		 end if
		end if
	end if	
		
	    if elm=";" Then
				'' ' Response.Write "/EOF/"
		end if
		
		if foundnoun=1 and ElementCount>2 Then
		    
			if ( eng_array(ElementCount-2)="next" or eng_array(ElementCount-2)="previous" ) and foundNounTermONE=1 and foundNounTermTWO=0 Then
				
				if 	eng_array(ElementCount-2)="next" Then
					MODNounTermONE="অহা"
					MODNounTermONEUtcharan="oha"
				 else
					MODNounTermONE="পাছৰ"
					MODNounTermONEUtcharan="pasor"
				 end if
			
			elseif ( eng_array(ElementCount-2)="next" or eng_array(ElementCount-2)="previous"  ) and foundNounTermTWO=1 Then
				if 	eng_array(ElementCount-2)="next" Then
					MODNounTermTWO="অহা"
					MODNounTermTWOUtcharan="oha"
				 else
					MODNounTermTWO="পাছৰ"
					MODNounTermTWOUtcharan="pasor"
				 end if
			end if
			
		end if
		
		DoThisElem=""
	   ' search tense and mainverb
	   
		
		
	          if StrComp(elm,"do")=0 or StrComp(elm,"done")=0 or StrComp(elm,"did")=0 or StrComp(elm,"does")=0 Then
                           if StrComp(eng_array(ElementCount),"not")=0 Then
						     '
							  foundnot=1
							  WordDone=1
							 
						   else
						      founddo=1
							  WordDone=1
							
						   end if
						   
              end if 
			  
			  TAGLIM=0
			  
			  '' when connective phrases are one word and connection term found "after" ''''''''''''''''''
			   if  elm<>";" and  count>2 and ElementCount<2 Then
							da=""
							rs.Open "select root from tab_tenseverb where english='"+elm+"'", Conn
							if rs.EOF Then
								  'do nothing
							else
								'
								da=rs.Fields(0).value
								TAGLIM=1
							end if
							rs.close
							
							
							'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
					' '''''''''''''''''''''''''''''''' when parsed after     ''''''''''''''''''''''
					''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
							'' ' Response.Write "//////////////"
							'' ' Response.Write ConnectiveTermTWO
							'' ' Response.Write "//////////"
							
							if ( ConnectiveTermONE="after" or ConnectiveTermONE="for" ) and CountingPhrases=3 and Phrases2=";" and TAGLIM=1 and WordDone=0 Then
								rs.Open "select action,actionUtcharan from tab_verb where verbs='"+da+"_secondperson'", Conn 
								if rs.EOF Then
									'pass
								else
									Assamese_String=Assamese_String+rs.Fields(0).value+"ৰ "
									Assamese_StringUtcharan=Assamese_StringUtcharan+rs.Fields(1).value+"r"
									WordDone=1
									'' ' Response.Write Assamese_String
								end if
								rs.close
						   elseif  ( ConnectiveTermONE="after" or ConnectiveTermONE="for" ) and CountingPhrases=2 and Phrases2<>";" and TAGLIM=1 and WordDone=0 Then
								rs.Open "select action,actionUtcharan from tab_verb where verbs='"+da+"_secondperson'", Conn 
								if rs.EOF Then
									'pass
								else
									Assamese_String=Assamese_String+rs.Fields(0).value+"ৰ "
									Assamese_StringUtcharan=Assamese_StringUtcharan+rs.Fields(1).value+"r"
									WordDone=1
									'' ' Response.Write Assamese_String
								end if
								rs.close
							elseif  ( ConnectiveTermTWO="after" or ConnectiveTermTWO="for") and CountingPhrases=3 and Phrases2<>";" and TAGLIM=1 and WordDone=0 Then
								rs.Open "select action,actionUtcharan from tab_verb where verbs='"+da+"_secondperson'", Conn 
								if rs.EOF Then
									'pass
								else
									Assamese_String=Assamese_String+rs.Fields(0).value+"ৰ "
									Assamese_StringUtcharan=Assamese_StringUtcharan+rs.Fields(1).value+"r"
									WordDone=1
									'' ' Response.Write Assamese_String
								end if
								rs.close
							end if
							
								'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
								' '''''''''''''''''''''''''''''''' after   parsing ends here  ''''''''''''''''''''''
								''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
								
								
								
							'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
					' '''''''''''''''''''''''''''''''' when parsed before     ''''''''''''''''''''''
					''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
							'' ' Response.Write "//////////////"
							'' ' Response.Write ConnectiveTermTWO
							'' ' Response.Write "//////////"
							
							if  ( ConnectiveTermONE="before" or ConnectiveTermONE="for") and CountingPhrases=3 and Phrases2=";" and TAGLIM=1 and WordDone=0 Then
								rs.Open "select action,actionUtcharan from tab_verb where verbs='"+da+"_secondperson'", Conn 
								if rs.EOF Then
									'pass
								else
									Assamese_String=Assamese_String+rs.Fields(0).value+"ৰ "
									Assamese_StringUtcharan=Assamese_StringUtcharan+rs.Fields(1).value+"r"
									WordDone=1
									'' ' Response.Write Assamese_String
								end if
								rs.close
						   elseif  ( ConnectiveTermONE="before" or ConnectiveTermONE="for") and CountingPhrases=2 and Phrases2<>";" and TAGLIM=1 and WordDone=0 Then
								rs.Open "select action,actionUtcharan from tab_verb where verbs='"+da+"_secondperson'", Conn 
								if rs.EOF Then
									'pass
								else
									Assamese_String=Assamese_String+rs.Fields(0).value+"ৰ "
									Assamese_StringUtcharan=Assamese_StringUtcharan+rs.Fields(1).value+"r"
									WordDone=1
									'' ' Response.Write Assamese_String
								end if
								rs.close
							elseif  ( ConnectiveTermTWO="before" or ConnectiveTermTWO="for") and CountingPhrases=3 and Phrases2<>";" and TAGLIM=1 and WordDone=0 Then
								rs.Open "select action,actionUtcharan from tab_verb where verbs='"+da+"_secondperson'", Conn 
								if rs.EOF Then
									'pass
								else
									Assamese_String=Assamese_String+rs.Fields(0).value+"ৰ "
									Assamese_StringUtcharan=Assamese_StringUtcharan+rs.Fields(1).value+"r"
									WordDone=1
									'' ' Response.Write Assamese_String
								end if
								rs.close
							end if
							
								'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
								' ''''''''''''''''''''''''''''''''before   parsing ends here  ''''''''''''''''''''''
								''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
								
								
								'''  When Speaker is absent and a phrase is very general
							' if WordDone=0 and  TAGLIM=1 and(actor1=-1 and actor2=-1 and actor3=-1 ) or (actor1<>-1 and Phrases1<>";" and (actor2=-1 and (CountingPhrases=2 or CountingPhrases=3)) and actor3=-1 ) Then
									' rs.Open "select present,presentUtcharan from tab_verb where verbs='"+da+"_firstperson'", Conn 
									
									' if rs.EOF Then
										' 'pass
									' else
										' splitvalue=split(rs.Fields(0).value," ")
										' splitvalueUtch=split(rs.Fields(1).value," ")
										' Assamese_String=Assamese_String+splitvalue(0)
										' Assamese_StringUtcharan=Assamese_StringUtcharan+splitvalueUtch(1)
										' WordDone=1
										' ' ' Response.Write rs.Fields(0).value
									' end if
									' rs.close
							' end if
			   end if
			 
			 
			  
			  
			 
			  ''from running..sitting....work etc
			  TAGLIM=0
			  if  elm<>";" and  count>2 and ElementCount>2 Then
					
				    da=""
				    rs.Open "select root from tab_tenseverb where english='"+elm+"'", Conn
					if rs.EOF Then
						  'do nothing
					else
						'
						da=rs.Fields(0).value
						TAGLIM=1
					end if
					rs.close
					
					
					
					
						'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
						' ''''''''''''''''''''''''''''''''   parsing from  ''''''''''''''''''''''
						''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
				    if StrComp(eng_array(ElementCount-2),"from")=0 and TAGLIM=1 Then
						'' ' Response.Write "XXXX"
						
						rs.Open "select action,actionUtcharan from tab_verb where verbs='"+da+"_secondperson'", Conn 
						if rs.EOF Then
							'pass
						else
							Assamese_String=Assamese_String+rs.Fields(0).value+"ৰ পৰা"
							Assamese_StringUtcharan=Assamese_StringUtcharan+rs.Fields(1).value+"r pora"
							WordDone=1
							'' ' Response.Write rs.Fields(0).value
						end if
						rs.close
						
					end if
			  end if
			  '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
						' '''''''''''''''''''''''''''''''' from   parsing ends here  ''''''''''''''''''''''
						''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
			  '''  When Speaker is absent and a phrase is very general
					' if WordDone=0 and TAGLIM=1 and (actor1=-1 and actor2=-1 and actor3=-1 ) or (actor1<>-1  and Phrases1<>";" and (actor2=-1 and (CountingPhrases=2 or CountingPhrases=3)) and actor3=-1 ) Then
					        ' rs.Open "select present,presentUtcharan from tab_verb where verbs='"+da+"_firstperson'", Conn 
							
							' if rs.EOF Then
								' 'pass
							' else
							    ' splitvalue=split(rs.Fields(0).value," ")
								' splitvalueUtch=split(rs.Fields(1).value," ")
								' Assamese_String=Assamese_String+splitvalue(0)
								' Assamese_StringUtcharan=Assamese_StringUtcharan+splitvalueUtch(1)
								' WordDone=1
								' ' ' Response.Write rs.Fields(0).value
							' end if
							' rs.close
					' end if
			 
			  if elm<>";" and WordDone=0 Then
					   
			          if elm="take" Then
					  
					    if  eng_array(ElementCount)="boy" or eng_array(ElementCount)="man" or eng_array(ElementCount)="woman" or eng_array(ElementCount)="son" or eng_array(ElementCount)="driver" or eng_array(ElementCount)="girl" or eng_array(ElementCount)="him" or eng_array(ElementCount)="her" or eng_array(ElementCount)="his" or eng_array(ElementCount)="my" or eng_array(ElementCount)="me" or eng_array(ElementCount)="them"  Then
							elm="takep"
							WordDone=1
						elseif eng_array(ElementCount)="the" Then
						  if  eng_array(ElementCount+1)="boy" or eng_array(ElementCount+1)="man" or eng_array(ElementCount+1)="woman" or eng_array(ElementCount+1)="son" or eng_array(ElementCount+1)="driver" or eng_array(ElementCount+2)="girl" or eng_array(ElementCount+1)="him" or eng_array(ElementCount+1)="her" or eng_array(ElementCount+1)="his" or eng_array(ElementCount+1)="my" or eng_array(ElementCount+1)="me" or eng_array(ElementCount+1)="them"  Then
							elm="takep"
							WordDone=1
						  end if
						end if
						if  eng_array(ElementCount)="sister" or eng_array(ElementCount)="brother" or eng_array(ElementCount)="uncle" or eng_array(ElementCount)="aunt" or eng_array(ElementCount)="mother"   Then
							elm="takep"
							WordDone=1
						elseif eng_array(ElementCount)="the" Then
						  if  eng_array(ElementCount+1)="sister" or eng_array(ElementCount+1)="brother" or eng_array(ElementCount+1)="uncle" or eng_array(ElementCount+1)="aunt" or eng_array(ElementCount+1)="mother" Then
							elm="takep"
							WordDone=1
						  end if
						end if
					  end if
					  ''''''''''for plurals''''''''''
					  if elm="take" Then
					  
					    if  eng_array(ElementCount)="boys" or eng_array(ElementCount)="men" or eng_array(ElementCount)="women" or eng_array(ElementCount)="sons" or eng_array(ElementCount)="drivers" or eng_array(ElementCount)="girls" or eng_array(ElementCount)="him" or eng_array(ElementCount)="her" or eng_array(ElementCount)="his" or eng_array(ElementCount)="my" or eng_array(ElementCount)="me" or eng_array(ElementCount)="them"  Then
							elm="takep"
							WordDone=1
						elseif eng_array(ElementCount)="the" Then
						  if  eng_array(ElementCount+1)="boys" or eng_array(ElementCount+1)="men" or eng_array(ElementCount+1)="women" or eng_array(ElementCount+1)="sons" or eng_array(ElementCount+1)="drivers" or eng_array(ElementCount+2)="girls" or eng_array(ElementCount+1)="him" or eng_array(ElementCount+1)="her" or eng_array(ElementCount+1)="his" or eng_array(ElementCount+1)="my" or eng_array(ElementCount+1)="me" or eng_array(ElementCount+1)="them"  Then
							elm="takep"
							WordDone=1
						  end if
						end if
						if  eng_array(ElementCount)="sisters" or eng_array(ElementCount)="brothers" or eng_array(ElementCount)="uncles" or eng_array(ElementCount)="aunts" or eng_array(ElementCount)="mothers"   Then
							elm="takep"
							WordDone=1
						elseif eng_array(ElementCount)="the" Then
						  if  eng_array(ElementCount+1)="sisters" or eng_array(ElementCount+1)="brothers" or eng_array(ElementCount+1)="uncles" or eng_array(ElementCount+1)="aunts" or eng_array(ElementCount+1)="mothers" Then
							elm="takep"
							WordDone=1
						  end if
						end if
					  end if
					  
					  if elm<>"want" or elm<>"wanted" Then
							  rs.Open "Select root,tense from tab_tenseverb where english='"+elm+"'", Conn 
							  if rs.EOF Then
							  'do nothing
							   
							  elseif Len(rs.Fields(0)) > 0 and mainverb="" Then
								WordDone=1
							   mainverb=rs.Fields(0).value
							  
							   mainverbPOSITION=SuperCounter-1
							   ' ' ' Response.Write "mainverb:"+mainverb
							    ' ' ' Response.Write mainverbPOSITION
							   
							   if MasterNoundone=0 Then
								MasterVerb=1
							   end if
							   '' ' Response.Write "mainverb:"+mainverb
							   tense=rs.Fields(1).value
							   if mainverb="say" or mainverb="call" or mainverb="tell" or mainverb="give" Then
									callsay=1
							   end if
							   if mainverb="stop" and ( FoundThinking=1 or Foundsay=1 or Foundwork=1) Then
									mainverb="stopbondho"
							   end if
							   
							   
							   if ElementCount=1 Then
								 actor1=1
							   end if
								 '' ' Response.Write "/tense:"+tense+"/ "
								 '' ' Response.Write "/voice"
								 '' ' Response.Write firstpersonaux
								 '' ' Response.Write "/mainverb NEGATIVE Procc./"
								 if ConnectiveTermONE="to" and Phrases1<>";" and CountingPhrases=2 and TermONEDONE=0 Then
														
														TermONEDONE=99
													elseif ConnectiveTermTWO="to" and Phrases2<>";" and CountingPhrases=3 and TermTWODONE=0  Then
														
														TermTWODONE=99
													elseif ConnectiveTermONE="to" and Phrases2=";" and CountingPhrases=3 and TermONEDONE=0   Then
														
														TermONEDONE=99
								end if
							  elseif Len(rs.Fields(0)) > 0 and mainverb<>"" Then
							   auxverb=rs.Fields(0).value
							
							    auxverbPOSITION=SuperCounter-1
								' ' ' Response.Write "auxverb:"+auxverb
							    ' ' ' Response.Write auxverbPOSITION
								
  							   '' ' Response.Write "auxverb:"+auxverb+"/ "
								tenseauxverb=rs.Fields(1).value
								'' ' Response.Write "/auxtense:"+tenseauxverb+"/ "
										if ConnectiveTermONE="to" and Phrases1<>";" and CountingPhrases=2 and TermONEDONE<>0  Then
														
														TermONEDONE=199
													elseif ConnectiveTermTWO="to" and Phrases2<>";" and CountingPhrases=3 and TermTWODONE<>0  Then
														
														TermTWODONE=199
													elseif ConnectiveTermONE="to" and Phrases2=";" and CountingPhrases=3 and TermONEDONE<>0  Then
														
														TermONEDONE=199
									   end if
							  end if
							 rs.close
					    end if
					  
			  else 
					'' ' Response.Write "/000EOF/"
			  end if
			  
			  if ElementCount>3 Then 
			  '' ' Response.Write eng_array(ElementCount-1) 
			  '' ' Response.Write eng_array(ElementCount-2) 
			  '' ' Response.Write eng_array(ElementCount-3) 
			  '' ' Response.Write eng_array(ElementCount-4) 
			  '' ' Response.Write "**"
			  if mainverb<>"" and StrComp(eng_array(ElementCount-3),"have")=0 and StrComp(eng_array(ElementCount-4),"i")=0  Then
                PronounTerm="মই " 
			    PronounTermUtcharan="moi " 
			  elseif auxverb<>"" and StrComp(eng_array(ElementCount-3),"have")=0 and StrComp(eng_array(ElementCount-4),"i")=0  Then
                AUXPronounTerm="মই " 
			    AUXPronounTermUtcharan="moi " 
			  end if 
			  end if
			  if Foundtimeverbmodifier=1 Then
						rs.Open "select action,actionUtcharan from tab_verb where verbs='"+mainverb+"_secondperson'", Conn 
						if rs.EOF Then
							'pass
						else
							Assamese_String=Assamese_String+rs.Fields(0).value+"ৰ"
							Assamese_StringUtcharan=Assamese_StringUtcharan+rs.Fields(1).value+"ar"
							WordDone=1
							'' ' Response.Write rs.Fields(0).value
						end if
						rs.close
						mainverb=""
			  end if
			  
			  
			  if tense="prst" Then
						prst=1
						elseif tense="pst" Then
						  pst=1
						  elseif tense="ftre" Then
							ftre=1
			  end if
			  if tenseauxverb="prst" Then
						prstaux=1
						elseif tenseauxverb="pst" Then
						  pstaux=1
						  elseif tenseauxverb="ftre" Then
							ftreaux=1
			 end if
			if fdis=1 Then	 
     		 
					'ENDSTRING="আছে"
					'ENDSTRINGUtcharan="aase"
					prst=1
					pst=0
					ftre=0
			elseif fdwas=1  Then
					'ENDSTRING="আছিল"
					'ENDSTRINGUtcharan="aasil"
					pst=1
					prst=0
					ftre=0
			elseif fddid=1 Then
					'ENDSTRING="আছিল"
					'ENDSTRINGUtcharan="aasil"
					pst=1
					prst=0
					ftre=0
			 elseif fddid=1  and auxverb<>"" and mainverb="" Then
					'ENDSTRING="আছিল"
					'ENDSTRINGUtcharan="aasil"
					fdwas=1
					pstaux=0
					prstaux=0
					ftreaux=0
					founddo=0
					pst=1
					prst=0
					ftre=0
					mainverb=auxverb
					auxverb=""
			 elseif  fddo=1 and auxverb<>""  and mainverb="" Then
					
					fdwas=0
					pstaux=0
					prstaux=0
					ftreaux=0
					founddo=0
					pst=0
					prst=0
					ftre=1
					mainverb=auxverb
					auxverb=""
		     elseif fdthis=1 and fdis=1 Then
				
					ENDSTRING="হয়"
					ENDSTRINGUtcharan="hoi"
					prst=1
					pst=0
					ftre=0
			elseif fdwas=1 and fdthis=1 Then
					ENDSTRING="আছিল"
					ENDSTRINGUtcharan="aasil"
					pst=1
					prst=0
					ftre=0
				
		     elseif fdis=1 and ENDSTRING="" Then
			   ENDSTRING="হয়"
			   ENDSTRINGUtcharan="hoi"
		     end if
			 
			 if Foundwhowhomtense=1 Then
			    if auxverb="" Then
				'pass
				else
				
					 if tense="prst" Then
								prst=1
								elseif tense="pst" Then
								  pst=1
								  elseif tense="ftre" Then
									ftre=1
					  end if
						thirdpersonaux=1
						secondpersonaux=0
						firstpersonaux=0
				end if
			 end if
			 if foundto=1 Then
						 thirdpersonaux=1
			 end if
			 
		     if mainverb<>"" and StrComp(elm,"have")=0 and WordDone=0 Then
                
			  elseif auxverb<>"" and StrComp(elm,"have")=0 and WordDone=0  Then
                
			  end if 
			  
			  if have_=1 or have_=2 Then
			     
			  end if
	  
			if Foundkeep=1 Then
				ftreaux=1
				prstaux=0
				pstaux=0
			end if
			'' ' Response.write mainverb
			if Foundhowfar=1 and Foundhowlong="long" Then
				
				mainverb=""
				tense=""
				
				pst=0
				prst=0
				ftre=0
				ENDSTRING=""
				ENDSTRINGUtcharan=""
			elseif Foundhowfar=1 and Foundhowlong="time" Then
				mainverb=""
				tense=""
				
				pst=0
				prst=0
				ftre=0
				Foundhowfar=0  're initialize
				QHString=QHString+" সময়"
				QHStringUtcharan=QHStringUtcharan+" xomoi"
			end if
	  
	  '' ' Response.Write mainverb
	  
	if StrComp(elm,"the") =0 Then
	  'do nothing
		foundTHE=1
		WordDone=1
		'' ' Response.Write "/foundTHE/"
	end if
	
	
	
	if StrComp(elm,"you")=0 and WordDone=0 Then
       '' ' Response.Write "/55%%/"
	   '' ' Response.Write actor1
	   WordDone="1 and you"
	  if actor1=-1 Then
			   if CountingPhrases=2 and have_=1  Then
				thirdperson=1
				secondperson=0
				'' ' Response.Write "/you..o#"
			   elseif CountingPhrases=1 and have_=1 Then
				 secondperson=1
				end if
				if CountingPhrases=3 and ( have_=1 or have_=2) Then
				  thirdperson=1
				  secondperson=0
				  '' ' Response.Write "/you..d##"
				elseif CountingPhrases=1 and have_=1 Then
				 secondperson=1
				else
				 secondperson=1
				end if
	   sglr=1
	   foundpronoun=1
	   actor1=1
	   
	  elseif actor1=1 Then
	    secondpersonaux=1
		actor2=1
		'' ' Response.Write "/acto2"
		'' ' Response.Write secondpersonaux
		'' ' Response.Write "/"
	  end if
	  
	  if StrComp(elm,"your")=0  Then
       '' ' Response.Write "/77%%/"
	   '' ' Response.Write actor1
	   WordDone=1
			  if actor1=-1 Then
					   
			   secondperson=1
						
			   sglr=1
			   foundpronoun=1
			   actor1=1
			   
			  elseif actor1=1 Then
				secondpersonaux=1
				actor2=1
				'' ' Response.Write "/acto2"
				'' ' Response.Write secondpersonaux
				'' ' Response.Write "/"
			 end if
	  end if
	  
	  if ElementCount>0 Then 
			  '' ' Response.Write eng_array(ElementCount) 
			   
			    
			   
			  '' ' Response.Write "%%"
	  end if
	  '' ' Response.Write PronounTerm
      if eng_array(0)<>"you" and StrComp(elm,"you")=0 and WordDone="1 and you" Then
	    '' ' Response.Write eng_array(0)
		rs.Open "Select translation,translationUtcharan from tab_pronoun where words='"+elm+"'", Conn 
	    WordDone=1
		'Ex: I said you
		if rs.eof Then
		  'do nothing
		elseif  actor2=-1 and ((ConnectiveTermONE="to" and CountingPhrases=2 and Phrases2<>";") or (ConnectiveTermONE="to" and Phrases2=";" and CountingPhrases=3)or (ConnectiveTermTWO="to" and Phrases2<>";" and CountingPhrases=3) ) and ( ConnectiveTermTWO="to" or StrComp(eng_array(ElementCount-2),"given")=0 or StrComp(eng_array(ElementCount-2),"gave")=0 or StrComp(eng_array(ElementCount-2),"give")=0 or StrComp(eng_array(ElementCount-2),"want")=0 or StrComp(eng_array(ElementCount-2),"need")=0 or StrComp(eng_array(ElementCount-2),"tell")=0 or StrComp(eng_array(ElementCount-2),"told")=0 or StrComp(eng_array(ElementCount-2),"said")=0 or StrComp(eng_array(ElementCount-2),"say")=0 or StrComp(eng_array(ElementCount-2),"wanted")=0 or StrComp(eng_array(ElementCount-2),"needed")=0) Then
		   
		   if actor2=-1 Then
		    
			PronounTerm=PronounTerm+"তোমাক " 
			PronounTermUtcharan=PronounTermUtcharan+"tumak " 
		   end if
		elseif actor2=1 and posto<SuperCounter-1 and FoundMebeforeyou=0 Then
		    
		    AUXPronounTerm=AUXPronounTerm+"তোমাক " 
			AUXPronounTermUtcharan=AUXPronounTermUtcharan+"tumak "
		elseif actor2=1 and posto<SuperCounter-1 and FoundMebeforeyou=1 Then
		    
		    AUXPronounTerm=AUXPronounTerm+"তোমাৰ " 
			AUXPronounTermUtcharan=AUXPronounTermUtcharan+"tumar "
		elseif actor2=1 and posto>SuperCounter-1 Then
		    
		    AUXPronounTerm=AUXPronounTerm+"তুমি " 
			AUXPronounTermUtcharan=AUXPronounTermUtcharan+"tumi "
		 
		elseif StrComp(eng_array(ElementCount),"had")=0 or StrComp(eng_array(ElementCount),"did")=0  Then
		   
		   if actor2=-1 and  foundQH=0 Then
			PronounTerm=PronounTerm+"তোমাৰ " 
			PronounTermUtcharan=PronounTermUtcharan+"tumar " 
		   elseif actor2=1 and foundQH=0 Then
			AUXPronounTerm=AUXPronounTerm+"তোমাৰ " 
			AUXPronounTermUtcharan=AUXPronounTermUtcharan+"tumar " 
		   end if
		   
		else
		  ' ' ' Response.Write "/&&/"
		   if actor2=-1 Then
			PronounTerm=PronounTerm+rs.Fields(0).value+" " 
			PronounTermUtcharan=PronounTermUtcharan+rs.Fields(1).value+" " 
		   elseif actor2=1 Then
		    AUXPronounTerm=AUXPronounTerm+rs.Fields(0).value+" " 
			AUXPronounTermUtcharan=AUXPronounTermUtcharan+rs.Fields(1).value+" "
		   end if
		   
		end if
         rs.close 
		 '' ' Response.write PronounTerm
	  elseif StrComp(elm,"you")=0 and eng_array(0)="you" and WordDone="1 and you" Then
	    '' ' Response.write ConnectiveTermONE
		WordDone=1
		rs.Open "Select translation,translationUtcharan from tab_pronoun where words='"+elm+"'", Conn 
		'' ' Response.Write "TUMAK???"
		'' ' Response.Write eng_array(ElementCount)
		if (ConnectiveTermONE<>"for") and eng_array(ElementCount)<>"have" and eng_array(ElementCount)<>"had" and eng_array(ElementCount)<>";" Then
			'' ' Response.Write "1111---"
			if actor2=-1 Then
				PronounTerm=PronounTerm+rs.Fields(0).value+" "
				PronounTermUtcharan=PronounTermUtcharan+rs.Fields(1).value+" "
			elseif actor2=1 Then
				AUXPronounTerm=AUXPronounTerm+rs.Fields(0).value
				AUXPronounTermUtcharan=AUXPronounTermUtcharan+rs.Fields(1).value
			end if
		elseif StrComp(eng_array(ElementCount),"have")=0 or StrComp(eng_array(ElementCount),"had")=0  Then
			'' ' Response.Write "0101---"
			if actor2=-1 Then
				PronounTerm=PronounTerm+"তোমাৰ "
				PronounTermUtcharan=PronounTermUtcharan+"tumar"
			elseif actor2=1 Then
				AUXPronounTerm=AUXPronounTerm+"তোমাৰ "
				AUXPronounTermUtcharan=AUXPronounTermUtcharan+"tumar"
			end if
		elseif (ConnectiveTermONE="for" and (CountingPhrases=2 or CountingPhrases=3)) or ConnectiveTermTWO="for"  Then
			'' ' Response.Write "0101---"
			if actor2=-1 Then
				PronounTerm=PronounTerm+"তোমালৈ"
				PronounTermUtcharan=PronounTermUtcharan+"tumaloi"
			elseif actor2=1 Then
				AUXPronounTerm=AUXPronounTerm+"তোমালৈ"
				AUXPronounTermUtcharan=AUXPronounTermUtcharan+"tumaloi"
			end if
		elseif  actor2=-1 and ((ConnectiveTermONE="to" and CountingPhrases=2 and Phrases2<>";") or (ConnectiveTermONE="to" and Phrases2=";" and CountingPhrases=3)or (ConnectiveTermTWO="to" and Phrases2<>";" and CountingPhrases=3) )  Then
		   '' ' Response.Write "/&&/"
		   if actor2=-1 Then
		    '' ' Response.Write "/&&/"
			PronounTerm=PronounTerm+"তোমাক " 
			PronounTermUtcharan=PronounTermUtcharan+"tumak " 
		   end if
		elseif actor2=1 and posto<SuperCounter-1 and FoundMebeforeyou=0 Then
		    
		    AUXPronounTerm=AUXPronounTerm+"তোমাক " 
			AUXPronounTermUtcharan=AUXPronounTermUtcharan+"tumak "
		else
			if actor2=-1 Then
				PronounTerm=PronounTerm+rs.Fields(0).value+" "
				PronounTermUtcharan=PronounTermUtcharan+rs.Fields(1).value+" "
			elseif actor2=1 Then
				AUXPronounTerm=AUXPronounTerm+rs.Fields(0).value
				AUXPronounTermUtcharan=AUXPronounTermUtcharan+rs.Fields(1).value
			end if
		end if
		rs.close
	  else
	     'pass
		 
	  end if
	  
	end if       ' 2259
	
	if StrComp(elm,"your")=0 Then
	    WordDone=1
		'' ' Response.Write "/7&&/"
		rs.Open "Select translation,translationUtcharan from tab_pronoun where words='"+elm+"'", Conn
		if actor2=-1 Then
			PronounTerm=PronounTerm+rs.Fields(0).value
			PronounTermUtcharan=PronounTermUtcharan+rs.Fields(1).value
		   elseif actor2=1 Then
		    AUXPronounTerm=AUXPronounTerm+rs.Fields(0).value
			AUXPronounTermUtcharan=AUXPronounTermUtcharan+rs.Fields(1).value
		   end if
		rs.close 
	  end if
	  
	  '' CORRECTION NEEDED 14.3.19 FATAL
	
	if WordDone=0 and (StrComp(elm,"he") =0  or StrComp(elm,"she")=0 or StrComp(elm,"her")=0 or StrComp(elm,"him")=0 or StrComp(elm,"his")=0)  Then
	       '' ' Response.write WordDone
		   
		   LocalHerPointer=0
		   
		   For FindLocalHerPointer=count-1 To 0  Step -1          'decrementing Loop
				if eng_arrayTemp(FindLocalHerPointer)="her" Then
					LocalHerPointer=FindLocalHerPointer
					
				end if
				
		   Next
		   
		   
		   
		   WordDone=1
		   
		   rs.Open "Select translation,translationUtcharan from tab_pronoun where words='"+elm+"'", Conn 
		   if rs.eof Then
		     
			 'pass
		   else
					
				  
				   
				   
				if StrComp(elm,"her")=0 and SuperCounter>3 Then    ' her is not the starting word
				 
				    '' ' Response.write eng_arrayTemp(LocalHerPointer)
					if StrComp(eng_arrayTemp(LocalHerPointer+1),"to")=0   Then
								
							   if actor2=-1 Then
								PronounTerm=PronounTerm+rs.Fields(0).value+"ক "
								PronounTermUtcharan=PronounTermUtcharan+rs.Fields(1).value+"k "
								
							   elseif actor2=1  Then
								AUXPronounTerm=AUXPronounTerm+rs.Fields(0).value+"ক "
								AUXPronounTermUtcharan=AUXPronounTermUtcharan+rs.Fields(1).value+"k "
							   end if
					
					elseif StrComp(eng_arrayTemp(LocalHerPointer-1),"to")=0   Then
								
							   if actor2=-1 Then
								PronounTerm=PronounTerm+rs.Fields(0).value+"ৰ "
								PronounTermUtcharan=PronounTermUtcharan+rs.Fields(1).value+"r "
								
							   elseif actor2=1  Then
								AUXPronounTerm=AUXPronounTerm+rs.Fields(0).value+"ৰ "
								AUXPronounTermUtcharan=AUXPronounTermUtcharan+rs.Fields(1).value+"r "
							   end if
					elseif foundfrom=1 Then
						
							   if actor2=-1 Then
								PronounTerm=PronounTerm+rs.Fields(0).value+"ৰপৰা"
								PronounTermUtcharan=PronounTermUtcharan+rs.Fields(1).value+"rpora "
							   elseif actor2=1 Then
								AUXPronounTerm=AUXPronounTerm++rs.Fields(0).value+"ৰপৰা"
								AUXPronounTermUtcharan=AUXPronounTermUtcharan+rs.Fields(1).value+"rpora "
							   end if
					elseif ElementCount>1 Then
						 
					  if eng_array(ElementCount)=";" and (StrComp(eng_array(ElementCount-2),"call")=0 or StrComp(eng_array(ElementCount-2),"say")=0 or  StrComp(eng_array(ElementCount-2),"tell")=0 or  StrComp(eng_array(ElementCount-2),"give")=0 or StrComp(eng_array(ElementCount),"it")=0 or StrComp(eng_array(ElementCount),"that")=0 or StrComp(eng_array(ElementCount),"those")=0 or StrComp(eng_array(ElementCount),"this")=0 ) Then
						
						if actor2=-1 Then
								PronounTerm=PronounTerm+rs.Fields(0).value+"ক "
								PronounTermUtcharan=PronounTermUtcharan+rs.Fields(1).value+"k "
								
						elseif actor2=1  Then
								AUXPronounTerm=AUXPronounTerm+rs.Fields(0).value+"ক "
								AUXPronounTermUtcharan=AUXPronounTermUtcharan+rs.Fields(1).value+"k "
						end if
					  elseif eng_array(ElementCount)<>";" Then
						
						if actor2=-1 Then
								PronounTerm=PronounTerm+rs.Fields(0).value+"ৰ "
								PronounTermUtcharan=PronounTermUtcharan++rs.Fields(1).value+"r "
							   elseif actor2=1 Then
								AUXPronounTerm=AUXPronounTerm+rs.Fields(0).value+"ৰ "
								AUXPronounTermUtcharan=AUXPronounTermUtcharan+rs.Fields(1).value+"r "
					      end if
					  else     ''any action other than callsay
					    
					     if actor2=-1 Then
								PronounTerm=PronounTerm+rs.Fields(0).value+"ক "
								PronounTermUtcharan=PronounTermUtcharan+rs.Fields(1).value+"k "
								
						elseif actor2=1  Then
								AUXPronounTerm=AUXPronounTerm+rs.Fields(0).value+"ক "
								AUXPronounTermUtcharan=AUXPronounTermUtcharan+rs.Fields(1).value+"k "
						end if
					  end if
					elseif Foundwith=0 Then
						if actor2=-1 Then
								PronounTerm=PronounTerm+rs.Fields(0).value
								PronounTermUtcharan=PronounTermUtcharan+rs.Fields(1).value
								
						elseif actor2=1  Then
								AUXPronounTerm=AUXPronounTerm+rs.Fields(0).value
								AUXPronounTermUtcharan=AUXPronounTermUtcharan+rs.Fields(1).value
						end if
					else
						if actor2=-1 Then
								PronounTerm=PronounTerm+rs.Fields(0).value+"ৰ "
								PronounTermUtcharan=PronounTermUtcharan++rs.Fields(1).value+"r "
							   elseif actor2=1 Then
								AUXPronounTerm=AUXPronounTerm+rs.Fields(0).value+"ৰ "
								AUXPronounTermUtcharan=AUXPronounTermUtcharan+rs.Fields(1).value+"r "
					      end if
					end if
				elseif StrComp(elm,"her")=0 and SuperCounter=3 Then
					if actor2=-1 Then
								PronounTerm=PronounTerm+rs.Fields(0).value+"ৰ "
								PronounTermUtcharan=PronounTermUtcharan++rs.Fields(1).value+"r "
							   elseif actor2=1 Then
								AUXPronounTerm=AUXPronounTerm+rs.Fields(0).value+"ৰ "
								AUXPronounTermUtcharan=AUXPronounTermUtcharan+rs.Fields(1).value+"r "
					end if
				elseif elm="her" Then
				
					if actor2=-1 Then
								PronounTerm=PronounTerm+rs.Fields(0).value+"ক "
								PronounTermUtcharan=PronounTermUtcharan+rs.Fields(1).value+"k "
								
						elseif actor2=1  Then
								AUXPronounTerm=AUXPronounTerm+rs.Fields(0).value+"ক "
								AUXPronounTermUtcharan=AUXPronounTermUtcharan+rs.Fields(1).value+"k "
						end if
				else
					if actor2=-1 Then
								PronounTerm=PronounTerm+rs.Fields(0).value
								PronounTermUtcharan=PronounTermUtcharan+rs.Fields(1).value
								
						elseif actor2=1  Then
								AUXPronounTerm=AUXPronounTerm+rs.Fields(0).value
								AUXPronounTermUtcharan=AUXPronounTermUtcharan+rs.Fields(1).value
						end if
				end if
				   
				   
				if actor1=-1 Then
					 thirdperson=1
					 sglr=1
					 foundpronoun=1
					 actor1=1
				elseif actor1=1 Then
					 thirdpersonaux=1
					 actor2=1
				end if
				   
				    
				   '' ' Response.Write thirdperson
		   end if
		   rs.close
	end if
	'' ' Response.write tense
	
	
if StrComp(elm,"i")=0  or StrComp(elm,"myself")=0 or StrComp(elm,"my")=0 Then
	  WordDone=1
	  if elm="myself" Then
		elm="my"
	  end if
	  if elm="i" Then
		FoundI=1
	  end if
	  
	  if elm="my" and FoundI=0 Then
			FoundMy=1
			
			if actor1=-1 Then
			   thirdperson=1
			   firstperson=0
			   secondperson=0
				sglr=1
				foundpronoun=1
			   actor1=1
			elseif actor2=-1 Then
				actor2=1
				secondpersonaux=1
				sglr=1
				foundpronoun=1
			end if
	  end if
	  if actor1=-1 and elm<>"my" Then
	    '' ' Response.write "f"
		firstperson=1
	    sglr=1
	    foundpronoun=1
		actor1=1
		'' ' Response.Write "/actor1.."
		
		'' ' Response.Write actor1
		'' ' Response.Write "/"
	  elseif actor1=1 and elm<>"my" Then
	    firstpersonaux=1
		actor2=1
	  end if
	  rs.Open "Select translation,translationUtcharan from tab_pronoun where words='"+elm+"'", Conn 
	  if StrComp(elm,"i")=0 Then
	    WordDone=1
		if StrComp(eng_array(ElementCount),"want")=0 or StrComp(eng_array(ElementCount),"need")=0 or StrComp(eng_array(ElementCount),"wanted")=0 or StrComp(eng_array(ElementCount),"needed")=0 Then
		   if actor2=-1 Then
			PronounTerm=PronounTerm+"মোক " 
			PronounTermUtcharan=PronounTermUtcharan+"muk" 
			
	       elseif actor2=1 Then
		    AUXPronounTerm=AUXPronounTerm+"মোক " 
			AUXPronounTermUtcharan=AUXPronounTermUtcharan+"muk" 
		   end if
		elseif StrComp(eng_array(ElementCount),"had")=0 or StrComp(eng_array(ElementCount),"did")=0 or StrComp(eng_array(ElementCount),"have")=0 Then
		    if actor2=-1 and foundQH=0 Then
				PronounTerm=PronounTerm+"মোৰ "
				PronounTermUtcharan=PronounTermUtcharan+"mur"
			elseif actor2=1 and foundQH=0 Then
				AUXPronounTerm=AUXPronounTerm+"মোৰ "
				AUXPronounTermUtcharan=AUXPronounTermUtcharan+"mur"
			end if
		else
		   if actor2=-1 Then
			PronounTerm=PronounTerm+rs.Fields(0).value+" " 
			PronounTermUtcharan=PronounTermUtcharan+rs.Fields(1).value+" "
		   elseif actor2=1 Then
		    AUXPronounTerm=AUXPronounTerm+rs.Fields(0).value+" " 
			AUXPronounTermUtcharan=AUXPronounTermUtcharan+rs.Fields(1).value+" "
		   end if
		end if
	  
	  elseif FoundI=0 or FoundMy=1 Then
	    if actor2=-1 Then
			PronounTerm=PronounTerm+rs.Fields(0).value+" " 
			PronounTermUtcharan=PronounTermUtcharan+rs.Fields(1).value+" " 
		elseif actor2=1 Then
			AUXPronounTerm=AUXPronounTerm+rs.Fields(0).value+" " 
			AUXPronounTermUtcharan=AUXPronounTermUtcharan+rs.Fields(1).value+" "
		end if
	  end if
      rs.close
	end if
	'' ' Response.write actor1
	if StrComp(elm,"me")=0 and WordDone=0 Then
	  WordDone=1
	  FoundMebeforeyou=1
	  '' ' Response.Write "/WordDone/"
	  if actor1=-1 Then
	    thirdperson=1
	    sglr=1
	    foundpronoun=1
		actor1=1
	  elseif actor1=1 Then
	    thirdpersonaux=1
		actor2=1
	  end if
	  rs.Open "Select translation,translationUtcharan from tab_pronoun where words='"+elm+"'", Conn 
      if actor2=-1 Then
		PronounTerm=PronounTerm+rs.Fields(0).value+" " 
		PronounTermUtcharan=PronounTermUtcharan+rs.Fields(1).value+" "
	  elseif actor2=1 Then
		AUXPronounTerm=AUXPronounTerm+rs.Fields(0).value+" " 
		AUXPronounTermUtcharan=AUXPronounTermUtcharan+rs.Fields(1).value+" "
	  end if
      rs.close
	end if
	if (StrComp(elm,"we")= 0 or StrComp(elm,"our")= 0  or StrComp(elm,"ours")= 0 or StrComp(elm,"their")= 0 or StrComp(elm,"theirs")= 0 ) and WordDone=0  Then
	  WordDone=1
	  if actor1=-1 Then
	    firstperson=1
	    plrl=1
	    foundpronoun=1
		actor1=1
	  elseif actor1=1 Then
	    secondpersonaux=1
		actor2=1
	  end if
	  rs.Open "Select translation,translationUtcharan from tab_pronoun where words='"+elm+"'", Conn 
       if actor2=-1 Then
		PronounTerm=PronounTerm+rs.Fields(0).value+" " 
		PronounTermUtcharan=PronounTermUtcharan+rs.Fields(1).value+" " 
	   elseif actor2=1 Then
	    AUXPronounTerm=AUXPronounTerm+rs.Fields(0).value+" " 
		AUXPronounTermUtcharan=AUXPronounTermUtcharan+rs.Fields(1).value+" "
	   end if
      rs.close
	end if
	if StrComp(elm,"that")=0 and WordDone=0  Then
			WordDone=1
	
			rs.Open "Select translation,translationUtcharan from tab_additional where english='"+elm+"'", Conn 
			if rs.eof Then
			  'pass
			else
			   
				Assamese_String=Assamese_String+rs.Fields(0).value+" " 
				Assamese_StringUtcharan=Assamese_StringUtcharan+rs.Fields(1).value+" "
			   
			   
			end if
		    rs.close
	end if
	
	if ( StrComp(elm,"they") =0 or StrComp(elm,"them")=0 or StrComp(elm,"these")=0 or StrComp(elm,"those")=0 ) and WordDone=0  Then
	  WordDone=1
	  if actor1=-1 Then
	   thirdperson=1
	   plrl=1
	   foundpronoun=1
	  elseif actor2=0 Then
	   thirdpersonaux=1
	   actor2=1
	  end if
	  if (ConnectiveTermONE="for" and CountingPhrases=2 ) or (ConnectiveTermTWO="for" and CountingPhrases=3 ) and WordDone=0  Then
	    elm="themr"
	  end if
	       rs.Open "Select plural,pluralUtcharan from tab_pronoun where words='"+elm+"'", Conn 
		   if actor2=-1 Then
			PronounTerm=PronounTerm+rs.Fields(0).value+" " 
			PronounTermUtcharan=PronounTermUtcharan+rs.Fields(1).value+" "
		   elseif actor2=1 Then
			AUXPronounTerm=AUXPronounTerm+rs.Fields(0).value+" " 
			AUXPronounTermUtcharan=AUXPronounTermUtcharan+rs.Fields(1).value+" "
		   end if
           rs.close
	 
	end if
	
	if StrComp(elm,"will") = 0 or StrComp(elm,"would") =0 or StrComp(elm,"can") =0 or StrComp(elm,"could") =0 or StrComp(elm,"shall") =0 or StrComp(elm,"should") = 0 Then
		  if WordDone=0 Then
		  ftre=1
		  tense="ftre"
		  '' ' Response.write "RRTT"
		   WordDone=1
		   ModBe=1
		  end if
	end if
	if elm="be" and ModBe=1 and WordDone=0 Then
	  WordDone=1
	  Assamese_String=Assamese_String+"হয়তো "
	  Assamese_StringUtcharan=Assamese_StringUtcharan+"hoitu "
	end if
	 if   StrComp(elm,"had") = 0 and  WordDone=0 Then
			 WordDone=1
		     pst=1
		           
				  
	 end if
	  if   StrComp(elm,"have") =0  and WordDone=0 Then
			 WordDone=1
		     pst=1
		           
				  
	 end if
	  if   StrComp(elm,"has")=0  and WordDone=0 Then
			 WordDone=1
		     pst=1
		           
				  
	 end if
	


	if StrComp(elm,"welcome") = 0  Then
		  WordDone=1
		  rs.Open "Select translation,translationUtcharan from tab_additional where english='"+elm+"'", Conn 
                  Assamese_String=Assamese_String+rs.Fields(0).value+" " 
				  Assamese_StringUtcharan=Assamese_StringUtcharan+rs.Fields(1).value+" " 
                  rs.close
		 
	end if
	'section to find to

	     
	     
		 if locafterto=1 and foundnoun=1 Then 
		    
			'' ' Response.Write "/To..noun/"+NounTerm+"/"
		    foundto=0
			foundnoun=0
			if foundNounTermONE=1 Then
									'NounTermONE=NounTermONE+"লৈ"+ " "
									'NounTermONEUtcharan=NounTermONEUtcharan+"loi"+ " "
									foundNounTermONE=1
								elseif foundNounTermTWO=1 Then
									'NounTermTWO=NounTermTWO
									'NounTermTWOUtcharan=NounTermTWOUtcharan+"loi"+ " "
									foundNounTermTWO=1
								end if
		 end if 
		 if foundto=1 and locafterto=0 and thirdpersonaux=0 Then
		    if mainverb=""  Then
			  mainverb=elm
			  
		    end if			
			ftre=1
			foundto=0
			
		 end if
	    if StrComp(elm,"to")=0 Then
		  '' ' Response.Write "found"
		  foundto=1
		  tempto=1
	    end if
	   
	

	
	'section to search will/could/should.....
	
	
	    
	    if affirverb=1  and mainverb<>"" and auxverb="" Then
		 
		 'mainverb=elm
		 ftre=1
		 'affirverb=0
	
        elseif affirverb=1 and foundpronoun=1 Then
		ftre=1
		elseif (StrComp(elm,"will")=0  or StrComp(elm,"would")=0 or StrComp(elm,"shall")=0 or StrComp(elm,"should")=0 or StrComp(elm,"can")=0 or StrComp(elm,"could")=0 ) and WordDone=0  Then
		  
		  '' ' Response.Write "found"
		  affirverb=1
		  WordDone=1
		end if
		if elm="hi" or elm="hello" Then
		 Assamese_String=Assamese_String+"কেনে "
		 Assamese_StringUtcharan=Assamese_StringUtcharan+"kene "
		 WordDone=1
		end if
		if founda=0 and foundthis=0 Then
		    heavy=0
			light=0
		end if
		
		'Set of Nouns to identify 3rd person
		
		if  ( elm="god" or elm="father" or elm="brother" or elm="sister" or elm="aunt" or elm="uncle" or elm="boy" or elm="man" or elm="woman" or elm="son" or elm="driver" or elm="girl" ) and WordDone=0   Then
				person=1
		
        end if
		if  ( elm="gods" or elm="fathers" or elm="brothers" or elm="sisters" or elm="aunts" or elm="uncles" or elm="boys" or elm="men" or elm="women" or elm="sons" or elm="drivers" or elm="girls" ) and WordDone=0   Then
				person=1
		
        end if
		
		if person=1 Then
		    firstperson=0
			secondperson=0
			thirdperson=1
		end if
		   
		if elm="this" or elm="it" Then
		   foundthis=1
		   WordDone=1
		elseif elm="a" Then
		   founda=1
		   WordDone=1
		end if
		'' ' Response.Write "/ELMENT"
		MasterNoun=0
		
		if WordDone=0 Then
				  '' ' Response.Write "^^^"
				  '' ' Response.Write elm
				  '' ' Response.write eng_array(ElementCount-2)
			      rs.Open "Select translation,translationUtcharan from tab_additional where english='"+elm+"'", Conn 
                  if rs.EOF Then
				    'do nothing
				  else
					  if ElementCount>2 Then
					     
						if eng_array(ElementCount-2)="my" or eng_array(ElementCount-2)="your" or eng_array(ElementCount-2)="our" or eng_array(ElementCount-2)="their" or eng_array(ElementCount-2)="her" or eng_array(ElementCount-2)="his" Then
							if AUXPronounTerm<>"" Then
								AUXPronounTerm=AUXPronounTerm+rs.Fields(0).value+" " 
								AUXPronounTermUtcharan=AUXPronounTermUtcharan+rs.Fields(1).value+" "
							elseif PronounTerm<>"" Then
								PronounTerm=PronounTerm+rs.Fields(0).value+" " 
								PronounTermUtcharan=PronounTermUtcharan+rs.Fields(1).value+" "
							end if
						elseif eng_array(ElementCount-2)="in" or eng_array(ElementCount-3)="in" Then
								'' ' Response.write eng_array(ElementCount-2)
								Assamese_String=Assamese_String+rs.Fields(0).value+"ত " 
								Assamese_StringUtcharan=Assamese_StringUtcharan+rs.Fields(1).value+"t " 
						
						elseif elm="one" or elm="two" or  elm="two" or elm="three" or elm="four" or elm="five" or elm="six" or elm="seven" or elm="eight" or elm="nine" or elm="ten" Then
							'nothing
						else
							Assamese_String=Assamese_String+rs.Fields(0).value+" " 
							Assamese_StringUtcharan=Assamese_StringUtcharan+rs.Fields(1).value+" " 
						end if
						
					  elseif elm="one" or elm="two" or  elm="two" or elm="three" or elm="four" or elm="five" or elm="six" or elm="seven" or elm="eight" or elm="nine" or elm="ten" Then
							'nothing
					  else
						Assamese_String=Assamese_String+rs.Fields(0).value+" " 
						Assamese_StringUtcharan=Assamese_StringUtcharan+rs.Fields(1).value+" " 
						
					  end if
					  
					  WordDone=1
				  end if
				  rs.close
		 else '%%%%
				if ElementCount>2 Then
						if eng_array(ElementCount-2)="my" or eng_array(ElementCount-2)="your" or eng_array(ElementCount-2)="our" or eng_array(ElementCount-2)="their" or eng_array(ElementCount-2)="her" or eng_array(ElementCount-2)="his" Then
							if Curr_Term="NounTermONE" Then
								PronounTerm=PronounTerm+" "+NounTermONE+" " 
								PronounTermUtcharan=PronounTermUtcharan+" "+NounTermONEUtcharan+" "
								NounTermONE=""
								NounTermONEUtcharan=""
							elseif Curr_Term="NounTermTWO" Then
								PronounTerm=PronounTerm+" "+NounTermTWO+" " 
								PronounTermUtcharan=PronounTermUtcharan+" "+NounTermTWOUtcharan+" "
								NounTermTWO=""
								NounTermTWOUtcharan=""
							elseif Curr_Term="VerbTermONE" Then
								PronounTerm=PronounTerm+" "+VerbTermONE+" " 
								PronounTermUtcharan=PronounTermUtcharan+" "+VerbTermONEUtcharan+" "
								VerbTermONE=""
								VerbTermONEUtcharan=""
							elseif Curr_Term="VerbTermTWO" Then
								PronounTerm=PronounTerm+" "+VerbTermTWO+" " 
								PronounTermUtcharan=PronounTermUtcharan+" "+VerbTermTWOUtcharan+" "
								VerbTermTWO=""
								VerbTermTWOUtcharan=""
							end if
						end if
						
				
				end if
		 end if
		 
		 
		 
		if FoundMy=1 Then
			if auxverb="" and mainverb<>"" Then
			   'pass
			   thirdperson=1
			   firstperson=0
			   secondperson=0
			elseif auxverb<>"" Then
			   thirdpersonaux=1
			   firstpersonaux=0
			   secondpersonaux=0
			end if
		end if
		' if foundhow=1 and foundare=1 and mainverb="" Then
					' QHString="কেনে "
					' QHStringUtcharan="kene "
	' end if
	if foundhowwhat=1 and foundmoney=1 Then
		   	        QHString="কিমান মূল্য"
					QHStringUtcharan="kiman mulyo" 
	end if
	
		if foundthis=1 and heavy=1 and foundperson=0 Then
		          rs.Open "Select prefix_article,translation,prefix_articleUtcharan,translationUtcharan from tab_athis where article='this_heavy'", Conn 
                  if foundthisdone=0 and foundNounTermONE=1 and foundNounTermTWO=0 Then
					NounTermONE=rs.Fields(0).value+rs.Fields(1).value+" "+NounTermONE
					NounTermONEUtcharan=rs.Fields(2).value+rs.Fields(3).value+" "+NounTermONEUtcharan
					foundthisdone=1
				  elseif foundthisdone=0 and foundNounTermONE=1 and foundNounTermTWO=1 Then
					NounTermTWO=rs.Fields(0).value+rs.Fields(1).value+" "+NounTermTWO
					NounTermTWOUtcharan=rs.Fields(2).value+rs.Fields(3).value+" "+NounTermTWOUtcharan
					foundthisdone=1
				  end if
                  rs.close
				  foundthis=0
				  
		end if
		if founda=1 and heavy=1 and foundperson=0 Then
		          rs.Open "Select prefix_article,translation,prefix_articleUtcharan,translationUtcharan from tab_athis where article='a_heavy'", Conn 
                  
                
				  if foundadone=0 and foundNounTermONE=1 and foundNounTermTWO=0 Then
					NounTermONE=rs.Fields(0).value+rs.Fields(1).value+" "+NounTermONE
					NounTermONEUtcharan=rs.Fields(2).value+rs.Fields(3).value+" "+NounTermONEUtcharan
					foundadone=1
				  elseif foundadone=0 and foundNounTermONE=1 and foundNounTermTWO=1 Then
					NounTermTWO=rs.Fields(0).value+rs.Fields(1).value+" "+NounTermTWO
					NounTermTWOUtcharan=rs.Fields(2).value+rs.Fields(3).value+" "+NounTermTWOUtcharan
					foundadone=1
				  end if
				  founda=0
				  rs.close
		end if
		if foundthis=1 and light=1 and foundperson=0 Then
		          rs.Open "Select prefix_article,translation,prefix_articleUtcharan,translationUtcharan from tab_athis where article='this_light'", Conn 
                 if foundthisdone=0 and foundNounTermONE=1 and foundNounTermTWO=0 Then
					NounTermONE=rs.Fields(0).value+rs.Fields(1).value+" "+NounTermONE
					NounTermONEUtcharan=rs.Fields(2).value+rs.Fields(3).value+" "+NounTermONEUtcharan
					foundthisdone=1
				  elseif foundthisdone=0 and foundNounTermONE=1 and foundNounTermTWO=1 Then
					NounTermTWO=rs.Fields(0).value+rs.Fields(1).value+" "+NounTermTWO
					NounTermTWOUtcharan=rs.Fields(2).value+rs.Fields(3).value+" "+NounTermTWOUtcharan
					foundthisdone=1
				  end if
                  rs.close
				  foundthis=0
		end if
		if founda=1 and light=1 and foundperson=0 Then
		          rs.Open "Select prefix_article,translation,prefix_articleUtcharan,translationUtcharan from tab_athis where article='a_light'", Conn 
                  if foundadone=0 and foundNounTermONE=1 and foundNounTermTWO=0 Then
					NounTermONE=rs.Fields(0).value+rs.Fields(1).value+" "+NounTermONE
					NounTermONEUtcharan=rs.Fields(2).value+rs.Fields(3).value+" "+NounTermONEUtcharan
					foundadone=1
				  elseif foundadone=0 and foundNounTermONE=1 and foundNounTermTWO=1 Then
					NounTermTWO=rs.Fields(0).value+rs.Fields(1).value+" "+NounTermTWO
					NounTermTWOUtcharan=rs.Fields(2).value+rs.Fields(3).value+" "+NounTermTWOUtcharan
					foundadone=1
				  end if
                  rs.close
				  founda=0
		end if
		
		if Foundthat=1 Then
		    foundTHE=1
		end if
		'for person
		if foundthis=1 and  foundperson=1 and FoundFemale=0 Then
		          rs.Open "Select prefix_article,translation,prefix_articleUtcharan,translationUtcharan from tab_athis where article='this_person_male'", Conn 
                  if foundthisdone=0 and foundNounTermONE=1 and foundNounTermTWO=0 Then
					NounTermONE=rs.Fields(0).value+rs.Fields(1).value+" "+NounTermONE
					NounTermONEUtcharan=rs.Fields(2).value+rs.Fields(3).value+" "+NounTermONEUtcharan
					foundthisdone=1
				  elseif foundthisdone=0 and foundNounTermONE=1 and foundNounTermTWO=1 Then
					NounTermTWO=rs.Fields(0).value+rs.Fields(1).value+" "+NounTermTWO
					NounTermTWOUtcharan=rs.Fields(2).value+rs.Fields(3).value+" "+NounTermTWOUtcharan
					foundthisdone=1
				  end if
                  rs.close
				  foundthis=0
				  
		end if
		if founda=1 and foundperson=1 and FoundFemale=1  Then
		          rs.Open "Select prefix_article,translation,prefix_articleUtcharan,translationUtcharan from tab_athis where article='a_person_female'", Conn 
                  
                
				  if foundadone=0 and foundNounTermONE=1 and foundNounTermTWO=0 Then
					NounTermONE=rs.Fields(0).value+rs.Fields(1).value+" "+NounTermONE
					NounTermONEUtcharan=rs.Fields(2).value+rs.Fields(3).value+" "+NounTermONEUtcharan
					foundadone=1
				  elseif foundadone=0 and foundNounTermONE=1 and foundNounTermTWO=1 Then
					NounTermTWO=rs.Fields(0).value+rs.Fields(1).value+" "+NounTermTWO
					NounTermTWOUtcharan=rs.Fields(2).value+rs.Fields(3).value+" "+NounTermTWOUtcharan
					foundadone=1
				  end if
				  founda=0
				  rs.close
		end if
		if foundthis=1  and foundperson=1 and FoundFemale=0  Then
		          rs.Open "Select prefix_article,translation,prefix_articleUtcharan,translationUtcharan from tab_athis where article='this_person_male'", Conn 
                 if foundthisdone=0 and foundNounTermONE=1 and foundNounTermTWO=0 Then
					NounTermONE=rs.Fields(0).value+rs.Fields(1).value+" "+NounTermONE
					NounTermONEUtcharan=rs.Fields(2).value+rs.Fields(3).value+" "+NounTermONEUtcharan
					foundthisdone=1
				  elseif foundthisdone=0 and foundNounTermONE=1 and foundNounTermTWO=1 Then
					NounTermTWO=rs.Fields(0).value+rs.Fields(1).value+" "+NounTermTWO
					NounTermTWOUtcharan=rs.Fields(2).value+rs.Fields(3).value+" "+NounTermTWOUtcharan
					foundthisdone=1
				  end if
                  rs.close
				  foundthis=0
		end if
		if founda=1  and foundperson=1 and FoundFemale=0  Then
		          rs.Open "Select prefix_article,translation,prefix_articleUtcharan,translationUtcharan from tab_athis where article='a_person_female'", Conn 
                  if foundadone=0 and foundNounTermONE=1 and foundNounTermTWO=0 Then
					NounTermONE=rs.Fields(0).value+rs.Fields(1).value+" "+NounTermONE
					NounTermONEUtcharan=rs.Fields(2).value+rs.Fields(3).value+" "+NounTermONEUtcharan
					foundadone=1
				  elseif foundadone=0 and foundNounTermONE=1 and foundNounTermTWO=1 Then
					NounTermTWO=rs.Fields(0).value+rs.Fields(1).value+" "+NounTermTWO
					NounTermTWOUtcharan=rs.Fields(2).value+rs.Fields(3).value+" "+NounTermTWOUtcharan
					foundadone=1
				  end if
                  rs.close
				  founda=0
		end if
		
		
		'' FOR ---baabe  
		' ' Response.Write "len:AS:"
		' ' Response.Write len(Assamese_String)
		' ' Response.Write "/"
		
		 if ForDone=0 Then
		       
				if len(NounTermONE)>0 Then
				    if StrComp((Right(NounTermONE,1))," ")=0  Then
					 NounTermONE=Left(NounTermONE,len(NounTermONE)-1)
					 NounTermONEUtcharan=Left(NounTermONEUtcharan,len(NounTermONEUtcharan)-1)
					end if
				elseif len(NounTermTWO)>0 Then
					if  StrComp((Right(NounTermTWO,1))," ")=0  Then
						NounTermTWO=Left(NounTermTWO,len(NounTermTWO)-1)
						NounTermTWOUtcharan=Left(NounTermTWOUtcharan,len(NounTermTWOUtcharan)-1)
					end if
				elseif len(VerbTermONE)>0 Then
					if StrComp((Right(VerbTermONE,1))," ")=0  Then
						VerbTermONE=Left(VerbTermONE,len(VerbTermONE)-1)
						VerbTermONEUtcharan=Left(VerbTermONEUtcharan,len(VerbTermONEUtcharan)-1)
					end if
				elseif len(VerbTermTWO)>0 Then	
					if StrComp((Right(VerbTermTWO,1))," ")=0  Then
						VerbTermTWO=Left(VerbTermTWO,len(VerbTermTWO)-1)
						VerbTermTWOUtcharan=Left(VerbTermTWOUtcharan,len(VerbTermTWOUtcharan)-1)
					end if
				elseif len(Assamese_String)>0 Then
					
					if StrComp((Right(Assamese_String,1))," ")=0  Then
						Assamese_String=Left(Assamese_String,len(Assamese_String)-1)
						Assamese_StringUtcharan=Left(Assamese_StringUtcharan,len(Assamese_StringUtcharan)-1)
					end if
				end if
				
				
				 if ConnectiveTermONE="for" and ( ( CountingPhrases=2 and Phrases2<>";") or (CountingPhrases=3 and Phrases2=";") ) Then
					if Curr_Term="NounTermONE" Then
						NounTermONE=NounTermONE+"ৰ"
						NounTermONEUtcharan=NounTermONEUtcharan+"r"
						ForDone=1
					elseif Curr_Term="NounTermTWO" Then
						NounTermTWO=NounTermTWO+"ৰ"
						NounTermTWOUtcharan=NounTermTWOUtcharan+"r"
						ForDone=1
					elseif Curr_Term="VerbTermONE" Then
						VerbTermONE=VerbTermONE+"ৰ"
						VerbTermONEUtcharan=VerbTermONEUtcharan+"r"
						ForDone=1
					elseif Curr_Term="VerbTermTWO" Then
						VerbTermTWO=VerbTermTWO+"ৰ"
						VerbTermTWOUtcharan=VerbTermTWOUtcharan+"r"
						ForDone=1
					else
						Assamese_String=Assamese_String+"ৰ "
						Assamese_StringUtcharan=Assamese_StringUtcharan+"r "
						ForDone=1
					end if
				 elseif ConnectiveTermTWO="for" and CountingPhrases=3 Then
					if Curr_Term="NounTermONE" Then
						NounTermONE=NounTermONE+"ৰ"
						NounTermONEUtcharan=NounTermONEUtcharan+"r"
						ForDone=1
					elseif Curr_Term="NounTermTWO" Then
						NounTermTWO=NounTermTWO+"ৰ"
						NounTermTWOUtcharan=NounTermTWOUtcharan+"r"
						ForDone=1
					elseif Curr_Term="VerbTermONE" Then
						VerbTermONE=VerbTermONE+"ৰ"
						VerbTermONEUtcharan=VerbTermONEUtcharan+"r"
						ForDone=1
					elseif Curr_Term="VerbTermTWO" Then
						VerbTermTWO=VerbTermTWO+"ৰ"
						VerbTermTWOUtcharan=VerbTermTWOUtcharan+"r"
						ForDone=1
					else
						Assamese_String=Assamese_String+"ৰ "
						Assamese_StringUtcharan=Assamese_StringUtcharan+"r "
						ForDone=1
					end if
				end if
		end if   ''end of FOR--baabe
		
		
	Next               ''END OF A WORD
	    
		if mainverb="" and auxverb="" and Foundhaddefault=1 Then
			'mainverb="eat"
			pst=1
			prst=0
			ftre=0
			thirdperson=1
			secondperson=0
			thirdperson=0
		elseif mainverb="" and auxverb="" and Foundhavedefault=1 Then
			'mainverb="eat"
			pst=0
			prst=0
			ftre=1
			thirdperson=1
			secondperson=0
			thirdperson=0
		end if
		if FoundIyouMy=1 Then
			thirdpersonaux=1
			firstpersonaux=0
			secondpersonaux=0
		end if
	 
	 
	    'grammar     V  NOT    AUXV
		
		  ' ' ' Response.write posnot
		  ' ' ' Response.write mainverbPOSITION
		  ' ' ' Response.write auxverbPOSITION
		  ' ' ' Response.write "/"
		
	    if mainverb<>"" and auxverb<>"" and posnot>mainverbPOSITION and posnot<auxverbPOSITION and posnot>-1  Then
			foundnot=0
			foundauxnot=1
		elseif mainverb<>"" and auxverb="" and posnot<mainverbPOSITION and posnot>-1 Then
		    foundnot=1
			
		end if
		 
	    
	    if ConnectiveTermONE<>"" and mainverb="" and auxverb="" and (firstpersonaux=1 or secondpersonaux=1 or thirdpersonaux=1 ) Then
			firstperson=firstpersonaux
			thirdperson=thirdpersonaux
			secondperson=secondpersonaux
		end if
	 
		if firstperson=0 and secondperson=0  and thirdperson=0 and ( fdwas<>0 or fdis<>0 )  Then
			'nothing
			thirdperson=1
		elseif firstperson=0 and secondperson=0  and thirdperson=0 Then
			onlyRoot=99
		end if
		
		if ThanConjDone=0.5 Then                     ' comparing "Than"
					onlyRoot=99
					rs.Open "Select action,actionUtcharan from tab_verb where verbs='"+mainverb+"_firstperson'", Conn 
					 
						VerbTerm=VerbTerm+rs.Fields(0).value
						VerbTermUtcharan=VerbTermUtcharan+rs.Fields(1).value
					 if foundVerbTermONE=0 Then
											Curr_Term="VerbTermONE"
											VerbTermONE=VerbTerm+ "তকৈ"
											VerbTermONEUtcharan=VerbTermUtcharan+" otkoi"
											foundVerbTermONE=1
											ThanConjDone=1
											mainverb=""
										elseif foundVerbTermTWO=0  Then
											Curr_Term="VerbTermTWO"
											VerbTermTWO=VerbTerm+ "তকৈ"
											VerbTermTWOUtcharan=VerbTermUtcharan+" otkoi"
											foundVerbTermTWO=1
											ThanConjDone=1
					end if
					  rs.close
			  
		end if
		
		if onlyRoot=99 and foundnot=1 Then
		  ' thirdperson=1
		   '' ' Response.Write "/"
			'' ' Response.Write "Sun"
			'' ' Response.Write "/"
			'onlyRoot=0
		end if
		'' ' Response.Write onlyRoot
		'' ' Response.Write "/onlyroot"
		'' ' Response.Write tense
		'' ' Response.Write "/count"
		'' ' Response.Write count
		'' ' Response.Write "/"
		if firstpersonaux=0 and secondpersonaux=0  and thirdpersonaux=0 Then
		  firstpersonaux=99
		end if
		'' ' Response.Write "/AuxVoice"
		'' ' Response.Write firstpersonaux
		'' ' Response.Write "/count"
		'' ' Response.Write mainverb
		'' ' Response.Write "/mainverb"
		
		''''' FOR AUXILIARY VERB
		if auxverb="" and ThanConjDone=0.5 Then
			'' ' Response.Write "Success 40+"
		elseif ftreaux=1 and firstpersonaux=1 and auxverb<>"" and founddo=0 and foundauxnot=0 Then
	        '' ' Response.Write "/AUX!1991/"
			rs.Open "Select future,futureUtcharan from tab_verb where verbs='"+auxverb+"_firstperson'", Conn 
            AuxVerbTerm=rs.Fields(0).value+" " 
			AuxVerbTermUtcharan=rs.Fields(1).value+" " 
		    rs.close
			
			if foundAuxVerbTermONE=0 Then
									AuxVerbTermONE=AuxVerbTerm
									AuxVerbTermONEUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermONE=1
								elseif foundAuxVerbTermTWO=0  Then
									AuxVerbTermTWO=AuxVerbTerm
									AuxVerbTermTWOUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermTWO=1
								end if
		elseif firstpersonaux=99 and auxverb<>"" and TermONEDONE<>199 Then
			'' ' Response.Write "/AUX=199/"
			rs.Open "Select future,futureUtcharan from tab_verb where verbs='"+auxverb+"_thirdperson'", Conn 
            AuxVerbTerm=rs.Fields(0).value
			AuxVerbTermUtcharan=rs.Fields(1).value
		    rs.close
			
			if foundAuxVerbTermONE=0 Then
									AuxVerbTermONE=AuxVerbTerm
									AuxVerbTermONEUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermONE=1
								elseif foundAuxVerbTermTWO=0  Then
									AuxVerbTermTWO=AuxVerbTerm
									AuxVerbTermTWOUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermTWO=1
								end if
		elseif auxverb<>"" and TermONEDONE=199 Then
			'' ' Response.Write "/AUX!199/"
			rs.Open "Select action,actionUtcharan from tab_verb where verbs='"+auxverb+"_thirdperson'", Conn 
            AuxVerbTerm=rs.Fields(0).value 
			AuxVerbTermUtcharan=rs.Fields(1).value
		    rs.close
			
			if foundAuxVerbTermONE=0 Then
									AuxVerbTermONE=AuxVerbTerm
									AuxVerbTermONEUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermONE=1
								elseif foundAuxVerbTermTWO=0  Then
									AuxVerbTermTWO=AuxVerbTerm
									AuxVerbTermTWOUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermTWO=1
								end if
		elseif ftreaux=1 and secondpersonaux=1 and auxverb<>"" and founddo=0 and foundauxnot=0 Then
		   '' ' Response.Write "/AUX!1992/"
		   rs.Open "Select future,futureUtcharan from tab_verb where verbs='"+auxverb+"_secondperson'", Conn 
           AuxVerbTerm=rs.Fields(0).value+" " 
		   AuxVerbTermUtcharan=rs.Fields(1).value+" " 
        	rs.close
			
			if foundAuxVerbTermONE=0 Then
									AuxVerbTermONE=AuxVerbTerm
									AuxVerbTermONEUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermONE=1
								elseif foundAuxVerbTermTWO=0  Then
									AuxVerbTermTWO=AuxVerbTerm
									AuxVerbTermTWOUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermTWO=1
								end if
		elseif ftreaux=1 and thirdpersonaux=1 and auxverb<>"" and founddo=0 and foundauxnot=0 Then
		   '' ' Response.Write "/AUX!1993/"
		   rs.Open "Select future,futureUtcharan from tab_verb where verbs='"+auxverb+"_thirdperson'", Conn 
           AuxVerbTerm=rs.Fields(0).value+" " 
		   AuxVerbTermUtcharan=rs.Fields(1).value+" " 
        	'' ' Response.Write "/aux:"+AuxVerbTerm+"/"
			rs.close
			
			if foundAuxVerbTermONE=0 Then
									AuxVerbTermONE=AuxVerbTerm
									AuxVerbTermONEUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermONE=1
								elseif foundAuxVerbTermTWO=0  Then
									AuxVerbTermTWO=AuxVerbTerm
									AuxVerbTermTWOUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermTWO=1
								end if
		' present 
		elseif prstaux=1 and firstpersonaux=1  and auxverb<>"" and founddo=0 and foundauxnot=0 Then
	      '' ' Response.Write "/AUX!1994/"
		  rs.Open "Select present,presentUtcharan from tab_verb where verbs='"+auxverb+"_firstperson'", Conn 
          AuxVerbTerm=rs.Fields(0).value+" " 
		  AuxVerbTermUtcharan=rs.Fields(1).value+" " 
          rs.close
			if foundAuxVerbTermONE=0 Then
									AuxVerbTermONE=AuxVerbTerm
									AuxVerbTermONEUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermONE=1
								elseif foundAuxVerbTermTWO=0  Then
									AuxVerbTermTWO=AuxVerbTerm
									AuxVerbTermTWOUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermTWO=1
								end if
		elseif prstaux=1 and secondpersonaux=1 and auxverb<>"" and founddo=0 and foundauxnot=0 Then
		  '' ' Response.Write "/AUX!1995/"
		  rs.Open "Select present,presentUtcharan from tab_verb where verbs='"+auxverb+"_secondperson'", Conn 
          AuxVerbTerm=rs.Fields(0).value+" "
			AuxVerbTermUtcharan=rs.Fields(1).value+" "
        	rs.close
			if foundAuxVerbTermONE=0 Then
									AuxVerbTermONE=AuxVerbTerm
									AuxVerbTermONEUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermONE=1
								elseif foundAuxVerbTermTWO=0  Then
									AuxVerbTermTWO=AuxVerbTerm
									AuxVerbTermTWOUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermTWO=1
								end if
		elseif prstaux=1 and thirdpersonaux=1  and auxverb<>"" and founddo=0 and foundauxnot=0 Then
		   '' ' Response.Write "/AUX!1996/"
		   rs.Open "Select present,presentUtcharan from tab_verb where verbs='"+auxverb+"_thirdperson'", Conn 
           AuxVerbTerm=rs.Fields(0).value+" " 
		   AuxVerbTermUtcharan=rs.Fields(1).value+" " 
         	rs.close
			if foundAuxVerbTermONE=0 Then
									AuxVerbTermONE=AuxVerbTerm
									AuxVerbTermONEUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermONE=1
								elseif foundAuxVerbTermTWO=0  Then
									AuxVerbTermTWO=AuxVerbTerm
									AuxVerbTermTWOUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermTWO=1
								end if
		' past 
		elseif pstaux=1 and firstpersonaux=1 and auxverb<>"" and founddo=0 and foundauxnot=0 Then
	      '' ' Response.Write "/AUX!1997/"
		  rs.Open "Select past,pastUtcharan from tab_verb where verbs='"+auxverb+"_firstperson'", Conn 
          AuxVerbTerm=rs.Fields(0).value+" " 
		  AuxVerbTermUtcharan=rs.Fields(1).value+" "
        	rs.close
			if foundAuxVerbTermONE=0 Then
									AuxVerbTermONE=AuxVerbTerm
									AuxVerbTermONEUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermONE=1
								elseif foundAuxVerbTermTWO=0  Then
									AuxVerbTermTWO=AuxVerbTerm
									AuxVerbTermTWOUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermTWO=1
								end if
		elseif pstaux=1 and secondpersonaux=1 and auxverb<>"" and founddo=0 and foundauxnot=0 Then
		   '' ' Response.Write "/AUX!1998/"
		   rs.Open "Select past,pastUtcharan from tab_verb where verbs='"+auxverb+"_secondperson'", Conn 
           AuxVerbTerm=rs.Fields(0).value+" "
			AuxVerbTermUtcharan=rs.Fields(1).value+" "
        	rs.close
			if foundAuxVerbTermONE=0 Then
									AuxVerbTermONE=AuxVerbTerm
									AuxVerbTermONEUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermONE=1
								elseif foundAuxVerbTermTWO=0  Then
									AuxVerbTermTWO=AuxVerbTerm
									AuxVerbTermTWOUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermTWO=1
								end if
		elseif pstaux=1 and thirdpersonaux=1 and auxverb<>"" and founddo=0 and foundauxnot=0 Then
			'' ' Response.Write "/AUX!1999/"
			rs.Open "Select past,pastUtcharan from tab_verb where verbs='"+auxverb+"_thirdperson'", Conn 
			AuxVerbTerm=rs.Fields(0).value+" " 
			AuxVerbTermUtcharan=rs.Fields(1).value+" " 
			rs.close
			if foundAuxVerbTermONE=0 Then
									AuxVerbTermONE=AuxVerbTerm
									AuxVerbTermONEUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermONE=1
								elseif foundAuxVerbTermTWO=0  Then
									AuxVerbTermTWO=AuxVerbTerm
									AuxVerbTermTWOUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermTWO=1
								end if
		elseif founddo=1 and BeginQst=0 and auxverb<>"" Then
		    '' ' Response.Write "/200/"
   	          rs.Open "Select action,actionUtcharan from tab_verb where verbs='"+auxverb+"_thirdperson'", Conn 
              AuxVerbTerm=AuxVerbTerm+rs.Fields(0).value+" " 
			  AuxVerbTermUtcharan=AuxVerbTermUtcharan+rs.Fields(1).value+" " 
              rs.close
			 
			  if foundAuxVerbTermONE=0 Then
									AuxVerbTermONE=AuxVerbTerm
									AuxVerbTermONEUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermONE=1
								elseif foundAuxVerbTermTWO=0  Then
									AuxVerbTermTWO=AuxVerbTerm
									AuxVerbTermTWOUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermTWO=1
								end if
        elseif ftreaux=1 and firstpersonaux=1 and auxverb<>"" and founddo=1 and BeginQst=1 and foundauxnot=0 Then
	        '' ' Response.Write "/2001/"
			rs.Open "Select future,futureUtcharan from tab_verb where verbs='"+auxverb+"_firstperson'", Conn 
            AuxVerbTerm=rs.Fields(0).value+" নে " 
			AuxVerbTermUtcharan=rs.Fields(1).value+" ne " 
            
		    rs.close
			if foundAuxVerbTermONE=0 Then
									AuxVerbTermONE=AuxVerbTerm
									AuxVerbTermONEUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermONE=1
								elseif foundAuxVerbTermTWO=0  Then
									AuxVerbTermTWO=AuxVerbTerm
									AuxVerbTermTWOUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermTWO=1
								end if
		elseif ftreaux=1 and secondpersonaux=1 and auxverb<>"" and founddo=1 and BeginQst=1 and foundauxnot=0 Then
		   '' ' Response.Write "/2002/"
		   rs.Open "Select future,futureUtcharan from tab_verb where verbs='"+auxverb+"_secondperson'", Conn 
           AuxVerbTerm=rs.Fields(0).value+" নে " 
		   AuxVerbTermUtcharan=rs.Fields(1).value+" ne "
        	rs.close
			
			if foundAuxVerbTermONE=0 Then
									AuxVerbTermONE=AuxVerbTerm  
									AuxVerbTermONEUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermONE=1
								elseif foundAuxVerbTermTWO=0  Then
									AuxVerbTermTWO=AuxVerbTerm
									AuxVerbTermTWOUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermTWO=1
								end if
		elseif ftreaux=1 and thirdpersonaux=1 and auxverb<>"" and founddo=1 and BeginQst=1 and foundauxnot=0 Then
		   '' ' Response.Write "/2003/"
		   rs.Open "Select future,futureUtcharan from tab_verb where verbs='"+auxverb+"_thirdperson'", Conn 
           AuxVerbTerm=rs.Fields(0).value+" নে " 
		   AuxVerbTermUtcharan=rs.Fields(1).value+" ne "
        	'' ' Response.Write "/aux:"+AuxVerbTerm+"/"
			rs.close
			
			if foundAuxVerbTermONE=0 Then
									AuxVerbTermONE=AuxVerbTerm
									AuxVerbTermONEUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermONE=1
								elseif foundAuxVerbTermTWO=0  Then
									AuxVerbTermTWO=AuxVerbTerm
									AuxVerbTermTWOUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermTWO=1
								end if
		' present 
		elseif prstaux=1 and firstpersonaux=1  and auxverb<>"" and founddo=1 and BeginQst=1 and foundauxnot=0 Then
	      '' ' Response.Write "/2004/"
		  rs.Open "Select present,presentUtcharan from tab_verb where verbs='"+auxverb+"_firstperson'", Conn 
          AuxVerbTerm=rs.Fields(0).value+" নে " 
		  AuxVerbTermUtcharan=rs.Fields(1).value+" ne " 
          rs.close
			if foundAuxVerbTermONE=0 Then
									AuxVerbTermONE=AuxVerbTerm
									AuxVerbTermONEUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermONE=1
								elseif foundAuxVerbTermTWO=0  Then
									AuxVerbTermTWO=AuxVerbTerm
									AuxVerbTermTWOUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermTWO=1
								end if
		elseif prstaux=1 and secondpersonaux=1 and auxverb<>"" and founddo=1 and BeginQst=1 and foundauxnot=0 Then
		  '' ' Response.Write "/2005/"
		  rs.Open "Select present,presentUtcharan from tab_verb where verbs='"+auxverb+"_secondperson'", Conn 
          AuxVerbTerm=rs.Fields(0).value+" নে " 
		  AuxVerbTermUtcharan=rs.Fields(1).value+" ne " 
        	rs.close
			if foundAuxVerbTermONE=0 Then
									AuxVerbTermONE=AuxVerbTerm
									AuxVerbTermONEUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermONE=1
								elseif foundAuxVerbTermTWO=0  Then
									AuxVerbTermTWO=AuxVerbTerm
									AuxVerbTermTWOUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermTWO=1
								end if
		elseif prstaux=1 and thirdpersonaux=1  and auxverb<>"" and founddo=1 and BeginQst=1 and foundauxnot=0 Then
		   '' ' Response.Write "/2006/"
		   rs.Open "Select present,presentUtcharan from tab_verb where verbs='"+auxverb+"_thirdperson'", Conn 
           AuxVerbTerm=rs.Fields(0).value+" নে " 
		   AuxVerbTermUtcharan=rs.Fields(1).value+" ne " 
         	rs.close
			if foundAuxVerbTermONE=0 Then
									AuxVerbTermONE=AuxVerbTerm
									AuxVerbTermONEUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermONE=1
								elseif foundAuxVerbTermTWO=0  Then
									AuxVerbTermTWO=AuxVerbTerm
									AuxVerbTermTWOUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermTWO=1
								end if
		' past 
		elseif pstaux=1 and firstpersonaux=1 and auxverb<>"" and founddo=1 and BeginQst=1 and foundauxnot=0 Then
	      '' ' Response.Write "/2007/"
		  rs.Open "Select past,pastUtcharan from tab_verb where verbs='"+auxverb+"_firstperson'", Conn 
          AuxVerbTerm=rs.Fields(0).value+" নে " 
		  AuxVerbTermUtcharan=rs.Fields(1).value+" ne "
        	rs.close
			if foundAuxVerbTermONE=0 Then
									AuxVerbTermONE=AuxVerbTerm
									AuxVerbTermONEUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermONE=1
								elseif foundAuxVerbTermTWO=0  Then
									AuxVerbTermTWO=AuxVerbTerm
									AuxVerbTermTWOUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermTWO=1
								end if
		elseif pstaux=1 and secondpersonaux=1 and auxverb<>"" and founddo=1 and BeginQst=1 and foundauxnot=0 Then
		   '' ' Response.Write "/2008/"
		   rs.Open "Select past,pastUtcharan from tab_verb where verbs='"+auxverb+"_secondperson'", Conn 
           AuxVerbTerm=rs.Fields(0).value+" নে  " 
		   AuxVerbTermUtcharan=rs.Fields(1).value+" ne  " 
        	rs.close
			if foundAuxVerbTermONE=0 Then
									AuxVerbTermONE=AuxVerbTerm
									AuxVerbTermONEUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermONE=1
								elseif foundAuxVerbTermTWO=0  Then
									AuxVerbTermTWO=AuxVerbTerm
									AuxVerbTermTWOUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermTWO=1
								end if
		elseif pstaux=1 and thirdpersonaux=1 and auxverb<>"" and founddo=1 and BeginQst=1 and foundauxnot=0 Then
			'' ' Response.Write "/2009/"
			rs.Open "Select past,pastUtcharan from tab_verb where verbs='"+auxverb+"_thirdperson'", Conn 
			AuxVerbTerm=rs.Fields(0).value+" নে " 
			AuxVerbTermUtcharan=rs.Fields(1).value+" ne " 
			rs.close
			if foundAuxVerbTermONE=0 Then
									AuxVerbTermONE=AuxVerbTerm
									AuxVerbTermONEUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermONE=1
								elseif foundAuxVerbTermTWO=0  Then
									AuxVerbTermTWO=AuxVerbTerm
									AuxVerbTermTWOUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermTWO=1
								end if
		else
			'' ' Response.Write "Success 40+"
		end if
		'' ' Response.Write "Success 41+"
		
		''''' FOR NEG AUX VERB
		if ftreaux=1 and firstpersonaux=1 and auxverb<>"" and founddo=0 and foundauxnot=1 Then
	        rs.Open "Select future,futureUtcharan from tab_verb where verbs='neg"+auxverb+"_firstperson'", Conn 
            AuxVerbTerm=rs.Fields(0).value+" " 
			AuxVerbTermUtcharan=rs.Fields(1).value+" " 
		    rs.close
			if foundAuxVerbTermONE=0 Then
									AuxVerbTermONE=AuxVerbTerm
									AuxVerbTermONEUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermONE=1
								elseif foundAuxVerbTermTWO=0  Then
									AuxVerbTermTWO=AuxVerbTerm
									AuxVerbTermTWOUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermTWO=1
								end if
		elseif firstpersonaux=99 and auxverb<>"" and TermONEDONE<>199 and foundauxnot=1 Then
			' ' Response.Write "/AUX=199/"
			rs.Open "Select future,futureUtcharan from tab_verb where verbs='neg"+auxverb+"_thirdperson'", Conn 
            AuxVerbTerm=rs.Fields(0).value
			AuxVerbTermUtcharan=rs.Fields(1).value
		    rs.close
			
			if foundAuxVerbTermONE=0 Then
									AuxVerbTermONE=AuxVerbTerm
									AuxVerbTermONEUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermONE=1
								elseif foundAuxVerbTermTWO=0  Then
									AuxVerbTermTWO=AuxVerbTerm
									AuxVerbTermTWOUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermTWO=1
								end if
		elseif auxverb<>"" and TermONEDONE=199 and foundauxnot=1 Then
			' ' Response.Write "/AUX!199/"
			rs.Open "Select action,actionUtcharan from tab_verb where verbs='neg"+auxverb+"_thirdperson'", Conn 
            AuxVerbTerm=rs.Fields(0).value 
			AuxVerbTermUtcharan=rs.Fields(1).value
		    rs.close
			
			if foundAuxVerbTermONE=0 Then
									AuxVerbTermONE=AuxVerbTerm
									AuxVerbTermONEUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermONE=1
								elseif foundAuxVerbTermTWO=0  Then
									AuxVerbTermTWO=AuxVerbTerm
									AuxVerbTermTWOUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermTWO=1
								end if
		elseif ftreaux=1 and secondpersonaux=1 and auxverb<>"" and founddo=0 and foundauxnot=1 Then
		   rs.Open "Select future,futureUtcharan from tab_verb where verbs='neg"+auxverb+"_secondperson'", Conn 
           AuxVerbTerm=rs.Fields(0).value+" " 
		   AuxVerbTermUtcharan=rs.Fields(1).value+" " 
        	rs.close
			if foundAuxVerbTermONE=0 Then
									AuxVerbTermONE=AuxVerbTerm
									AuxVerbTermONEUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermONE=1
								elseif foundAuxVerbTermTWO=0  Then
									AuxVerbTermTWO=AuxVerbTerm
									AuxVerbTermTWOUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermTWO=1
								end if
		elseif ftreaux=1 and secondpersonaux=1 and auxverb<>"" and founddo=0 and foundauxnot=1 Then
		   rs.Open "Select future,futureUtcharan from tab_verb where verbs='neg"+auxverb+"_secondperson'", Conn 
           AuxVerbTerm=rs.Fields(0).value+" " 
		   AuxVerbTermUtcharan=rs.Fields(1).value+" " 
        	rs.close
			if foundAuxVerbTermONE=0 Then
									AuxVerbTermONE=AuxVerbTerm
									AuxVerbTermONEUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermONE=1
								elseif foundAuxVerbTermTWO=0  Then
									AuxVerbTermTWO=AuxVerbTerm
									AuxVerbTermTWOUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermTWO=1
								end if
		elseif ftreaux=1 and thirdpersonaux=1 and auxverb<>"" and founddo=0 and foundauxnot=1 Then
		   rs.Open "Select future,futureUtcharan from tab_verb where verbs='neg"+auxverb+"_thirdperson'", Conn 
           AuxVerbTerm=rs.Fields(0).value+" " 
		   AuxVerbTermUtcharan=rs.Fields(1).value+" " 
        	'' ' Response.Write "/aux:"+AuxVerbTerm+"/"
			rs.close
			if foundAuxVerbTermONE=0 Then
									AuxVerbTermONE=AuxVerbTerm
									AuxVerbTermONEUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermONE=1
								elseif foundAuxVerbTermTWO=0  Then
									AuxVerbTermTWO=AuxVerbTerm
									AuxVerbTermTWOUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermTWO=1
								end if
		' present 
		elseif prstaux=1 and firstpersonaux=1  and auxverb<>"" and founddo=0 and foundauxnot=1 Then
	      rs.Open "Select present,presentUtcharan from tab_verb where verbs='neg"+auxverb+"_firstperson'", Conn 
          AuxVerbTerm=rs.Fields(0).value+" " 
		  AuxVerbTermUtcharan=rs.Fields(1).value+" " 
          rs.close
			if foundAuxVerbTermONE=0 Then
									AuxVerbTermONE=AuxVerbTerm
									AuxVerbTermONEUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermONE=1
								elseif foundAuxVerbTermTWO=0  Then
									AuxVerbTermTWO=AuxVerbTerm
									AuxVerbTermTWOUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermTWO=1
								end if
		elseif prstaux=1 and secondpersonaux=1 and auxverb<>"" and founddo=0 and foundauxnot=1 Then
		  rs.Open "Select present,presentUtcharan from tab_verb where verbs='neg"+auxverb+"_secondperson'", Conn 
          AuxVerbTerm=rs.Fields(0).value+" "
			AuxVerbTermUtcharan=rs.Fields(1).value+" "
        	rs.close
			if foundAuxVerbTermONE=0 Then
									AuxVerbTermONE=AuxVerbTerm
									AuxVerbTermONEUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermONE=1
								elseif foundAuxVerbTermTWO=0  Then
									AuxVerbTermTWO=AuxVerbTerm
									AuxVerbTermTWOUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermTWO=1
								end if
		elseif prstaux=1 and thirdpersonaux=1  and auxverb<>"" and founddo=0 and foundauxnot=1 Then
		   rs.Open "Select present,presentUtcharan from tab_verb where verbs='neg"+auxverb+"_thirdperson'", Conn 
           AuxVerbTerm=rs.Fields(0).value+" " 
		   AuxVerbTermUtcharan=rs.Fields(1).value+" " 
         	rs.close
			if foundAuxVerbTermONE=0 Then
									AuxVerbTermONE=AuxVerbTerm
									AuxVerbTermONEUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermONE=1
								elseif foundAuxVerbTermTWO=0  Then
									AuxVerbTermTWO=AuxVerbTerm
									AuxVerbTermTWOUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermTWO=1
								end if
		' past 
		elseif pstaux=1 and firstpersonaux=1 and auxverb<>"" and founddo=0 and foundauxnot=1 Then
	      rs.Open "Select past,pastUtcharan from tab_verb where verbs='neg"+auxverb+"_firstperson'", Conn 
          AuxVerbTerm=rs.Fields(0).value+" " 
		  AuxVerbTermUtcharan=rs.Fields(1).value+" "
        	rs.close
			if foundAuxVerbTermONE=0 Then
									AuxVerbTermONE=AuxVerbTerm
									AuxVerbTermONEUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermONE=1
								elseif foundAuxVerbTermTWO=0  Then
									AuxVerbTermTWO=AuxVerbTerm
									AuxVerbTermTWOUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermTWO=1
								end if
		elseif pstaux=1 and secondpersonaux=1 and auxverb<>"" and founddo=0 and foundauxnot=1 Then
		   rs.Open "Select past,pastUtcharan from tab_verb where verbs='neg"+auxverb+"_secondperson'", Conn 
           AuxVerbTerm=rs.Fields(0).value+" "
			AuxVerbTermUtcharan=rs.Fields(1).value+" "
        	rs.close
			if foundAuxVerbTermONE=0 Then
									AuxVerbTermONE=AuxVerbTerm
									AuxVerbTermONEUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermONE=1
								elseif foundAuxVerbTermTWO=0  Then
									AuxVerbTermTWO=AuxVerbTerm
									AuxVerbTermTWOUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermTWO=1
								end if
		elseif pstaux=1 and thirdpersonaux=1 and auxverb<>"" and founddo=0 and foundauxnot=1 Then
		rs.Open "Select past,pastUtcharan from tab_verb where verbs='neg"+auxverb+"_thirdperson'", Conn 
        AuxVerbTerm=rs.Fields(0).value+" " 
		AuxVerbTermUtcharan=rs.Fields(1).value+" " 
        rs.close
			if foundAuxVerbTermONE=0 Then
									AuxVerbTermONE=AuxVerbTerm
									AuxVerbTermONEUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermONE=1
								elseif foundAuxVerbTermTWO=0  Then
									AuxVerbTermTWO=AuxVerbTerm
									AuxVerbTermTWOUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermTWO=1
								end if
		elseif founddo=1 and BeginQst=0 and foundauxnot=1 Then
   	          rs.Open "Select action,actionUtcharan from tab_verb where verbs='neg"+auxverb+"_thirdperson'", Conn 
              AuxVerbTerm=AuxVerbTerm+rs.Fields(0).value+" " 
			  AuxVerbTermUtcharan=AuxVerbTermUtcharan+rs.Fields(1).value+" " 
              rs.close
			  if foundAuxVerbTermONE=0 Then
									AuxVerbTermONE=AuxVerbTerm
									AuxVerbTermONEUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermONE=1
								elseif foundAuxVerbTermTWO=0  Then
									AuxVerbTermTWO=AuxVerbTerm
									AuxVerbTermTWOUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermTWO=1
								end if
        elseif ftreaux=1 and firstpersonaux=1 and auxverb<>"" and founddo=1 and BeginQst=1 and foundauxnot=1 Then
	        rs.Open "Select future,futureUtcharan from tab_verb where verbs='neg"+auxverb+"_firstperson'", Conn 
            AuxVerbTerm=rs.Fields(0).value+" নে " 
			AuxVerbTermUtcharan=rs.Fields(1).value+" ne " 
        
		    rs.close
			if foundAuxVerbTermONE=0 Then
									AuxVerbTermONE=AuxVerbTerm
									AuxVerbTermONEUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermONE=1
								elseif foundAuxVerbTermTWO=0  Then
									AuxVerbTermTWO=AuxVerbTerm
									AuxVerbTermTWOUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermTWO=1
								end if
		elseif ftreaux=1 and secondpersonaux=1 and auxverb<>"" and founddo=1 and BeginQst=1 and foundauxnot=1 Then
		   rs.Open "Select future,futureUtcharan from tab_verb where verbs='neg"+auxverb+"_secondperson'", Conn 
           AuxVerbTerm=rs.Fields(0).value+" নে " 
		   AuxVerbTermUtcharan=rs.Fields(1).value+" ne "
        	rs.close
			if foundAuxVerbTermONE=0 Then
									AuxVerbTermONE=AuxVerbTerm
									AuxVerbTermONEUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermONE=1
								elseif foundAuxVerbTermTWO=0  Then
									AuxVerbTermTWO=AuxVerbTerm
									AuxVerbTermTWOUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermTWO=1
								end if
		elseif ftreaux=1 and thirdpersonaux=1 and auxverb<>"" and founddo=1 and BeginQst=1 and foundauxnot=1 Then
		   rs.Open "Select future,futureUtcharan from tab_verb where verbs='neg"+auxverb+"_thirdperson'", Conn 
           AuxVerbTerm=rs.Fields(0).value+" নে " 
		   AuxVerbTermUtcharan=rs.Fields(1).value+" ne "
        	'' ' Response.Write "/aux:"+AuxVerbTerm+"/"
			rs.close
			if foundAuxVerbTermONE=0 Then
									AuxVerbTermONE=AuxVerbTerm
									AuxVerbTermONEUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermONE=1
								elseif foundAuxVerbTermTWO=0  Then
									AuxVerbTermTWO=AuxVerbTerm
									AuxVerbTermTWOUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermTWO=1
								end if
		' present 
		elseif prstaux=1 and firstpersonaux=1  and auxverb<>"" and founddo=1 and BeginQst=1 and foundauxnot=1 Then
	      rs.Open "Select present,presentUtcharan from tab_verb where verbs='neg"+auxverb+"_firstperson'", Conn 
          AuxVerbTerm=rs.Fields(0).value+" নে " 
		  AuxVerbTermUtcharan=rs.Fields(1).value+" ne " 
          rs.close
			if foundAuxVerbTermONE=0 Then
									AuxVerbTermONE=AuxVerbTerm
									AuxVerbTermONEUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermONE=1
								elseif foundAuxVerbTermTWO=0  Then
									AuxVerbTermTWO=AuxVerbTerm
									AuxVerbTermTWOUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermTWO=1
								end if
		elseif prstaux=1 and secondpersonaux=1 and auxverb<>"" and founddo=1 and BeginQst=1 and foundauxnot=1 Then
		  rs.Open "Select present,presentUtcharan from tab_verb where verbs='neg"+auxverb+"_secondperson'", Conn 
          AuxVerbTerm=rs.Fields(0).value+" নে " 
		  AuxVerbTermUtcharan=rs.Fields(1).value+" ne " 
        	rs.close
			if foundAuxVerbTermONE=0 Then
									AuxVerbTermONE=AuxVerbTerm
									AuxVerbTermONEUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermONE=1
								elseif foundAuxVerbTermTWO=0  Then
									AuxVerbTermTWO=AuxVerbTerm
									AuxVerbTermTWOUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermTWO=1
								end if
		elseif prstaux=1 and thirdpersonaux=1  and auxverb<>"" and founddo=1 and BeginQst=1 and foundauxnot=1 Then
		   rs.Open "Select present,presentUtcharan from tab_verb where verbs='neg"+auxverb+"_thirdperson'", Conn 
           AuxVerbTerm=rs.Fields(0).value+" নে " 
		   AuxVerbTermUtcharan=rs.Fields(1).value+" ne " 
         	rs.close
			if foundAuxVerbTermONE=0 Then
									AuxVerbTermONE=AuxVerbTerm
									AuxVerbTermONEUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermONE=1
								elseif foundAuxVerbTermTWO=0  Then
									AuxVerbTermTWO=AuxVerbTerm
									AuxVerbTermTWOUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermTWO=1
								end if
		' past 
		elseif pstaux=1 and firstpersonaux=1 and auxverb<>"" and founddo=1 and BeginQst=1 and foundauxnot=1 Then
	      rs.Open "Select past,pastUtcharan from tab_verb where verbs='neg"+auxverb+"_firstperson'", Conn 
          AuxVerbTerm=rs.Fields(0).value+" নে " 
		  AuxVerbTermUtcharan=rs.Fields(1).value+" ne "
        	rs.close
			if foundAuxVerbTermONE=0 Then
									AuxVerbTermONE=AuxVerbTerm
									AuxVerbTermONEUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermONE=1
								elseif foundAuxVerbTermTWO=0  Then
									AuxVerbTermTWO=AuxVerbTerm
									AuxVerbTermTWOUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermTWO=1
								end if
		elseif pstaux=1 and secondpersonaux=1 and auxverb<>"" and founddo=1 and BeginQst=1 and foundauxnot=1 Then
		   rs.Open "Select past,pastUtcharan from tab_verb where verbs='neg"+auxverb+"_secondperson'", Conn 
           AuxVerbTerm=rs.Fields(0).value+" নে  " 
		   AuxVerbTermUtcharan=rs.Fields(1).value+" ne  " 
        	rs.close
			if foundAuxVerbTermONE=0 Then
									AuxVerbTermONE=AuxVerbTerm
									AuxVerbTermONEUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermONE=1
								elseif foundAuxVerbTermTWO=0  Then
									AuxVerbTermTWO=AuxVerbTerm
									AuxVerbTermTWOUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermTWO=1
								end if
		elseif pstaux=1 and thirdpersonaux=1 and auxverb<>"" and founddo=1 and BeginQst=1 and foundauxnot=1 Then
		rs.Open "Select past,pastUtcharan from tab_verb where verbs='neg"+auxverb+"_thirdperson'", Conn 
        AuxVerbTerm=rs.Fields(0).value+" নে " 
		AuxVerbTermUtcharan=rs.Fields(1).value+" ne " 
        rs.close
			if foundAuxVerbTermONE=0 Then
									AuxVerbTermONE=AuxVerbTerm
									AuxVerbTermONEUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermONE=1
								elseif foundAuxVerbTermTWO=0  Then
									AuxVerbTermTWO=AuxVerbTerm
									AuxVerbTermTWOUtcharan=AuxVerbTermUtcharan
									foundAuxVerbTermTWO=1
								end if
		end if
		
		'''' FOR MAIN VERB
		'' ' Response.Write thirdperson
		'' ' Response.Write firstperson
                            '' ' Response.Write foundnot
							
		if founddo=1 Then
			founddo=0
		end if
	    if ftre=1 and firstperson=1 and mainverb<>"" and foundnot=0 and founddo=0 or onlyRoot=1 and  foundnot=0 Then
	        rs.Open "Select action,future,actionUtcharan,futureUtcharan from tab_verb where verbs='"+mainverb+"_firstperson'", Conn 
             if QHString="" and founddo=0 Then
			    VerbTerm=VerbTerm+rs.Fields(1).value+" " 
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+" "
              elseif affirverb=1 and QHString<>""  and founddo=0 Then
			    VerbTerm=VerbTerm+rs.Fields(1).value+"নে "
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+"ne "
		     elseif  founddo=0 Then
		        VerbTerm=VerbTerm+rs.Fields(1).value+" " 
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+" "
                                   '' ' Response.Write VerbTerm
		   
                                end if
		      rs.close
			  if foundVerbTermONE=0 Then
									Curr_Term="VerbTermONE"
									VerbTermONE=VerbTerm
									VerbTermONEUtcharan=VerbTermUtcharan
									foundVerbTermONE=1
								elseif foundVerbTermTWO=0  Then
									Curr_Term="VerbTermTWO"
									VerbTermTWO=VerbTerm
									VerbTermTWOUtcharan=VerbTermUtcharan
									foundVerbTermTWO=1
								end if
               
		elseif onlyRoot=99 and mainverb<>"" and count > 2 and foundnot=0 Then
			 '' ' Response.Write "/O root / count less ++2"
			 rs.Open "Select future,futureUtcharan from tab_verb where verbs='"+mainverb+"_thirdperson'", Conn 
             if QHString="" and founddo=0 Then
			    VerbTerm=VerbTerm+rs.Fields(0).value
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(1).value
              elseif affirverb=1 and QHString<>""  and founddo=0 Then
			    VerbTerm=VerbTerm+rs.Fields(0).value+"নে "
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(1).value+"ne "
		     elseif  founddo=0 Then
		        VerbTerm=VerbTerm+rs.Fields(0).value
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(1).value
                                   '' ' Response.Write VerbTerm
		   
              end if
		      rs.close
			  if foundVerbTermONE=0 Then
									Curr_Term="VerbTermONE"
									VerbTermONE=VerbTerm
									VerbTermONEUtcharan=VerbTermUtcharan
									foundVerbTermONE=1
								elseif foundVerbTermTWO=0  Then
									Curr_Term="VerbTermTWO"
									VerbTermTWO=VerbTerm
									VerbTermTWOUtcharan=VerbTermUtcharan
									foundVerbTermTWO=1
								end if
		elseif onlyRoot=99 and mainverb<>"" and (count < 2 or count=2) and foundnot=0 Then
			' ' ' Response.Write "/O root / count less -2"
			 rs.Open "Select action,actionUtcharan from tab_verb where verbs='"+mainverb+"_firstperson'", Conn 
             if QHString="" and founddo=0 Then
			    VerbTerm=VerbTerm+rs.Fields(0).value
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(1).value
              elseif affirverb=1 and QHString<>""  and founddo=0 Then
			    VerbTerm=VerbTerm+rs.Fields(0).value+"নে "
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(1).value+"ne "
		     elseif  founddo=0 Then
		        VerbTerm=VerbTerm+rs.Fields(0).value
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(1).value
                                   '' ' Response.Write VerbTerm
		   
              end if
		      rs.close
			  if foundVerbTermONE=0 Then
									Curr_Term="VerbTermONE"
									VerbTermONE=VerbTerm
									VerbTermONEUtcharan=VerbTermUtcharan
									foundVerbTermONE=1
								elseif foundVerbTermTWO=0  Then
									Curr_Term="VerbTermTWO"
									VerbTermTWO=VerbTerm
									VerbTermTWOUtcharan=VerbTermUtcharan
									foundVerbTermTWO=1
								end if
		elseif ftre=1 and secondperson=1 and mainverb<>"" and onlyRoot=0 and founddo=0 and foundnot=0 Then
		    '' ' Response.Write "/Debug2p/"
			rs.Open "Select action,future,actionUtcharan,futureUtcharan from tab_verb where verbs='"+mainverb+"_secondperson'", Conn 
            '' ' Response.Write rs.Fields(1).value
			if QHString="" and founddo=0 Then
		       VerbTerm=VerbTerm+rs.Fields(1).value
			   VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value
             elseif affirverb=1 and QHString<>"" and founddo=0 Then
			    '' ' Response.Write "/Debug2part1/"
				VerbTerm=VerbTerm+rs.Fields(1).value+"নে " 
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+"ne " 
				'' ' Response.Write VerbTerm
		      elseif  founddo=0 Then
		        VerbTerm=VerbTerm+rs.Fields(1).value 
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value 
           end if
		   rs.close
			if foundVerbTermONE=0 Then
									Curr_Term="VerbTermONE"
									VerbTermONE=VerbTerm
									VerbTermONEUtcharan=VerbTermUtcharan
									foundVerbTermONE=1
								elseif foundVerbTermTWO=0  Then
									Curr_Term="VerbTermTWO"
									VerbTermTWO=VerbTerm
									VerbTermTWOUtcharan=VerbTermUtcharan
									foundVerbTermTWO=1
								end if
		elseif ftre=1 and thirdperson=1 and mainverb<>"" and onlyRoot=0 and founddo=0 and foundnot=0 Then
		    rs.Open "Select action,future,actionUtcharan,futureUtcharan from tab_verb where verbs='"+mainverb+"_thirdperson'", Conn 
            '' ' Response.Write "/Debug3p/"
			if QHString="" and founddo=0 Then
		       VerbTerm=VerbTerm+rs.Fields(1).value
			   VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value
            elseif affirverb=1 and QHString<>"" and founddo=0 Then
			   VerbTerm=VerbTerm+rs.Fields(1).value+"নে " 
			   VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+"ne " 
		   elseif  founddo=0 Then
		      VerbTerm=VerbTerm+rs.Fields(1).value
		       VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value
                                end if
		   '' ' Response.Write "Debug"
		   rs.close
			if foundVerbTermONE=0 Then
									Curr_Term="VerbTermONE"
									VerbTermONE=VerbTerm
									VerbTermONEUtcharan=VerbTermUtcharan
									foundVerbTermONE=1
								elseif foundVerbTermTWO=0  Then
									Curr_Term="VerbTermTWO"
									VerbTermTWO=VerbTerm
									VerbTermTWOUtcharan=VerbTermUtcharan
									foundVerbTermTWO=1
								end if
		' present 
		elseif prst=1 and firstperson=1  and mainverb<>"" and onlyRoot=0 and founddo=0 and foundnot=0 Then
			rs.Open "Select action,present,actionUtcharan,presentUtcharan from tab_verb where verbs='"+mainverb+"_firstperson'", Conn 
			if QHString="" and founddo=0 Then
			  VerbTerm=VerbTerm+rs.Fields(1).value
			  VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value
			elseif affirverb=1 and QHString<>"" and founddo=0 Then
				VerbTerm=VerbTerm+rs.Fields(1).value+"নে " 
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+"ne " 
			elseif  founddo=0 Then
			   VerbTerm=VerbTerm+rs.Fields(1).value
			   VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value
									end if
			rs.close
			if foundVerbTermONE=0 Then
									Curr_Term="VerbTermONE"
									VerbTermONE=VerbTerm
									VerbTermONEUtcharan=VerbTermUtcharan
									foundVerbTermONE=1
								elseif foundVerbTermTWO=0  Then
									Curr_Term="VerbTermTWO"
									VerbTermTWO=VerbTerm
									VerbTermTWOUtcharan=VerbTermUtcharan
									foundVerbTermTWO=1
								end if
		elseif prst=1 and secondperson=1 and mainverb<>""  and onlyRoot=0 and founddo=0 and foundnot=0 Then
			rs.Open "Select action,present,actionUtcharan,presentUtcharan from tab_verb where verbs='"+mainverb+"_secondperson'", Conn 
			if QHString="" and founddo=0 Then
			   VerbTerm=VerbTerm+rs.Fields(1).value
			   VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value
			elseif affirverb=1 and QHString<>"" and founddo=0 Then
				VerbTerm=VerbTerm+rs.Fields(1).value+"নে " 
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+"ne "
			elseif  founddo=0 Then
			   VerbTerm=VerbTerm+rs.Fields(1).value
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value
									end if
			rs.close
			if foundVerbTermONE=0 Then
									Curr_Term="VerbTermONE"
									VerbTermONE=VerbTerm
									VerbTermONEUtcharan=VerbTermUtcharan
									foundVerbTermONE=1
								elseif foundVerbTermTWO=0  Then
									Curr_Term="VerbTermTWO"
									VerbTermTWO=VerbTerm
									VerbTermTWOUtcharan=VerbTermUtcharan
									foundVerbTermTWO=1
								end if
		elseif prst=1 and thirdperson=1  and mainverb<>""  and onlyRoot=0 and founddo=0 and foundnot=0 Then
			rs.Open "Select action,present,actionUtcharan,presentUtcharan from tab_verb where verbs='"+mainverb+"_thirdperson'", Conn 
			if QHString="" and founddo=0 Then
			   VerbTerm=VerbTerm+rs.Fields(1).value
			   VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value
			elseif affirverb=1 and QHString<>"" and founddo=0 Then
				VerbTerm=VerbTerm+rs.Fields(1).value+"নে " 
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+"ne " 
			elseif  founddo=0 Then
			   VerbTerm=VerbTerm+rs.Fields(1).value
			   VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value
			end if
			rs.close
			if foundVerbTermONE=0 Then
									Curr_Term="VerbTermONE"
									VerbTermONE=VerbTerm
									VerbTermONEUtcharan=VerbTermUtcharan
									foundVerbTermONE=1
								elseif foundVerbTermTWO=0  Then
									Curr_Term="VerbTermTWO"
									VerbTermTWO=VerbTerm
									VerbTermTWOUtcharan=VerbTermUtcharan
									foundVerbTermTWO=1
								end if
		' past 
		elseif pst=1 and firstperson=1 and mainverb<>""  and onlyRoot=0 and founddo=0 and foundnot=0 Then
			rs.Open "Select action,past,actionUtcharan,pastUtcharan from tab_verb where verbs='"+mainverb+"_firstperson'", Conn 
			if QHString="" and founddo=0 Then
			   VerbTerm=VerbTerm+rs.Fields(1).value
			   VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value
			elseif affirverb=1 and QHString<>"" and founddo=0 Then
				VerbTerm=VerbTerm+rs.Fields(1).value+"নে " 
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+"ne "
			elseif  founddo=0 Then
			   VerbTerm=VerbTerm+rs.Fields(1).value
			   VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value
									end if
			rs.close
			if foundVerbTermONE=0 Then
									Curr_Term="VerbTermONE"
									VerbTermONE=VerbTerm
									VerbTermONEUtcharan=VerbTermUtcharan
									foundVerbTermONE=1
								elseif foundVerbTermTWO=0  Then
									Curr_Term="VerbTermTWO"
									VerbTermTWO=VerbTerm
									VerbTermTWOUtcharan=VerbTermUtcharan
									foundVerbTermTWO=1
								end if
		elseif pst=1 and secondperson=1 and mainverb<>"" and onlyRoot=0 and founddo=0 and foundnot=0 Then
			rs.Open "Select action,past,actionUtcharan,pastUtcharan from tab_verb where verbs='"+mainverb+"_secondperson'", Conn 
			if QHString="" and founddo=0 Then
			   VerbTerm=VerbTerm+rs.Fields(1).value
			   VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value
			elseif affirverb=1 and QHString<>"" and founddo=0 Then
				VerbTerm=VerbTerm+rs.Fields(1).value+"নে " 
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+"ne " 
			elseif  founddo=0 Then
			   VerbTerm=VerbTerm+rs.Fields(1).value
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value
									end if
			rs.close
			if foundVerbTermONE=0 Then
									Curr_Term="VerbTermONE"
									VerbTermONE=VerbTerm
									VerbTermONEUtcharan=VerbTermUtcharan
									foundVerbTermONE=1
								elseif foundVerbTermTWO=0  Then
									Curr_Term="VerbTermTWO"
									VerbTermTWO=VerbTerm
									VerbTermTWOUtcharan=VerbTermUtcharan
									foundVerbTermTWO=1
								end if
		elseif pst=1 and thirdperson=1 and mainverb<>"" and onlyRoot=0 and founddo=0 and foundnot=0 Then
			rs.Open "Select action,past,actionUtcharan,pastUtcharan from tab_verb where verbs='"+mainverb+"_thirdperson'", Conn 
			if QHString="" and founddo=0 Then
			  VerbTerm=VerbTerm+rs.Fields(1).value
			  VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value
			elseif affirverb=1 and QHString<>"" and founddo=0 Then
				VerbTerm=VerbTerm+rs.Fields(1).value+"নে " 
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+"ne " 
			elseif  founddo=0 Then
			   VerbTerm=VerbTerm+rs.Fields(1).value
			   VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value
				end if
			rs.close
			if foundVerbTermONE=0 Then
									Curr_Term="VerbTermONE"
									VerbTermONE=VerbTerm
									VerbTermONEUtcharan=VerbTermUtcharan
									foundVerbTermONE=1
								elseif foundVerbTermTWO=0  Then
									Curr_Term="VerbTermTWO"
									VerbTermTWO=VerbTerm
									VerbTermTWOUtcharan=VerbTermUtcharan
									foundVerbTermTWO=1
								end if
		
		''' FOR NEGATIVE VERB 
		
		elseif ftre=1 and firstperson=1 and mainverb<>"" and founddo=0 and foundnot=1 or onlyRoot=1 and foundnot=1  Then
	        '' ' Response.Write "/NegVerb/"
			rs.Open "Select action,future,actionUtcharan,futureUtcharan from tab_verb where verbs='neg"+mainverb+"_firstperson'", Conn 
             if QHString="" and founddo=0 Then
			    VerbTerm=VerbTerm+rs.Fields(1).value
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value
              elseif affirverb=1 and QHString<>""  and founddo=0 Then
			    VerbTerm=VerbTerm+rs.Fields(1).value+"নে "
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+"ne "
		     elseif  founddo=0 Then
		        VerbTerm=VerbTerm+rs.Fields(1).value
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value
                                   '' ' Response.Write VerbTerm
		   
             end if
		      rs.close
               if foundVerbTermONE=0 Then
									Curr_Term="VerbTermONE"
									VerbTermONE=VerbTerm
									VerbTermONEUtcharan=VerbTermUtcharan
									foundVerbTermONE=1
								elseif foundVerbTermTWO=0  Then
									Curr_Term="VerbTermTWO"
									VerbTermTWO=VerbTerm
									VerbTermTWOUtcharan=VerbTermUtcharan
									foundVerbTermTWO=1
								end if
		elseif onlyRoot=99 and mainverb<>"" and count > 2 and foundnot=1 Then
			 '' ' Response.Write "/O root / count less +2"
			 rs.Open "Select future,futureUtcharan from tab_verb where verbs='neg"+mainverb+"_thirdperson'", Conn 
             if QHString="" and founddo=0 Then
			    VerbTerm=VerbTerm+rs.Fields(0).value
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(1).value
              elseif affirverb=1 and QHString<>""  and founddo=0 Then
			    VerbTerm=VerbTerm+rs.Fields(0).value+"নে "
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(1).value+"ne "
		     elseif  founddo=0 Then
		        VerbTerm=VerbTerm+rs.Fields(0).value
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(1).value
                                   '' ' Response.Write VerbTerm
		   
              end if
		      rs.close
			  if foundVerbTermONE=0 Then
									Curr_Term="VerbTermONE"
									VerbTermONE=VerbTerm
									VerbTermONEUtcharan=VerbTermUtcharan
									foundVerbTermONE=1
								elseif foundVerbTermTWO=0  Then
									Curr_Term="VerbTermTWO"
									VerbTermTWO=VerbTerm
									VerbTermTWOUtcharan=VerbTermUtcharan
									foundVerbTermTWO=1
								end if
		elseif onlyRoot=99 and mainverb<>"" and (count < 2 or count=2) and foundnot=1 Then
			 '' ' Response.Write "/O root / count less -2"
			 rs.Open "Select action,actionUtcharan from tab_verb where verbs='neg"+mainverb+"_firstperson'", Conn 
             if QHString="" and founddo=0 Then
			    VerbTerm=VerbTerm+rs.Fields(0).value
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(1).value
              elseif affirverb=1 and QHString<>""  and founddo=0 Then
			    VerbTerm=VerbTerm+rs.Fields(0).value+"নে "
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(1).value+"ne "
		     elseif  founddo=0 Then
		        VerbTerm=VerbTerm+rs.Fields(0).value
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(1).value
                                   '' ' Response.Write VerbTerm
		   
              end if
		      rs.close
			  if foundVerbTermONE=0 Then
									Curr_Term="VerbTermONE"
									VerbTermONE=VerbTerm
									VerbTermONEUtcharan=VerbTermUtcharan
									foundVerbTermONE=1
								elseif foundVerbTermTWO=0  Then
									Curr_Term="VerbTermTWO"
									VerbTermTWO=VerbTerm
									VerbTermTWOUtcharan=VerbTermUtcharan
									foundVerbTermTWO=1
								end if
		elseif ftre=1 and secondperson=1 and mainverb<>"" and  foundnot=1 and onlyRoot=0 and founddo=0  Then
		    '' ' Response.Write "/Debug2p/"
			rs.Open "Select action,future,actionUtcharan,futureUtcharan from tab_verb where verbs='neg"+mainverb+"_secondperson'", Conn 
            '' ' Response.Write rs.Fields(1).value
			if QHString="" and founddo=0 Then
		       VerbTerm=VerbTerm+rs.Fields(1).value
			   VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value
             elseif affirverb=1 and QHString<>"" and founddo=0 Then
			    '' ' Response.Write "/Debug2part1/"
				VerbTerm=VerbTerm+rs.Fields(1).value+"নে " 
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+"ne " 
				'' ' Response.Write VerbTerm
		      elseif  founddo=0 Then
		        VerbTerm=VerbTerm+rs.Fields(1).value
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value
           end if
		   rs.close
			if foundVerbTermONE=0 Then
									Curr_Term="VerbTermONE"
									VerbTermONE=VerbTerm
									VerbTermONEUtcharan=VerbTermUtcharan
									foundVerbTermONE=1
								elseif foundVerbTermTWO=0  Then
									Curr_Term="VerbTermTWO"
									VerbTermTWO=VerbTerm
									VerbTermTWOUtcharan=VerbTermUtcharan
									foundVerbTermTWO=1
								end if
		elseif ftre=1 and thirdperson=1 and mainverb<>"" and foundnot=1 and onlyRoot=0 and founddo=0  Then
		    rs.Open "Select action,future,actionUtcharan,futureUtcharan from tab_verb where verbs='neg"+mainverb+"_thirdperson'", Conn 
            '' ' Response.Write "/Debug3p/"
			if QHString="" and founddo=0 Then
		       VerbTerm=VerbTerm+rs.Fields(1).value 
			   VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value
            elseif affirverb=1 and QHString<>"" and founddo=0 Then
			   VerbTerm=VerbTerm+rs.Fields(1).value+"নে " 
			   VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+"ne " 
		   elseif  founddo=0 Then
		      VerbTerm=VerbTerm+rs.Fields(1).value
		       VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value 
                                end if
		   '' ' Response.Write "Debug"
		   rs.close
			if foundVerbTermONE=0 Then
									Curr_Term="VerbTermONE"
									VerbTermONE=VerbTerm
									VerbTermONEUtcharan=VerbTermUtcharan
									foundVerbTermONE=1
								elseif foundVerbTermTWO=0  Then
									Curr_Term="VerbTermTWO"
									VerbTermTWO=VerbTerm
									VerbTermTWOUtcharan=VerbTermUtcharan
									foundVerbTermTWO=1
								end if
		' present 
		elseif prst=1 and firstperson=1  and mainverb<>"" and foundnot=1 and onlyRoot=0 and founddo=0  Then
			rs.Open "Select action,present,actionUtcharan,presentUtcharan from tab_verb where verbs='neg"+mainverb+"_firstperson'", Conn 
			if QHString="" and founddo=0 Then
			  VerbTerm=VerbTerm+rs.Fields(1).value
			  VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value
			elseif affirverb=1 and QHString<>"" and founddo=0 Then
				VerbTerm=VerbTerm+rs.Fields(1).value+"নে " 
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+"ne " 
			elseif  founddo=0 Then
			   VerbTerm=VerbTerm+rs.Fields(1).value
			   VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value
									end if
			rs.close
			if foundVerbTermONE=0 Then
									Curr_Term="VerbTermONE"
									VerbTermONE=VerbTerm
									VerbTermONEUtcharan=VerbTermUtcharan
									foundVerbTermONE=1
								elseif foundVerbTermTWO=0  Then
									Curr_Term="VerbTermTWO"
									VerbTermTWO=VerbTerm
									VerbTermTWOUtcharan=VerbTermUtcharan
									foundVerbTermTWO=1
								end if
		elseif prst=1 and secondperson=1 and mainverb<>"" and foundnot=1 and onlyRoot=0 and founddo=0  Then
			rs.Open "Select action,present,actionUtcharan,presentUtcharan from tab_verb where verbs='neg"+mainverb+"_secondperson'", Conn 
			if QHString="" and founddo=0 Then
			   VerbTerm=VerbTerm+rs.Fields(1).value
			   VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value
			elseif affirverb=1 and QHString<>"" and founddo=0 Then
				VerbTerm=VerbTerm+rs.Fields(1).value+"নে " 
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+"ne "
			elseif  founddo=0 Then
			   VerbTerm=VerbTerm+rs.Fields(1).value
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value 
									end if
			rs.close
			if foundVerbTermONE=0 Then
									Curr_Term="VerbTermONE"
									VerbTermONE=VerbTerm
									VerbTermONEUtcharan=VerbTermUtcharan
									foundVerbTermONE=1
								elseif foundVerbTermTWO=0  Then
									Curr_Term="VerbTermTWO"
									VerbTermTWO=VerbTerm
									VerbTermTWOUtcharan=VerbTermUtcharan
									foundVerbTermTWO=1
								end if
		elseif prst=1 and thirdperson=1  and mainverb<>"" and foundnot=1 and onlyRoot=0 and founddo=0  Then
			rs.Open "Select action,present,actionUtcharan,presentUtcharan from tab_verb where verbs='neg"+mainverb+"_thirdperson'", Conn 
			if QHString="" and founddo=0 Then
			   VerbTerm=VerbTerm+rs.Fields(1).value
			   VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value
			elseif affirverb=1 and QHString<>"" and founddo=0 Then
				VerbTerm=VerbTerm+rs.Fields(1).value+"নে " 
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+"ne " 
			elseif  founddo=0 Then
			   VerbTerm=VerbTerm+rs.Fields(1).value 
			   VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value
			end if
			rs.close
			if foundVerbTermONE=0 Then
									Curr_Term="VerbTermONE"
									VerbTermONE=VerbTerm
									VerbTermONEUtcharan=VerbTermUtcharan
									foundVerbTermONE=1
								elseif foundVerbTermTWO=0  Then
									Curr_Term="VerbTermTWO"
									VerbTermTWO=VerbTerm
									VerbTermTWOUtcharan=VerbTermUtcharan
									foundVerbTermTWO=1
								end if
		' past 
		elseif pst=1 and firstperson=1 and mainverb<>"" and foundnot=1 and onlyRoot=0 and founddo=0  Then
			'' ' Response.Write "/PS:1/"
			rs.Open "Select action,past,actionUtcharan,pastUtcharan from tab_verb where verbs='neg"+mainverb+"_firstperson'", Conn 
			if QHString="" and founddo=0 Then
			   VerbTerm=VerbTerm+rs.Fields(1).value 
			   VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value
			elseif affirverb=1 and QHString<>"" and founddo=0 Then
				VerbTerm=VerbTerm+rs.Fields(1).value+"নে " 
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+"ne "
			elseif  founddo=0 Then
			   VerbTerm=VerbTerm+rs.Fields(1).value
			   VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value 
									end if
			rs.close
			if foundVerbTermONE=0 Then
									Curr_Term="VerbTermONE"
									VerbTermONE=VerbTerm
									VerbTermONEUtcharan=VerbTermUtcharan
									foundVerbTermONE=1
								elseif foundVerbTermTWO=0  Then
									Curr_Term="VerbTermTWO"
									VerbTermTWO=VerbTerm
									VerbTermTWOUtcharan=VerbTermUtcharan
									foundVerbTermTWO=1
								end if
		elseif pst=1 and secondperson=1 and mainverb<>"" and foundnot=1 and onlyRoot=0 and founddo=0  Then
		    
			rs.Open "Select action,past,actionUtcharan,pastUtcharan from tab_verb where verbs='neg"+mainverb+"_secondperson'", Conn 
			if QHString="" and founddo=0 Then
			   VerbTerm=VerbTerm+rs.Fields(1).value
			   VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value
			elseif affirverb=1 and QHString<>"" and founddo=0 Then
				VerbTerm=VerbTerm+rs.Fields(1).value+"নে " 
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+"ne " 
			elseif  founddo=0 Then
			   VerbTerm=VerbTerm+rs.Fields(1).value
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value
									end if
			rs.close
			if foundVerbTermONE=0 Then
									Curr_Term="VerbTermONE"
									VerbTermONE=VerbTerm
									VerbTermONEUtcharan=VerbTermUtcharan
									foundVerbTermONE=1
								elseif foundVerbTermTWO=0  Then
									Curr_Term="VerbTermTWO"
									VerbTermTWO=VerbTerm
									VerbTermTWOUtcharan=VerbTermUtcharan
									foundVerbTermTWO=1
								end if
		elseif pst=1 and thirdperson=1 and mainverb<>"" and foundnot=1 and onlyRoot=0 and founddo=0  Then
			rs.Open "Select action,past,actionUtcharan,pastUtcharan from tab_verb where verbs='neg"+mainverb+"_thirdperson'", Conn 
			if QHString="" and founddo=0 Then
			  VerbTerm=VerbTerm+rs.Fields(1).value
			  VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value
			elseif affirverb=1 and QHString<>"" and founddo=0 Then
				VerbTerm=VerbTerm+rs.Fields(1).value+"নে " 
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+"ne " 
			elseif  founddo=0 Then
			   VerbTerm=VerbTerm+rs.Fields(1).value
			   VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value
			end if
			rs.close
			if foundVerbTermONE=0 Then
									Curr_Term="VerbTermONE"
									VerbTermONE=VerbTerm
									VerbTermONEUtcharan=VerbTermUtcharan
									foundVerbTermONE=1
								elseif foundVerbTermTWO=0  Then
									Curr_Term="VerbTermTWO"
									VerbTermTWO=VerbTerm
									VerbTermTWOUtcharan=VerbTermUtcharan
									foundVerbTermTWO=1
								end if
    elseif founddo=1 and DoThisElem="do" Then
   	           ' rs.Open "Select action from tab_verb where verbs='"+mainverb+"_thirdperson'", Conn 
               ' VerbTerm=VerbTerm+rs.Fields(0).value+" " 
               ' rs.close	
    end if
	'' Adding Connection to verb
	'' ' Response.Write "Success 40-0"
	
	
	
	if ConnectiveTermONE="to" and Phrases1<>";" and CountingPhrases=2 and TermONEDONE=99 and Phrases2<>";" Then
										
										verbsplit=split(VerbTermONE," ")
										verbsplitUtcharan=split(VerbTermONEUtcharan," ")
										
										
										
										
										i=0
										For each item in verbsplit
										 
										 if item<>"" Then
											verbsplit(i)=item
											i=i+1
										 end if
										 
										next
										
										i=0
										For each item in verbsplitUtcharan
										
										 if item<>"" Then
											verbsplitUtcharan(i)=item
											i=i+1
										 end if
										 
										next
										
									
										
										
										if FoundMebeforeyou=0 Then
										
												VerbTermONE=verbsplit(0)+" "+verbsplit(1)+"লৈ"
												VerbTermONEUtcharan=verbsplitUtcharan(0)+" "+verbsplitUtcharan(1)+"loi"
											  
											
										else
											VerbTermONE=verbsplit(0)+" "+verbsplit(1)
											VerbTermONEUtcharan=verbsplitUtcharan(0)+" "+verbsplitUtcharan(1)
										end if
										TermONEDONE=99
										Curr_Term="VerbTermONE"
    elseif ConnectiveTermTWO="to" and Phrases2<>";" and CountingPhrases=3 and TermTWODONE=99 Then
										
										verbsplit=split(VerbTermONE," ")
										verbsplitUtcharan=split(VerbTermONEUtcharan," ")
										i=0
										For each item in verbsplit
										
										 if item<>" " Then
											verbsplit(i)=item
										 end if
										 i=i+1
										next
										i=0
										For each item in verbsplitUtcharan
										
										 if item<>" " Then
											verbsplitUtcharan(i)=item
										 end if
										 i=i+1
										next
										if FoundMebeforeyou=0 Then
											VerbTermONE=verbsplit(0)+" "+verbsplit(1)+"লৈ"
											VerbTermONEUtcharan=verbsplitUtcharan(0)+" "+verbsplitUtcharan(1)+"loi"
										else
											VerbTermONE=verbsplit(0)+" "+verbsplit(1)
											VerbTermONEUtcharan=verbsplitUtcharan(0)+" "+verbsplitUtcharan(1)
										end if
										TermTWODONE=99
										Curr_Term="VerbTermONE"
	elseif ConnectiveTermONE="to" and Phrases2=";" and CountingPhrases=3 and TermONEDONE=99 Then
										
										verbsplit=split(VerbTermONE," ")
										verbsplitUtcharan=split(VerbTermONEUtcharan," ")
										i=0
										For each item in verbsplit
										
										 if item<>" " Then
											verbsplit(i)=item
										 end if
										 i=i+1
										next
										i=0
										For each item in verbsplitUtcharan
										
										 if item<>" " Then
											verbsplitUtcharan(i)=item
										 end if
										 i=i+1
										next
										if FoundMebeforeyou=0 Then
											VerbTermONE=verbsplit(0)+" "+verbsplit(1)+"লৈ"
											VerbTermONEUtcharan=verbsplitUtcharan(0)+" "+verbsplitUtcharan(1)+"loi"
										else
											VerbTermONE=verbsplit(0)+" "+verbsplit(1)
											VerbTermONEUtcharan=verbsplitUtcharan(0)+" "+verbsplitUtcharan(1)
										end if
										TermONEDONE=99
	end if
	if ConnectiveTermONE="to" and Phrases1<>";" and CountingPhrases=2 and TermONEDONE=199 and Phrases2<>";" Then
										
										verbsplit=split(AuxVerbTermONE," ")
										verbsplitUtcharan=split(AuxVerbTermONEUtcharan," ")
										i=0
										For each item in verbsplit
										
										 if item<>" " Then
											verbsplit(i)=item
										 end if
										 i=i+1
										next
										i=0
										For each item in verbsplitUtcharan
										
										 if item<>" " Then
											verbsplitUtcharan(i)=item
										 end if
										 i=i+1
										next
										if FoundMebeforeyou=0 Then
										AuxVerbTermONE=verbsplit(0)+" "+verbsplit(1)+"লৈ"
										AuxVerbTermONEUtcharan=verbsplitUtcharan(0)+" "+verbsplitUtcharan(1)+"loi"
										else
											AuxVerbTermONE=verbsplit(0)
											AuxVerbTermONEUtcharan=verbsplitUtcharan(0)
										end if
										TermONEDONE=199
    elseif ConnectiveTermTWO="to" and Phrases2<>";" and CountingPhrases=3 and TermTWODONE=199 Then
										
										verbsplit=split(AuxVerbTermONE," ")
										verbsplitUtcharan=split(AuxVerbTermONEUtcharan," ")
										i=0
										For each item in verbsplit
										
										 if item<>" " Then
											verbsplit(i)=item
										 end if
										 i=i+1
										next
										i=0
										For each item in verbsplitUtcharan
										
										 if item<>" " Then
											verbsplitUtcharan(i)=item
										 end if
										 i=i+1
										next
										if FoundMebeforeyou=0 Then
											AuxVerbTermONE=verbsplit(0)+" "+verbsplit(1)+"লৈ"
											AuxVerbTermONEUtcharan=verbsplitUtcharan(0)+" "+verbsplitUtcharan(1)+"loi"
										else
											AuxVerbTermONE=verbsplit(0)
											AuxVerbTermONEUtcharan=verbsplitUtcharan(0)
										end if
										TermTWODONE=199
	elseif ConnectiveTermONE="to" and Phrases2=";" and CountingPhrases=3 and TermONEDONE=199 Then
										
										verbsplit=split(AuxVerbTermONE," ")
										verbsplitUtcharan=split(AuxVerbTermONEUtcharan," ")
										i=0
										For each item in verbsplit
										
										 if item<>" " Then
											verbsplit(i)=item
										 end if
										 i=i+1
										next
										i=0
										For each item in verbsplitUtcharan
										
										 if item<>" " Then
											verbsplitUtcharan(i)=item
										 end if
										 i=i+1
										next
										if FoundMebeforeyou=0 Then
											AuxVerbTermONE=verbsplit(0)+" "+verbsplit(1)+"লৈ"
											AuxVerbTermONEUtcharan=verbsplitUtcharan(0)+" "+verbsplitUtcharan(1)+"loi"
										else
											AuxVerbTermONE=verbsplit(0)
											AuxVerbTermONEUtcharan=verbsplitUtcharan(0)
										end if
										TermONEDONE=199
	end if
	
	
	
	
	''' Before Ending the phrase translations look for a translations of not or dont/didnt etc.
	
	if foundnot=1 and (mainverb="" and auxverb="") and donotbe=0 Then
				Assamese_String=Assamese_String+"নোহোঁৱা"
				Assamese_StringUtcharan=Assamese_StringUtcharan+"nuhua"
	elseif donotbe=1 Then
				Assamese_String=Assamese_String+"নহবা"
				Assamese_StringUtcharan=Assamese_StringUtcharan+"nohoba"
	end if 
	if BeginQst=1 and mainverb<>"" and auxverb="" and ConnectiveTermONE="" Then
		QHString=QHString+" নে নাই"
		QHStringUtcharan=QHStringUtcharan+" ne nai"
	end if
    
	'' ' Response.Write ConnectiveTermTWO
	
	if FrontQHType=0 Then
		if CountingPhrases=3 and Phrases2<>";" Then
			  
				if ConnectiveTermTWO="to" Then
				  Assamese_StringFinal=MODNounTermONE+" "+NounTermONE+" "+PronounTerm+" "+VerbTermONE+" "+LOC_StringONE+" "+MODNounTermTWO+" "+NounTermTWO+" "+AUXPronounTerm+" "+AuxVerbTermONE+" "+VerbTermTWO+" "+LOC_StringTWO+" "+AuxVerbTermTWO+" "+Assamese_String+" "+ENDSTRING+" "+QHString
				  Assamese_StringUtcharanFinal=MODNounTermONEUtcharan+" "+NounTermONEUtcharan+" "+PronounTermUtcharan+" "+VerbTermONEUtcharan+" "+LOC_StringONEUtcharan+" "+MODNounTermTWOUtcharan+" "+NounTermTWOUtcharan+" "+AUXPronounTermUtcharan+" "+AuxVerbTermONEUtcharan+" "+VerbTermTWOUtcharan+" "+AuxVerbTermTWOUtcharan+" "+LOC_StringTWOUtcharan+" "+Assamese_StringUtcharan+" "+ENDSTRINGUtcharan+" "+QHStringUtcharan
				  ThirdStringValued=SecondStringValued+" "+Assamese_StringFinal
				  ThirdStringValuedUtcharan=SecondStringValuedUtcharan+" "+Assamese_StringUtcharanFinal
				  Assamese_String=""
				  Assamese_StringUtcharan=""
				' elseif ConnectiveTermONE<>"with" Then   ''check
				  ' Assamese_StringFinal=ConnectiveTermTWOTranslation+" "+MODNounTermONE+" "+NounTermONE+" "+PronounTerm+" "+VerbTermONE+" "+LOC_StringONE+" "+MODNounTermTWO+" "+NounTermTWO+" "+AUXPronounTerm+" "+AuxVerbTermONE+" "+VerbTermTWO+" "+LOC_StringTWO+" "+AuxVerbTermTWO+" "+Assamese_String+" "+ENDSTRING+" "+QHString
				  ' Assamese_StringUtcharanFinal=ConnectiveTermTWOTranslationUtcharan+" "+MODNounTermONEUtcharan+" "+NounTermONEUtcharan+" "+PronounTermUtcharan+" "+VerbTermONEUtcharan+" "+LOC_StringONEUtcharan+" "+MODNounTermTWOUtcharan+" "+NounTermTWOUtcharan+" "+AUXPronounTermUtcharan+" "+AuxVerbTermONEUtcharan+" "+VerbTermTWOUtcharan+" "+AuxVerbTermTWOUtcharan+" "+LOC_StringTWOUtcharan+" "+Assamese_StringUtcharan+" "+ENDSTRINGUtcharan+" "+QHStringUtcharan
					' ThirdStringValued=SecondStringValued+" "+Assamese_StringFinal
				  ' ThirdStringValuedUtcharan=SecondStringValuedUtcharan+" "+Assamese_StringUtcharanFinal
				  ' Assamese_String=""
				  ' Assamese_StringUtcharan=""
				else
				  Assamese_StringFinal=MODNounTermONE+" "+NounTermONE+" "+PronounTerm+" "+VerbTermONE+" "+LOC_StringONE+" "+MODNounTermTWO+" "+NounTermTWO+" "+AUXPronounTerm+" "+AuxVerbTermONE+" "+VerbTermTWO+" "+LOC_StringTWO+" "+AuxVerbTermTWO+" "+Assamese_String+" "+ENDSTRING+" "+QHString+" "+ConnectiveTermTWOTranslation
				  Assamese_StringUtcharanFinal=MODNounTermONEUtcharan+" "+NounTermONEUtcharan+" "+PronounTermUtcharan+" "+VerbTermONEUtcharan+" "+LOC_StringONEUtcharan+" "+MODNounTermTWOUtcharan+" "+NounTermTWOUtcharan+" "+AUXPronounTermUtcharan+" "+AuxVerbTermONEUtcharan+" "+VerbTermTWOUtcharan+" "+AuxVerbTermTWOUtcharan+" "+LOC_StringTWOUtcharan+" "+Assamese_StringUtcharan+" "+ENDSTRINGUtcharan+" "+QHStringUtcharan+" "+ConnectiveTermTWOTranslationUtcharan
				   ThirdStringValued=SecondStringValued+" "+Assamese_StringFinal
				  ThirdStringValuedUtcharan=SecondStringValuedUtcharan+" "+Assamese_StringUtcharanFinal
				  Assamese_String=""
				  Assamese_StringUtcharan=""
				 end if
				 AuxVerbTermONE=""
				  AuxVerbTermTWO=""
				  AuxVerbTermONEUtcharan=""
				  AuxVerbTermTWOUtcharan=""
				  
		 elseif CountingPhrases=3 and Phrases2=";" and Phrases1<>";" Then
				if ConnectiveTermONE="to" Then
				  Assamese_StringFinal=MODNounTermONE+" "+NounTermONE+" "+PronounTerm+" "+VerbTermONE+" "+LOC_StringONE+" "+MODNounTermTWO+" "+NounTermTWO+" "+AUXPronounTerm+" "+AuxVerbTermONE+" "+VerbTermTWO+" "+LOC_StringTWO+" "+AuxVerbTermTWO+" "+Assamese_String+" "+ENDSTRING+" "+QHString
				  Assamese_StringUtcharanFinal=MODNounTermONEUtcharan+" "+NounTermONEUtcharan+" "+PronounTermUtcharan+" "+VerbTermONEUtcharan+" "+LOC_StringONEUtcharan+" "+MODNounTermTWOUtcharan+" "+NounTermTWOUtcharan+" "+AUXPronounTermUtcharan+" "+AuxVerbTermONEUtcharan+" "+VerbTermTWOUtcharan+" "+AuxVerbTermTWOUtcharan+" "+LOC_StringTWOUtcharan+" "+Assamese_StringUtcharan+" "+ENDSTRINGUtcharan+" "+QHStringUtcharan
					ThirdStringValued=FirstStringValued+" "+Assamese_StringFinal
				  ThirdStringValuedUtcharan=FirstStringValuedUtcharan+" "+Assamese_StringUtcharanFinal
				  Assamese_String=""
				  Assamese_StringUtcharan=""
				 ' elseif ConnectiveTermONE<>"with" Then
				 ' '' ' Response.Write "TAG $$%%##$$%%**(0)"
				 ' '' ' Response.Write QHStringUtcharan
				   ' Assamese_StringFinal=ConnectiveTermONETranslation+" "+MODNounTermONE+" "+NounTermONE+" "+PronounTerm+" "+VerbTermONE+" "+LOC_StringONE+" "+MODNounTermTWO+" "+NounTermTWO+" "+AUXPronounTerm+" "+AuxVerbTermONE+" "+VerbTermTWO+" "+LOC_StringTWO+" "+AuxVerbTermTWO+" "+Assamese_String+" "+ENDSTRING+" "+QHString
				  ' Assamese_StringUtcharanFinal=ConnectiveTermONETranslationUtcharan+" "+MODNounTermONEUtcharan+" "+NounTermONEUtcharan+" "+PronounTermUtcharan+" "+VerbTermONEUtcharan+" "+LOC_StringONEUtcharan+" "+MODNounTermTWOUtcharan+" "+NounTermTWOUtcharan+" "+AUXPronounTermUtcharan+" "+AuxVerbTermONEUtcharan+" "+VerbTermTWOUtcharan+" "+AuxVerbTermTWOUtcharan+" "+LOC_StringTWOUtcharan+" "+Assamese_StringUtcharan+" "+ENDSTRINGUtcharan+" "+QHStringUtcharan
				  ' ThirdStringValued=FirstStringValued+" "+Assamese_StringFinal
				  ' ThirdStringValuedUtcharan=FirstStringValuedUtcharan+" "+Assamese_StringUtcharanFinal
				  
				  ' Assamese_String=""
				   ' Assamese_StringUtcharan=""
				  else
				  Assamese_StringFinal=MODNounTermONE+" "+NounTermONE+" "+PronounTerm+" "+VerbTermONE+" "+LOC_StringONE+" "+MODNounTermTWO+" "+NounTermTWO+" "+AUXPronounTerm+" "+AuxVerbTermONE+" "+VerbTermTWO+" "+LOC_StringTWO+" "+AuxVerbTermTWO+" "+Assamese_String+" "+ENDSTRING+" "+ConnectiveTermONETranslation+" "+QHString
				  Assamese_StringUtcharanFinal=MODNounTermONEUtcharan+" "+NounTermONEUtcharan+" "+PronounTermUtcharan+" "+VerbTermONEUtcharan+" "+LOC_StringONEUtcharan+" "+MODNounTermTWOUtcharan+" "+NounTermTWOUtcharan+" "+AUXPronounTermUtcharan+" "+AuxVerbTermONEUtcharan+" "+VerbTermTWOUtcharan+" "+AuxVerbTermTWOUtcharan+" "+LOC_StringTWOUtcharan+" "+Assamese_StringUtcharan+" "+ENDSTRINGUtcharan+" "+ConnectiveTermONETranslationUtcharan+" "+QHStringUtcharan
				  ThirdStringValued=FirstStringValued+" "+Assamese_StringFinal
				  ThirdStringValuedUtcharan=FirstStringValuedUtcharan+" "+Assamese_StringUtcharanFinal
				  
				  Assamese_String=""
				   Assamese_StringUtcharan=""
				 end if
				 AuxVerbTermONE=""
				  AuxVerbTermTWO=""
				  AuxVerbTermONEUtcharan=""
				  AuxVerbTermTWOUtcharan=""
		 elseif CountingPhrases=3 and Phrases2=";" and Phrases1=";" Then
				 '' ' Response.write "ff"
				  Assamese_StringFinal=MODNounTermONE+" "+NounTermONE+" "+PronounTerm+" "+VerbTermONE+" "+LOC_StringONE+" "+MODNounTermTWO+" "+NounTermTWO+" "+AUXPronounTerm+" "+AuxVerbTermONE+" "+VerbTermTWO+" "+LOC_StringTWO+" "+AuxVerbTermTWO+" "+Assamese_String+" "+ENDSTRING+" "+ConnectiveTermONETranslation+" "+QHString
				  Assamese_StringUtcharanFinal=MODNounTermONEUtcharan+" "+NounTermONEUtcharan+" "+PronounTermUtcharan+" "+VerbTermONEUtcharan+" "+LOC_StringONEUtcharan+" "+MODNounTermTWOUtcharan+" "+NounTermTWOUtcharan+" "+AUXPronounTermUtcharan+" "+AuxVerbTermONEUtcharan+" "+VerbTermTWOUtcharan+" "+AuxVerbTermTWOUtcharan+" "+LOC_StringTWOUtcharan+" "+Assamese_StringUtcharan+" "+ENDSTRINGUtcharan+" "+ConnectiveTermONETranslationUtcharan+" "+QHStringUtcharan
				  ThirdStringValued=FirstStringValued+" "+Assamese_StringFinal
				  ThirdStringValuedUtcharan=FirstStringValuedUtcharan+" "+Assamese_StringUtcharanFinal
				  
				  Assamese_String=""
				   Assamese_StringUtcharan=""
				 
				 AuxVerbTermONE=""
				  AuxVerbTermTWO=""
				  AuxVerbTermONEUtcharan=""
				  AuxVerbTermTWOUtcharan=""	 
		 elseif CountingPhrases=2  and Phrases2<>";" Then 
		 
				if ConnectiveTermONE="to" Then
				  Assamese_StringFinal=ConnectiveTermONETranslation+" "+MODNounTermONE+" "+NounTermONE+" "+PronounTerm+" "+VerbTermONE+" "+LOC_StringONE+" "+MODNounTermTWO+" "+NounTermTWO+" "+AUXPronounTerm+" "+AuxVerbTermONE+" "+VerbTermTWO+" "+LOC_StringTWO+" "+AuxVerbTermTWO+" "+Assamese_String+" "+ENDSTRING+" "+QHString
				  Assamese_StringUtcharanFinal=ConnectiveTermONETranslationUtcharan+" "+MODNounTermONEUtcharan+" "+NounTermONEUtcharan+" "+PronounTermUtcharan+" "+VerbTermONEUtcharan+" "+LOC_StringONEUtcharan+" "+MODNounTermTWOUtcharan+" "+NounTermTWOUtcharan+" "+AUXPronounTermUtcharan+" "+AuxVerbTermONEUtcharan+" "+VerbTermTWOUtcharan+" "+AuxVerbTermTWOUtcharan+" "+LOC_StringTWOUtcharan+" "+Assamese_StringUtcharan+" "+ENDSTRINGUtcharan+" "+QHStringUtcharan
				  SecondStringValued=FirstStringValued+" "+Assamese_StringFinal
				  SecondStringValuedUtcharan=FirstStringValuedUtcharan+" "+Assamese_StringUtcharanFinal
				  Assamese_String=""
				   Assamese_StringUtcharan=""
				else
					Assamese_StringFinal=ConnectiveTermONETranslation+" "+MODNounTermONE+" "+NounTermONE+" "+PronounTerm+" "+VerbTermONE+" "+LOC_StringONE+" "+MODNounTermTWO+" "+NounTermTWO+" "+AUXPronounTerm+" "+AuxVerbTermONE+" "+VerbTermTWO+" "+LOC_StringTWO+" "+AuxVerbTermTWO+" "+Assamese_String+" "+ENDSTRING+" "+QHString
				  Assamese_StringUtcharanFinal=ConnectiveTermONETranslationUtcharan+" "+MODNounTermONEUtcharan+" "+NounTermONEUtcharan+" "+PronounTermUtcharan+" "+VerbTermONEUtcharan+" "+LOC_StringONEUtcharan+" "+MODNounTermTWOUtcharan+" "+NounTermTWOUtcharan+" "+AUXPronounTermUtcharan+" "+AuxVerbTermONEUtcharan+" "+VerbTermTWOUtcharan+" "+AuxVerbTermTWOUtcharan+" "+LOC_StringTWOUtcharan+" "+Assamese_StringUtcharan+" "+ENDSTRINGUtcharan+" "+QHStringUtcharan
				  SecondStringValued=FirstStringValued+" "+Assamese_StringFinal
				  SecondStringValuedUtcharan=FirstStringValuedUtcharan+" "+Assamese_StringUtcharanFinal
				  Assamese_String=""
				   Assamese_StringUtcharan=""
				 end if
				 AuxVerbTermONE=""
				  AuxVerbTermTWO=""
				  AuxVerbTermONEUtcharan=""
				  AuxVerbTermTWOUtcharan=""
		elseif CountingPhrases=1 and Phrases1<>";" Then
				
				 Assamese_StringFinal=MODNounTermONE+" "+NounTermONE+" "+PronounTerm+" "+VerbTermONE+" "+LOC_StringONE+" "+MODNounTermTWO+" "+NounTermTWO+" "+AUXPronounTerm+" "+AuxVerbTermONE+" "+VerbTermTWO+" "+LOC_StringTWO+" "+AuxVerbTermTWO+" "+Assamese_String+" "+ENDSTRING+" "+QHString
				  Assamese_StringUtcharanFinal=MODNounTermONEUtcharan+" "+NounTermONEUtcharan+" "+PronounTermUtcharan+" "+VerbTermONEUtcharan+" "+LOC_StringONEUtcharan+" "+MODNounTermTWOUtcharan+" "+NounTermTWOUtcharan+" "+AUXPronounTermUtcharan+" "+AuxVerbTermONEUtcharan+" "+VerbTermTWOUtcharan+" "+AuxVerbTermTWOUtcharan+" "+LOC_StringTWOUtcharan+" "+Assamese_StringUtcharan+" "+ENDSTRINGUtcharan+" "+QHStringUtcharan
				  FirstStringValued=Assamese_StringFinal
				  FirstStringValuedUtcharan=Assamese_StringUtcharanFinal
				   
				  Assamese_String=""
				   Assamese_StringUtcharan=""
				  AuxVerbTermONE=""
				  AuxVerbTermTWO=""
				  AuxVerbTermONEUtcharan=""
				  AuxVerbTermTWOUtcharan=""
				 
		end if
	elseif FrontQHType=1 Then
		if CountingPhrases=3 and Phrases2<>";" Then
			  
				if ConnectiveTermTWO="to" Then
				  Assamese_StringFinal=QHString+" "+MODNounTermONE+" "+NounTermONE+" "+PronounTerm+" "+VerbTermONE+" "+LOC_StringONE+" "+MODNounTermTWO+" "+NounTermTWO+" "+AUXPronounTerm+" "+AuxVerbTermONE+" "+VerbTermTWO+" "+LOC_StringTWO+" "+AuxVerbTermTWO+" "+Assamese_String+" "+ENDSTRING
				  Assamese_StringUtcharanFinal=QHStringUtcharan+" "+MODNounTermONEUtcharan+" "+NounTermONEUtcharan+" "+PronounTermUtcharan+" "+VerbTermONEUtcharan+" "+LOC_StringONEUtcharan+" "+MODNounTermTWOUtcharan+" "+NounTermTWOUtcharan+" "+AUXPronounTermUtcharan+" "+AuxVerbTermONEUtcharan+" "+VerbTermTWOUtcharan+" "+AuxVerbTermTWOUtcharan+" "+LOC_StringTWOUtcharan+" "+Assamese_StringUtcharan+" "+ENDSTRINGUtcharan
				  ThirdStringValued=SecondStringValued+" "+Assamese_StringFinal
				  ThirdStringValuedUtcharan=SecondStringValuedUtcharan+" "+Assamese_StringUtcharanFinal
				  Assamese_String=""
				  Assamese_StringUtcharan=""
				' elseif ConnectiveTermONE<>"with" Then
				  ' Assamese_StringFinal=QHString+" "+ConnectiveTermTWOTranslation+" "+MODNounTermONE+" "+NounTermONE+" "+PronounTerm+" "+VerbTermONE+" "+LOC_StringONE+" "+MODNounTermTWO+" "+NounTermTWO+" "+AUXPronounTerm+" "+AuxVerbTermONE+" "+VerbTermTWO+" "+LOC_StringTWO+" "+AuxVerbTermTWO+" "+Assamese_String+" "+ENDSTRING
				  ' Assamese_StringUtcharanFinal=QHStringUtcharan+" "+ConnectiveTermTWOTranslationUtcharan+" "+MODNounTermONEUtcharan+" "+NounTermONEUtcharan+" "+PronounTermUtcharan+" "+VerbTermONEUtcharan+" "+LOC_StringONEUtcharan+" "+MODNounTermTWOUtcharan+" "+NounTermTWOUtcharan+" "+AUXPronounTermUtcharan+" "+AuxVerbTermONEUtcharan+" "+VerbTermTWOUtcharan+" "+AuxVerbTermTWOUtcharan+" "+LOC_StringTWOUtcharan+" "+Assamese_StringUtcharan+" "+ENDSTRINGUtcharan
					' ThirdStringValued=SecondStringValued+" "+Assamese_StringFinal
				  ' ThirdStringValuedUtcharan=SecondStringValuedUtcharan+" "+Assamese_StringUtcharanFinal
				  ' Assamese_String=""
				  ' Assamese_StringUtcharan=""
				else
				  Assamese_StringFinal=QHString+" "+MODNounTermONE+" "+NounTermONE+" "+PronounTerm+" "+VerbTermONE+" "+LOC_StringONE+" "+MODNounTermTWO+" "+NounTermTWO+" "+AUXPronounTerm+" "+AuxVerbTermONE+" "+VerbTermTWO+" "+LOC_StringTWO+" "+AuxVerbTermTWO+" "+Assamese_String+" "+ENDSTRING+" "+ConnectiveTermTWOTranslation
				  Assamese_StringUtcharanFinal=QHStringUtcharan+" "+MODNounTermONEUtcharan+" "+NounTermONEUtcharan+" "+PronounTermUtcharan+" "+VerbTermONEUtcharan+" "+LOC_StringONEUtcharan+" "+MODNounTermTWOUtcharan+" "+NounTermTWOUtcharan+" "+AUXPronounTermUtcharan+" "+AuxVerbTermONEUtcharan+" "+VerbTermTWOUtcharan+" "+AuxVerbTermTWOUtcharan+" "+LOC_StringTWOUtcharan+" "+Assamese_StringUtcharan+" "+ENDSTRINGUtcharan+" "+ConnectiveTermTWOTranslationUtcharan
				   ThirdStringValued=SecondStringValued+" "+Assamese_StringFinal
				  ThirdStringValuedUtcharan=SecondStringValuedUtcharan+" "+Assamese_StringUtcharanFinal
				  Assamese_String=""
				  Assamese_StringUtcharan=""
				 end if
				 AuxVerbTermONE=""
				  AuxVerbTermTWO=""
				  AuxVerbTermONEUtcharan=""
				  AuxVerbTermTWOUtcharan=""
				  
		 elseif CountingPhrases=3 and Phrases2=";" and Phrases1<>";" Then
				if ConnectiveTermONE="to" Then
				  Assamese_StringFinal=QHString+" "+MODNounTermONE+" "+NounTermONE+" "+PronounTerm+" "+VerbTermONE+" "+LOC_StringONE+" "+MODNounTermTWO+" "+NounTermTWO+" "+AUXPronounTerm+" "+AuxVerbTermONE+" "+VerbTermTWO+" "+LOC_StringTWO+" "+AuxVerbTermTWO+" "+Assamese_String+" "+ENDSTRING
				  Assamese_StringUtcharanFinal=QHStringUtcharan+" "+MODNounTermONEUtcharan+" "+NounTermONEUtcharan+" "+PronounTermUtcharan+" "+VerbTermONEUtcharan+" "+LOC_StringONEUtcharan+" "+MODNounTermTWOUtcharan+" "+NounTermTWOUtcharan+" "+AUXPronounTermUtcharan+" "+AuxVerbTermONEUtcharan+" "+VerbTermTWOUtcharan+" "+AuxVerbTermTWOUtcharan+" "+LOC_StringTWOUtcharan+" "+Assamese_StringUtcharan+" "+ENDSTRINGUtcharan
					ThirdStringValued=FirstStringValued+" "+Assamese_StringFinal
				  ThirdStringValuedUtcharan=FirstStringValuedUtcharan+" "+Assamese_StringUtcharanFinal
				  Assamese_String=""
				  Assamese_StringUtcharan=""
				 ' elseif ConnectiveTermONE<>"with" Then
				 ' '' ' Response.Write "TAG $$%%##$$%%**(0)"
				 ' '' ' Response.Write QHStringUtcharan
				   ' Assamese_StringFinal=QHString+" "+ConnectiveTermONETranslation+" "+MODNounTermONE+" "+NounTermONE+" "+PronounTerm+" "+VerbTermONE+" "+LOC_StringONE+" "+MODNounTermTWO+" "+NounTermTWO+" "+AUXPronounTerm+" "+AuxVerbTermONE+" "+VerbTermTWO+" "+LOC_StringTWO+" "+AuxVerbTermTWO+" "+Assamese_String+" "+ENDSTRING
				  ' Assamese_StringUtcharanFinal=QHStringUtcharan+" "+ConnectiveTermONETranslationUtcharan+" "+MODNounTermONEUtcharan+" "+NounTermONEUtcharan+" "+PronounTermUtcharan+" "+VerbTermONEUtcharan+" "+LOC_StringONEUtcharan+" "+MODNounTermTWOUtcharan+" "+NounTermTWOUtcharan+" "+AUXPronounTermUtcharan+" "+AuxVerbTermONEUtcharan+" "+VerbTermTWOUtcharan+" "+AuxVerbTermTWOUtcharan+" "+LOC_StringTWOUtcharan+" "+Assamese_StringUtcharan+" "+ENDSTRINGUtcharan
				  ' ThirdStringValued=FirstStringValued+" "+Assamese_StringFinal
				  ' ThirdStringValuedUtcharan=FirstStringValuedUtcharan+" "+Assamese_StringUtcharanFinal
				  
				  ' Assamese_String=""
				   ' Assamese_StringUtcharan=""
				  else
				  Assamese_StringFinal=QHString+" "+MODNounTermONE+" "+NounTermONE+" "+PronounTerm+" "+VerbTermONE+" "+LOC_StringONE+" "+MODNounTermTWO+" "+NounTermTWO+" "+AUXPronounTerm+" "+AuxVerbTermONE+" "+VerbTermTWO+" "+LOC_StringTWO+" "+AuxVerbTermTWO+" "+Assamese_String+" "+ENDSTRING+" "+ConnectiveTermONETranslation
				  Assamese_StringUtcharanFinal=QHStringUtcharan+" "+MODNounTermONEUtcharan+" "+NounTermONEUtcharan+" "+PronounTermUtcharan+" "+VerbTermONEUtcharan+" "+LOC_StringONEUtcharan+" "+MODNounTermTWOUtcharan+" "+NounTermTWOUtcharan+" "+AUXPronounTermUtcharan+" "+AuxVerbTermONEUtcharan+" "+VerbTermTWOUtcharan+" "+AuxVerbTermTWOUtcharan+" "+LOC_StringTWOUtcharan+" "+Assamese_StringUtcharan+" "+ENDSTRINGUtcharan+" "+ConnectiveTermONETranslationUtcharan
				  ThirdStringValued=FirstStringValued+" "+Assamese_StringFinal
				  ThirdStringValuedUtcharan=FirstStringValuedUtcharan+" "+Assamese_StringUtcharanFinal
				  
				  Assamese_String=""
				   Assamese_StringUtcharan=""
				 end if
				 AuxVerbTermONE=""
				  AuxVerbTermTWO=""
				  AuxVerbTermONEUtcharan=""
				  AuxVerbTermTWOUtcharan=""
		 elseif CountingPhrases=3 and Phrases2=";" and Phrases1=";" Then
				 '' ' Response.write "ff"
				  Assamese_StringFinal=QHString+" "+MODNounTermONE+" "+NounTermONE+" "+PronounTerm+" "+VerbTermONE+" "+LOC_StringONE+" "+MODNounTermTWO+" "+NounTermTWO+" "+AUXPronounTerm+" "+AuxVerbTermONE+" "+VerbTermTWO+" "+LOC_StringTWO+" "+AuxVerbTermTWO+" "+Assamese_String+" "+ENDSTRING+" "+ConnectiveTermONETranslation
				  Assamese_StringUtcharanFinal=QHStringUtcharan+" "+MODNounTermONEUtcharan+" "+NounTermONEUtcharan+" "+PronounTermUtcharan+" "+VerbTermONEUtcharan+" "+LOC_StringONEUtcharan+" "+MODNounTermTWOUtcharan+" "+NounTermTWOUtcharan+" "+AUXPronounTermUtcharan+" "+AuxVerbTermONEUtcharan+" "+VerbTermTWOUtcharan+" "+AuxVerbTermTWOUtcharan+" "+LOC_StringTWOUtcharan+" "+Assamese_StringUtcharan+" "+ENDSTRINGUtcharan+" "+ConnectiveTermONETranslationUtcharan
				  ThirdStringValued=FirstStringValued+" "+Assamese_StringFinal
				  ThirdStringValuedUtcharan=FirstStringValuedUtcharan+" "+Assamese_StringUtcharanFinal
				  
				  Assamese_String=""
				   Assamese_StringUtcharan=""
				 
				 AuxVerbTermONE=""
				  AuxVerbTermTWO=""
				  AuxVerbTermONEUtcharan=""
				  AuxVerbTermTWOUtcharan=""	 
		 elseif CountingPhrases=2  and Phrases2<>";" Then 
		 
				if ConnectiveTermONE="to" Then
				  Assamese_StringFinal=QHString+" "+ConnectiveTermONETranslation+" "+MODNounTermONE+" "+NounTermONE+" "+PronounTerm+" "+VerbTermONE+" "+LOC_StringONE+" "+MODNounTermTWO+" "+NounTermTWO+" "+AUXPronounTerm+" "+AuxVerbTermONE+" "+VerbTermTWO+" "+LOC_StringTWO+" "+AuxVerbTermTWO+" "+Assamese_String+" "+ENDSTRING
				  Assamese_StringUtcharanFinal=QHStringUtcharan+" "+ConnectiveTermONETranslationUtcharan+" "+MODNounTermONEUtcharan+" "+NounTermONEUtcharan+" "+PronounTermUtcharan+" "+VerbTermONEUtcharan+" "+LOC_StringONEUtcharan+" "+MODNounTermTWOUtcharan+" "+NounTermTWOUtcharan+" "+AUXPronounTermUtcharan+" "+AuxVerbTermONEUtcharan+" "+VerbTermTWOUtcharan+" "+AuxVerbTermTWOUtcharan+" "+LOC_StringTWOUtcharan+" "+Assamese_StringUtcharan+" "+ENDSTRINGUtcharan
				  SecondStringValued=FirstStringValued+" "+Assamese_StringFinal
				  SecondStringValuedUtcharan=FirstStringValuedUtcharan+" "+Assamese_StringUtcharanFinal
				  Assamese_String=""
				   Assamese_StringUtcharan=""
				else
					Assamese_StringFinal=QHString+" "+ConnectiveTermONETranslation+" "+MODNounTermONE+" "+NounTermONE+" "+PronounTerm+" "+VerbTermONE+" "+LOC_StringONE+" "+MODNounTermTWO+" "+NounTermTWO+" "+AUXPronounTerm+" "+AuxVerbTermONE+" "+VerbTermTWO+" "+LOC_StringTWO+" "+AuxVerbTermTWO+" "+Assamese_String+" "+ENDSTRING
				  Assamese_StringUtcharanFinal=QHStringUtcharan+" "+ConnectiveTermONETranslationUtcharan+" "+MODNounTermONEUtcharan+" "+NounTermONEUtcharan+" "+PronounTermUtcharan+" "+VerbTermONEUtcharan+" "+LOC_StringONEUtcharan+" "+MODNounTermTWOUtcharan+" "+NounTermTWOUtcharan+" "+AUXPronounTermUtcharan+" "+AuxVerbTermONEUtcharan+" "+VerbTermTWOUtcharan+" "+AuxVerbTermTWOUtcharan+" "+LOC_StringTWOUtcharan+" "+Assamese_StringUtcharan+" "+ENDSTRINGUtcharan
				  SecondStringValued=FirstStringValued+" "+Assamese_StringFinal
				  SecondStringValuedUtcharan=FirstStringValuedUtcharan+" "+Assamese_StringUtcharanFinal
				  Assamese_String=""
				   Assamese_StringUtcharan=""
				 end if
				 AuxVerbTermONE=""
				  AuxVerbTermTWO=""
				  AuxVerbTermONEUtcharan=""
				  AuxVerbTermTWOUtcharan=""
		elseif CountingPhrases=1 and Phrases1<>";" Then
				
				 Assamese_StringFinal=QHString+" "+MODNounTermONE+" "+NounTermONE+" "+PronounTerm+" "+VerbTermONE+" "+LOC_StringONE+" "+MODNounTermTWO+" "+NounTermTWO+" "+AUXPronounTerm+" "+AuxVerbTermONE+" "+VerbTermTWO+" "+LOC_StringTWO+" "+AuxVerbTermTWO+" "+Assamese_String+" "+ENDSTRING
				  Assamese_StringUtcharanFinal=QHStringUtcharan+" "+MODNounTermONEUtcharan+" "+NounTermONEUtcharan+" "+PronounTermUtcharan+" "+VerbTermONEUtcharan+" "+LOC_StringONEUtcharan+" "+MODNounTermTWOUtcharan+" "+NounTermTWOUtcharan+" "+AUXPronounTermUtcharan+" "+AuxVerbTermONEUtcharan+" "+VerbTermTWOUtcharan+" "+AuxVerbTermTWOUtcharan+" "+LOC_StringTWOUtcharan+" "+Assamese_StringUtcharan+" "+ENDSTRINGUtcharan
				  FirstStringValued=Assamese_StringFinal
				  FirstStringValuedUtcharan=Assamese_StringUtcharanFinal
				   
				  Assamese_String=""
				   Assamese_StringUtcharan=""
				  AuxVerbTermONE=""
				  AuxVerbTermTWO=""
				  AuxVerbTermONEUtcharan=""
				  AuxVerbTermTWOUtcharan=""
				 
		end if
	
	
	end if
     ' if Len(Assamese_String)=0 and Len(QHString)=0 Then
	   ' Assamese_String="Unrecognised"
	   ' QHString="sentences"
	' end if
	if Len(auxverb)=0 Then
		auxverb=""
	end if
	 
	
	 
	 '' ' Response.Write "/CountingPhrases"
	 '' ' Response.Write CountingPhrases
	 if CountingPhrases=3 and Phrases2<>";"  Then
		     
	       
			 
			 Assamese_String=""
			 Assamese_StringUtcharan=""
			 ' ' Response.Write("<br>The generated Assamese Translation is:<br>") 
			 if FoundatleastoneQH=1 Then
			  ThirdStringValued=ThirdStringValued+" ?"
			  ' ' Response.Write("<font face=ariel color=black size=5>"+ThirdStringValued+" </font><br>") 
			 else
			    ThirdStringValued=ThirdStringValued+" ।"
				' ' Response.Write("<font face=ariel color=black size=5>"+ThirdStringValued+" </font><br>")
			 end if
			 ' ' Response.Write("<font face=ariel color=black size=5>"+ThirdStringValuedUtcharan+" "+" </font><br>") 
			 
		     
			
	 elseif CountingPhrases=3 and Phrases2=";"  Then
			
			 
			 
			Assamese_String=""
			 Assamese_StringUtcharan=""
			 ' ' Response.Write("<br>The generated Assamese Translation is:") 
			 if FoundatleastoneQH=1 Then
			  ThirdStringValued=ThirdStringValued+" ?"
			  ' ' Response.Write("<font face=ariel color=black size=5>"+ThirdStringValued+" </font><br>") 
			 else
			    ThirdStringValued=ThirdStringValued+" ।"
				' ' Response.Write("<font face=ariel color=black size=5>"+ThirdStringValued+" </font><br>")
			 end if
			
			 
			 
				
			 ' ' Response.Write("(<font face=ariel color=black size=5>"+ThirdStringValuedUtcharan+" "+" "+" </font>)") 
			 
	 
		
	 elseif CountingPhrases=2 and Phrases2<>";" Then 
	 
			 Assamese_String=""
			 Assamese_StringUtcharan=""
			' ' ' Response.Write("<font face=ariel color=green size=8>"+SecondStringValued+" "+" "+" </font>") 
			 '' ' Response.Write(" <br>The generated Assamese Pronunciation is: ")
			
				
			 '' ' Response.Write("<font face=ariel color=green size=8>"+SecondStringValuedUtcharan+" "+" </font>")
			 
			 
	elseif CountingPhrases=1 and Phrases1<>";" Then
			 Assamese_String=""
			 Assamese_StringUtcharan=""
			
			 '' ' Response.Write("<font face=ariel color=blue size=8>"+FirstStringValued+" "+" "+" </font>") 
			 '' ' Response.Write(" <br>The generated Assamese Pronunciation is: ")
			
				
			' ' ' Response.Write("<font face=ariel color=blue size=8>"+FirstStringValuedUtcharan+" "+" </font>")
			 
	end if
	
	
	
	
	Next            ''END OF A PHRASE
	
	AmbiguityTermDone=AmbiguityTermDone+1
	AmbiguityTerm=AmbiguityTerm+1
	
	
	Loop While AmbiguityTermDone<=AmbiguityTermExist             ''End of ONE AmbiguityTerm
	             
	' ' Response.Cookies("AsStrUtchnew")=ThirdStringValuedUtcharan
	' ' Response.Cookies("QHStrUtchnew")=""
	
	
    end if     '' End of Final Search
	
	
	'' ' Response.write "<br>Components are :<br>"
	TemporaryThirdStringValued=ThirdStringValued
	TemporaryThirdStringValued=Replace(TemporaryThirdStringValued," ",".")
	'' ' Response.write TemporaryThirdStringValued
	'VowelsAssamese= া       ি      ী    ু   ূ   ৃ    ে    ৈ      ো      ৌ   
	ComplexVowel=0
	BlankSpace=0
	Voice=""
	for i=1 to Len(TemporaryThirdStringValued)
		
		
		
	    ComplexVowel=0
		BlankSpace=0
	    data=Right(Left(TemporaryThirdStringValued,i),1)
		
		dataNext=Right(Left(TemporaryThirdStringValued,i+1),1)
		dataPrev=Right(Left(TemporaryThirdStringValued,i-1),1)
		
		
		' ' Response.Write data
		' ' Response.Write " "
		
		if dataNext="া" or dataNext="ি"  or dataNext="ী" or dataNext="ু" or dataNext="ূ" or dataNext="ৃ" or dataNext="ে" or dataNext="ৈ"  or dataNext="ো" or dataNext="ৌ" Then
				'skip
				ComplexVowel=1
		
		
		elseif data="." and dataPrev<>"." Then
			BlankSpace=1
		elseif data="." and dataNext="." Then
			ComplexVowel=10
			BlankSpace=0
		elseif data="." and dataPrev="." Then
			ComplexVowel=10
			BlankSpace=0
		elseif dataNext="্" Then
			Voice=Voice+data+" "+"#"
			ComplexVowel=2
		elseif data="্" Then
			'pass
		else
			ComplexVowel=0
		end if
		
		
		
		if  data="া" or data="ি"  or data="ী" or data="্" or data="ু" or data="ূ" or data="ৃ" or data="ে" or data="ৈ"  or data="ো" or data="ৌ" Then
				'skip
				
		
		elseif ComplexVowel=0 Then
			'' ' Response.write data              'NOT for Jyutakhor
			Voice=Voice+data
		elseif ComplexVowel=1 and BlankSpace=0 Then
			'' ' Response.write Right(Left(TemporaryThirdStringValued,i+1),2)
			Voice=Voice+Right(Left(TemporaryThirdStringValued,i+1),2)
		
		elseif BlankSpace=1 Then	
			Voice=Voice+"."
		end if
		' ' Response.write " "
		Voice=Voice+" "
	next
	' Adding Buffer
	Voice=Voice+"."
	
	' ' Response.write "</div>"
	' ' Response.write "</div>"
	' ' Response.Write Voice
	' ' Response.Write ("<br>")
		 matra=Array("","া","ি","ী","ু","ূ","ৃ","ে","ৈ","ো","ৌ")   
		 
		 
		 DataSet=Array("অ","আ","ই","ঈ","উ","ঊ","ঋ","এ","ঐ","ও","ঔ","ক","খ","গ","ঘ","ঙ","চ","ছ","জ","ঝ","ঞ","ট","ঠ","ড","ঢ","ণ","ত","থ","দ","ধ","ন","প","ফ","ব","ভ","ম","য","ৰ","ল","ৱ","শ","ষ","স","হ","ক্ষ","য়","ড়","ঢ়","ৎ")
		 
		 AddressString=""
		 VoiceArray=split(Voice," ")
		 VoiceLength=0
		 
		 for each item in VoiceArray
		    if item=" " Then
			else
				VoiceLength=VoiceLength+1
			end if
		 next
		 '' ' Response.write "Voice:"
		
		 for i=0 to VoiceLength-1 
		  '  ' ' Response.write i
			'' ' Response.write ":"
			'' ' Response.write VoiceArray(i)+" "
		 next
		 '
		 
		 DataSetVoice=Array("","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","")
		 
		 
		 countData=0
		 
		 
		for j=0 to 10
			for i=0 to 48 
				DataSetVoice(countData)=DataSet(i)+matra(j)
				' ' ' Response.Write(countData)
				 '' ' Response.Write(" ")
				' ' ' Response.Write(DataSetVoice(countData))
				 ' ' ' Response.Write("<br/>")
				countData=countData+1
			next
		 next
		 
		 
		 
		 for j=0 to VoiceLength-2
		   for i=0 to CountData
			
				if VoiceArray(j)=DataSetVoice(i) Then
					
				end if
			next
		 next
		 
		 
		 
		 
		 
		 for j=0 to VoiceLength-2      ' subtract additional buffer
		   for i=0 to CountData-1
		        Lenofdata=0
				
			    if j<2 Then Lenofdata=j else Lenofdata=j-2 end if
				
				if VoiceArray(j)=DataSetVoice(i) and  ( ( VoiceArray(j+1)="." and VoiceArray(Lenofdata)<>"#" ) or VoiceArray(j+1)="#" ) Then
					' adding silent voices
					'' ' ' Response.write Lenofdata
					'' ' ' Response.write " "
					if VoiceArray(j)="ক" Then 
						AddressString=AddressString+"750"+" " 
					elseif VoiceArray(j)="খ" Then
						AddressString=AddressString+"751"+" " 
					elseif VoiceArray(j)="গ" Then
						AddressString=AddressString+"752"+" " 
					elseif VoiceArray(j)="ঘ" Then
						AddressString=AddressString+"753"+" " 
					 
					elseif VoiceArray(j)="চ" Then
						AddressString=AddressString+"754"+" " 
					elseif VoiceArray(j)="ছ" Then
						AddressString=AddressString+"755"+" " 
					elseif VoiceArray(j)="জ" Then
						AddressString=AddressString+"756"+" " 
					elseif VoiceArray(j)="ঝ" Then
						AddressString=AddressString+"757"+" " 
					elseif VoiceArray(j)="ঞ" Then
						AddressString=AddressString+"758"+" " 
					elseif VoiceArray(j)="ট" Then
						AddressString=AddressString+"759"+" " 
					elseif VoiceArray(j)="ঠ" Then
						AddressString=AddressString+"760"+" " 
					elseif VoiceArray(j)="ড" Then
						AddressString=AddressString+"761"+" " 
					elseif VoiceArray(j)="ঢ" Then
						AddressString=AddressString+"762"+" " 
					elseif VoiceArray(j)="ণ" Then
						AddressString=AddressString+"763"+" " 
					elseif VoiceArray(j)="ত" Then
						AddressString=AddressString+"764"+" " 
					elseif VoiceArray(j)="থ" Then
						AddressString=AddressString+"765"+" " 
					elseif VoiceArray(j)="দ" Then
						AddressString=AddressString+"766"+" " 
					elseif VoiceArray(j)="ধ" Then
						AddressString=AddressString+"767"+" " 
					elseif VoiceArray(j)="ন" Then
						AddressString=AddressString+"768"+" " 
					elseif VoiceArray(j)="প" Then
						AddressString=AddressString+"769"+" " 
					elseif VoiceArray(j)="ফ" Then
						AddressString=AddressString+"770"+" " 
					
					elseif VoiceArray(j)="ভ" Then
						AddressString=AddressString+"772"+" " 
					elseif VoiceArray(j)="ম" Then
						AddressString=AddressString+"773"+" " 
					elseif VoiceArray(j)="য" Then
						AddressString=AddressString+"774"+" " 
					elseif VoiceArray(j)="ৰ" Then
						AddressString=AddressString+"775"+" " 
					elseif VoiceArray(j)="ল" Then
						AddressString=AddressString+"776"+" " 
					elseif VoiceArray(j)="ৱ" Then
						AddressString=AddressString+"777"+" " 
					elseif VoiceArray(j)="শ" Then
						AddressString=AddressString+"778"+" " 
					elseif VoiceArray(j)="ষ" Then
						AddressString=AddressString+"779"+" " 
					elseif VoiceArray(j)="স" Then
						AddressString=AddressString+"780"+" " 
					elseif VoiceArray(j)="হ" Then
						AddressString=AddressString+"781"+" " 
					elseif VoiceArray(j)="য়" Then
						AddressString=AddressString+"782"+" " 
					'
					end if
			 elseif VoiceArray(j)=DataSetVoice(i) Then
							AddressString=AddressString+CStr(i)+" "
			 else
						if VoiceArray(j)="ক্" Then
							AddressString=AddressString+"750"+" " 
						elseif VoiceArray(j)="খ্" Then
							AddressString=AddressString+"751"+" " 
						elseif VoiceArray(j)="গ্" Then
							AddressString=AddressString+"752"+" " 
						elseif VoiceArray(j)="ঘ্" Then
							AddressString=AddressString+"753"+" " 
						 
						elseif VoiceArray(j)="চ্" Then
							AddressString=AddressString+"754"+" " 
						elseif VoiceArray(j)="ছ্" Then
							AddressString=AddressString+"755"+" " 
						elseif VoiceArray(j)="জ্" Then
							AddressString=AddressString+"756"+" " 
						elseif VoiceArray(j)="ঝ্" Then
							AddressString=AddressString+"757"+" " 
						elseif VoiceArray(j)="ঞ্" Then
							AddressString=AddressString+"758"+" " 
						elseif VoiceArray(j)="ট্" Then
							AddressString=AddressString+"759"+" " 
						elseif VoiceArray(j)="ঠ্" Then
							AddressString=AddressString+"760"+" " 
						elseif VoiceArray(j)="ড্" Then
							AddressString=AddressString+"761"+" " 
						elseif VoiceArray(j)="ঢ্" Then
							AddressString=AddressString+"762"+" " 
						elseif VoiceArray(j)="ণ্" Then
							AddressString=AddressString+"763"+" " 
						elseif VoiceArray(j)="ত্" Then
							AddressString=AddressString+"764"+" " 
						elseif VoiceArray(j)="থ্" Then
							AddressString=AddressString+"765"+" " 
						elseif VoiceArray(j)="দ্" Then
							AddressString=AddressString+"766"+" " 
						elseif VoiceArray(j)="ধ্" Then
							AddressString=AddressString+"767"+" " 
						elseif VoiceArray(j)="ন্" Then
							AddressString=AddressString+"768"+" " 
						elseif VoiceArray(j)="প্" Then
							AddressString=AddressString+"769"+" " 
						elseif VoiceArray(j)="ফ্" Then
							AddressString=AddressString+"770"+" " 
						
						elseif VoiceArray(j)="ভ্" Then
							AddressString=AddressString+"772"+" " 
						elseif VoiceArray(j)="ম্" Then
							AddressString=AddressString+"773"+" " 
						'elseif VoiceArray(j)="য" Then
							'AddressString=AddressString+"774"+" " 
						elseif VoiceArray(j)="ৰ্" Then
							AddressString=AddressString+"775"+" " 
						elseif VoiceArray(j)="ল্" Then
							AddressString=AddressString+"776"+" " 
						'elseif VoiceArray(j)="ৱ" Then
							'AddressString=AddressString+"777"+" " 
						elseif VoiceArray(j)="শ্" Then
							AddressString=AddressString+"778"+" " 
						elseif VoiceArray(j)="ষ্" Then
							AddressString=AddressString+"779"+" " 
						elseif VoiceArray(j)="স্" Then
							AddressString=AddressString+"780"+" " 
						elseif VoiceArray(j)="হ্" Then
							AddressString=AddressString+"781"+" " 
						''elseif VoiceArray(j)="য়" Then
							'AddressString=AddressString+"782"+" " 
					    end if
				
				
			    
				end if
			next
			
			if VoiceArray(j)="." Then
					AddressString=AddressString+"749"+" "      'address of . file 749
			end if
		 next
	        max=100
			min=1
			Randomize
			usernumber=Int((max-min+1)*Rnd+min)
			
			rs.open
			rs.close
			
		
		'' ' ' Response.Write AddressString
       ' ' ' ' Response.Redirect ("http://localhost:81/aanademo/EngSound.aspx?Org="+Request.QueryString("eng_text")+"&TL="+ThirdStringValued+"&Utch="+ThirdStringValuedUtcharan+"&Voice="+AddressString+"&User="+CStr(usernumber))
		'' ' ' Response.Write ("http://localhost:81/aanademo/EngSound.aspx?Org="+Request.QueryString("eng_text")+"&TL="+ThirdStringValued+"&Utch="+ThirdStringValuedUtcharan+"&Voice="+AddressString)
	
	
	EngData=Request.Form("Testmsg"+CStr(MessageLocal))
	AssameseData=ThirdStringValued
    if EngData<>"Default_Type" Then
		
		sql="insert into tab_test (EnglishInput,AssameseOutput)values ('" & EngData & "','" & AssameseData & "')"
			
		Conn.Execute(sql)
    end if		
	
	Conn.close
	
	
	
	
	Next '' MessageLocal
	%>

	 Thank you!. Have a nice day.
	 
	 
	 
	
	 
</body>
</html>