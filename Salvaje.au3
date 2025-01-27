#include<ImageSearch2015.au3>
#include <Misc.au3>
#include<AutoItConstants.au3>
Global $Contador=0;
Global $ContadorScreen=0;
Global $hunting = True
Global $encuentro = True
Global Const $walkingx1 = 959
Global Const $walkingy1 = 908
Global Const $walkingx2 = 1039
Global Const $walkingy2 = 988
Global Const $huirx1 = 883
Global Const $huiry1 = 905
Global Const $huirx2 = 1019
Global Const $huiry2 = 979
Global Const $walking = "walk2.png"
Global Const $huir = "huir2.png"
Global $returnx = 0
Global $returny= 0
Global $hDLL = DllOpen("user32.dll")
Sleep(3000)

While $hunting
	$result = _ImageSearchArea($walking,1,$walkingx1,$walkingy1,$walkingx2,$walkingy2,$returnx,$returny,0,0)
	if $result=1 Then


		send("{s down}")
		send("{LEFT down}")
		Sleep(250)
		send("{LEFT up}")
		send("{RIGHT down}")
		Sleep(250)
		send("{RIGHT up}")
		send("{s up}")
		if $encuentro=False then
		$encuentro= True
		EndIf
	Else
	while $encuentro
		$colorElektrike = PixelSearch(948, 269, 968, 289, 0xbcebb2)
		$colorMinum = PixelSearch(944, 240, 964, 260, 0x76c2ec)
		$colorGulpin = PixelSearch(977, 276, 999, 296, 0xAADAA1)
		$colorVoltorb = PixelSearch(929, 249, 949, 269, 0xF79c8d)
		$colorOddish = PixelSearch(962, 284, 982, 305, 0x5684a4)
		$colorWingull1  = PixelSearch(1032, 218, 1112, 298, 0x99daf7)
		$colorWingull2  = PixelSearch(1030, 220, 1120, 320, 0x6396bd)
		$colorWingull3  = PixelSearch(870, 210, 970, 320, 0x9fe3ff)
		$colorWingull4  = PixelSearch(870, 210, 970, 320, 0x9ee2ff)
		$colorZigzagoon  = PixelSearch(1040, 317, 1060, 337, 0x786d5b)
		$Contador+=1

		If   IsArray($colorWingull1) or  IsArray($colorWingull2) or  IsArray($colorWingull3) or  IsArray($colorWingull4) or IsArray($colorElektrike) or IsArray($colorMinum) or  IsArray($colorGulpin)  or  IsArray($colorVoltorb)  or IsArray($colorOddish) or IsArray($colorZigzagoon) Then
 #cs_ScreenCapture_Capture(@MyDocumentsDir & "\Screenshots\screen" & $ContadorScreen & ".jpg", 579, 54, 1350, 519)

 			ConsoleWrite("Wingull1: " & $colorWingull1 & @CRLF)
			ConsoleWrite("Wingull2: " & $colorWingull2 & @CRLF)
			ConsoleWrite("Wingull3: " & $colorWingull3 & @CRLF)
			ConsoleWrite("Wingull4: " & $colorWingull4 & @CRLF)
			ConsoleWrite("Elek: " & $colorElektrike & @CRLF)
			ConsoleWrite("Mnum: " & $colorMinum & @CRLF)
			ConsoleWrite("Gulpin: " & $colorGulpin & @CRLF)
			ConsoleWrite("oddish: " & $colorOddish & @CRLF)
			ConsoleWrite("Voltorb: " & $colorVoltorb & @CRLF)
			 #ce
 $ContadorScreen+=1
			$result7 = _ImageSearchArea($huir,1,$huirx1,$huiry1,$huirx2,$huiry2,$returnx,$returny,0,0)
			while $result7 = 0
				$result7 = _ImageSearchArea($huir,1,$huirx1,$huiry1,$huirx2,$huiry2,$returnx,$returny,0,0)
			If $result7=1 Then

				send("{NUMPADADD down}")
				send("{LEFT down}")
				Sleep(150)
				send("{LEFT up}")
				send("{RIGHT down}")
				Sleep(150)
				send("{RIGHT up}")
				send("{a down}")
				Sleep(150)
				send("{a up}")
				send("{NUMPADADD up}")
				$encuentro= False
				$Contador=0


			EndIf

			Wend
			ElseIf $Contador >= 65 then
			#cs _ScreenCapture_Capture(@MyDocumentsDir & "\Screenshots\screen" & $ContadorScreen & ".jpg", 579, 54, 1350, 519)
			#ce
			  $ContadorScreen+=1
			send("{NUMPADADD down}")
			Sleep(250)
			send("{NUMPADADD up}")
			$hunting= False
			$encuentro= False
			MsgBox($MB_OK,"Encontrado!!!!!","Se encontro un shiny")
			EndIf


	WEnd
	endif
if _IsPressed("1B", $hDLL) Then
	$hunting=False
	MsgBox($MB_OK,"Fueraaaaaaaaaaaa","Fuera del Programa")
	EndIf


WEnd