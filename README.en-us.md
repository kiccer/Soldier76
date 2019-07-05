
<h1 align="center">
  Soldier76 <img src="./static/img/76_logo.png" alt="76_logo">
</h1>
<div align="center">PUBG - Logitech mouse macro no recoil script instruction for use</div>
<div align="center"><b>(Must... Must.. Must.. Read carefully. The instructions are very detailed.)</b></div>
<div align="center">If you think the game experience has improved, please give me a little star.⭐</div>
<br>
<p align="center">
  <img src="https://img.shields.io/badge/lua-5.1-00007F.svg" alt="lua-5.1">
  <img src="https://img.shields.io/badge/logitech-✔-A7F079.svg" alt="logitech-✔">
  <img src="https://img.shields.io/badge/lgs-9.02.65-00B8FC.svg" alt="lgs-9.02.65">
  <img src="https://img.shields.io/badge/version-3.12.1-29D1E3.svg" alt="version-3.12.1">
</p>

---

### Preface
* My English is not very good, this document is also completed by means of translation software, I hope to help you.


### Download
* Select a version to <a href="https://github.com/kiccer/Soldier76/releases" target="_blank">download</a>.
* Version number **a.b.c** consists of three parts.
* **a**is a large version number. When this version number is changed, it may cause changes in operation mode.
* **b** is the minor version number, usually indicating new functionality.
* **c** is a revision number, usually indicating that BUG has been repaired or that new functions are being tested.

### Install
* Start Logitech Driver as **Administrator**
  - Make sure that the driver you downloaded matches your operating system.
* Open **Auto Game Detection**
  - The advantage of this is that scripts can be avoided accidentally interfering with normal operations.
* Scanning Game
  - If the game cannot be found by automatic detection, it needs to be added manually.
* Right-click the **PUBG** icon on the right side of the configuration file - > **Scripting**
  - After the last step, there will be an extra **PUBG** icon. Right-click on this icon to find **Scripting**
* Enter and save all the code contained in **Soldier76.lua** (Ctrl + S)
  - Overlay, that is, when opening **to write scripts**, the original generated code is not retained
* Right-click **PUBG Configuration** and **Default Configuration** in **G6**, **G7**, **G8**, **G9**, **G10**, **G11** Button -> **Unallocate**
  - Keyboard macros bound by keys in both current and default configurations may interfere with the normal use of scripts, so the allocation should be **Unallocate**.

### Game Settings
* The script sets `AimingSettings = "recommend"` by default, it's script recommendation settings, the settings in the game need to be changed accordingly.
  - ADS: Long press right button
  - Aim: Long press left Ctrl
* If you are used to the default settings for games, set `Aiming Settings = "default"`, then you don't need to change any game settings.
  - With this setup, any click you make will be identified as a shot and will reduce the backlash.
  - If you just want to click, hold left shift or left ALT or temporarily close `CapsLock`.
* If your operating habits are different, you can also set `Aiming Settings = "custom"`.
  - Using this setting requires corresponding judgments in `customAiming Settings`.
  - If you want to use it, you need to know the script first, or you can join the communication group for help.
* The latest version of the script will enable full automatic firing by default. If you need to turn it off, set  `autoContinuousFiring = 0`
  - The latest version of the function has realized the left key connection point, no longer using keyboard keys to fire, improve security and practicability
  - If you think it's not safe, you can turn it off and use the fully automated mode in the game.

### G-key function (default settings)
G key | Functional description
:--: | ---
`G6` | Switch to **5.56** Firearms Profile Table and use **first** configuration
`G7` | Switch to **9mm** Firearms Profile Table and use **first** configuration
`G8` | Switch to **7.62** Firearms Profile Table and use **first** configuration
`G9` | Switch to **.45** Firearms Profile Table and use **first** configuration
`G10` | Switch to **the last** Configuration (mouse roller deviation to the right)
`G11` | Switch to **the next** Configuration (mouse roller deviation to the left)
`lalt` + `G6` | Switch to base no recoil mode
`lalt` + `G7` | Switch to scopeX3 no recoil mode
`lalt` + `G8` | Switch to scopeX4 no recoil mode
`lalt` + `G9` | Switch to scopeX2 no recoil mode
`lalt` + `G11` | Switch to scopeX6 no recoil mode

