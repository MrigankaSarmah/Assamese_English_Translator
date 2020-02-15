<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Page Language="C#" CODEPAGE=65001%>
<%@import Namespace="System"%>
<%@import Namespace="System.IO"%>
<%@import Namespace="System.Collections"%> 


<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html;charset=UTF-8">


    <title>Translation</title>
</head>
<body>
    
	<h1 align=center>APP for converting English conversation into Assamese and vice-versa</h1>
	<h2 align=center>Funded project by Assam Association of North America(AANA)</h2>
	<h5 align=center>Project No. : ASDN/CP-004/DEVELOP-AAP/AANA/2018</h5>
	<h4 align=center>Developed by Department of Computer Science and Engineering</h4>
	<h4 align=center>Assam down town University</h4>
	<p align=center><img src="logo.jpg" height=80 width=80/></br>
	<p align=center >
	
	<%
	      Encoding encodingutf8=Encoding.UTF8;
			Byte[] decodedBytes,decodedBytes_Sub;
			 
			String decodedString,decodedString_Sub;
			
			string[] DataSetVoice_UTF=new string[1500]; 
		 
		string[] matra=new string[11];
		 matra[0]=encodingutf8.GetString(encodingutf8.GetBytes(""));
		 matra[1]=encodingutf8.GetString(encodingutf8.GetBytes("া"));  ;     
		 matra[2]=encodingutf8.GetString(encodingutf8.GetBytes("ি"));   ;   
		  matra[3]=encodingutf8.GetString(encodingutf8.GetBytes("ী"));   ; 
		  matra[4]=encodingutf8.GetString(encodingutf8.GetBytes("ু"));   ;
		  matra[5]=encodingutf8.GetString(encodingutf8.GetBytes("ূ"));   ;
		  matra[6]=encodingutf8.GetString(encodingutf8.GetBytes("ৃ"));    ;
		  matra[7]=encodingutf8.GetString(encodingutf8.GetBytes("ে"));    ;
		  matra[8]=encodingutf8.GetString(encodingutf8.GetBytes("ৈ"));     ; 
		  matra[9]=encodingutf8.GetString(encodingutf8.GetBytes("ো"));      ;
		  matra[10]=encodingutf8.GetString(encodingutf8.GetBytes("ৌ"));   ;
		 
		 
		 string[] DataSetVoice=new string[46];
		 DataSetVoice[0]=encodingutf8.GetString(encodingutf8.GetBytes("অ"));;
		 DataSetVoice[1]=encodingutf8.GetString(encodingutf8.GetBytes("আ"));;
		 DataSetVoice[2]=encodingutf8.GetString(encodingutf8.GetBytes("ই"));;
		 DataSetVoice[3]=encodingutf8.GetString(encodingutf8.GetBytes("ঈ"));;
		 DataSetVoice[4]=encodingutf8.GetString(encodingutf8.GetBytes("ঋ"));;
		 DataSetVoice[5]=encodingutf8.GetString(encodingutf8.GetBytes("এ"));;
		 DataSetVoice[6]=encodingutf8.GetString(encodingutf8.GetBytes("ঐ"));;
		 DataSetVoice[7]=encodingutf8.GetString(encodingutf8.GetBytes("উ"));;
		 DataSetVoice[8]=encodingutf8.GetString(encodingutf8.GetBytes("ঔ"));;
		 
		 DataSetVoice[9]=encodingutf8.GetString(encodingutf8.GetBytes("ক"));;
		 DataSetVoice[10]=encodingutf8.GetString(encodingutf8.GetBytes("খ"));;
		 DataSetVoice[11]=encodingutf8.GetString(encodingutf8.GetBytes("গ"));;
		 DataSetVoice[12]=encodingutf8.GetString(encodingutf8.GetBytes("ঘ"));;
		 DataSetVoice[13]=encodingutf8.GetString(encodingutf8.GetBytes("ঙ"));;
		 DataSetVoice[14]=encodingutf8.GetString(encodingutf8.GetBytes("চ"));;
		 DataSetVoice[15]=encodingutf8.GetString(encodingutf8.GetBytes("ছ"));;
		 DataSetVoice[16]=encodingutf8.GetString(encodingutf8.GetBytes("জ"));;
		 DataSetVoice[17]=encodingutf8.GetString(encodingutf8.GetBytes("ঝ"));;
		 DataSetVoice[18]=encodingutf8.GetString(encodingutf8.GetBytes("ঞ"));;
		 DataSetVoice[19]=encodingutf8.GetString(encodingutf8.GetBytes("ট"));;
		 DataSetVoice[20]=encodingutf8.GetString(encodingutf8.GetBytes("ঠ"));;
		 DataSetVoice[21]=encodingutf8.GetString(encodingutf8.GetBytes("ড"));;
		 DataSetVoice[22]=encodingutf8.GetString(encodingutf8.GetBytes("ঢ"));;
		 DataSetVoice[23]=encodingutf8.GetString(encodingutf8.GetBytes("ণ"));;
		 DataSetVoice[24]=encodingutf8.GetString(encodingutf8.GetBytes("ত"));;
		 DataSetVoice[25]=encodingutf8.GetString(encodingutf8.GetBytes("থ"));;
		 DataSetVoice[26]=encodingutf8.GetString(encodingutf8.GetBytes("দ"));;
		 DataSetVoice[27]=encodingutf8.GetString(encodingutf8.GetBytes("ধ"));;
		 DataSetVoice[28]=encodingutf8.GetString(encodingutf8.GetBytes("ন"));;
		 DataSetVoice[29]=encodingutf8.GetString(encodingutf8.GetBytes("প"));;
		 DataSetVoice[30]=encodingutf8.GetString(encodingutf8.GetBytes("ফ"));;
		 DataSetVoice[31]=encodingutf8.GetString(encodingutf8.GetBytes("ব"));;
		 DataSetVoice[32]=encodingutf8.GetString(encodingutf8.GetBytes("ভ"));;
		 DataSetVoice[33]=encodingutf8.GetString(encodingutf8.GetBytes("ম"));;
		 DataSetVoice[34]=encodingutf8.GetString(encodingutf8.GetBytes("য"));;
		 DataSetVoice[35]=encodingutf8.GetString(encodingutf8.GetBytes("ৰ"));;
		 DataSetVoice[36]=encodingutf8.GetString(encodingutf8.GetBytes("ল"));;
		 DataSetVoice[37]=encodingutf8.GetString(encodingutf8.GetBytes("ৱ"));;
		 DataSetVoice[38]=encodingutf8.GetString(encodingutf8.GetBytes("শ"));;
		 DataSetVoice[39]=encodingutf8.GetString(encodingutf8.GetBytes("ষ"));;
		 DataSetVoice[40]=encodingutf8.GetString(encodingutf8.GetBytes("স"));;
		 DataSetVoice[41]=encodingutf8.GetString(encodingutf8.GetBytes("হ"));;
		 DataSetVoice[42]=encodingutf8.GetString(encodingutf8.GetBytes("ক্ষ"));;
		 DataSetVoice[43]=encodingutf8.GetString(encodingutf8.GetBytes("ড়"));;
		 DataSetVoice[44]=encodingutf8.GetString(encodingutf8.GetBytes("ঢ়"));;
		 DataSetVoice[45]=encodingutf8.GetString(encodingutf8.GetBytes("ৎ"));;
		
		
		 
		 %>
		 
		 
		 <%
		   

			
			
			int Counter_DataSetVoice=0;
			decodedBytes=null;
			decodedBytes_Sub=null;
			for(int Counter_matra=0;Counter_matra<11;Counter_matra++)
			{
				
				for (int borno=0;borno<46;borno++)
				{
				    decodedBytes=encodingutf8.GetBytes(DataSetVoice[borno]);
					decodedBytes_Sub=encodingutf8.GetBytes(matra[Counter_matra]);
					
					decodedString=encodingutf8.GetString(decodedBytes);
					decodedString_Sub=encodingutf8.GetString(decodedBytes_Sub);
					
					DataSetVoice_UTF[Counter_DataSetVoice]=decodedString+decodedString_Sub;
					Counter_DataSetVoice=Counter_DataSetVoice+1;
					
					
				}
				
			}
			
			
			
		 %>	 
		 <script runat="server">
			  public static string[] FileURL=new string[783];
			   
		 </script>
	<% 
		 string DataVoice="";
		 string Eng_input="";
		 string Asm_output="";
		 string Asm_utch="";
	   string numberofuser="";
		 Response.Write ("<br><br/>");
		 Response.Write(" <font face=ariel color=black size=5 >English Sentence:"+HttpContext.Current.Server.UrlDecode(Request.QueryString["Org"])+"</font><br>") ;
		 Response.Write("<font face=ariel color=black size=5> Assamese Translation :"+HttpContext.Current.Server.UrlDecode(Request.QueryString["TL"])+" </font><br>");
		 Response.Write("<font face=ariel color=black size=5> Pronunciation :"+HttpContext.Current.Server.UrlDecode(Request.QueryString["Utch"])+" </font><br>");
		 Response.Write("<font face=ariel color=black size=5> Phoneme Codes :"+HttpContext.Current.Server.UrlDecode(Request.QueryString["Voice"])+" </font><br>");
		 
		 Eng_input=HttpContext.Current.Server.UrlDecode(Request.QueryString["Org"]);
		 Asm_output=HttpContext.Current.Server.UrlDecode(Request.QueryString["TL"]);
		 Asm_utch=HttpContext.Current.Server.UrlDecode(Request.QueryString["Utch"]);
		 DataVoice=HttpContext.Current.Server.UrlDecode(Request.QueryString["Voice"]);
