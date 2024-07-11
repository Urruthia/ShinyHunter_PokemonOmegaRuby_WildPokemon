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
		$colorZigzagoon  = PixelSearch(1040, 317, 1060, 337, 0x786d5b)
		$colorCascoonOjo = PixelSearch(939, 306, 999, 356, 0xb8646f)
		$colorCascoon = PixelSearch(920, 280, 990, 320, 0xe2dfeb)
		$colorShroomish1 = PixelSearch(965, 308, 985, 328, 0x9ac2ac)
		$colorShroomish2 = PixelSearch(941, 266, 961, 286, 0xf2e1ce)
		$colorSlakooth = PixelSearch(1111, 323, 1133, 343, 0xddd2c3)
		$colorSilcoon = PixelSearch(931, 261, 991, 321, 0xe2dfec)
		$colorTaillow = PixelSearch(1004, 326, 1024, 346, 0x3b3e5d)
		$Contador+=1


		If  IsArray($colorWurmple) or  IsArray($colorZigzagoon) or (IsArray($colorCascoonOjo) and  IsArray($colorCascoon)) or (IsArray($colorShroomish1) and  IsArray($colorShroomish2)) or IsArray($colorSlakooth) or  IsArray($colorTaillow) Then
			ConsoleWrite("CascoonOjo: " & $colorCascoonOjo  & @CRLF)
			ConsoleWrite("Cascoon: " & $colorCascoon & @CRLF)
			ConsoleWrite("Taillow: " & $colorTaillow & @CRLF)
			ConsoleWrite("Silcoon: " & $colorSilcoon & @CRLF)
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
			MsgBox($MB_OK,"Encontrado!!!!!","Se encontro un shiny")
			EndIf


	WEnd
	endif
if _IsPressed("1B", $hDLL) Then
	$hunting=False
	MsgBox($MB_OK,"Fueraaaaaaaaaaaa","Fuera del Programa")
	EndIf


WEnd