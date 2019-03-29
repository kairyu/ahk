#InstallKeybdHook

SetTitleMatchMode, RegEx
Global Magic, Ctrl

SendKeyDown(key)
{
	StringReplace, key, key, *
	StringReplace, key, key, $
	GetKeyState, Magic, LCtrl, P
	GetKeyState, Ctrl, LWin, P
	key = {%key% down}
	If Magic = D
		key := MagicKeyDown(key)
	If Ctrl = D
		key := CtrlKey(key)
	;MsgBox, %key%
	SendInput {Blind}%key%
	Return
}

SendKeyUp(key)
{
	StringReplace, key, key, *
	StringReplace, key, key, $
	GetKeyState, Magic, LCtrl, P
	GetKeyState, Ctrl, LWin, P
	key = {%key%}
	If Magic = D
		key := MagicKeyUp(key)
	If Ctrl = D
		key := CtrlKey(key)
	;MsgBox, %key%
	SendInput {Blind}%key%
	Return
}

MagicKeyDown(key)
{
	;MsgBox, %key%
	If (key = "{p down}")
		Return "{Up down}"
	Else If (key = "{n down}")
		Return "{Down down}"
	Else If (key = "{b down}")
		Return "{Left down}"
	Else If (key = "{f down}")
		Return "{Right down}"
	Else If (key = "{a down}")
		Return "{Home down}"
	Else If (key = "{e down}")
		Return "{End down}"
	Else If (key = "{[ down}")
		Return "{ESC down}"
	Else If (key = "{d down}")
		Return "{DEL down}"
	Else If (key = "{h down}")
		Return "{BS down}"
	Else If (key = "{i down}")
		Return "{Tab down}"
	Else If (key = "{j down}")
		Return "{Return down}"
	Else If (key = "{m down}")
		Return "{Return down}"
	Else If (key = "{w down}")
	{
		Send {Ctrl Down}{Shift Down}{Left}{Shift Up}{Ctrl Up}
		Sleep, 10
		Send ^x
		Return
	}
	Else If (key = "{u}")
	{
		Send {Shift Down}{Home}{Shift Up}
		Sleep, 10
		Send ^x
		Return
	}
	Else If (key = "{k}")
	{
		Send {Shift Down}{End}{Shift Up}
		Sleep, 10
		Send ^x
		Return
	}
	Else If (key = "{c}")
	{
		Send {Ctrl Down}{c}{Ctrl Up}
		Return
	}
	key = ^%key%
	Return key
}

MagicKeyUp(key)
{
	;MsgBox, %key%
	If (key = "{p up}")
		Return "{Up up}"
	Else If (key = "{n up}")
		Return "{Down up}"
	Else If (key = "{b up}")
		Return "{Left up}"
	Else If (key = "{f up}")
		Return "{Right up}"
	Else If (key = "{a up}")
		Return "{Home up}"
	Else If (key = "{e up}")
		Return "{End up}"
	Else If (key = "{[ up}")
		Return "{ESC up}"
	Else If (key = "{d up}")
		Return "{DEL up}"
	Else If (key = "{h up}")
		Return "{BS up}"
	Else If (key = "{i up}")
		Return "{Tab up}"
	Else If (key = "{j up}")
		Return "{Return up}"
	Else If (key = "{m up}")
		Return "{Return up}"
	Else If (key = "{w up}")
		Return
	Else If (key = "{u up}")
		Return
	Else If (key = "{k up}")
		Return
	Else If (key = "{c up}")
		Return
	key = ^%key%
	Return key
}

CtrlKey(key)
{
	StringReplace, key, key, ^
	If (key = "{Space}")
	{
		InputLangChangeForward()
		Return
	}
	key = ^%key%
	Return key
}

InputLangChangeBackward()
{
	PostMessage, 0x50, 0x04, 0,, A
	Return
}

InputLangChangeForward()
{
	PostMessage, 0x50, 0x02, 0,, A
	Return
}

