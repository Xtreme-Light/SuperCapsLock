#SingleInstance force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; https://wyagd001.github.io/zh-cn/docs/commands/_NoEnv.htm
SendMode Input  ; 让 Send 与 SendInput 同义. 由于其卓越的速度和可靠性, 推荐新脚本使用.  https://wyagd001.github.io/zh-cn/docs/commands/SendMode.htm
SetWorkingDir %A_ScriptDir%  ;

; 这个脚本主要是希望CapsLock去代替RControl

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
MouseIsOver(WinTitle) {
	MouseGetPos,,, Win
	return WinExist(WinTitle . " ahk_id " . Win)
}

; https://wyagd001.github.io/zh-cn/docs/commands/GetKeyState.htm
; 如果键是按下的(或打开了), 函数返回 1, 如果是松开的, 则返回 0.
CapsLock::RCtrl

>^k::
Send {Up}
return

>^j::
Send {Down}
return

>^l::
Send {Right}
return

>^h::
Send {Left}
return

>^a::
Send {Home}
return

>^e::
Send {End}
return

>^d::
Send {Del}
return

>^f::
Send ^{Right}
return

>^b::
Send ^{Left}
return

<^#c::
 	; null=
 	;多谢 helfee 的提醒，删除线部分是多余的。
    Send ^c
 	Sleep,200
 	Clipboard=%Clipboard% ;%null%
 	; 这句还是废话一下：windows 复制的时候，剪贴板保存的是“路径”。只是路径不是字符串，只要转换成字符串就可以粘贴出来了。
 	ToolTip,%Clipboard%
 	Sleep,500
 	ToolTip,
 return







