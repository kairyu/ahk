#InstallKeybdHook

SetTitleMatchMode, RegEx

SendKey(key)
{
	StringReplace, key, key, *
	StringReplace, key, key, $
	GetKeyState, Magic, LCtrl, P
	GetKeyState, Ctrl, LWin, P
	key = {%key%}
	If Magic = D
		key := MagicKey(key)
	If Ctrl = D
		key := CtrlKey(key)
	;MsgBox, %key%
	Send {Blind}%key%
	Return
}

MagicKey(key)
{
	If (key = "{p}")
		Return "{Up}"
	Else If (key = "{n}")
		Return "{Down}"
	Else If (key = "{b}")
		Return "{Left}"
	Else If (key = "{f}")
		Return "{Right}"
	Else If (key = "{a}")
		Return "{Home}"
	Else If (key = "{e}")
		Return "{End}"
	Else If (key = "{[}")
		Return "{ESC}"
	Else If (key = "{d}")
		Return "{DEL}"
	Else If (key = "{h}")
		Return "{BS}"
	Else If (key = "{i}")
		Return "{Tab}"
	Else If (key = "{j}")
		Return "{Return}"
	Else If (key = "{m}")
		Return "{Return}"
	Else If (key = "{Space}")
		Return "^#{Space}"
	Else If (key = "{w}")
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
GroupAdd, ExcludeGroup, ahk_class SunAwtFrame ; IntelliJ IDEA

;; Use Win as Ctrl
*LWin::LCtrl
#IfWinNotActive ahk_group ExcludeGroup
*LCtrl::Return
$*1::SendKey(A_ThisHotKey)
$*2::SendKey(A_ThisHotKey)
$*3::SendKey(A_ThisHotKey)
$*4::SendKey(A_ThisHotKey)
$*5::SendKey(A_ThisHotKey)
$*6::SendKey(A_ThisHotKey)
$*7::SendKey(A_ThisHotKey)
$*8::SendKey(A_ThisHotKey)
$*9::SendKey(A_ThisHotKey)
$*0::SendKey(A_ThisHotKey)
$*a::SendKey(A_ThisHotKey)
$*b::SendKey(A_ThisHotKey)
$*c::SendKey(A_ThisHotKey)
$*d::SendKey(A_ThisHotKey)
$*e::SendKey(A_ThisHotKey)
$*f::SendKey(A_ThisHotKey)
$*g::SendKey(A_ThisHotKey)
$*h::SendKey(A_ThisHotKey)
$*i::SendKey(A_ThisHotKey)
$*j::SendKey(A_ThisHotKey)
$*k::SendKey(A_ThisHotKey)
$*l::SendKey(A_ThisHotKey)
$*m::SendKey(A_ThisHotKey)
$*n::SendKey(A_ThisHotKey)
$*o::SendKey(A_ThisHotKey)
$*p::SendKey(A_ThisHotKey)
$*q::SendKey(A_ThisHotKey)
$*r::SendKey(A_ThisHotKey)
$*s::SendKey(A_ThisHotKey)
$*t::SendKey(A_ThisHotKey)
$*u::SendKey(A_ThisHotKey)
$*v::SendKey(A_ThisHotKey)
$*w::SendKey(A_ThisHotKey)
$*x::SendKey(A_ThisHotKey)
$*y::SendKey(A_ThisHotKey)
$*z::SendKey(A_ThisHotKey)
$*[::SendKey(A_ThisHotKey)
$*]::SendKey(A_ThisHotKey)
$*`::SendKey(A_ThisHotKey)
$*Esc::SendKey(A_ThisHotKey)
$*Space::SendKey(A_ThisHotKey)
#IfWinNotActive

; Paste for Vim
#IfWinActive ahk_class Vim
$<#v::Send ^O"{+}gP
#IfWinActive

; Copy and paste for PuTTY
#IfWinActive ahk_class PuTTY
$<#c::Send ^{Insert}
$<#v::Send +{Insert}
#IfWinActive

; Copy and paste for mintty
#IfWinActive ahk_class mintty
$<#c::Send ^{Insert}
$<#v::Send +{Insert}
#IfWinActive

; Copy and paste for CMD
#IfWinActive ahk_class ConsoleWindowClass
^c::Send !{Space}ek
^v::Send !{Space}ep
#IfWinActive

; Switch IME
#IfWinActive ahk_group ExcludeGroup
$<#Space::InputLangChangeForward()
$^Space::Send #^{Space}
#IfWinActive

; Some more remaps
#IfWinNotActive ahk_group ExcludeGroup
^q::WinClose, A
#IfWinNotActive
