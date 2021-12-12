# SuperCapsLock
为CapsLock赋能

CapsLock 和 RCtrl先进行映射。
Windows用户推荐使用[SharpKeys](https://github.com/randyrants/sharpkeys)
如果你是scoop用户或者wget用户，可以直接通过它们获取SharpKeys。  

```bash
winget install sharpkeys

scoop bucket add extras
scoop install sharpkeys
```
简单的通过界面把CapsLock和右边的Ctrl键位进行交换，并写入注册表中。  

这样CapsLock就变成了Ctrl键。  

但是还不够，这个时候左边就有了两个Ctrl键过于冗余，我们为CapsLock实体键增加一些功能。  

>CapsLock + h  ==>> Left (左方向键)  
CapsLock + j  ==>> Down (下方向键)  
CapsLock + k  ==>> Up (上方向键)  
CapsLock + l  ==>> Right (右方向键)  
CapsLock + f  ==>> 向右前进一个单词   
CapsLock + b  ==>> 向左前进一个单词  
CapsLock + e  ==>> End (移动到行尾)  
CapsLock + a  ==>> Home (移动到行首)  
CapsLock + d  ==>> Delete (删除键)  
CapsLock  ==>> Escape (退出键)  

>LCtrl+Win+c ==>> 复制文件的绝对路径  
鼠标中键 ==>> 隐藏/显示桌面图标


## Tips
当鼠标移动到任务栏时，此时滚动鼠标滑轮，可以控制系统音量。 ^_^