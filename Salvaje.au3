#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compile_Both=y
#AutoIt3Wrapper_UseX64=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
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
		$colorRoselia = PixelSearch(1004, 347, 1024, 367, 0x93ace6)
		$colorIllumise = PixelSearch(1007, 326, 1003, 346, 0x8b7494)
		$colorMarill= PixelSearch(981, 296, 1001, 317, 0x3da5dd)
		$colorVolbeat = PixelSearch(1007, 316, 1027, 356, 0xfe736d)
		$colorOddish = PixelSearch(962, 284, 982, 305, 0x5684a4)
		$colorZigzagoon  = PixelSearch(1040, 317, 1060, 337, 0x786d5b)
		$colorSurskit = PixelSearch(1150, 190, 1090, 230, 0x84c6ed)
		$Contador+=1

		If   IsArray($colorRoselia) or  IsArray($colorIllumise) or  IsArray($colorMarill) or  IsArray($colorVolbeat) or IsArray($colorSurskit)   or   IsArray($colorOddish) or IsArray($colorZigzagoon) Then
 _ScreenCapture_Capture(@MyDocumentsDir & "\Screenshots\screen" & $ContadorScreen & ".jpg", 579, 54, 1350, 519)
#cs
 			ConsoleWrite("Illumise: " & $colorIllumise & @CRLF)
			ConsoleWrite("Roselia: " & $colorRoselia & @CRLF)
			ConsoleWrite("Marill: " & $colorMarill & @CRLF)
			ConsoleWrite("Volbeat: " & $colorVolbeat & @CRLF)
			ConsoleWrite("oddish: " & $colorOddish & @CRLF)
			ConsoleWrite("Susrskit: " & $colorSurskit & @CRLF)
			ConsoleWrite("Zigzag: " & $colorZigzagoon & @CRLF)
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
			 _ScreenCapture_Capture(@MyDocumentsDir & "\Screenshots\screen" & $ContadorScreen & ".jpg", 579, 54, 1350, 519)

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