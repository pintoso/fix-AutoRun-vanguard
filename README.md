# Fix AutoRun Vanguard
![image](https://github.com/pintoso/fix-AutoRun-vanguard/assets/26844778/bf42b0ff-c81d-4bcb-a3e3-5c81b04abbb1)

"fix" for Vanguard / Valorant start without conflict with pirated softwares.

Just a simple script that will quickly and easily change the value of the DevOverrideEnable key in the windows registry depending on your needs.

By default it will detect `Riot/Valorant launcher` or `Vegas 20` program when they are opened
If it is detected that the program/game is not working, a confirmation window will appear.

(you can change it manually in the tray menu anyway)

------------

### DOWNLOAD OPTIONS
⚠️read the [FAQ](#faq) before

- #### [❶.EXE](https://github.com/pintoso/fix-AutoRun-vanguard/releases/latest/download/AutoRun.exe)
>✔️Make an exception for the`AutoRun.exe`if your antivirus does not like the file, this is a FALSE positive. 
([VIRUSTOTAL](https://www.virustotal.com/gui/file/4202fdd3d98db2c8888cfe19c052349379ec1f9206f31061037bd845b481849a/detection) scan)


- #### [❷.AHK](https://github.com/pintoso/fix-AutoRun-vanguard/archive/refs/heads/master.zip)
**need to install [AutoHotkey](https://www.autohotkey.com/download/ahk-v2.exe), extract the Agent Picker files and run `AgentPicker.ahk` as admin**

you can also [compile it yourself](#compiling)

## How to use
1. Download & run executable as admin
2. Run VALORANT
3. Accept and Restart



## Compiling
if you want to compile by yourself for security reasons(?), follow this step by step to compile correctly in `.exe`

1. Install [AHK](https://www.autohotkey.com/download/)
2. Download/clone the [github repository](https://github.com/pintoso/fix-AutoRun-vanguard)
3. Compile `AgentPicker.ahk` using Ahk2Exe


## FAQ
- Why is my antivirus blocking AutoRun?
> Idk, but yes it is safe, you can review the source code and compile it yourself, you will get the same result.


- How do I make another program be detected instead of Vegas 20?
> On [line 100](https://github.com/pintoso/fix-AutoRun-vanguard/blob/main/AutoRun.ahk#L100) `Process, Exist, vegas200.exe` change `vegas200.exe` to the executable you want.
