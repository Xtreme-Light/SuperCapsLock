#SingleInstance force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; https://wyagd001.github.io/zh-cn/docs/commands/_NoEnv.htm
SendMode Input  ; 让 Send 与 SendInput 同义. 由于其卓越的速度和可靠性, 推荐新脚本使用.  https://wyagd001.github.io/zh-cn/docs/commands/SendMode.htm
SetWorkingDir %A_ScriptDir%  ;

;这个脚本主要目的是给CapsLock赋能，也就是给CapsLock 组合多个键，展示不同效果

SetStoreCapslockMode, Off
;一直关闭 Capslock
SetCapsLockState, AlwaysOff  
;更换图标
I_Icon = panda.ico
IfExist, %I_Icon%
{
	Menu, Tray, Icon, %I_Icon%
}
;任务栏鼠标滚轮调节音量大小
#If MouseIsOver("ahk_class Shell_TrayWnd")
WheelUp::SoundSet +5, MASTER
WheelDown::SoundSet -5, MASTER
return
#If

CapsLock & k::
Send {Up}
return

CapsLock & j::
Send {Down}
return

CapsLock & l::
Send {Right}
return

CapsLock & h::
Send {Left}
return

CapsLock & a::
Send {Home}
return

CapsLock & e::
Send {End}
return

CapsLock & d::
Send {Del}
return

CapsLock & f::
Send ^{Right}
return

CapsLock & b::
Send ^{Left}
return

;=====================================================================o
;                      CapsLock + Intellj   Navigator                ;|
;-----------------------------------o---------------------------------o
;           一些CapsLock复用Ctrl的映射，主要是为了服务Intellij          ;|
;-----------------------------------o---------------------------------o
CapsLock & w::Send, ^w              ;Intellij的Extend Selection
CapsLock & m::Send, ^m              ;Intellij的光标居中
;---------------------------------------------------------------------o

CapsLock & c:: 
if GetKeyState("alt") = 0
{
	Send, ^c
}else{
	Send ^c
	Sleep,200
	Clipboard=%Clipboard% ;%null%
	; 这句还是废话一下：windows 复制的时候，剪贴板保存的是“路径”。只是路径不是字符串，只要转换成字符串就可以粘贴出来了。
	ToolTip,%Clipboard%
	Sleep,500
	ToolTip,
}
return
    
CapsLock & v:: Send, ^v  
CapsLock & z:: Send, ^z  
CapsLock & x:: Send, ^x  
CapsLock & q:: Send, ^q  
CapsLock & g:: Send, ^g  
CapsLock & r:: Send, ^r
CapsLock & t:: Send, ^t
CapsLock & y:: Send, ^y
CapsLock & u:: Send, ^u
CapsLock & i:: Send, ^i
CapsLock & o:: Send, ^o
CapsLock & p:: Send, ^p


CapsLock::Send, {ESC}      





MouseIsOver(WinTitle) {
	MouseGetPos,,, Win
	return WinExist(WinTitle . " ahk_id " . Win)
}