> The above settings can be customized

### What is switch?
> Many people don't know what switching means. This is what makes our script different.
>
>In this script, there is a gun depot, which is divided into different series according to bullet type, including **.45**, **9mm**, **5.56** and **7.62**. Each series contains firearms that match the type of ammunition. For example, the first gun in the 5.56 series is **M416**. **G6-G9** has four keys, each of which represents a series. After clicking, it will switch to the firearms table of the corresponding series, and automatically select the first gun in the list. Multiple pressing of the **G11** button allows you to choose the gun downward. If you need the last gun in the series, just press **G10** once.
>
> For example, if you find a **AKM**, you just need to click the **G8** button, because **AKM** is the first gun in the **7.62** series. If you pick up another **QBZ**, you don't want your **AKM**, then you need to click **G6** once, switch to **5.56** series and choose the first gun by default, while **QBZ** is the third, so you have to press **G11** twice again, so you can use **QBZ** data.
>
> See `userInfo.canUse`in the source code for the order of firearms, that is, the order of firearms.
>
> The above G-key functions can be customized settings, default to g502 settings, other Logitech series programmable mice are also supported. If you can't set up and adjust it, you are welcome to ask us.

### Instruction list
Instruction | Function description
:--: | ---
`.45` | Switch to **5.56** Firearms Profile Table and use **first** configuration
`9mm` | Switch to **9mm** Firearms Profile Table and use **first** configuration
`5.56` | Switch to **5.56** Firearms Profile Table and use **first** configuration
`7.62` | Switch to **7.62** Firearms Profile Table and use **first** configuration
`first` | Switch to the first gun in the current list
`next` | Switch to the next gun in the current list
`last` | Switch to the last gun in the current list
`off` |When `startControl = "G_bind"`, the command control script closes and the switch gun operation restarts the macro.
`scopeX1` | Switch to base no recoil mode (Red Spot Aiming Device, Holographic Aiming Device, Side Aiming Device or No Aiming Device)
`scopeX2` | Switch to scopeX2 no recoil mode
`scopeX3` | Switch to scopeX3 no recoil mode
`scopeX4` | Switch to scopeX4 no recoil mode
`scopeX6` | Switch to scopeX6 no recoil mode
`UMP45` | Direct switch to `UMP45` configuration
`Tommy Gun` | Direct switch to `Tommy Gun` configuration
`Vector` | Direct switch to `Vector` configuration
`Micro UZI` | Direct switch to `Micro UZI` configuration
`M416` | Direct switch to `M416` configuration
`SCAR-L` | Direct switch to `SCAR-L` configuration
`QBZ` | Direct switch to `QBZ` configuration
`G36C` | Direct switch to `G36C` configuration
`AKM` | Direct switch to `AKM` configuration
`Beryl M762` | Direct switch to `Beryl M762` configuration
`DP-28` | Direct switch to `DP-28` configuration

> You can bind to `G_bind`, triggering instructions using a default combination key

### Mode Control
Keyboard | Function description
:--: | ---
**CapsLock** | Open the capital key, start the macro, close the macro, close without backlash, but the `G_bind` instruction is still valid (note: can be changed to other control mode)
**ScrollLock** | Open the developer debugging mode, and then the quasi-star will automatically move to the right (after opening, try to modify the value of `ADS`, so that the trajectory becomes a straight line)

