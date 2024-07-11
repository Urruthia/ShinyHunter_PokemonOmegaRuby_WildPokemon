#include<ImageSearch2015.au3>
#include <Misc.au3>
#include<AutoItConstants.au3>
Global $Contador=0;
Global $hunting = True
Global $encuentro = True
Global Const $walkingx1 = 969
Global Const $walkingy1 = 918
Global Const $walkingx2 = 1029
Global Const $walkingy2 = 978
#cs
Global Const $wurmplex1 = 990
Global Const $wurmpley1 = 308
Global Const $wurmplex2 = 1050
Global Const $wurmpley2 = 375
Global Const $seedotx1 = 909
Global Const $seedoty1 = 326
Global Const $seedotx2 = 1028
Global Const $seedoty2 = 390
Global Const $raltsx1 = 939
Global Const $raltsy1 = 263
Global Const $raltstx2 = 1029
Global Const $raltsy2 = 339
Global Const $poochysx1 = 1005
Global Const $poochyy1 = 288
Global Const $poochytx2 = 1053
Global Const $poochyy2 = 378
Global Const $zigzagx1 = 950
Global Const $zigzagy1 = 263s
Global Const $zigzagtx2 = 1000sssssssss
Global Const $zigzagy2 = 300
#ce
Global Const $huirx1 = 893
Global Const $huiry1 = 915
Global Const $huirx2 = 1009
Global Const $huiry2 = 969
Global Const $walking = "walk.png"
#cs
Global Const $wurmple = "wurmple.png"
Global Const $seedot = "seedot.png"
Global Const $ralts = "ralts.png"
Global Const $poochy = "poochy.png"
Global Const $zigzag = "zigzag.png"
#ce
Global Const $huir = "huir.png"
Global $returnx = 0
Global $returny= 0
Global $hDLL = DllOpen("user32.dll")
Sleep(3000)

While $hunting
	$result = _ImageSearchArea($walking,1,$walkingx1,$walkingy1,$walkingx2,$walkingy2,$returnx,$returny,0,0)
	if $result=1 Then
		send("{s down}")
		send("{UP down}")
		Sleep(250)
		send("{UP up}")
		send("{DOWN down}")
		Sleep(250)
		send("{DOWN up}")
		send("{s up}")
		if $encuentro=False then
		$encuentro= True
		EndIf
	Else
	while $encuentro

		#cs

		$result1 = _ImageSearchArea($wurmple,1,$wurmplex1,$wurmpley1,$wurmplex2,$wurmpley2,$returnx,$returny,0,0)
		$result2 = _ImageSearchArea($seedot,1,$seedotx1,$seedoty1,$seedotx2,$seedoty2,$returnx,$returny,0,0)
		$result3 = _ImageSearchArea($ralts,1,$raltsx1,$raltsy1,$raltstx2,$raltsy2,$returnx,$returny,0,0)
		$result4 = _ImageSearchArea($poochy,1,$poochysx1,$poochyy1,$poochytx2,$poochyy2,$returnx,$returny,0,0)
		$result5 = _ImageSearchArea($zigzag,1,$zigzagx1,$zigzagy1,$zigzagtx2,$zigzagy2,$returnx,$returny,0,0)
		If $result1=1 or $result2=1 or $result3=1 or $result4=1 or $result5=1 Then
			MsgBox($MB_OK,"no Shiny","No es SHiny")
			$result7 = _ImageSearchArea($huir,1,$huirx1,$huiry1,$huirx2,$huiry2,$returnx,$returny,0,0)
			while $result7 = 0
				$result7 = _ImageSearchArea($huir,1,$huirx1,$huiry1,$huirx2,$huiry2,$returnx,$returny,0,0)
			If $result7=1 Then
			MouseMove ( $returnx, $returny )
			MouseClick($MOUSE_CLICK_LEFT)
			EndIf
			Wend
			$encuentro= False
		EndIf
		#ce




		$colorWurmple = PixelSearch(924, 231, 978, 334, 0xe7696f)
		$colorSeedot = PixelSearch(1011, 312, 1032, 335, 0xa58e7b)
		$colorSurskit = PixelSearch(1160, 200, 1080, 220, 0x84c6ed)
		$colorRalts = PixelSearch(956, 273, 976, 293, 0xa6dca6)
		$colorZigzagoon  = PixelSearch(1040, 317, 1060, 337, 0x786d5b)
		$colorPoochyena = PixelSearch(1023, 303, 1043, 323, 0xd5d6d5)
		$Contador+=1

		If  IsArray($colorWurmple) or  IsArray($colorZigzagoon) or IsArray($colorSeedot) or IsArray($colorPoochyena) or IsArray($colorRalts)  or  IsArray($colorSurskit) Then
			ConsoleWrite($Contador)
			$result7 = _ImageSearchArea($huir,1,$huirx1,$huiry1,$huirx2,$huiry2,$returnx,$returny,0,0)
			while $result7 = 0
				$result7 = _ImageSearchArea($huir,1,$huirx1,$huiry1,$huirx2,$huiry2,$returnx,$returny,0,0)
			If $result7=1 Then
				send("{NUMPADADD down}")
				send("{LEFT down}")
				Sleep(100)
				send("{LEFT up}")
				send("{RIGHT down}")
				Sleep(100)
				send("{RIGHT up}")
				send("{a down}")
				Sleep(100)
				send("{a up}")
				send("{NUMPADADD up}")
				$encuentro= False
				$Contador=0


			EndIf

			Wend
			ElseIf $Contador >= 150 then
			send("{NUMPADADD down}")
			Sleep(250)
			send("{NUMPADADD up}")
			$hunting= False
			$encuentro= False
			MsgBox($MB_OK,"Econtrado!!!!!","Se encontro un shiny")
			EndIf


	WEnd
	endif
if _IsPressed("1B", $hDLL) Then
	$hunting=False
	MsgBox($MB_OK,"Fueraaaaaaaaaaaa","Fuera del Programa")
	EndIf


WEnd