#include<ImageSearch2015.au3>
#include <Misc.au3>
#include<AutoItConstants.au3>
Global $Contador=0;
Global $ContadorScreen=0;
Global $hunting = True
Global $encuentro = True
Global Const $walkingx1 = 969
Global Const $walkingy1 = 918
Global Const $walkingx2 = 1029
Global Const $walkingy2 = 978
Global Const $huirx1 = 893
Global Const $huiry1 = 915
Global Const $huirx2 = 1009
Global Const $huiry2 = 969
Global Const $walking = "walk.png"
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
		$colorWurmple = PixelSearch(924, 231, 978, 334, 0xe7696f)
		$colorWingull1  = PixelSearch(1032, 218, 1112, 298, 0x99daf7)
		$colorWingull2  = PixelSearch(1030, 220, 1120, 320, 0x6396bd)
		$colorWingull3  = PixelSearch(870, 210, 970, 320, 0x9fe3ff)
		$colorWingull4  = PixelSearch(870, 210, 970, 320, 0x9ee2ff)
		$colorZigzagoon  = PixelSearch(1040, 317, 1060, 337, 0x786d5b)
		$colorTaillow = PixelSearch(1004, 326, 1024, 346, 0x3b3e5d)
		$Contador+=1

		If  IsArray($colorWingull1) or  IsArray($colorWingull2) or  IsArray($colorWingull3) or  IsArray($colorWingull4) or  IsArray($colorZigzagoon) or IsArray($colorWurmple) or IsArray($colorTaillow) Then
			 _ScreenCapture_Capture(@MyDocumentsDir & "\Screenshots\screen" & $ContadorScreen & ".jpg", 579, 54, 1350, 519)
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
			ElseIf $Contador >= 75 then
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