### Aiming settings
Parameter | Description
:--: | ---
`default` | Use the game's initial default settings, that is, right-click to open the mirror and long-click right-click to aim. (Simple click operation needs to hold the left shift)
`recommend` | Use this script to recommend settings, that is, long press the right button to ADS and long press the left Ctrl to Aim.
`custom` | Custom settings, using the criteria set in `customAimingSettings`.

### Start control
Parameter | Description
:--: | ---
`capslock` | Use `Caps Lock` to control
`numlock` | Use `Num Lock` to control
`G_bind` | Close the macro with the `off` command, and any gun switching operation can open the macro.

### First use
1. Install
1. Change in-game settings
1. Modify the firearms in the script `canUse`, set `UMP45` to **1**, and set all others to **0**. (**In automatic game detection, the switching window will cause script restart, so the location information of the last configuration table will not be recorded, and the available firearms will be limited to one which is beneficial for debugging, or you can choose to keep other firearms.**)
1. Enter the training ground and install the specified accessories for the gun according to the notes.
1. Turn on the pressure gun function and the debugging mode `ScrollLock`. Face the wall, press the right button to open the mirror, press the left button to open fire, you will find that the quasi-star automatically shifts to the right. Please do not move the mouse until the bullet is light.
1. If the bullet print is not a horizontal line, then modify the value of `ADS`, fine-tune up and down.
1. Go back to the game and feel the trajectory change. Repeat the above modification and try again until the trajectory becomes a horizontal line.
1. If the value cannot be changed to a horizontal line, try to slightly adjust the mouse sensitivity in the game.
1. When the trajectory succeeds in becoming a horizontal line, close the debugging mode `ScrollLock`, and shoot again against the wall. If there is no accident, then congratulations, you have succeeded in achieving no backlash!
1. Fine-tune the value of `userInfo.sensitivity.Aim` 、 `userInfo.sensitivity.scopeX2` 、 `userInfo.sensitivity.scopeX3` 、 `userInfo.sensitivity.scopeX4` 、 `userInfo.sensitivity.scopeX6`, Make more scope available without recoil.
1. Modify the firearms in the script `canUse`, and set the firearms you need to **1**
1. `ctrl+s` After saving the script, you can try to switch the configuration in the editor. When you switch the configuration, you will have the corresponding text information output. You can confirm whether the configuration information is the same as what you expected here.
1. The last step is to find your teammates and show them off.

> Note that the comments in the code clearly indicate the user-defined area and the script core area. Please do not modify the code in the script core area.

### Hardware conditions
* A programmable Logitech mouse (wireless mouse is very unstable when running macros)
* Game screen is not jammed, frame dropping is not frequent, if necessary, the number of frames can be locked to ensure stability.

### Disclaimer
* **This script program is only for learning and communication. It is strictly forbidden to be used for any commercial purpose. If there is any dispute of interest, it will not be responsible.**
* **Please respect the author's work, if you need to reproduce, please indicate the source, thank you!**
* **This script can not be used for commercial purposes after second creation!**

### Communication Group
* Welcome to join QQ Group of Technical Exchange: [![logitech 鼠标宏技术交流](./static/img/group.png)](https://kiccer.github.io/Soldier76/static/join_group.html)
* Small partners who are willing to fine-tune the trajectory of this project are very welcome.
* We also welcome small partners from other projects to join us to exchange technical topics.

### Question Feedback
* If you have any questions or shortcomings in using scripts, you can give me feedback in [`issues`](https://github.com/kiccer/Soldier76/issues).

### About macros
* Macros is like a handy blind man
* It can help you do more sophisticated operations.
* But it can't be adapted to the real-time situation.
* So it can't change the fact that you're not good at it……

### Need help
My English is not very good, and the translation results of translation software are usually very strange. So I need a translator to help me translate this document into other languages. If you can, please contact me.

If you could directly `fork` the project and create a `README.[lang].md`, then `Pull Request` would be great for me.

<!-- ~~Ps: 如果认为游戏体验有提升的话，请给我一颗小星星:)~~ -->