numberofuser=HttpContext.Current.Server.UrlDecode(Request.QueryString["User"]);	 
		 
		 
		 int i=0,NumberOfItem=0;
		 
		 string[] DataArray=DataVoice.Split(null);  
		 
		
		
		 FileURL[0]="lower_a";	
		 FileURL[1]="lower_aa";	
FileURL[2]="lower_i";	
FileURL[3]="lower_ii";	
FileURL[4]="lower_u";	
FileURL[5]="lower_uu";	
FileURL[6]="lower_ri";	
FileURL[7]="lower_e";	
FileURL[8]="lower_oi";	
FileURL[9]="lower_o";	
FileURL[10]="lower_ou";	
FileURL[11]="k";	
FileURL[12]="kh";	
FileURL[13]="g";	
FileURL[14]="gh";	
FileURL[15]="ng";	
FileURL[16]="prtm_c";	
FileURL[17]="dty_c";	
FileURL[18]="brg_j";	
FileURL[19]="jh";	
FileURL[20]="ny";	
FileURL[21]="mdh_t";	
FileURL[22]="mdh_th";	
FileURL[23]="mdh_d";	
FileURL[24]="mdh_dh";	
FileURL[25]="mdh_n";	
FileURL[26]="dnt_t";	
FileURL[27]="dnt_th";	
FileURL[28]="dnt_d";	
FileURL[29]="dnt_dh";	
FileURL[30]="dnt_n";	
FileURL[31]="p";	
FileURL[32]="ph";	
FileURL[33]="b";	
FileURL[34]="bh";	
FileURL[35]="m";	
FileURL[36]="onts_j";	
FileURL[37]="r";	
FileURL[38]="l";	
FileURL[39]="v";	
FileURL[40]="tlb_x";	
FileURL[41]="mdh_x";	
FileURL[42]="dnt_x";	
FileURL[43]="h";	
FileURL[44]="khiy";	
FileURL[45]="y";	
FileURL[46]="dor_r";	
FileURL[47]="dhor_r";	
FileURL[48]="hcn_t";	
FileURL[49]="";	
FileURL[50]="";	
FileURL[51]="";	
FileURL[52]="";	
FileURL[53]="";	
FileURL[54]="";	
FileURL[55]="";	
FileURL[56]="";	
FileURL[57]="";	
FileURL[58]="";	
FileURL[59]="";	
FileURL[60]="ka";	
FileURL[61]="kha";	
FileURL[62]="ga";	
FileURL[63]="gha";	
FileURL[64]="nga";	
FileURL[65]="prtm_ca";	
FileURL[66]="dty_ca";	
FileURL[67]="brg_ja";	
FileURL[68]="jha";	
FileURL[69]="nga";	
FileURL[70]="mdh_ta";	
FileURL[71]="mdh_tha";	
FileURL[72]="";	
FileURL[73]="";	
FileURL[74]="";	
FileURL[75]="";	
FileURL[76]="";	
FileURL[77]="";	
FileURL[78]="";	
FileURL[79]="";	
FileURL[80]="";	
FileURL[81]="";	
FileURL[82]="";	
FileURL[83]="";	
FileURL[84]="";	
FileURL[85]="";	
FileURL[86]="";	
FileURL[87]="";	
FileURL[88]="";	
FileURL[89]="";	
FileURL[90]="";	
FileURL[91]="";	
FileURL[92]="";	
FileURL[93]="";	
FileURL[94]="";	
FileURL[95]="";	
FileURL[96]="";	
FileURL[97]="";	
FileURL[98]="";	
FileURL[99]="";	
FileURL[100]="";	
FileURL[101]="";	
FileURL[102]="";	
FileURL[103]="";	
FileURL[104]="";	
FileURL[105]="";	
FileURL[106]="";	
FileURL[107]="";	
FileURL[108]="";	
FileURL[109]="";	
FileURL[110]="";	
FileURL[111]="";	
FileURL[112]="";	
FileURL[113]="";	
FileURL[114]="";	
FileURL[115]="";	
FileURL[116]="";	
FileURL[117]="";	
FileURL[118]="";	
FileURL[119]="";	
FileURL[120]="";	
FileURL[121]="";	
FileURL[122]="";	
FileURL[123]="";	
FileURL[124]="";	
FileURL[125]="";	
FileURL[126]="";	
FileURL[127]="";	
FileURL[128]="";	
FileURL[129]="";	
FileURL[130]="";	
FileURL[131]="";	
FileURL[132]="";	
FileURL[133]="";	
FileURL[134]="";	
FileURL[135]="";	
FileURL[136]="";	
FileURL[137]="";	
FileURL[138]="";	
FileURL[139]="";	
FileURL[140]="";	
FileURL[141]="";	
FileURL[142]="";	
FileURL[143]="";	
FileURL[144]="";	
FileURL[145]="";	
FileURL[146]="";	
FileURL[147]="";	
FileURL[148]="";	
FileURL[149]="";	
FileURL[150]="";	
FileURL[151]="";	
FileURL[152]="";	
FileURL[153]="";	
FileURL[154]="";	
FileURL[155]="";	
FileURL[156]="";	
FileURL[157]="";	
FileURL[158]="";	
FileURL[159]="";	
FileURL[160]="";	
FileURL[161]="";	
FileURL[162]="";	
FileURL[163]="";	
FileURL[164]="";	
FileURL[165]="";	
FileURL[166]="";	
FileURL[167]="";	
FileURL[168]="";	
FileURL[169]="";	
FileURL[170]="";	
FileURL[171]="";	
FileURL[172]="";	
FileURL[173]="";	
FileURL[174]="";	
FileURL[175]="";	
FileURL[176]="";	
FileURL[177]="";	
FileURL[178]="";	
FileURL[179]="";	
FileURL[180]="";	
FileURL[181]="";	
FileURL[182]="";	
FileURL[183]="";	
FileURL[184]="";	
FileURL[185]="";	
FileURL[186]="";	
FileURL[187]="";	
FileURL[188]="";	
FileURL[189]="";	
FileURL[190]="";	
FileURL[191]="";	
FileURL[192]="";	
FileURL[193]="";	
FileURL[194]="";	
FileURL[195]="";	
FileURL[196]="";	
FileURL[197]="";	
FileURL[198]="";	
FileURL[199]="";	
FileURL[200]="";	
FileURL[201]="";	
FileURL[202]="";	
FileURL[203]="";	
FileURL[204]="";	
FileURL[205]="";	
FileURL[206]="";	
FileURL[207]="";	
FileURL[208]="";	
FileURL[209]="";	
FileURL[210]="";	
FileURL[211]="";	
FileURL[212]="";	
FileURL[213]="";	
FileURL[214]="";	
FileURL[215]="";	
FileURL[216]="";	
FileURL[217]="";	
FileURL[218]="";	
FileURL[219]="";	
FileURL[220]="";	
FileURL[221]="";	
FileURL[222]="";	
FileURL[223]="";	
FileURL[224]="";	
FileURL[225]="";	
FileURL[226]="";	
FileURL[227]="";	
FileURL[228]="";	
FileURL[229]="";	
FileURL[230]="";	
FileURL[231]="";	
FileURL[232]="";	
FileURL[233]="";	
FileURL[234]="";	
FileURL[235]="";	
FileURL[236]="";	
FileURL[237]="";	
FileURL[238]="";	
FileURL[239]="";	
FileURL[240]="";	
FileURL[241]="";	
FileURL[242]="";	
FileURL[243]="";	
FileURL[244]="";	
FileURL[245]="";	
FileURL[246]="";	
FileURL[247]="";	
FileURL[248]="";	
FileURL[249]="";	
FileURL[250]="";	
FileURL[251]="";	
FileURL[252]="";	
FileURL[253]="";	
FileURL[254]="";	
FileURL[255]="";	
FileURL[256]="";	
FileURL[257]="";	
FileURL[258]="";	
FileURL[259]="";	
FileURL[260]="";	
FileURL[261]="";	
FileURL[262]="";	
FileURL[263]="";	
FileURL[264]="";	
FileURL[265]="";	
FileURL[266]="";	
FileURL[267]="";	
FileURL[268]="";	
FileURL[269]="";	
FileURL[270]="";	
FileURL[271]="";	
FileURL[272]="";	
FileURL[273]="";	
FileURL[274]="";	
FileURL[275]="";	
FileURL[276]="";	
FileURL[277]="";	
FileURL[278]="";	
FileURL[279]="";	
FileURL[280]="";	
FileURL[281]="";	
FileURL[282]="";	
FileURL[283]="";	
FileURL[284]="";	
FileURL[285]="";	
FileURL[286]="";	
FileURL[287]="";	
FileURL[288]="";	
FileURL[289]="";	
FileURL[290]="";	
FileURL[291]="";	
FileURL[292]="";	
FileURL[293]="";	
FileURL[294]="";	
FileURL[295]="";	
FileURL[296]="";	
FileURL[297]="";	
FileURL[298]="";	
FileURL[299]="";	
FileURL[300]="";	
FileURL[301]="";	
FileURL[302]="";	
FileURL[303]="";	
FileURL[304]="";	
FileURL[305]="";	
FileURL[306]="";	
FileURL[307]="";	
FileURL[308]="";	
FileURL[309]="";	
FileURL[310]="";	
FileURL[311]="";	
FileURL[312]="";	
FileURL[313]="";	
FileURL[314]="";	
FileURL[315]="";	
FileURL[316]="";	
FileURL[317]="";	
FileURL[318]="";	
FileURL[319]="";	
FileURL[320]="";	
FileURL[321]="";	
FileURL[322]="";	
FileURL[323]="";	
FileURL[324]="";	
FileURL[325]="";	
FileURL[326]="";	
FileURL[327]="";	
FileURL[328]="";	
FileURL[329]="";	
FileURL[330]="";	
FileURL[331]="";	
FileURL[332]="";	
FileURL[333]="";	
FileURL[334]="";	
FileURL[335]="";	
FileURL[336]="";	
FileURL[337]="";	
FileURL[338]="";	
FileURL[339]="";	
FileURL[340]="";	
FileURL[341]="";	
FileURL[342]="";	
FileURL[343]="";	
FileURL[344]="";	
FileURL[345]="";	
FileURL[346]="";	
FileURL[347]="";	
FileURL[348]="";	
FileURL[349]="";	
FileURL[350]="";	
FileURL[351]="";	
FileURL[352]="";	
FileURL[353]="";	
FileURL[354]="";	
FileURL[355]="";	
FileURL[356]="";	
FileURL[357]="";	
FileURL[358]="";	
FileURL[359]="";	
FileURL[360]="";	
FileURL[361]="";	
FileURL[362]="";	
FileURL[363]="";	
FileURL[364]="";	
FileURL[365]="";	
FileURL[366]="";	
FileURL[367]="";	
FileURL[368]="";	
FileURL[369]="";	
FileURL[370]="";	
FileURL[371]="";	
FileURL[372]="";	
FileURL[373]="";	
FileURL[374]="";	
FileURL[375]="";	
FileURL[376]="";	
FileURL[377]="";	
FileURL[378]="";	
FileURL[379]="";	
FileURL[380]="";	
FileURL[381]="";	
FileURL[382]="";	
FileURL[383]="";	
FileURL[384]="";	
FileURL[385]="";	
FileURL[386]="";	
FileURL[387]="";	
FileURL[388]="";	
FileURL[389]="";	
FileURL[390]="";	
FileURL[391]="";	
FileURL[392]="";	
FileURL[393]="";	
FileURL[394]="";	
FileURL[395]="";	
FileURL[396]="";	
FileURL[397]="";	
FileURL[398]="";	
FileURL[399]="";	
FileURL[400]="";	
FileURL[401]="";	
FileURL[402]="";	
FileURL[403]="";	
FileURL[404]="";	
FileURL[405]="";	
FileURL[406]="";	
FileURL[407]="";	
FileURL[408]="";	
FileURL[409]="";	
FileURL[410]="";	
FileURL[411]="";	
FileURL[412]="";	
FileURL[413]="";	
FileURL[414]="";	
FileURL[415]="";	
FileURL[416]="";	
FileURL[417]="";	
FileURL[418]="";	
FileURL[419]="";	
FileURL[420]="";	
FileURL[421]="";	
FileURL[422]="";	
FileURL[423]="";	
FileURL[424]="";	
FileURL[425]="";	
FileURL[426]="";	
FileURL[427]="";	
FileURL[428]="";	
FileURL[429]="";	
FileURL[430]="";	
FileURL[431]="";	
FileURL[432]="";	
FileURL[433]="";	
FileURL[434]="";	
FileURL[435]="";	
FileURL[436]="";	
FileURL[437]="";	
FileURL[438]="";	
FileURL[439]="";	
FileURL[440]="";	
FileURL[441]="";	
FileURL[442]="";	
FileURL[443]="";	
FileURL[444]="";	
FileURL[445]="";	
FileURL[446]="";	
FileURL[447]="";	
FileURL[448]="";	
FileURL[449]="";	
FileURL[450]="";	
FileURL[451]="";	
FileURL[452]="";	
FileURL[453]="";	
FileURL[454]="";	
FileURL[455]="";	
FileURL[456]="";	
FileURL[457]="";	
FileURL[458]="";	
FileURL[459]="";	
FileURL[460]="";	
FileURL[461]="";	
FileURL[462]="";	
FileURL[463]="";	
FileURL[464]="";	
FileURL[465]="";	
FileURL[466]="";	
FileURL[467]="";	
FileURL[468]="";	
FileURL[469]="";	
FileURL[470]="";	
FileURL[471]="";	
FileURL[472]="";	
FileURL[473]="";	
FileURL[474]="";	
FileURL[475]="";	
FileURL[476]="";	
FileURL[477]="";	
FileURL[478]="";	
FileURL[479]="";	
FileURL[480]="";	
FileURL[481]="";	
FileURL[482]="";	
FileURL[483]="";	
FileURL[484]="";	
FileURL[485]="";	
FileURL[486]="";	
FileURL[487]="";	
FileURL[488]="";	
FileURL[489]="";	
FileURL[490]="";	
FileURL[491]="";	
FileURL[492]="";	
FileURL[493]="";	
FileURL[494]="";	
FileURL[495]="";	
FileURL[496]="";	
FileURL[497]="";	
FileURL[498]="";	
FileURL[499]="";	
FileURL[500]="";	
FileURL[501]="";	
FileURL[502]="";	
FileURL[503]="";	
FileURL[504]="";	
FileURL[505]="";	
FileURL[506]="";	
FileURL[507]="";	
FileURL[508]="";	
FileURL[509]="";	
FileURL[510]="";	
FileURL[511]="";	
FileURL[512]="";	
FileURL[513]="";	
FileURL[514]="";	
FileURL[515]="";	
FileURL[516]="";	
FileURL[517]="";	
FileURL[518]="";	
FileURL[519]="";	
FileURL[520]="";	
FileURL[521]="";	
FileURL[522]="";	
FileURL[523]="";	
FileURL[524]="";	
FileURL[525]="";	
FileURL[526]="";	
FileURL[527]="";	
FileURL[528]="";	
FileURL[529]="";	
FileURL[530]="";	
FileURL[531]="";	
FileURL[532]="";	
FileURL[533]="";	
FileURL[534]="";	
FileURL[535]="";	
FileURL[536]="";	
FileURL[537]="";	
FileURL[538]="";	
FileURL[539]="";	
FileURL[540]="";	
FileURL[541]="";	
FileURL[542]="";	
FileURL[543]="";	
FileURL[544]="";	
FileURL[545]="";	
FileURL[546]="";	
FileURL[547]="";	
FileURL[548]="";	
FileURL[549]="";	
FileURL[550]="";	
FileURL[551]="";	
FileURL[552]="";	
FileURL[553]="";	
FileURL[554]="";	
FileURL[555]="";	
FileURL[556]="";	
FileURL[557]="";	
FileURL[558]="";	
FileURL[559]="";	
FileURL[560]="";	
FileURL[561]="";	
FileURL[562]="";	
FileURL[563]="";	
FileURL[564]="";	
FileURL[565]="";	
FileURL[566]="";	
FileURL[567]="";	
FileURL[568]="";	
FileURL[569]="";	
FileURL[570]="";	
FileURL[571]="";	
FileURL[572]="";	
FileURL[573]="";	
FileURL[574]="";	
FileURL[575]="";	
FileURL[576]="";	
FileURL[577]="";	
FileURL[578]="";	
FileURL[579]="";	
FileURL[580]="";	
FileURL[581]="";	
FileURL[582]="";	
FileURL[583]="";	
FileURL[584]="";	
FileURL[585]="";	
FileURL[586]="";	
FileURL[587]="";	
FileURL[588]="";	
FileURL[589]="";	
FileURL[590]="";	
FileURL[591]="";	
FileURL[592]="";	
FileURL[593]="";	
FileURL[594]="";	
FileURL[595]="";	
FileURL[596]="";	
FileURL[597]="";	
FileURL[598]="";	
FileURL[599]="";	
FileURL[600]="";	
FileURL[601]="";	
FileURL[602]="";	
FileURL[603]="";	
FileURL[604]="";	
FileURL[605]="";	
FileURL[606]="";	
FileURL[607]="";	
FileURL[608]="";	
FileURL[609]="";	
FileURL[610]="";	
FileURL[611]="";	
FileURL[612]="";	
FileURL[613]="";	
FileURL[614]="";	
FileURL[615]="";	
FileURL[616]="";	
FileURL[617]="";	
FileURL[618]="";	
FileURL[619]="";	
FileURL[620]="";	
FileURL[621]="";	
FileURL[622]="";	
FileURL[623]="";	
FileURL[624]="";	
FileURL[625]="";	
FileURL[626]="";	
FileURL[627]="";	
FileURL[628]="";	
FileURL[629]="";	
FileURL[630]="";	
FileURL[631]="";	
FileURL[632]="";	
FileURL[633]="";	
FileURL[634]="";	
FileURL[635]="";	
FileURL[636]="";	
FileURL[637]="";	
FileURL[638]="";	
FileURL[639]="";	
FileURL[640]="";	
FileURL[641]="";	
FileURL[642]="";	
FileURL[643]="";	
FileURL[644]="";	
FileURL[645]="";	
FileURL[646]="";	
FileURL[647]="";	
FileURL[648]="";	
FileURL[649]="";	
FileURL[650]="";	
FileURL[651]="";	
FileURL[652]="";	
FileURL[653]="";	
FileURL[654]="";	
FileURL[655]="";	
FileURL[656]="";	
FileURL[657]="";	
FileURL[658]="";	
FileURL[659]="";	
FileURL[660]="";	
FileURL[661]="";	
FileURL[662]="";	
FileURL[663]="";	
FileURL[664]="";	
FileURL[665]="";	
FileURL[666]="";	
FileURL[667]="";	
FileURL[668]="";	
FileURL[669]="";	
FileURL[670]="";	
FileURL[671]="";	
FileURL[672]="";	
FileURL[673]="";	
FileURL[674]="";	
FileURL[675]="";	
FileURL[676]="";	
FileURL[677]="";	
FileURL[678]="";	
FileURL[679]="";	
FileURL[680]="";	
FileURL[681]="";	
FileURL[682]="";	
FileURL[683]="";	
FileURL[684]="";	
FileURL[685]="";	
FileURL[686]="";	
FileURL[687]="";	
FileURL[688]="";	
FileURL[689]="";	
FileURL[690]="";	
FileURL[691]="";	
FileURL[692]="";	
FileURL[693]="";	
FileURL[694]="";	
FileURL[695]="";	
FileURL[696]="";	
FileURL[697]="";	
FileURL[698]="";	
FileURL[699]="";	
FileURL[700]="";	
FileURL[701]="";	
FileURL[702]="";	
FileURL[703]="";	
FileURL[704]="";	
FileURL[705]="";	
FileURL[706]="";	
FileURL[707]="";	
FileURL[708]="";	
FileURL[709]="";	
FileURL[710]="";	
FileURL[711]="";	
FileURL[712]="";	
FileURL[713]="";	
FileURL[714]="";	
FileURL[715]="";	
FileURL[716]="";	
FileURL[717]="";	
FileURL[718]="";	
FileURL[719]="";	
FileURL[720]="";	
FileURL[721]="";	
FileURL[722]="";	
FileURL[723]="";	
FileURL[724]="";	
FileURL[725]="";	
FileURL[726]="";	
FileURL[727]="";	
FileURL[728]="";	
FileURL[729]="";	
FileURL[730]="";	
FileURL[731]="";	
FileURL[732]="";	
FileURL[733]="";	
FileURL[734]="";	
FileURL[735]="";	
FileURL[736]="";	
FileURL[737]="";	
FileURL[738]="";	
FileURL[739]="";	
FileURL[740]="";	
FileURL[741]="";	
FileURL[742]="";	
FileURL[743]="";	
FileURL[744]="";	
FileURL[745]="";	
FileURL[746]="";	
FileURL[747]="";	
FileURL[748]="";	
FileURL[749]="blnk";	
FileURL[750]="silent_k";
FileURL[751]="silent_kh";
FileURL[752]="silent_g";
FileURL[753]="silent_gh";
FileURL[754]="silent_prtmc";
FileURL[755]="silent_dtyc";
FileURL[756]="silent_brgj";
FileURL[757]="silent_jh";
FileURL[758]="silent_ny";
FileURL[759]="silent_mdht";
FileURL[760]="silent_mdhth";
FileURL[761]="silent_mdhd";
FileURL[762]="silent_mdhdh";
FileURL[763]="silent_mdhn";
FileURL[764]="silent_dntt";
FileURL[765]="silent_dntth";
FileURL[766]="silent_dntd";
FileURL[767]="silent_dntdh";
FileURL[768]="silent_dntn";
FileURL[769]="silent_p";
FileURL[770]="silent_ph";
FileURL[771]="silent_b";
FileURL[772]="silent_bh";
FileURL[773]="silent_m";
FileURL[774]="silent_ontsj";
FileURL[775]="silent_r";
FileURL[776]="silent_l";
FileURL[777]="silent_v";
FileURL[778]="silent_tlbx";
FileURL[779]="silent_mdhx";
FileURL[780]="silent_dntx";
FileURL[781]="silent_h";
FileURL[782]="silent_y";


		
		
	
	
    
	
		 %>
		 <script runat="server">
		  
		 class FindFiles{
		 int i=0;
		 public FindFiles(){}
		 
		 DirectoryInfo d=new DirectoryInfo(@"E:\Test\Voice_MGS");   
		 FileInfo[] files;
		 
			 public void find() {
			 
				files=d.GetFiles("*.wav");
				foreach (FileInfo file in files)
				{
						FileURL[i]=file.Name.ToString();
						i++;
						
				}
			}
			
				
			
			
		}
		
	</script>
	<%
	
	string phoneme="";
	
	string[] TempList=new string[DataArray.Length];
	
	
	string[] lower_set_alpha=new string[]{"","a","i","ii","u","uu","ri","e","oi","o","ou"};
	int counter_upper_set=11,counter_lower_set=0,loop_k=11;
	for( counter_lower_set=0;counter_lower_set<11;counter_lower_set++)
	{
			    counter_upper_set=11;
			    while(counter_upper_set<=48) {
						FileURL[loop_k]=FileURL[counter_upper_set]+lower_set_alpha[counter_lower_set];
						loop_k++;
						counter_upper_set++;
				}
				loop_k=loop_k+11;
	
	}
	
	
	
	for (int k=0;k<DataArray.Length;k++)
	{
		TempList[k]=DataArray[k];
		
	}
	for (int k=0;k<DataArray.Length;k++)
	{
		int number;
		bool success=Int32.TryParse(DataArray[k],out number);
		if(success)
		{
			
			phoneme=phoneme+" "+FileURL[number];
		}
		
		
	}
	
	Response.Redirect("https://www.aanaadtu.com/soundwav.php?Voice="+phoneme+"&Eng="+Eng_input+"&Asm_output="+Asm_output+"&Asm_utch="+Asm_utch+"&Address="+DataVoice+"&User="+numberofuser); 
	%>
	
   
	</p>
		 


		 
</body>
</html>	 
	