GroupAdd, ExcludeGroup, ahk_class Vim
GroupAdd, ExcludeGroup, ahk_class PuTTY
GroupAdd, ExcludeGroup, ahk_class mintty
;GroupAdd, ExcludeGroup, ahk_class QWidget
GroupAdd, ExcludeGroup, ^.* - Microsoft Visual Studio.*$ ahk_class ^HwndWrapper\[DefaultDomain;;.*\]$
GroupAdd, ExcludeGroup, ahk_class TscShellContainerClass ; Remote Desktop
;GroupAdd, ExcludeGroup, ahk_class Chrome_WidgetWin_1
GroupAdd, ExcludeGroup, ahk_class CEFCLIENT ; Brackets
GroupAdd, ExcludeGroup, ahk_class SWT_Window0 ; Eclipse
;GroupAdd, ExcludeGroup, ahk_class SunAwtFrame ; IntelliJ IDEA
GroupAdd, ExcludeGroup, ahk_class VirtualConsoleClass ; ConEmu
GroupAdd, ExcludeGroup, ahk_class ConsoleWindowClass ; CMD
GroupAdd, ExcludeGroup, ahk_exe devenv.exe ; Microsoft Visual Studio
GroupAdd, ExcludeGroup, ahk_exe nvim-qt.exe ; NeoVim QT
GroupAdd, ExcludeGroup, ahk_exe Oni.exe ; Oni
GroupAdd, ExcludeGroup, ahk_exe MousewithoutBordersHelper.exe ; Mouse Without Boarders

