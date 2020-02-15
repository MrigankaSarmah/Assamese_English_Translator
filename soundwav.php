<html>
<body>
	<h1 align=center>APP for converting English conversation into Assamese and vice-versa</h1>
	<h2 align=center>Funded project by Assam Association of North America(AANA)</h2>
	<h5 align=center>Project No. : ASDN/CP-004/DEVELOP-AAP/AANA/2018</h5>
	<h4 align=center>Developed by Department of Computer Science and Engineering</h4>
	<h4 align=center>Assam down town University</h4>
	<p align=center >
<?php


 
header('Content-Type: text/html; charset=utf-8');
$UserCount=0;
$encodedString="";
$FinalVoiceArray = []; 
foreach ($_GET as $name => $value) {
	if($name=="User"){
		$UserCount=urldecode($value);
	}
    if ($name=="Voice") {
		$encodedString=urldecode($value);
		$pieces = explode(" ", $encodedString);
		
		
		
	}
	else
		echo '<font face=ariel color=blue size=5 >' . urldecode($value) . '<br /></font>';
}

for($x=0;$x<count($pieces);$x++)
{
		//echo $pieces[$x]. " ";
}
for($x=1;$x<count($pieces);$x++)
{
		$pieces[$x]="Voice_DHT/". $pieces[$x] . ".wav";
		$FinalVoiceArray[$x-1]=$pieces[$x];
}
for($x=0;$x<count($FinalVoiceArray);$x++)
{
		//echo $FinalVoiceArray[$x]. " ";
}





$content = joinwavs($FinalVoiceArray,$UserCount);





function joinwavs($wavs,$UserCount){




$fields = join('/',array( 'H8ChunkID', 'VChunkSize', 'H8Format',
'H8Subchunk1ID', 'VSubchunk1Size',
'vAudioFormat', 'vNumChannels', 'VSampleRate',
'VByteRate', 'vBlockAlign', 'vBitsPerSample','H8subchunk2id' ));
$data = '';

foreach($wavs as $wav){
	
	
$fp = fopen($wav,'rb');
$header = fread($fp,40);
$info = unpack($fields,$header);
// Destination file to be writed


$size = unpack('Vsize',fread($fp,4));
$size = $size['size'];
// read data
$data .= fread($fp,$size);




}
$filecontent = $header.pack('V',strlen($data)).$data;
// Write the output data in a seperate file
$destfile =  "sound0 - Copy (" . $UserCount%50 . ").wav";
$fp1 = fopen($destfile,"wb");
fwrite($fp1,$filecontent);
fclose($fp1);

}
?>
<audio id="myaudio" controls><source src="sound0 - Copy (<?php echo $UserCount%50 ?>).wav" type="audio/wav"></audio>
<p>
<?php 
echo '<script>var vid = document.getElementById("myaudio");vid.playbackRate = 1.85;</script>'
?>
</body>
</html>