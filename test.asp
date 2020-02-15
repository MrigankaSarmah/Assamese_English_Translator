
<!DOCTYPE html>
<%@ CODEPAGE=65001%>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html;charset=UTF-8">
<TITLE>tab_additional</TITLE>
</HEAD>
<html>
<body>
<script>
document.cookie="AsStrUtch=x;"
document.cookie="QHStrUtch=y;"
</script>
<%
Set Conn = Server.CreateObject("ADODB.Connection")
DSNtest="DRIVER={Microsoft Access Driver (*.mdb)}; "
DSNtest=dsntest & "DBQ=C:\inetpub\wwwroot\aanademo\aananlp.mdb" 
Conn.Open DSNtest
%>
<%  Assamese_String=""
    set rs = Server.CreateObject("ADODB.recordset")%>
    
    <table border="1" width="10%" ><FONT FACE="GIST-SND-DVOTDhruv" COLOR=#000000>
	<% Response.Write("string in english is: <font face=ariel color=blue size=8 >"+Request.QueryString("eng_text")+"</font>") %>
	<% eng_str=Request.QueryString("eng_text")+" ;"
	   eng_array=split(eng_str," ")
	   
	   'Finding Phrases in a Sentence(Max. 3)
	   ' separators such as for/if/and/but/because/until/unless
	   Phrases1=""
	   Phrases2=""
	   Phrases3=""
	   ConnectiveTermONE=""
	   ConnectiveTermTWO=""
	   ConnectiveTermTHREE=""
	   count=0
	   tempcount=0
	   for each elm in eng_array 
		
			if elm="to" or elm="for" or elm="but" or elm="because" or elm="untill" or elm="unless" or elm="if" Then
				
				if Phrases1="" Then
					ConnectiveTermONE=elm
					For i=0 to count-1
						Phrases1=Phrases1+eng_array(i)+" "
						tempcount=tempcount+1
					Next
				elseif Phrases2="" Then
					ConnectiveTermTWO=elm
					For i=tempcount+1 to count-1
						Phrases2=Phrases2+eng_array(i)+" "
						tempcount=tempcount+1
					Next
				end if
			elseif elm=";" and Phrases1="" Then
					ConnectiveTermTHREE=elm
					For i=tempcount to count
						Phrases3=Phrases3+eng_array(i)+" "
						tempcount=tempcount+1
					Next
			elseif elm=";" and Phrases2<>"" Then
					ConnectiveTermTHREE=elm
					For i=tempcount+2 to count
						Phrases3=Phrases3+eng_array(i)+" "
						tempcount=tempcount+1
					Next
			elseif elm=";" Then
					For i=tempcount+1 to count
						Phrases3=Phrases3+eng_array(i)+" "
						tempcount=tempcount+1
					Next
			end if
			count=count+1
	   next
	   Response.Write("//First Phrase is: <font face=ariel color=cyan size=2 >"+Phrases1+"</font>//")
	   Response.Write("//Second Phrase is: <font face=ariel color=cyan size=2 >"+Phrases2+"</font>//")
	   Response.Write("//Third Phrase is: <font face=ariel color=cyan size=2 >"+Phrases3+"</font>//")
	   
	   
	   ElementCount=0
	   sglr=0
	   plrl=0
	   heavy=0
	   light=0
	   foundthis=0
	   founda=0
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
	   foundpronoun=0
	   theafterto=0
	   translationnounafterto=""
	   verbafterto=0
	   QHString=""
	   foundfrom=0
	   tempto=0
	   moneymatters=0
	   foundhowwhat=0
	   foundhow=0
	   foundare=0
	   foundmoney=0
	   foundnoun=0
	   foundQH=0
	   foundnot=0
	   foundauxnot=0
	   foundTHE=0
	   foundMove=0
	   actor1=-1
	   actor2=-1
	   actor3=-1
       BeginQst=0
		ENDSTRING=""
		ENDSTRINGUtcharan=""
	   NounTerm=""
	   PronounTerm=""
	   AUXPronounTerm=""
                 VerbTerm=""
                 ArticleTerm=""
                 AdjectiveTerm=""
                 AuxVerbTerm=""
                 ConnectiveTerm=""

		Assamese_StringUtcharan=""
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
		NounTermTWO=""
		VerbTermONE=""
		VerbTermTWO=""
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
	   Response.Write "/First Element is:/"+eng_array(0)+"/"
	   
	   
	   
	   if  StrComp(eng_array(0),"is",0)=0 or StrComp(eng_array(0),"are",0)=0 or StrComp(eng_array(0),"was",0)=0 or StrComp(eng_array(0),"were",0)=0 or StrComp(eng_array(0),"will",0)=0  or StrComp(eng_array(0),"would",0)=0 or StrComp(eng_array(0),"shall",0)=0 or StrComp(eng_array(0),"should",0)=0 or StrComp(eng_array(0),"can",0)=0 or StrComp(eng_array(0),"could",0)=0 Then
	    QHString=" "
        BeginQst=1         
	   end if
	   if StrComp(eng_array(0),"do")=0  or StrComp(eng_array(0),"does")=0 Then
	    QHString=" "
         ftre=1 
		 BeginQst=1
	   end if
	   if  StrComp(eng_array(0),"did")=0 Then
	    QHString=" "
         pst=1 
		 BeginQst=1
	   end if
	   if StrComp(eng_array(0),"have")=0  or StrComp(eng_array(0),"had")=0  Then
	    QHString=" "
		BeginQst=1
         pst=1      
	   end if
	   
	   
	   For each elm in eng_array
			Response.Write elm
			
	   next
	   
	   For each elm in eng_array
	      ' for noun words
		  ElementCount=ElementCount+1
		  Response.Write "/"+elm+"/#"
		  Response.Write ElementCount
		 if elm="the" Then
			fdthe=1
		 elseif elm="this" Then
			fdthis=1
		 elseif elm="is" Then
			fdis=1
		 elseif elm="was" Then
			fdwas=1
		 end if
		 if elm="here" or elm="there" Then
			if  eng_array(ElementCount-2)="go" or eng_array(ElementCount-2)="move" or eng_array(ElementCount-2)="run" or eng_array(ElementCount-2)="walk" or eng_array(ElementCount-2)="drive" or eng_array(ElementCount-2)="ride" or eng_array(ElementCount-2)="cycle" Then
		        Response.Write "/"+elm+"/@"
		        Response.Write ElementCount
				foundMove=1
			end if
			if  eng_array(ElementCount-2)="going" or eng_array(ElementCount-2)="moving" or eng_array(ElementCount-2)="running" or eng_array(ElementCount-2)="walking" or eng_array(ElementCount-2)="driving" or eng_array(ElementCount-2)="riding" or eng_array(ElementCount-2)="cycling" Then
		        Response.Write "/"+elm+"/@"
		        Response.Write ElementCount
				foundMove=1
			end if
			if  eng_array(ElementCount-2)="gone" or eng_array(ElementCount-2)="moved" or eng_array(ElementCount-2)="ran" or eng_array(ElementCount-2)="walked" or eng_array(ElementCount-2)="driven" or eng_array(ElementCount-2)="rode" or eng_array(ElementCount-2)="cycled" Then
		        Response.Write "/"+elm+"/@"
		        Response.Write ElementCount
				foundMove=1
			end if
		 end if
	     if fdthe=1 Then	 
     		 if fdis=1 Then
					ENDSTRING="আছে"
					ENDSTRINGUtcharan="aase"
				elseif fdwas=1 Then
					ENDSTRING="আছিল"
					ENDSTRINGUtcharan="aasil"
				end if
		 elseif fdthis=1 Then
				if fdis=1 Then
					ENDSTRING="হয়"
					ENDSTRINGUtcharan="hoi"
				elseif fdwas=1 Then
					ENDSTRING="আছিল"
					ENDSTRINGUtcharan="aasil"
				end if
		 elseif fdis=1 and ENDSTRING="" Then
			ENDSTRING="হয়"
			ENDSTRINGUtcharan="hoi"
		 end if
		  
		  if  StrComp(elm,"dont")=0 or StrComp(elm,"don't")=0 or StrComp(elm,"won't")=0 or StrComp(elm,"wont")=0 or StrComp(elm,"cant")=0 or StrComp(elm,"can't")=0 or StrComp(elm,"shan't")=0 or StrComp(elm,"shant")=0 Then
	       if foundnot= 1 Then
				foundauxnot=1
		   end if
		   foundnot=1 
            ftre=1
		    tense="ftre"		   
	         Response.Write "/NEG/"
			 if elm="don't" Then
			  elm="dont"
			 end if
			 if elm="won't" Then
			  elm="wont"
			 end if
			 if elm="can't" Then
			  elm="cant"
			 end if
		   elseif  StrComp(elm,"not")=0 Then 
			if foundnot= 1 Then
				foundauxnot=1
		    end if
			foundnot=1 
            Response.Write "/NEG/"   
	       end if
		  if StrComp(elm,"the")=0 or StrComp(elm,"a")=0 Then
		    thirdpersonaux=1
		  end if
		  if StrComp(elm,"how")=0 or StrComp(elm,"what")=0 Then
		     foundhow=1
			 if StrComp(elm,"what")=0 Then
			   foundhowwhat=1
		     end if
		  end if
	     if StrComp(elm,"are")=0 Then
		  foundare=1
		 end if
		 if StrComp(elm,"money")=0 or StrComp(elm,"cost")=0 or StrComp(elm,"price")=0 or StrComp(elm,"rupees")=0 Then
		      foundmoney=1
		  end if
	      
		  if StrComp(elm,"from")=0 Then
		    foundfrom=1
                    
	       end if
		   
		   if foundfrom=1 and ( StrComp(elm,"here")=0 or StrComp(elm,"there")=0 ) Then
                    Response.Write "foundfrom"
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
           elseif ( StrComp(elm,"there")=0 or StrComp(elm,"here")=0 ) and  foundfrom=0 Then
                    Response.Write foundfrom
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
	      end if
	      if elm = "where" or elm="how" or elm="when" or elm="what" or elm="why" Then
		       	    
					 if ElementCount < 2 Then 
						foundQH=1
						rs.Open "Select translation,translationUtcharan from tab_additional where english='"+elm+"'", Conn 
						QHString=QHString+rs.Fields(0).value+" " 
						QHStringUtcharan=QHStringUtcharan+rs.Fields(1).value+" " 
						rs.close
					else
						foundQH=0
						rs.Open "Select translation,translationUtcharan from tab_additional where english='Je"+elm+"'", Conn 
						QHString=QHString+rs.Fields(0).value+" " 
						QHStringUtcharan=QHStringUtcharan+rs.Fields(1).value+" " 
						rs.close
					end if
		  end if
		   
	       rs.Open "Select root from tab_allnoun where words='"+elm+"'", Conn 
		   if rs.EOF Then
		   'do nothing
		   elseif Len(rs.Fields(0))>0 Then
				noun=rs.Fields(0).value
				foundnoun=1
				Response.Write "/NOUN:/"+noun
				if verbafterto=1 or foundto=1 Then
				  nounafterto=1
				 
				end if
           end if			
		   rs.close 
		   
		   
	        if StrComp(elm,noun) = 0 and foundto=1 Then
		      rs.Open "Select translation,singular,modifier_plural,heavylight,translationUtcharan,singularUtcharan from tab_noun where english='"+noun+"'", Conn 
			  if StrComp(rs.Fields(2),"loc")=0 Then
				locafterto=1
              end if
			  if foundTHE=0 Then
					NounTerm=NounTerm+rs.Fields(0).value
					NounTermUtcharan=NounTermUtcharan+rs.Fields(4).value
					if foundNounTermONE=0 Then
							NounTermONE=NounTerm
							NounTermONEUtcharan=NounTermUtcharan
							foundNounTermONE=1
							NounTerm=""
							NounTermUtcharan=""
						elseif foundNounTermTWO=0 Then
							NounTermTWO=NounTerm
							NounTermTWOUtcharan=NounTermUtcharan
							foundNounTermTWO=1
							NounTerm=""
							NounTermUtcharan=""
						end if
						
			  elseif foundTHE=1 Then
					NounTerm=NounTerm+rs.Fields(0).value+rs.Fields(1).value
					NounTermUtcharan=NounTermUtcharan+rs.Fields(4).value+rs.Fields(5).value
					if foundNounTermONE=0 Then
							NounTermONE=NounTerm
							NounTermONEUtcharan=NounTermUtcharan
							foundNounTermONE=1
							NounTerm=""
							NounTermUtcharan=""
						elseif foundNounTermTWO=0 Then
							NounTermTWO=NounTerm
							NounTermTWOUtcharan=NounTermUtcharan
							foundNounTermTWO=1
							NounTerm=""
							NounTermUtcharan=""
						end if
			  end if
			  if StrComp(rs.Fields(3),"h")=0 Then
			     heavy =1
			  elseif StrComp(rs.Fields(3),"l")=0 Then
			    light=1
			  end if
			  translationnounafterto=rs.Fields(0).value
			  sglr=1
			  ',thirdperson=1
                      rs.close 
		elseif StrComp(elm,noun+"s") = 0 or StrComp(elm,noun+"es") = 0 Then
			   plural=1
               thirdperson=1
			    
		         rs.Open "Select translation,plural,heavylight,translationUtcharan,singularUtcharan from tab_noun where english='"+noun+"'", Conn 
		         if foundfrom=1 Then
				   NounTerm=NounTerm+rs.Fields(0).value+"ৰপৰা  "
					NounTermUtcharan=NounTermUtcharan+rs.Fields(3).value+"rpora " 
					if foundNounTermONE=0 Then
							NounTermONE=NounTerm
							NounTermONEUtcharan=NounTermUtcharan
							foundNounTermONE=1
							NounTerm=""
							NounTermUtcharan=""
						elseif foundNounTermTWO=0 Then
							NounTermTWO=NounTerm
							NounTermTWOUtcharan=NounTermUtcharan
							foundNounTermTWO=1
							NounTerm=""
							NounTermUtcharan=""
						end if
				 else
				   if foundTHE=0 Then
						NounTerm=NounTerm+rs.Fields(0).value
						NounTermUtcharan=NounTermUtcharan+rs.Fields(3).value
						if foundNounTermONE=0 Then
							NounTermONE=NounTerm
							NounTermONEUtcharan=NounTermUtcharan
							foundNounTermONE=1
							NounTerm=""
							NounTermUtcharan=""
						elseif foundNounTermTWO=0 Then
							NounTermTWO=NounTerm
							NounTermTWOUtcharan=NounTermUtcharan
							foundNounTermTWO=1
							NounTerm=""
							NounTermUtcharan=""
						end if
					elseif foundTHE=1 Then
						NounTerm=NounTerm+rs.Fields(0).value+rs.Fields(1).value
						NounTermUtcharan=NounTermUtcharan+rs.Fields(3).value+rs.Fields(4).value	
						if foundNounTermONE=0 Then
							NounTermONE=NounTerm
							NounTermONEUtcharan=NounTermUtcharan
							foundNounTermONE=1
							NounTerm=""
							NounTermUtcharan=""
						elseif foundNounTermTWO=0 Then
							NounTermTWO=NounTerm
							NounTermTWOUtcharan=NounTermUtcharan
							foundNounTermTWO=1
							NounTerm=""
							NounTermUtcharan=""
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
						thirdperson=1
                         rs.Open "Select translation,singular,heavylight,translationUtcharan,singularUtcharan from tab_noun where english='"+noun+"'", Conn 
		                 if foundfrom=1 Then
						   NounTerm=NounTerm+rs.Fields(0).value+"ৰপৰা " 
						   NounTermUtcharan=NounTermUtcharan+rs.Fields(3).value+"rpora " 
						   if foundNounTermONE=0 Then
								NounTermONE=NounTerm
								NounTermONEUtcharan=NounTermUtcharan
								foundNounTermONE=1
								NounTerm=""
							NounTermUtcharan=""
							elseif foundNounTermTWO=0 Then
								NounTermTWO=NounTerm
								NounTermTWOUtcharan=NounTermUtcharan
								foundNounTermTWO=1
								NounTerm=""
							    NounTermUtcharan=""
							end if
						 else
						   if foundTHE=0 Then
								NounTerm=NounTerm+rs.Fields(0).value
								NounTermUtcharan=NounTermUtcharan+rs.Fields(3).value
								if foundNounTermONE=0 Then
									NounTermONE=NounTerm
									NounTermONEUtcharan=NounTermUtcharan
									foundNounTermONE=1
									NounTerm=""
									NounTermUtcharan=""
								elseif foundNounTermTWO=0 Then
									NounTermTWO=NounTerm
									NounTermTWOUtcharan=NounTermUtcharan
									foundNounTermTWO=1
									NounTerm=""
									NounTermUtcharan=""
								end if
							elseif foundTHE=1 Then
							    NounTerm=NounTerm+rs.Fields(0).value+rs.Fields(1).value
								NounTermUtcharan=NounTermUtcharan+rs.Fields(3).value+rs.Fields(4).value
								if foundNounTermONE=0 Then
									NounTermONE=NounTerm
									NounTermONEUtcharan=NounTermUtcharan
									foundNounTermONE=1
									NounTerm=""
									NounTermUtcharan=""
								elseif foundNounTermTWO=0 Then
									NounTermTWO=NounTerm
									NounTermTWOUtcharan=NounTermUtcharan
									foundNounTermTWO=1
									NounTerm=""
									NounTermUtcharan=""
								end if
							end if
                         end if
						 if StrComp(rs.Fields(2),"h")=0 Then
			               heavy =1
			             elseif StrComp(rs.Fields(2),"l")=0 Then
			               light=1
			             end if
						 rs.close
		end if
	   
	   ' search tense and mainverb
	          if StrComp(elm,"do")=0 or StrComp(elm,"done")=0 or StrComp(elm,"did")=0 or StrComp(elm,"does")=0 Then
                           'founddo=1 
              end if 
			  rs.Open "Select root,tense from tab_tenseverb where english='"+elm+"'", Conn 
		      
			  if rs.EOF Then
			  'do nothing
			  elseif Len(rs.Fields(0)) > 0 and mainverb="" Then
			   mainverb=rs.Fields(0).value
			   Response.Write "mainverb:"+mainverb
			   tense=rs.Fields(1).value
			     Response.Write "/tense:"+tense+"/ "
				 Response.Write "/mainverb NEGATIVE Procc./"
			  elseif Len(rs.Fields(0)) > 0 and mainverb<>"" Then
			   auxverb=rs.Fields(0).value
			    Response.Write "auxverb:"+auxverb+"/ "
			    tenseauxverb=rs.Fields(1).value
			    Response.Write "/auxtense:"+tenseauxverb+"/ "
				
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
			  if foundto=1 Then
				 thirdpersonaux=1
				end if
			  
              rs.close 
		   
	  
	  Response.Write mainverb
	  
	if StrComp(elm,"the") =0 Then
	  'do nothing
		foundTHE=1
		Response.Write "/foundTHE/"
	end if
	if StrComp(elm,"you") =0 or StrComp(elm,"your") =0 Then
	Response.Write "/you.."
	Response.Write actor1
	  if actor1=-1 Then
	   secondperson=1
	   sglr=1
	   foundpronoun=1
	   actor1=1
	  elseif actor1=1 Then
	    secondpersonaux=1
		actor2=1
		Response.Write "/acto2"
		Response.Write secondpersonaux
		Response.Write "/"
	  end if
      if StrComp(elm,"you")=0 Then
	    rs.Open "Select translation,translationUtcharan from tab_pronoun where words='"+elm+"'", Conn 
	    if StrComp(eng_array(ElementCount),"want")=0 or StrComp(eng_array(ElementCount),"need")=0 Then
		   if actor2=-1 Then
			PronounTerm=PronounTerm+"তোমাক " 
			PronounTermUtcharan=PronounTermUtcharan+"tumak " 
		   elseif actor2=1 Then
		    AUXPronounTerm=AUXPronounTerm+"তোমাক " 
			AUXPronounTermUtcharan=AUXPronounTermUtcharan+"tumak "
		   end if
		elseif StrComp(eng_array(ElementCount),"had")=0 or StrComp(eng_array(ElementCount),"did")=0 Then
		   if actor2=-1 Then
			PronounTerm=PronounTerm+"তোমাৰ " 
			PronounTermUtcharan=PronounTermUtcharan+"tumar " 
		   elseif actor2=1 Then
			AUXPronounTerm=AUXPronounTerm+"তোমাৰ " 
			AUXPronounTermUtcharan=AUXPronounTermUtcharan+"tumar " 
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
         rs.close 
	  end if
	end if
	
	if StrComp(elm,"he") =0  or StrComp(elm,"she")=0 or StrComp(elm,"her")=0 or StrComp(elm,"him")=0 or StrComp(elm,"his")=0 Then
	       rs.Open "Select translation,translationUtcharan from tab_pronoun where words='"+elm+"'", Conn 
		   if actor2=-1 Then
			PronounTerm=PronounTerm+rs.Fields(0).value+" "
			PronounTermUtcharan=PronounTermUtcharan+rs.Fields(1).value+" "
		   elseif actor2=1 Then
		    AUXPronounTerm=AUXPronounTerm+rs.Fields(0).value+" "
			AUXPronounTermUtcharan=AUXPronounTermUtcharan+rs.Fields(1).value+" "
		   end if
		   Response.Write "/"+rs.Fields(0).value+"/ "
           
		   if StrComp(elm,"her")=0 Then
		    if StrComp(eng_array(ElementCount),"to")=0 or StrComp(eng_array(ElementCount),";")=0 or StrComp(eng_array(ElementCount),"it")=0 or StrComp(eng_array(ElementCount),"that")=0 or StrComp(eng_array(ElementCount),"those")=0 or StrComp(eng_array(ElementCount),"this")=0 Then
			   if actor2=-1 Then
				PronounTerm=PronounTerm+"ক "
				PronounTermUtcharan=PronounTermUtcharan+"k "
			   elseif actor2=1 Then
				AUXPronounTerm=AUXPronounTerm+"ক "
				AUXPronounTermUtcharan=AUXPronounTermUtcharan+"k "
			   end if
			else
			   if actor2=-1 Then
				PronounTerm=PronounTerm+"ৰ "
				PronounTermUtcharan=PronounTermUtcharan+"r "
			   elseif actor2=1 Then
				AUXPronounTerm=AUXPronounTerm+"ৰ "
				AUXPronounTermUtcharan=AUXPronounTermUtcharan+"r "
			   end if
			end if
		   end if
		   Assamese_String=Assamese_String+" "
		   Assamese_StringUtcharan=Assamese_StringUtcharan+" "
		   rs.close
		   if actor1=-1 Then
	         thirdperson=1
	         sglr=1
	         foundpronoun=1
		     actor1=1
		   elseif actor1=1 Then
		     thirdpersonaux=1
			 actor2=1
		   end if
	       Response.Write thirdperson
		   
	end if
	if StrComp(elm,"i")=0  or StrComp(elm,"myself")=0 or StrComp(elm,"my")=0 Then
	  if actor1=-1 Then
	    firstperson=1
	    sglr=1
	    foundpronoun=1
		actor1=1
		Response.Write "/actor1.."
		
		Response.Write actor1
		Response.Write "/"
	  elseif actor1=1 Then
	    firstpersonaux=1
		actor2=1
	  end if
	  rs.Open "Select translation,translationUtcharan from tab_pronoun where words='"+elm+"'", Conn 
	  if StrComp(elm,"i")=0 Then
	    if StrComp(eng_array(ElementCount),"want")=0 or StrComp(eng_array(ElementCount),"need")=0 Then
		   if actor2=-1 Then
			PronounTerm=PronounTerm+"মোক " 
			PronounTermUtcharan=PronounTermUtcharan+"muk" 
	       elseif actor2=1 Then
		    AUXPronounTerm=AUXPronounTerm+"মোক " 
			AUXPronounTermUtcharan=AUXPronounTermUtcharan+"muk" 
		   end if
		elseif StrComp(eng_array(ElementCount),"had")=0 or StrComp(eng_array(ElementCount),"did")=0 Then
		    if actor2=-1 Then
				PronounTerm=PronounTerm+"মোৰ "
				PronounTermUtcharan=PronounTermUtcharan+"mur"
			elseif actor2=1 Then
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
	  
	  else
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
	if StrComp(elm,"me")=0  Then
	  if actor1=-1 Then
	    secondperson=1
	    sglr=1
	    foundpronoun=1
	  elseif actor2=0 Then
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
	if StrComp(elm,"we")= 0 Then
	  if actor1=-1 Then
	    firstperson=1
	    plrl=1
	    foundpronoun=1
	  elseif actor1=1 Then
	    firstpersonaux=1
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
	if StrComp(elm,"that")=0 Then
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
	if StrComp(elm,"they") =0 or StrComp(elm,"them")=0 or StrComp(elm,"these")=0 or StrComp(elm,"those")=0  Then
	  if actor1=-1 Then
	   thirdperson=1
	   plrl=1
	   foundpronoun=1
	  elseif actor2=0 Then
	   thirdpersonaux=1
	   actor2=1
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
		  ftre=1
		  tense="ftre"
		  ' rs.Open "Select future from tab_verb where verbs='"+mainverb+"_firstperson'", Conn 
           ' Assamese_String=Assamese_String+rs.Fields(0).value+" " 
           ' rs.close
	end if
	
	if StrComp(elm,"had") = 0 or StrComp(elm,"have") =0 or StrComp(elm,"has") =0   Then
		  pst=1
		  tense="pst"
		          rs.Open "Select translation,translationUtcharan from tab_additional where english='"+elm+"'", Conn 
                  Assamese_String=Assamese_String+rs.Fields(0).value+" " 
				   Assamese_StringUtcharan=Assamese_StringUtcharan+rs.Fields(1).value+" "
                  rs.close
				  
	end if
	


	if StrComp(elm,"welcome") = 0  Then
		  rs.Open "Select translation,translationUtcharan from tab_additional where english='"+elm+"'", Conn 
                  Assamese_String=Assamese_String+rs.Fields(0).value+" " 
				  Assamese_StringUtcharan=Assamese_StringUtcharan+rs.Fields(1).value+" " 
                  rs.close
		 
	end if
	'section to find to

	     
	     
		 if locafterto=1 and foundnoun=1 Then 
		    
			Response.Write "/To..noun/"+NounTerm+"/"
		    foundto=0
			foundnoun=0
			if foundNounTermONE=1 Then
									NounTermONE=NounTermONE+"লৈ"+ " "
									NounTermONEUtcharan=NounTermONEUtcharan+"loi"+ " "
									foundNounTermONE=1
								elseif foundNounTermTWO=1 Then
									NounTermTWO=NounTermTWO
									NounTermTWOUtcharan=NounTermTWOUtcharan+"loi"+ " "
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
	    if StrComp(elm,"to") =0 Then
		  Response.Write "found"
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
		elseif StrComp(elm,"will")=0  or StrComp(elm,"would")=0 or StrComp(elm,"shall")=0 or StrComp(elm,"should")=0 or StrComp(elm,"can")=0 or StrComp(elm,"could")=0 Then
		  Response.Write "found"
		  affirverb=1
		end if
		if elm="hi" or elm="hello" Then
		 Assamese_String=Assamese_String+"কেনে "
		 Assamese_StringUtcharan=Assamese_StringUtcharan+"kene "
		end if
		if elm="this" or elm="it" Then
		   foundthis=1
		elseif elm="a" Then
		   founda=1
		end if
	Next
	if foundhow=1 and foundare=1 and mainverb="" Then
					QHString="কেনে ?"
					QHStringUtcharan="kene ?"
	end if
	if foundhowwhat=1 and foundmoney=1 Then
		   	        QHString="কিমান দাম?"
					QHStringUtcharan="kiman dam?" 
	end if
    if foundthis=1 and heavy=1 Then
		          rs.Open "Select prefix_article,translation,prefix_articleUtcharan,translationUtcharan from tab_athis where article='this_heavy'", Conn 
                  Assamese_String=Assamese_String+rs.Fields(0).value+rs.Fields(1).value+" "
				  Assamese_StringUtcharan=Assamese_StringUtcharan+rs.Fields(2).value+rs.Fields(3).value+" "
                  rs.close
		end if
		if founda=1 and heavy=1 Then
		          rs.Open "Select prefix_article,translation,prefix_articleUtcharan,translationUtcharan from tab_athis where article='a_heavy'", Conn 
                  Assamese_String=Assamese_String+rs.Fields(0).value+rs.Fields(1).value+" "
				  Assamese_StringUtcharan=Assamese_StringUtcharan+rs.Fields(2).value+rs.Fields(3).value+" "
                  rs.close
		end if
		if foundthis=1 and light=1 Then
		          rs.Open "Select prefix_article,translation,prefix_articleUtcharan,translationUtcharan from tab_athis where article='this_light'", Conn 
                  Assamese_String=Assamese_String+rs.Fields(0).value+rs.Fields(1).value+" "
				  Assamese_StringUtcharan=Assamese_StringUtcharan+rs.Fields(2).value+rs.Fields(3).value+" "
                  rs.close
		end if
		if founda=1 and light=1 Then
		          rs.Open "Select prefix_article,translation,prefix_articleUtcharan,translationUtcharan from tab_athis where article='a_light'", Conn 
                  Assamese_String=Assamese_String+rs.Fields(0).value+rs.Fields(1).value+" "
				  Assamese_StringUtcharan=Assamese_StringUtcharan+rs.Fields(2).value+rs.Fields(3).value+" "
                  rs.close
		end if
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
		if firstperson=0 and secondperson=0  and thirdperson=0 Then
		  onlyRoot=99
		end if
		Response.Write auxverb
		Response.Write "/secondpersonaux"
		Response.Write secondpersonaux
		Response.Write "/"
		if firstpersonaux=0 and secondpersonaux=0  and thirdpersonaux=0 Then
		  firstpersonaux=99
		end if
		
		''''' FOR AUXILIARY VERB
		if ftreaux=1 and firstpersonaux=1 and auxverb<>"" and founddo=0 and foundauxnot=0 Then
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
		elseif firstpersonaux=99 and auxverb<>"" Then
			rs.Open "Select future from tab_verb where verbs='"+auxverb+"_firstperson'", Conn 
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
		elseif ftreaux=1 and secondpersonaux=1 and auxverb<>"" and founddo=0 and foundauxnot=0 Then
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
		   rs.Open "Select future,futureUtcharan from tab_verb where verbs='"+auxverb+"_thirdperson'", Conn 
           AuxVerbTerm=rs.Fields(0).value+" " 
		   AuxVerbTermUtcharan=rs.Fields(1).value+" " 
        	Response.Write "/aux:"+AuxVerbTerm+"/"
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
		elseif founddo=1 and BeginQst=0 Then
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
	        rs.Open "Select future,futureUtcharan from tab_verb where verbs='"+auxverb+"_firstperson'", Conn 
            AuxVerbTerm=rs.Fields(0).value+" নি ?" 
			AuxVerbTermUtcharan=rs.Fields(1).value+" ni ?" 
        
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
		   rs.Open "Select future,futureUtcharan from tab_verb where verbs='"+auxverb+"_secondperson'", Conn 
           AuxVerbTerm=rs.Fields(0).value+" নি ?" 
		   AuxVerbTermUtcharan=rs.Fields(1).value+" ni ?"
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
		   rs.Open "Select future,futureUtcharan from tab_verb where verbs='"+auxverb+"_thirdperson'", Conn 
           AuxVerbTerm=rs.Fields(0).value+" নি ?" 
		   AuxVerbTermUtcharan=rs.Fields(1).value+" ni ?"
        	Response.Write "/aux:"+AuxVerbTerm+"/"
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
	      rs.Open "Select present,presentUtcharan from tab_verb where verbs='"+auxverb+"_firstperson'", Conn 
          AuxVerbTerm=rs.Fields(0).value+" নি ?" 
		  AuxVerbTermUtcharan=rs.Fields(1).value+" ni ?" 
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
		  rs.Open "Select present,presentUtcharan from tab_verb where verbs='"+auxverb+"_secondperson'", Conn 
          AuxVerbTerm=rs.Fields(0).value+" নি ?" 
		  AuxVerbTermUtcharan=rs.Fields(1).value+" ni ?" 
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
		   rs.Open "Select present,presentUtcharan from tab_verb where verbs='"+auxverb+"_thirdperson'", Conn 
           AuxVerbTerm=rs.Fields(0).value+" নি ?" 
		   AuxVerbTermUtcharan=rs.Fields(1).value+" ni ?" 
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
	      rs.Open "Select past,pastUtcharan from tab_verb where verbs='"+auxverb+"_firstperson'", Conn 
          AuxVerbTerm=rs.Fields(0).value+" নি ?" 
		  AuxVerbTermUtcharan=rs.Fields(1).value+" ni ?"
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
		   rs.Open "Select past,pastUtcharan from tab_verb where verbs='"+auxverb+"_secondperson'", Conn 
           AuxVerbTerm=rs.Fields(0).value+" নি  ?" 
		   AuxVerbTermUtcharan=rs.Fields(1).value+" ni  ?" 
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
		rs.Open "Select past,pastUtcharan from tab_verb where verbs='"+auxverb+"_thirdperson'", Conn 
        AuxVerbTerm=rs.Fields(0).value+" নি ?" 
		AuxVerbTermUtcharan=rs.Fields(1).value+" ni ?" 
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
        	Response.Write "/aux:"+AuxVerbTerm+"/"
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
            AuxVerbTerm=rs.Fields(0).value+" নি ?" 
			AuxVerbTermUtcharan=rs.Fields(1).value+" ni ?" 
        
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
           AuxVerbTerm=rs.Fields(0).value+" নি ?" 
		   AuxVerbTermUtcharan=rs.Fields(1).value+" ni ?"
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
           AuxVerbTerm=rs.Fields(0).value+" নি ?" 
		   AuxVerbTermUtcharan=rs.Fields(1).value+" ni ?"
        	Response.Write "/aux:"+AuxVerbTerm+"/"
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
          AuxVerbTerm=rs.Fields(0).value+" নি ?" 
		  AuxVerbTermUtcharan=rs.Fields(1).value+" ni ?" 
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
          AuxVerbTerm=rs.Fields(0).value+" নি ?" 
		  AuxVerbTermUtcharan=rs.Fields(1).value+" ni ?" 
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
           AuxVerbTerm=rs.Fields(0).value+" নি ?" 
		   AuxVerbTermUtcharan=rs.Fields(1).value+" ni ?" 
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
          AuxVerbTerm=rs.Fields(0).value+" নি ?" 
		  AuxVerbTermUtcharan=rs.Fields(1).value+" ni ?"
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
           AuxVerbTerm=rs.Fields(0).value+" নি  ?" 
		   AuxVerbTermUtcharan=rs.Fields(1).value+" ni  ?" 
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
        AuxVerbTerm=rs.Fields(0).value+" নি ?" 
		AuxVerbTermUtcharan=rs.Fields(1).value+" ni ?" 
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
		Response.Write thirdperson
                            Response.Write foundnot
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
                                   Response.Write VerbTerm
		   
                                end if
		      rs.close
			  if foundVerbTermONE=0 Then
									VerbTermONE=VerbTerm
									VerbTermONEUtcharan=VerbTermUtcharan
									foundVerbTermONE=1
								elseif foundVerbTermTWO=0  Then
									VerbTermTWO=VerbTerm
									VerbTermTWOUtcharan=VerbTermUtcharan
									foundVerbTermTWO=1
								end if
               
		elseif onlyRoot=99 and mainverb<>"" Then
			 rs.Open "Select action,actionUtcharan from tab_verb where verbs='"+mainverb+"_firstperson'", Conn 
             if QHString="" and founddo=0 Then
			    VerbTerm=VerbTerm+rs.Fields(0).value+" " 
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(1).value+" "
              elseif affirverb=1 and QHString<>""  and founddo=0 Then
			    VerbTerm=VerbTerm+rs.Fields(0).value+"নে "
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(1).value+"ne "
		     elseif  founddo=0 Then
		        VerbTerm=VerbTerm+rs.Fields(0).value+" " 
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(1).value+" "
                                   Response.Write VerbTerm
		   
              end if
		      rs.close
			  if foundVerbTermONE=0 Then
									VerbTermONE=VerbTerm
									VerbTermONEUtcharan=VerbTermUtcharan
									foundVerbTermONE=1
								elseif foundVerbTermTWO=0  Then
									VerbTermTWO=VerbTerm
									VerbTermTWOUtcharan=VerbTermUtcharan
									foundVerbTermTWO=1
								end if
		elseif ftre=1 and secondperson=1 and mainverb<>"" and onlyRoot=0 and founddo=0 and foundnot=0 Then
		    Response.Write "/Debug2p/"
			rs.Open "Select action,future,actionUtcharan,futureUtcharan from tab_verb where verbs='"+mainverb+"_secondperson'", Conn 
            Response.Write rs.Fields(1).value
			if QHString="" and founddo=0 Then
		       VerbTerm=VerbTerm+rs.Fields(1).value+" " 
			   VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+" "
             elseif affirverb=1 and QHString<>"" and founddo=0 Then
			    Response.Write "/Debug2part1/"
				VerbTerm=VerbTerm+rs.Fields(1).value+"নে " 
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+"ne " 
				Response.Write VerbTerm
		      elseif  founddo=0 Then
		        VerbTerm=VerbTerm+rs.Fields(1).value+" " 
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+" " 
           end if
		   rs.close
			if foundVerbTermONE=0 Then
									VerbTermONE=VerbTerm
									VerbTermONEUtcharan=VerbTermUtcharan
									foundVerbTermONE=1
								elseif foundVerbTermTWO=0  Then
									VerbTermTWO=VerbTerm
									VerbTermTWOUtcharan=VerbTermUtcharan
									foundVerbTermTWO=1
								end if
		elseif ftre=1 and thirdperson=1 and mainverb<>"" and onlyRoot=0 and founddo=0 and foundnot=0 Then
		    rs.Open "Select action,future,actionUtcharan,futureUtcharan from tab_verb where verbs='"+mainverb+"_thirdperson'", Conn 
            Response.Write "/Debug3p/"
			if QHString="" and founddo=0 Then
		       VerbTerm=VerbTerm+rs.Fields(1).value+" " 
			   VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+" "
            elseif affirverb=1 and QHString<>"" and founddo=0 Then
			   VerbTerm=VerbTerm+rs.Fields(1).value+"নে " 
			   VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+"ne " 
		   elseif  founddo=0 Then
		      VerbTerm=VerbTerm+rs.Fields(1).value+" " 
		       VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+" " 
                                end if
		   Response.Write "Debug"
		   rs.close
			if foundVerbTermONE=0 Then
									VerbTermONE=VerbTerm
									VerbTermONEUtcharan=VerbTermUtcharan
									foundVerbTermONE=1
								elseif foundVerbTermTWO=0  Then
									VerbTermTWO=VerbTerm
									VerbTermTWOUtcharan=VerbTermUtcharan
									foundVerbTermTWO=1
								end if
		' present 
		elseif prst=1 and firstperson=1  and mainverb<>"" and onlyRoot=0 and founddo=0 and foundnot=0 Then
			rs.Open "Select action,present,actionUtcharan,presentUtcharan from tab_verb where verbs='"+mainverb+"_firstperson'", Conn 
			if QHString="" and founddo=0 Then
			  VerbTerm=VerbTerm+rs.Fields(1).value+" " 
			  VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+" "
			elseif affirverb=1 and QHString<>"" and founddo=0 Then
				VerbTerm=VerbTerm+rs.Fields(1).value+"নে " 
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+"ne " 
			elseif  founddo=0 Then
			   VerbTerm=VerbTerm+rs.Fields(1).value+" " 
			   VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+" "
									end if
			rs.close
			if foundVerbTermONE=0 Then
									VerbTermONE=VerbTerm
									VerbTermONEUtcharan=VerbTermUtcharan
									foundVerbTermONE=1
								elseif foundVerbTermTWO=0  Then
									VerbTermTWO=VerbTerm
									VerbTermTWOUtcharan=VerbTermUtcharan
									foundVerbTermTWO=1
								end if
		elseif prst=1 and secondperson=1 and mainverb<>""  and onlyRoot=0 and founddo=0 and foundnot=0 Then
			rs.Open "Select action,present,actionUtcharan,presentUtcharan from tab_verb where verbs='"+mainverb+"_secondperson'", Conn 
			if QHString="" and founddo=0 Then
			   VerbTerm=VerbTerm+rs.Fields(1).value+" " 
			   VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+" "
			elseif affirverb=1 and QHString<>"" and founddo=0 Then
				VerbTerm=VerbTerm+rs.Fields(1).value+"নে " 
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+"ne "
			elseif  founddo=0 Then
			   VerbTerm=VerbTerm+rs.Fields(1).value+" " 
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+" " 
									end if
			rs.close
			if foundVerbTermONE=0 Then
									VerbTermONE=VerbTerm
									VerbTermONEUtcharan=VerbTermUtcharan
									foundVerbTermONE=1
								elseif foundVerbTermTWO=0  Then
									VerbTermTWO=VerbTerm
									VerbTermTWOUtcharan=VerbTermUtcharan
									foundVerbTermTWO=1
								end if
		elseif prst=1 and thirdperson=1  and mainverb<>""  and onlyRoot=0 and founddo=0 and foundnot=0 Then
			rs.Open "Select action,present,actionUtcharan,presentUtcharan from tab_verb where verbs='"+mainverb+"_thirdperson'", Conn 
			if QHString="" and founddo=0 Then
			   VerbTerm=VerbTerm+rs.Fields(1).value+" " 
			   VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+" " 
			elseif affirverb=1 and QHString<>"" and founddo=0 Then
				VerbTerm=VerbTerm+rs.Fields(1).value+"নে " 
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+"ne " 
			elseif  founddo=0 Then
			   VerbTerm=VerbTerm+rs.Fields(1).value+" " 
			   VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+" " 
			end if
			rs.close
			if foundVerbTermONE=0 Then
									VerbTermONE=VerbTerm
									VerbTermONEUtcharan=VerbTermUtcharan
									foundVerbTermONE=1
								elseif foundVerbTermTWO=0  Then
									VerbTermTWO=VerbTerm
									VerbTermTWOUtcharan=VerbTermUtcharan
									foundVerbTermTWO=1
								end if
		' past 
		elseif pst=1 and firstperson=1 and mainverb<>""  and onlyRoot=0 and founddo=0 and foundnot=0 Then
			rs.Open "Select action,past,actionUtcharan,pastUtcharan from tab_verb where verbs='"+mainverb+"_firstperson'", Conn 
			if QHString="" and founddo=0 Then
			   VerbTerm=VerbTerm+rs.Fields(1).value+" " 
			   VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+" " 
			elseif affirverb=1 and QHString<>"" and founddo=0 Then
				VerbTerm=VerbTerm+rs.Fields(1).value+"নে " 
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+"ne "
			elseif  founddo=0 Then
			   VerbTerm=VerbTerm+rs.Fields(1).value+" " 
			   VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+" " 
									end if
			rs.close
			if foundVerbTermONE=0 Then
									VerbTermONE=VerbTerm
									VerbTermONEUtcharan=VerbTermUtcharan
									foundVerbTermONE=1
								elseif foundVerbTermTWO=0  Then
									VerbTermTWO=VerbTerm
									VerbTermTWOUtcharan=VerbTermUtcharan
									foundVerbTermTWO=1
								end if
		elseif pst=1 and secondperson=1 and mainverb<>"" and onlyRoot=0 and founddo=0 and foundnot=0 Then
			rs.Open "Select action,past,actionUtcharan,pastUtcharan from tab_verb where verbs='"+mainverb+"_secondperson'", Conn 
			if QHString="" and founddo=0 Then
			   VerbTerm=VerbTerm+rs.Fields(1).value+" " 
			   VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+" "
			elseif affirverb=1 and QHString<>"" and founddo=0 Then
				VerbTerm=VerbTerm+rs.Fields(1).value+"নে " 
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+"ne " 
			elseif  founddo=0 Then
			   VerbTerm=VerbTerm+rs.Fields(1).value+" " 
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+" "
									end if
			rs.close
			if foundVerbTermONE=0 Then
									VerbTermONE=VerbTerm
									VerbTermONEUtcharan=VerbTermUtcharan
									foundVerbTermONE=1
								elseif foundVerbTermTWO=0  Then
									VerbTermTWO=VerbTerm
									VerbTermTWOUtcharan=VerbTermUtcharan
									foundVerbTermTWO=1
								end if
		elseif pst=1 and thirdperson=1 and mainverb<>"" and onlyRoot=0 and founddo=0 and foundnot=0 Then
			rs.Open "Select action,past,actionUtcharan,pastUtcharan from tab_verb where verbs='"+mainverb+"_thirdperson'", Conn 
			if QHString="" and founddo=0 Then
			  VerbTerm=VerbTerm+rs.Fields(1).value+" " 
			  VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+" " 
			elseif affirverb=1 and QHString<>"" and founddo=0 Then
				VerbTerm=VerbTerm+rs.Fields(1).value+"নে " 
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+"ne " 
			elseif  founddo=0 Then
			   VerbTerm=VerbTerm+rs.Fields(1).value+" " 
			   VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+" " 
				end if
			rs.close
			if foundVerbTermONE=0 Then
									VerbTermONE=VerbTerm
									VerbTermONEUtcharan=VerbTermUtcharan
									foundVerbTermONE=1
								elseif foundVerbTermTWO=0  Then
									VerbTermTWO=VerbTerm
									VerbTermTWOUtcharan=VerbTermUtcharan
									foundVerbTermTWO=1
								end if
		
		''' FOR NEGATIVE VERB 
		
		elseif ftre=1 and firstperson=1 and mainverb<>"" and founddo=0 and foundnot=1 or onlyRoot=1 and foundnot=1  Then
	        Response.Write "/NegVerb/"
			rs.Open "Select action,future,actionUtcharan,futureUtcharan from tab_verb where verbs='neg"+mainverb+"_firstperson'", Conn 
             if QHString="" and founddo=0 Then
			    VerbTerm=VerbTerm+rs.Fields(1).value+" " 
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+" "
              elseif affirverb=1 and QHString<>""  and founddo=0 Then
			    VerbTerm=VerbTerm+rs.Fields(1).value+"নে "
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+"ne "
		     elseif  founddo=0 Then
		        VerbTerm=VerbTerm+rs.Fields(1).value+" " 
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+" "
                                   Response.Write VerbTerm
		   
             end if
		      rs.close
               if foundVerbTermONE=0 Then
									VerbTermONE=VerbTerm
									VerbTermONEUtcharan=VerbTermUtcharan
									foundVerbTermONE=1
								elseif foundVerbTermTWO=0  Then
									VerbTermTWO=VerbTerm
									VerbTermTWOUtcharan=VerbTermUtcharan
									foundVerbTermTWO=1
								end if
		elseif ftre=1 and secondperson=1 and mainverb<>"" and  foundnot=1 and onlyRoot=0 and founddo=0  Then
		    Response.Write "/Debug2p/"
			rs.Open "Select action,future,actionUtcharan,futureUtcharan from tab_verb where verbs='neg"+mainverb+"_secondperson'", Conn 
            Response.Write rs.Fields(1).value
			if QHString="" and founddo=0 Then
		       VerbTerm=VerbTerm+rs.Fields(1).value+" " 
			   VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+" "
             elseif affirverb=1 and QHString<>"" and founddo=0 Then
			    Response.Write "/Debug2part1/"
				VerbTerm=VerbTerm+rs.Fields(1).value+"নে " 
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+"ne " 
				Response.Write VerbTerm
		      elseif  founddo=0 Then
		        VerbTerm=VerbTerm+rs.Fields(1).value+" " 
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+" " 
           end if
		   rs.close
			if foundVerbTermONE=0 Then
									VerbTermONE=VerbTerm
									VerbTermONEUtcharan=VerbTermUtcharan
									foundVerbTermONE=1
								elseif foundVerbTermTWO=0  Then
									VerbTermTWO=VerbTerm
									VerbTermTWOUtcharan=VerbTermUtcharan
									foundVerbTermTWO=1
								end if
		elseif ftre=1 and thirdperson=1 and mainverb<>"" and foundnot=1 and onlyRoot=0 and founddo=0  Then
		    rs.Open "Select action,future,actionUtcharan,futureUtcharan from tab_verb where verbs='neg"+mainverb+"_thirdperson'", Conn 
            Response.Write "/Debug3p/"
			if QHString="" and founddo=0 Then
		       VerbTerm=VerbTerm+rs.Fields(1).value+" " 
			   VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+" "
            elseif affirverb=1 and QHString<>"" and founddo=0 Then
			   VerbTerm=VerbTerm+rs.Fields(1).value+"নে " 
			   VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+"ne " 
		   elseif  founddo=0 Then
		      VerbTerm=VerbTerm+rs.Fields(1).value+" " 
		       VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+" " 
                                end if
		   Response.Write "Debug"
		   rs.close
			if foundVerbTermONE=0 Then
									VerbTermONE=VerbTerm
									VerbTermONEUtcharan=VerbTermUtcharan
									foundVerbTermONE=1
								elseif foundVerbTermTWO=0  Then
									VerbTermTWO=VerbTerm
									VerbTermTWOUtcharan=VerbTermUtcharan
									foundVerbTermTWO=1
								end if
		' present 
		elseif prst=1 and firstperson=1  and mainverb<>"" and foundnot=1 and onlyRoot=0 and founddo=0  Then
			rs.Open "Select action,present,actionUtcharan,presentUtcharan from tab_verb where verbs='neg"+mainverb+"_firstperson'", Conn 
			if QHString="" and founddo=0 Then
			  VerbTerm=VerbTerm+rs.Fields(1).value+" " 
			  VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+" "
			elseif affirverb=1 and QHString<>"" and founddo=0 Then
				VerbTerm=VerbTerm+rs.Fields(1).value+"নে " 
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+"ne " 
			elseif  founddo=0 Then
			   VerbTerm=VerbTerm+rs.Fields(1).value+" " 
			   VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+" "
									end if
			rs.close
			if foundVerbTermONE=0 Then
									VerbTermONE=VerbTerm
									VerbTermONEUtcharan=VerbTermUtcharan
									foundVerbTermONE=1
								elseif foundVerbTermTWO=0  Then
									VerbTermTWO=VerbTerm
									VerbTermTWOUtcharan=VerbTermUtcharan
									foundVerbTermTWO=1
								end if
		elseif prst=1 and secondperson=1 and mainverb<>"" and foundnot=1 and onlyRoot=0 and founddo=0  Then
			rs.Open "Select action,present,actionUtcharan,presentUtcharan from tab_verb where verbs='neg"+mainverb+"_secondperson'", Conn 
			if QHString="" and founddo=0 Then
			   VerbTerm=VerbTerm+rs.Fields(1).value+" " 
			   VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+" "
			elseif affirverb=1 and QHString<>"" and founddo=0 Then
				VerbTerm=VerbTerm+rs.Fields(1).value+"নে " 
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+"ne "
			elseif  founddo=0 Then
			   VerbTerm=VerbTerm+rs.Fields(1).value+" " 
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+" " 
									end if
			rs.close
			if foundVerbTermONE=0 Then
									VerbTermONE=VerbTerm
									VerbTermONEUtcharan=VerbTermUtcharan
									foundVerbTermONE=1
								elseif foundVerbTermTWO=0  Then
									VerbTermTWO=VerbTerm
									VerbTermTWOUtcharan=VerbTermUtcharan
									foundVerbTermTWO=1
								end if
		elseif prst=1 and thirdperson=1  and mainverb<>"" and foundnot=1 and onlyRoot=0 and founddo=0  Then
			rs.Open "Select action,present,actionUtcharan,presentUtcharan from tab_verb where verbs='neg"+mainverb+"_thirdperson'", Conn 
			if QHString="" and founddo=0 Then
			   VerbTerm=VerbTerm+rs.Fields(1).value+" " 
			   VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+" " 
			elseif affirverb=1 and QHString<>"" and founddo=0 Then
				VerbTerm=VerbTerm+rs.Fields(1).value+"নে " 
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+"ne " 
			elseif  founddo=0 Then
			   VerbTerm=VerbTerm+rs.Fields(1).value+" " 
			   VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+" " 
			end if
			rs.close
			if foundVerbTermONE=0 Then
									VerbTermONE=VerbTerm
									VerbTermONEUtcharan=VerbTermUtcharan
									foundVerbTermONE=1
								elseif foundVerbTermTWO=0  Then
									VerbTermTWO=VerbTerm
									VerbTermTWOUtcharan=VerbTermUtcharan
									foundVerbTermTWO=1
								end if
		' past 
		elseif pst=1 and firstperson=1 and mainverb<>"" and foundnot=1 and onlyRoot=0 and founddo=0  Then
			rs.Open "Select action,past,actionUtcharan,pastUtcharan from tab_verb where verbs='neg"+mainverb+"_firstperson'", Conn 
			if QHString="" and founddo=0 Then
			   VerbTerm=VerbTerm+rs.Fields(1).value+" " 
			   VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+" " 
			elseif affirverb=1 and QHString<>"" and founddo=0 Then
				VerbTerm=VerbTerm+rs.Fields(1).value+"নে " 
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+"ne "
			elseif  founddo=0 Then
			   VerbTerm=VerbTerm+rs.Fields(1).value+" " 
			   VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+" " 
									end if
			rs.close
			if foundVerbTermONE=0 Then
									VerbTermONE=VerbTerm
									VerbTermONEUtcharan=VerbTermUtcharan
									foundVerbTermONE=1
								elseif foundVerbTermTWO=0  Then
									VerbTermTWO=VerbTerm
									VerbTermTWOUtcharan=VerbTermUtcharan
									foundVerbTermTWO=1
								end if
		elseif pst=1 and secondperson=1 and mainverb<>"" and foundnot=1 and onlyRoot=0 and founddo=0  Then
			rs.Open "Select action,past,actionUtcharan,pastUtcharan from tab_verb where verbs='neg"+mainverb+"_secondperson'", Conn 
			if QHString="" and founddo=0 Then
			   VerbTerm=VerbTerm+rs.Fields(1).value+" " 
			   VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+" "
			elseif affirverb=1 and QHString<>"" and founddo=0 Then
				VerbTerm=VerbTerm+rs.Fields(1).value+"নে " 
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+"ne " 
			elseif  founddo=0 Then
			   VerbTerm=VerbTerm+rs.Fields(1).value+" " 
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+" "
									end if
			rs.close
			if foundVerbTermONE=0 Then
									VerbTermONE=VerbTerm
									VerbTermONEUtcharan=VerbTermUtcharan
									foundVerbTermONE=1
								elseif foundVerbTermTWO=0  Then
									VerbTermTWO=VerbTerm
									VerbTermTWOUtcharan=VerbTermUtcharan
									foundVerbTermTWO=1
								end if
		elseif pst=1 and thirdperson=1 and mainverb<>"" and foundnot=1 and onlyRoot=0 and founddo=0  Then
			rs.Open "Select action,past,actionUtcharan,pastUtcharan from tab_verb where verbs='neg"+mainverb+"_thirdperson'", Conn 
			if QHString="" and founddo=0 Then
			  VerbTerm=VerbTerm+rs.Fields(1).value+" " 
			  VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+" " 
			elseif affirverb=1 and QHString<>"" and founddo=0 Then
				VerbTerm=VerbTerm+rs.Fields(1).value+"নে " 
				VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+"ne " 
			elseif  founddo=0 Then
			   VerbTerm=VerbTerm+rs.Fields(1).value+" " 
			   VerbTermUtcharan=VerbTermUtcharan+rs.Fields(3).value+" " 
			end if
			rs.close
			if foundVerbTermONE=0 Then
									VerbTermONE=VerbTerm
									VerbTermONEUtcharan=VerbTermUtcharan
									foundVerbTermONE=1
								elseif foundVerbTermTWO=0  Then
									VerbTermTWO=VerbTerm
									VerbTermTWOUtcharan=VerbTermUtcharan
									foundVerbTermTWO=1
								end if
    elseif founddo=1 Then
   	          ' rs.Open "Select action from tab_verb where verbs='"+mainverb+"_thirdperson'", Conn 
              ' VerbTerm=VerbTerm+rs.Fields(0).value+" " 
               ' rs.close	
    end if
	
	
	conn.close
              Assamese_String=Assamese_String+" "+NounTermONE+" "+VerbTermONE+" "+PronounTerm+" "+AuxVerbTermONE+" "+LOC_StringONE+" "+NounTermTWO+" "+VerbTermTWO+" "+AUXPronounTerm+" "+AuxVerbTermTWO+" "+LOC_StringTWO+" "+ENDSTRING
			  Assamese_StringUtcharan=Assamese_StringUtcharan+" "+NounTermUtcharan+" "+PronounTermUtcharan+" "+VerbTermUtcharan+" "+AUXPronounTermUtcharan+" "+AuxVerbTermUtcharan+" "+ENDSTRINGUtcharan
	if Len(Assamese_String)=0 and Len(QHString)=0  Then
	   Assamese_String="Unrecognised"
	   QHString="sentences"
	end if
	if Len(auxverb)=0 Then
		auxverb=""
	end if
	 %>
	 
	<br/> The generated Assamese Translation is: <br/>
	<% Response.Write("<font face=ariel color=blue size=8>"+Assamese_String+" "+QHString+" </font>") %>
    <br/> The generated Assamese Pronunciation is: <br/>
	<%
		
	Response.Write("<font face=ariel color=blue size=8>"+Assamese_StringUtcharan+" "+QHStringUtcharan+" </font>") 
	
	Response.Cookies("AsStrUtchnew")=Assamese_StringUtcharan
	Response.Cookies("QHStrUtchnew")=QHStringUtcharan
	
	%>

     
	 
	 <script>
	 
	 
	 
	 function tell()
	 {
		var utter=new SpeechSynthesisUtterance();
	 utter.voice=speechSynthesis.getVoices()[9]  ;
	   utter.text=document.cookie.split(';')[3].split('=')[1]+" "+document.cookie.split(';')[2].split('=')[1];
	   speechSynthesis.speak(utter);
	 }
	 function tell1()
	 {
	   var utter=new SpeechSynthesisUtterance();
	 utter.voice=speechSynthesis.getVoices()[9]  ;
	   Str1=document.cookie.split(';')[3].split('=')[1]
	   Str1Final=Str1.replace('+',"")
	   for (i=0; i< 200; i++) {
	   Str1Final=Str1Final.replace('+',"")
	   }
	   
	   Str2=document.cookie.split(';')[2].split('=')[1]
	   Str2Final=Str2.replace('+',"")
	   for (i=0; i< 200; i++) {
	   Str2Final=Str2Final.replace('+',"")
	   }
	   var txt=decodeURIComponent(Str1Final)+" "+decodeURIComponent(Str2Final)
	   utter.text=txt;
	   speechSynthesis.speak(utter);
	  }
	 
	 </script>
	 <button name="say"  onClick="tell1()">Say it</button>
</body>
</html>