;; Use Win as Ctrl
*LWin::LCtrl
#IfWinNotActive ahk_group ExcludeGroup
*LCtrl::Return
;If Ctrl = D
{
$*1::SendKeyDown(A_ThisHotKey)
$*2::SendKeyDown(A_ThisHotKey)
$*3::SendKeyDown(A_ThisHotKey)
$*4::SendKeyDown(A_ThisHotKey)
$*5::SendKeyDown(A_ThisHotKey)
$*6::SendKeyDown(A_ThisHotKey)
$*7::SendKeyDown(A_ThisHotKey)
$*8::SendKeyDown(A_ThisHotKey)
$*9::SendKeyDown(A_ThisHotKey)
$*0::SendKeyDown(A_ThisHotKey)
$*a::SendKeyDown(A_ThisHotKey)
$*b::SendKeyDown(A_ThisHotKey)
$*c::SendKeyDown(A_ThisHotKey)
$*d::SendKeyDown(A_ThisHotKey)
$*e::SendKeyDown(A_ThisHotKey)
$*f::SendKeyDown(A_ThisHotKey)
$*g::SendKeyDown(A_ThisHotKey)
$*h::SendKeyDown(A_ThisHotKey)
$*i::SendKeyDown(A_ThisHotKey)
$*j::SendKeyDown(A_ThisHotKey)
$*k::SendKeyDown(A_ThisHotKey)
$*l::SendKeyDown(A_ThisHotKey)
$*m::SendKeyDown(A_ThisHotKey)
$*n::SendKeyDown(A_ThisHotKey)
$*o::SendKeyDown(A_ThisHotKey)
$*p::SendKeyDown(A_ThisHotKey)
$*q::SendKeyDown(A_ThisHotKey)
$*r::SendKeyDown(A_ThisHotKey)
$*s::SendKeyDown(A_ThisHotKey)
$*t::SendKeyDown(A_ThisHotKey)
$*u::SendKeyDown(A_ThisHotKey)
$*v::SendKeyDown(A_ThisHotKey)
$*w::SendKeyDown(A_ThisHotKey)
$*x::SendKeyDown(A_ThisHotKey)
$*y::SendKeyDown(A_ThisHotKey)
$*z::SendKeyDown(A_ThisHotKey)
$*[::SendKeyDown(A_ThisHotKey)
$*]::SendKeyDown(A_ThisHotKey)
$*`::SendKeyDown(A_ThisHotKey)
$*Esc::SendKeyDown(A_ThisHotKey)
$*Space::SendKeyDown(A_ThisHotKey)
$*Backspace::SendKeyDown(A_ThisHotKey)
$*Enter::SendKeyDown(A_ThisHotKey)

$*1 up::SendKeyUp(A_ThisHotKey)
$*2 up::SendKeyUp(A_ThisHotKey)
$*3 up::SendKeyUp(A_ThisHotKey)
$*4 up::SendKeyUp(A_ThisHotKey)
$*5 up::SendKeyUp(A_ThisHotKey)
$*6 up::SendKeyUp(A_ThisHotKey)
$*7 up::SendKeyUp(A_ThisHotKey)
$*8 up::SendKeyUp(A_ThisHotKey)
$*9 up::SendKeyUp(A_ThisHotKey)
$*0 up::SendKeyUp(A_ThisHotKey)
$*a up::SendKeyUp(A_ThisHotKey)
$*b up::SendKeyUp(A_ThisHotKey)
$*c up::SendKeyUp(A_ThisHotKey)
$*d up::SendKeyUp(A_ThisHotKey)
$*e up::SendKeyUp(A_ThisHotKey)
$*f up::SendKeyUp(A_ThisHotKey)
$*g up::SendKeyUp(A_ThisHotKey)
$*h up::SendKeyUp(A_ThisHotKey)
$*i up::SendKeyUp(A_ThisHotKey)
$*j up::SendKeyUp(A_ThisHotKey)
$*k up::SendKeyUp(A_ThisHotKey)
$*l up::SendKeyUp(A_ThisHotKey)
$*m up::SendKeyUp(A_ThisHotKey)
$*n up::SendKeyUp(A_ThisHotKey)
$*o up::SendKeyUp(A_ThisHotKey)
$*p up::SendKeyUp(A_ThisHotKey)
$*q up::SendKeyUp(A_ThisHotKey)
$*r up::SendKeyUp(A_ThisHotKey)
$*s up::SendKeyUp(A_ThisHotKey)
$*t up::SendKeyUp(A_ThisHotKey)
$*u up::SendKeyUp(A_ThisHotKey)
$*v up::SendKeyUp(A_ThisHotKey)
$*w up::SendKeyUp(A_ThisHotKey)
$*x up::SendKeyUp(A_ThisHotKey)
$*y up::SendKeyUp(A_ThisHotKey)
$*z up::SendKeyUp(A_ThisHotKey)
$*[ up::SendKeyUp(A_ThisHotKey)
$*] up::SendKeyUp(A_ThisHotKey)
$*` up::SendKeyUp(A_ThisHotKey)
$*Esc up::SendKeyUp(A_ThisHotKey)
$*Space up::SendKeyUp(A_ThisHotKey)
$*Backspace up::SendKeyUp(A_ThisHotKey)
$*Enter up::SendKeyUp(A_ThisHotKey)
}
#IfWinNotActive

sc07D::\

; Copy and paste for GVim
#IfWinActive ahk_class Vim
$<#c::Send ^{Insert}
$<#v::Send +{Insert}
#IfWinActive

; Copy and paste for PuTTY
#IfWinActive ahk_class PuTTY
$<#c::Send ^{Insert}
$<#v::Send +{Insert}
#IfWinActive

; Copy and paste for ConEmu
#IfWinActive ahk_class VirtualConsoleClass
$<#c::Send ^{Insert}
$<#v::Send +{Insert}
#IfWinActive

; Copy and paste for mintty
#IfWinActive ahk_class mintty
$<#c::Send ^{Insert}
$<#v::Send +{Insert}
#IfWinActive

; Copy and paste for CMD
;#IfWinActive ahk_class ConsoleWindowClass
;^c::Send !{Space}ek
;^v::Send !{Space}ep
;#IfWinActive

; Copy and paste for CMD w/ clink
#IfWinActive ahk_class ConsoleWindowClass
$<#v::Send ^v
#IfWinActive

; Switch IME
#IfWinActive ahk_group ExcludeGroup
$<#Space::InputLangChangeForward()
;$^Space::Send !{Space}
#IfWinActive

; Some more remaps
#IfWinNotActive ahk_group ExcludeGroup
^q::WinClose, A
#IfWinNotActive