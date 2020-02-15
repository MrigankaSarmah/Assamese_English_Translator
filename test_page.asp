<!DOCTYPE html>
<%@ CODEPAGE=65001%>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html;charset=UTF-8">
<TITLE>Translation Test Page</TITLE>
</HEAD>
<html>
<body>
<script>
function CallTest() {

	for( i =1 ;i<=10;i++)
	{
		alert(document.getElementById("Testmsg"+i).value)
	}
}
</script>



<form action="test_page_itr.asp" method="post">
<font face="verdana" color="green" size=4 >
/Test : submit and validate from <a href="validate_test.asp">validate_test</a><br/>
 1<input  type="text" id="Testmsg1" name="Testmsg1"  value="Default_Type" size=40/><br/>
  2<input  type="text" id="Testmsg2" name="Testmsg2"  value="Default_Type" size=40/><br/>
  3<input  type="text" id="Testmsg3" name="Testmsg3"  value="Default_Type" size=40/><br/>
  4<input  type="text" id="Testmsg4" name="Testmsg4"  value="Default_Type" size=40/><br/>
  5<input  type="text" id="Testmsg5" name="Testmsg5"  value="Default_Type" size=40/><br/>
  6<input  type="text" id="Testmsg6" name="Testmsg6"  value="Default_Type" size=40/><br/>
  7<input  type="text" id="Testmsg7" name="Testmsg7"  value="Default_Type" size=40/><br/>
  8<input  type="text" id="Testmsg8" name="Testmsg8"  value="Default_Type" size=40/><br/>
  9<input  type="text" id="Testmsg9" name="Testmsg9"  value="Default_Type" size=40/><br/>
  10<input  type="text" id="Testmsg10" name="Testmsg10"  value="Default_Type" size=40/><br/>
  11<input  type="text" id="Testmsg11" name="Testmsg11"  value="Default_Type" size=40/><br/>
  12<input  type="text" id="Testmsg12" name="Testmsg12"  value="Default_Type" size=40/><br/>
  13<input  type="text" id="Testmsg13" name="Testmsg13"  value="Default_Type" size=40/><br/>
  14<input  type="text" id="Testmsg14" name="Testmsg14"  value="Default_Type" size=40/><br/>
  15<input  type="text" id="Testmsg15" name="Testmsg15"  value="Default_Type" size=40/><br/>
  16<input  type="text" id="Testmsg16" name="Testmsg16"  value="Default_Type" size=40/><br/>
  17<input  type="text" id="Testmsg17" name="Testmsg17"  value="Default_Type" size=40/><br/>
  18<input  type="text" id="Testmsg18" name="Testmsg18"  value="Default_Type" size=40/><br/>
  19<input  type="text" id="Testmsg19" name="Testmsg19"  value="Default_Type" size=40/><br/>
  20<input  type="text" id="Testmsg20" name="Testmsg20"  value="Default_Type" size=40/><br/>
  21<input  type="text" id="Testmsg21" name="Testmsg21"  value="Default_Type" size=40/><br/>
  22<input  type="text" id="Testmsg22" name="Testmsg22"  value="Default_Type" size=40/><br/>
  23<input  type="text" id="Testmsg23" name="Testmsg23"  value="Default_Type" size=40/><br/>
  24<input  type="text" id="Testmsg24" name="Testmsg24"  value="Default_Type" size=40/><br/>
  25<input  type="text" id="Testmsg25" name="Testmsg25"  value="Default_Type" size=40/><br/>
  26<input  type="text" id="Testmsg26" name="Testmsg26"  value="Default_Type" size=40/><br/>
  27<input  type="text" id="Testmsg27" name="Testmsg27"  value="Default_Type" size=40/><br/>
  28<input  type="text" id="Testmsg28" name="Testmsg28"  value="Default_Type" size=40/><br/>
  29<input  type="text" id="Testmsg29" name="Testmsg29"  value="Default_Type" size=40/><br/>
  30<input  type="text" id="Testmsg30" name="Testmsg30"  value="Default_Type" size=40/><br/>
  31<input  type="text" id="Testmsg31" name="Testmsg31"  value="Default_Type" size=40/><br/>
  32<input  type="text" id="Testmsg32" name="Testmsg32"  value="Default_Type" size=40/><br/>
  33<input  type="text" id="Testmsg33" name="Testmsg33"  value="Default_Type" size=40/><br/>
  34<input  type="text" id="Testmsg34" name="Testmsg34"  value="Default_Type" size=40/><br/>
  35<input  type="text" id="Testmsg35" name="Testmsg35"  value="Default_Type" size=40/><br/>
  36<input  type="text" id="Testmsg36" name="Testmsg36"  value="Default_Type" size=40/><br/>
  37<input  type="text" id="Testmsg37" name="Testmsg37"  value="Default_Type" size=40/><br/>
  38<input  type="text" id="Testmsg38" name="Testmsg38"  value="Default_Type" size=40/><br/>
  39<input  type="text" id="Testmsg39" name="Testmsg39"  value="Default_Type" size=40/><br/>
  40<input  type="text" id="Testmsg40" name="Testmsg40"  value="Default_Type" size=40/><br/>
  41<input  type="text" id="Testmsg41" name="Testmsg41"  value="Default_Type" size=40/><br/>
  42<input  type="text" id="Testmsg42" name="Testmsg42"  value="Default_Type" size=40/><br/>
  43<input  type="text" id="Testmsg43" name="Testmsg43"  value="Default_Type" size=40/><br/>
  44<input  type="text" id="Testmsg44" name="Testmsg44"  value="Default_Type" size=40/><br/>
  45<input  type="text" id="Testmsg45" name="Testmsg45"  value="Default_Type" size=40/><br/>
  46<input  type="text" id="Testmsg46" name="Testmsg46"  value="Default_Type" size=40/><br/>
  47<input  type="text" id="Testmsg47" name="Testmsg47"  value="Default_Type" size=40/><br/>
  48<input  type="text" id="Testmsg48" name="Testmsg48"  value="Default_Type" size=40/><br/>
  49<input  type="text" id="Testmsg49" name="Testmsg49"  value="Default_Type" size=40/><br/>
  50<input  type="text" id="Testmsg50" name="Testmsg50"  value="Default_Type" size=40/><br/>
  51<input  type="text" id="Testmsg51" name="Testmsg51"  value="Default_Type" size=40/><br/>
  52<input  type="text" id="Testmsg52" name="Testmsg52"  value="Default_Type" size=40/><br/>
  53<input  type="text" id="Testmsg53" name="Testmsg53"  value="Default_Type" size=40/><br/>
  54<input  type="text" id="Testmsg54" name="Testmsg54"  value="Default_Type" size=40/><br/>
  55<input  type="text" id="Testmsg55" name="Testmsg55"  value="Default_Type" size=40/><br/>
  56<input  type="text" id="Testmsg56" name="Testmsg56"  value="Default_Type" size=40/><br/>
  57<input  type="text" id="Testmsg57" name="Testmsg57"  value="Default_Type" size=40/><br/>
  58<input  type="text" id="Testmsg58" name="Testmsg58"  value="Default_Type" size=40/><br/>
  59<input  type="text" id="Testmsg59" name="Testmsg59"  value="Default_Type" size=40/><br/>
  60<input  type="text" id="Testmsg60" name="Testmsg60"  value="Default_Type" size=40/><br/>
  61<input  type="text" id="Testmsg61" name="Testmsg61"  value="Default_Type" size=40/><br/>
  62<input  type="text" id="Testmsg62" name="Testmsg62"  value="Default_Type" size=40/><br/>
  63<input  type="text" id="Testmsg63" name="Testmsg63"  value="Default_Type" size=40/><br/>
  64<input  type="text" id="Testmsg64" name="Testmsg64"  value="Default_Type" size=40/><br/>
  65<input  type="text" id="Testmsg65" name="Testmsg65"  value="Default_Type" size=40/><br/>
  66<input  type="text" id="Testmsg66" name="Testmsg66"  value="Default_Type" size=40/><br/>
  67<input  type="text" id="Testmsg67" name="Testmsg67"  value="Default_Type" size=40/><br/>
  68<input  type="text" id="Testmsg68" name="Testmsg68"  value="Default_Type" size=40/><br/>
  69<input  type="text" id="Testmsg69" name="Testmsg69"  value="Default_Type" size=40/><br/>
  70<input  type="text" id="Testmsg70" name="Testmsg70"  value="Default_Type" size=40/><br/>
  71<input  type="text" id="Testmsg71" name="Testmsg71"  value="Default_Type" size=40/><br/>
  72<input  type="text" id="Testmsg72" name="Testmsg72"  value="Default_Type" size=40/><br/>
  73<input  type="text" id="Testmsg73" name="Testmsg73"  value="Default_Type" size=40/><br/>
  74<input  type="text" id="Testmsg74" name="Testmsg74"  value="Default_Type" size=40/><br/>
  75<input  type="text" id="Testmsg75" name="Testmsg75"  value="Default_Type" size=40/><br/>
  76<input  type="text" id="Testmsg76" name="Testmsg76"  value="Default_Type" size=40/><br/>
  77<input  type="text" id="Testmsg77" name="Testmsg77"  value="Default_Type" size=40/><br/>
  78<input  type="text" id="Testmsg78" name="Testmsg78"  value="Default_Type" size=40/><br/>
  79<input  type="text" id="Testmsg79" name="Testmsg79"  value="Default_Type" size=40/><br/>
  80<input  type="text" id="Testmsg80" name="Testmsg80"  value="Default_Type" size=40/><br/>
  81<input  type="text" id="Testmsg81" name="Testmsg81"  value="Default_Type" size=40/><br/>
  82<input  type="text" id="Testmsg82" name="Testmsg82"  value="Default_Type" size=40/><br/>
  83<input  type="text" id="Testmsg83" name="Testmsg83"  value="Default_Type" size=40/><br/>
  84<input  type="text" id="Testmsg84" name="Testmsg84"  value="Default_Type" size=40/><br/>
  85<input  type="text" id="Testmsg85" name="Testmsg85"  value="Default_Type" size=40/><br/>
  86<input  type="text" id="Testmsg86" name="Testmsg86"  value="Default_Type" size=40/><br/>
  87<input  type="text" id="Testmsg87" name="Testmsg87"  value="Default_Type" size=40/><br/>
  88<input  type="text" id="Testmsg88" name="Testmsg88"  value="Default_Type" size=40/><br/>
  89<input  type="text" id="Testmsg89" name="Testmsg89"  value="Default_Type" size=40/><br/>
  90<input  type="text" id="Testmsg90" name="Testmsg90"  value="Default_Type" size=40/><br/>
  91<input  type="text" id="Testmsg91" name="Testmsg91"  value="Default_Type" size=40/><br/>
  92<input  type="text" id="Testmsg92" name="Testmsg92"  value="Default_Type" size=40/><br/>
  93<input  type="text" id="Testmsg93" name="Testmsg93"  value="Default_Type" size=40/><br/>
  94<input  type="text" id="Testmsg94" name="Testmsg94"  value="Default_Type" size=40/><br/>
  95<input  type="text" id="Testmsg95" name="Testmsg95"  value="Default_Type" size=40/><br/>
  96<input  type="text" id="Testmsg96" name="Testmsg96"  value="Default_Type" size=40/><br/>
  97<input  type="text" id="Testmsg97" name="Testmsg97"  value="Default_Type" size=40/><br/>
  98<input  type="text" id="Testmsg98" name="Testmsg98"  value="Default_Type" size=40/><br/>
  98<input  type="text" id="Testmsg99" name="Testmsg99"  value="Default_Type" size=40/><br/>
  100<input  type="text" id="Testmsg100" name="Testmsg100"  value="Default_Type" size=40/><br/>
  
  <input type="submit" name="send" value="Submit"/>
</font>


 </form>
 

</body>
</html>



