; 存储一些好用的函数或者脚本之类的，易于后面的借鉴


#SingleInstance force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; https://wyagd001.github.io/zh-cn/docs/commands/_NoEnv.htm
SendMode Input  ; 让 Send 与 SendInput 同义. 由于其卓越的速度和可靠性, 推荐新脚本使用.  https://wyagd001.github.io/zh-cn/docs/commands/SendMode.htm
SetWorkingDir %A_ScriptDir%  ;

;使用管理员身份运行
;https://www.autohotkey.com/docs/commands/Run.htm#RunAs
full_command_line := DllCall("GetCommandLine", "str")

if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)"))
{
    try
    {
        if A_IsCompiled
            Run *RunAs "%A_ScriptFullPath%" /restart
        else
            Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
    }
    ExitApp
}
MsgBox A_IsAdmin: %A_IsAdmin%`nCommand line: %full_command_line%


; 使用Ctrl + Windows + c 来复制资源管理器文件的完整路径

; https://github.com/FreemanZY/AutoHotKey/blob/master/scripts/19.%E7%94%A8%E5%BF%AB%E6%8D%B7%E9%94%AE%E5%BE%97%E5%88%B0%E5%BD%93%E5%89%8D%E9%80%89%E4%B8%AD%E6%96%87%E4%BB%B6%E7%9A%84%E8%B7%AF%E5%BE%84.ahk
 ^#c::
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
