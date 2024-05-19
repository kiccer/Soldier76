<div align="center">
  <img src="./static/img/76_logo.png" alt="76_logo">
</div>
<h1 align="center">
  Soldier76 | <a href="./README-LITE.md">Lite</a>
</h1>
<div align="center">Instructions for using the PUBG - Logitech mouse macro automatic recoil control script</div>
<div align="center"><b>(Be sure to... be sure to... be sure to... read carefully, the instructions are very detailed)</b></div>
<div align="center">If you think the game experience has been improved, please give me a little star⭐</div>
<br>
<p align="center">
  <img src="https://img.shields.io/badge/lua-5.1-00007F.svg?style=flat-square&logo" alt="lua-5.1">
  <img src="https://img.shields.io/badge/logitech-✔-A7F079.svg?style=flat-square&logo" alt="logitech-✔">
  <img src="https://img.shields.io/badge/lgs-9.02.65-00B8FC.svg?style=flat-square&logo" alt="lgs-9.02.65">
  <img src="https://img.shields.io/badge/version-latest-29D1E3.svg?style=flat-square&logo" alt="version-latest">
</p>

### Download Script

* Select a version and then [download](https://github.com/kiccer/Soldier76/releases). 
* If you use mirror download, please note whether the version number is consistent with that on GitHub. The mirror project may not be the latest version because it needs to be manually synchronized.

### Installation Guide

* Launch the Logitech driver as an **administrator**

  * Make sure the driver you downloaded is compatible with your operating system
  * Currently, the new `GHUB` driver is not supported. For related information, please refer to the [discussion area](https://github.com/kiccer/Soldier76/discussions/118).

* Enable **automatic game detection**

  * This is beneficial to prevent the script from interfering with normal operations.
  * Try not to lock the configuration, as your script will be running all the time after locking, which may interfere with your mouse's normal use.

* Scan for games

  * If the automatic detection cannot find the game, it needs to be manually added.
  * The trick to manually adding is to open the task manager, find the game process, right-click and select open file location to find the file that needs to be added.

* Right-click on the **PUBG** icon on the right side of the configuration file and select **Edit Script**

  * After the previous step, a PUBG icon will appear. Right-click on this icon to find **Edit Script**.

* Completely **overwrite** all the code contained in **Soldier76.lua** and save (Ctrl + S)

  * Overwrite means to not keep the initially generated code when opening **Edit Script**.
  * Note that machine translation of the script should not be used as it can destroy the code format and cause errors.

* Right-click on the buttons assigned to **G6**, **G7**, **G8**, **G9**, **G10**, **G11** in **PUBG Config** and **Default Config** and select **Unassign**

  * The button binding of the onboard macro in the current configuration and the default configuration may interfere with the normal use of the script, so it should be **Unassigned**.

### Game Settings

* By **default**, the script sets `AimingSettings = "recommend"`, which requires corresponding changes to the in-game settings.

  * Aiming: **Press and hold** right-click
  * ADS: When `autoPressAimKey = ""`, **press and hold** `ctrl`

* If you prefer the **default game settings**, set `AimingSettings = "default"`, and you won't need to change any game settings.

  * With this setting, any click operation will be recognized as shooting and will trigger automatic recoil control.
  * If you just want to perform a click operation, you need to turn off the script or temporarily hold down the left shift or left alt key.

* If your operating habits are different from most people, you can also **customize** the settings by setting `AimingSettings = "custom"`.

  * With this setting, corresponding judgments need to be made in `customAimingSettings`.
  * It is recommended to have a certain understanding of the script before using this setting, or you can join the communication group for help.

* The latest version of the script adds the **auto-hip fire** function, which can be enabled by setting `autoPressAimKey = "tilde"`.

  * This needs to be set to a key on the keyboard. Please refer to **G-series Lua API Reference.docx** for key names.
  * To disable this function, set `autoPressAimKey = ""`.
  * This function is not compatible with `AimingSettings = "default"`.
  * It is compatible with `AimingSettings = "recommend"` by default, but it will affect normal click operations. To perform click operations, please turn off the script or temporarily hold down the left shift or left alt key.
  * It is compatible with `AimingSettings = "custom"`, but you need to make your own compatibility settings.

| Parameter | Description |
:--: | ---
| `default` | Use the game's default settings, i.e. click the right mouse button to aim, and hold down the left shift key when performing simple click operations. |
| `recommend` | Use the recommended settings by the script, i.e. hold down the right mouse button to aim, and hold down the left control key to aim. (This is the default setting of the script) |
| `ctrlmode` | This mode requires modifying the game settings for quick aiming. When holding down the "Ctrl" key, the character will crouch. (This mode does not have the function of firing from the hip) |
| `custom` | Custom settings, using the judgment conditions set in `customAimingSettings`. |

### Startup Control

> Modify `startControl = "capslock"` to use different ways to control the macro on and off.

| Parameter | Description |
:--: | ---
| `capslock` | Use the Caps Lock key to control. (Default and recommended) |
| `numlock` | Use the Num Lock key to control. |
| `G_bind` | Use the `off` command to turn off the macro. The macro can be turned on with any weapon switching operation. |

### Mode Control

| Key | Function |
:--: | ---
| **CapsLock** | Turn on the macro when pressed, and lock it when released. When it's locked, left mouse button won't trigger recoil control, but `G_bind` command is still valid. (Note: The control key can be changed to other options, see [#Startup Control](https://github.com/kiccer/Soldier76#startup-control)) |
| **ScrollLock** | Turn on developer debug mode, which automatically shifts the crosshair to the right (when enabled, try changing the value of `ADS` to make the trajectory straight). |

### First Use

1. Follow the [#Installation Guide](https://github.com/kiccer/Soldier76#%E5%AE%89%E8%A3%85%E6%95%99%E7%A8%8B) to install the script.
2. Change the in-game settings as instructed in [#Game Settings](https://github.com/kiccer/Soldier76#%E6%B8%B8%E6%88%8F%E8%AE%BE%E7%BD%AE).
3. In the script, modify the gun settings in `canUse` to set the mode of `UMP45` to **1**, and set the mode of other guns to **0**. (**When the game is automatically detected, switching windows will cause the script to restart, so limiting the available guns to one is helpful for debugging. You can choose to keep other guns, as any gun can be used.**)
4. Enter the training range and install the specified attachments on the gun as instructed in the comments.
5. Turn on the recoil control function (refer to `startControl` for the startup method) and the debug mode `ScrollLock`. Face the wall, **hold down** the right mouse button to aim down sight, and **hold down** the left mouse button to shoot. You will notice that the **crosshair automatically moves to the right**. Do not move the mouse until you run out of bullets.
6. If the bullet pattern is not a horizontal line, adjust the value of `ADS` up or down to fine-tune it.
7. Return to the game and feel the change in bullet trajectory. Repeat the above steps and continue to adjust until the bullet trajectory becomes a horizontal line.
8. If the value cannot be adjusted to a horizontal line no matter how much you modify it, try adjusting the mouse sensitivity in the game.
9. When the bullet pattern is successfully turned into a horizontal line, turn off the debug mode `ScrollLock`, and then shoot at the wall again. If everything goes well, congratulations, your macro can accurately control recoil!
10. Fine-tune the values of `Aim`, `scopeX2`, `scopeX3`, `scopeX4`, and `scopeX6` to make the bullet pattern converge at one point when firing from hipfire, 2x, 3x, 4x, and 6x scopes. If you do not need the recoil control function with scopes, you can skip this step.
11. In the script, modify the gun settings in `canUse` to set the mode of the guns you need to **1**.
12. Press `ctrl+s` to save the script. You can try switching configurations in the editor, and corresponding text information will be output when switching configurations. You can confirm whether the configuration information matches your expectations here.
13. Finally, find some teammates and show off your skills!

<p style="color: red; font-weight: bold;">* Note the comments in the code, which clearly mark the player's customizable area and the script's core area. Do not modify the code in the script's core area.</p>

### Other Settings (Optional)

* To enable the rapid fire feature, please set it in the `canUse` section.
* To set the individual coefficient, please set it in the `canUse` section.
* To set the individual crouch coefficient, please set it in the `canUse` section.
* [Extended Development Tutorial: Adding a New Weapon/Modifying the Data of an Existing Weapon](https://github.com/kiccer/Soldier76/issues/24)
* [Extended Development Tutorial: Setting Custom Aiming Conditions](https://github.com/kiccer/Soldier76/issues/52)

### What is Configuration Switching?

Many people are unclear about what switching means, which is what sets our script apart from others.

This script contains a weapon library, which is divided into different series based on bullet type, including the **.45** series, **9mm** series, **5.56** series, and **7.62** series. Each series contains firearms that match the ammunition type, such as the **M416** being the first gun in the 5.56 series. The G6-G9 keys represent the four different series, and clicking on them will switch to the corresponding series of firearms and automatically select the first gun in the list. Pressing G11 multiple times will allow you to select the next firearm in the series, and if you need the last firearm in the series, simply press G10 once.

For example, if you pick up an **AKM**, you only need to click the G8 key, as the **AKM** is the first gun in the **7.62** series. If you later pick up a **QBZ**, and you no longer want the **AKM**, you need to click the G6 key to switch to the **5.56** series, which by default will select the first gun in the list. As the **QBZ** is the third gun in the series, you need to press G11 twice to select it.

The order of firearms can be found in the `userInfo.canUse` section of the source code, which reflects the order of the firearms.

The functions of the G keys can all be customized, and by default they are set to G502, but other Logitech programmable mice are also supported. If you do not know how to set or adjust them, feel free to join the group and ask us.

![](./static/img/output_screenshot.png)

### G key functions (default settings)

| G key | Function |
| ----- | ----- |
| `G6` | Switch to **5.56** firearms configuration file table, and use the **first** configuration |
| `G7` | Switch to **9mm** firearms configuration file table, and use the **first** configuration |
| `G8` | Switch to **7.62** firearms configuration file table, and use the **first** configuration |
| `G9` | Switch to **.45** firearms configuration file table, and use the **first** configuration |
| `G10` | Switch to **last** configuration (scroll wheel right tilt) |
| `G11` | Switch to **next** configuration (scroll wheel left tilt) |

> The above settings can all be customized in `G_bind` by changing the keybindings.

### Command List

| Command | Function |
| ----------------- | ----------------- |
| `.45` | Switch to the **.45** series firearm list and use the first firearm in the list |
| `9mm` | Switch to the **9mm** series firearm list and use the first firearm in the list |
| `5.56` | Switch to the **5.56** series firearm list and use the first firearm in the list |
| `7.62` | Switch to the **7.62** series firearm list and use the first firearm in the list |
| `first` | Switch to the first firearm in the current list |
| `next` | Switch to the next firearm in the current list |
| `last` | Switch to the last firearm in the current list |
| `first_in_canUse` | Treat all usable firearms under `canUse` as one list and switch to the first firearm in the list |
| `next_in_canUse` | Treat all usable firearms under `canUse` as one list and switch to the next firearm in the list |
| `last_in_canUse` | Treat all usable firearms under `canUse` as one list and switch to the last firearm in the list |
| `off` | When `startControl = "G_bind"`, use this command to turn off the script control. Switching firearms will restart the macro. |
| `scopeX1` | Switch to basic sight mode (red dot, holographic, side sight, or no sight) |
| `scopeX2` | Switch to 2x scope mode |
| `scopeX3` | Switch to 3x scope mode |
| `scopeX4` | Switch to 4x scope mode |
| `scopeX6` | Switch to 6x scope mode |
| `UMP45` | Directly switch to the `UMP45` configuration |
| `Tommy Gun` | Directly switch to the `Tommy Gun` configuration |
| `Vector` | Directly switch to the `Vector` configuration |
| `Micro UZI` | Directly switch to the `Micro UZI` configuration |
| `M416` | Directly switch to the `M416` configuration |
| `SCAR-L` | Directly switch to the `SCAR-L` configuration |
| `QBZ` | Directly switch to the `QBZ` configuration |
| `G36C` | Directly switch to the `G36C` configuration |
| `M16A4` | Directly switch to the `M16A4` configuration |
| `AKM` | Directly switch to the `AKM` configuration |
| `Beryl M762` | Directly switch to the `Beryl M762` configuration |
| `DP-28` | Directly switch to the `DP-28` configuration |
| `fast_pickup` | One-click pickup (use after closing the backpack). **Users have reported that this function has been detected by the game and may lead to a ban, so use with caution!** |
| `fast_discard` | One-click discard (use after closing the backpack) |
| `fast_lick_box` | One-click lick pack (use after closing the backpack, only pick up items that can be placed in the backpack) |

> Can be bound to `G_bind`, trigger the command with the preset key combination.
>
> Note: The command is bound to the key combination, not the key combination to the command. Please do not modify the content in `[""]` before the equal sign!
>
> Note: **One-click pick up/One-click discard/One-click lick pack** all have the possibility of three days, use with caution! Some experimental updates have been made to these three functions, and their safety is not guaranteed at the moment!

### `G_bind` command binding demonstration

```lua
-- G
["G3"] = "",
["G4"] = "",
["G5"] = "",
["G6"] = "5.56",
["G7"] = "9mm",
["G8"] = "7.62",
["G9"] = ".45",
["G10"] = "last",
["G11"] = "next",

-- ✖, incorrect modification method
["G3"] = "",
["G4"] = "", -- The G4 below will overwrite this G4, causing G6 to be lost and an error when G6 is pressed.
["G5"] = "",
["G4"] = "5.56", -- Never directly modify the key combination before the equal sign!
["G7"] = "9mm",
["G8"] = "7.62",
["G9"] = ".45",
["G10"] = "last",
["G11"] = "next",

-- ✔, correct modification method
["G3"] = "",
["G4"] = "5.56", -- Bind the command here
["G5"] = "",
["G6"] = "", -- Clear this command
["G7"] = "9mm",
["G8"] = "7.62",
["G9"] = ".45",
["G10"] = "last",
["G11"] = "next",

-- Added support for binding a group of commands with | in v4.4
["rctrl + G5"] = "M416|scopeX1",
["rctrl + G6"] = "AKM|scopeX4",
```

### Hardware requirements

* A programmable Logitech mouse (wireless mice are very unstable when running macros)
* The game screen should not stutter or drop frames frequently, and the frame rate can be locked if necessary to ensure stability.

### Disclaimer

* **This script program is for learning and communication purposes only. It is strictly forbidden to use it for any commercial purposes. We will not be responsible for any profit disputes arising from such use.**
* **Please respect the author's work. If you need to reprint it, please indicate the source. Thank you!**
* **It is not allowed to use this script for commercial purposes after secondary creation!**

### Communication Group

* Welcome to join our technical discussion QQ group (**below is the designated official group, beware of fake groups!**):

  * [768483124](https://kiccer.github.io/Soldier76/static/join_group.html) (just cleared out some inactive members, join now!)
  * _If the group is temporarily full and you cannot join, please go to the [Discussion](https://github.com/kiccer/Soldier76/discussions) section first and join later when the new group is established!_

* We warmly welcome those who are willing to fine-tune the ballistics of this project

* We also welcome other project partners to join and exchange technical topics together

* Group activities:

  * Posting promotional articles about [Soldier76](https://github.com/kiccer/Soldier76) macros in any well-known forums can get you a personal exclusive nickname, visit: [【Activity】Personal Exclusive Nickname Collection Area](https://github.com/kiccer/Soldier76/discussions/131)
  * Reporting second-hand merchants can get you an exclusive nickname "Clip Sister Dou", visit: [【Activity】Exclusive Nickname "Clip Sister Dou" Collection Area](https://github.com/kiccer/Soldier76/discussions/128)
  * Giving a star to [Soldier76](https://github.com/kiccer/Soldier76) project can get you an exclusive nickname "⭐", visit: [【Activity】Exclusive Nickname "⭐" Collection Area](https://github.com/kiccer/Soldier76/discussions/126)
  * _You can choose any one of the above if you meet multiple criteria._

### Frequently Asked Questions

* Q: No response?

  * A1: Please check if your wireless mouse or GHUB is working properly.
  * A2: Please check if you have enabled macros (it's usually enabled by default when typing in uppercase letters).

* Q: It works on desktop but not in game?

  * A: Close the driver and restart it with administrator privileges.

* Q: The comments in the code are all garbled?

  * A1: Your driver may be GHUB, which is currently not supported.
  * A2: You may have used the "import" function. The Lua file is copied and pasted directly into the editor and cannot be imported.

* Q: After copying the code into the editor, it gives an error when saving?

  * A1: GHUB is not supported.
  * A2: Make sure you have obtained the code from the official website.

* Q: The gun is pointing directly at the ground and cannot be lifted?

  * A: Adjust the ADS (if you have this question, you must not have read the tutorial above).

* Q: What is the answer to the group joining question?

  * A: Sorry, there is no answer! This group joining question is to prevent people who haven't read the documentation from joining the group and asking some meaningless questions. As long as you have carefully read the documentation once, you can find the answer to the group joining question! (ps: it's very troublesome to answer repetitive questions every day. If I have time to answer, I might as well write the documentation more detailed.)

* Q: How to distinguish between fully equipped and bare equipment?

  * A1: First of all, I want to say that I do not recommend distinguishing between configurations for fully equipped and bare equipment separately. If you do make a distinction, you will need to manually switch settings, which is more cumbersome. It is recommended to set the fully equipped coefficient. If you can't find the compensator in the game, use crouching posture shooting. The effect of reducing recoil while crouching is equal to that of the compensator. It is recommended to use the triangular grip, because it only controls horizontal recoil and does not affect vertical recoil. If you use other grips, you may experience overshooting. (depending on personal habits)
  * A2: If you must distinguish between fully equipped and bare equipment, you can randomly choose one of the scopeX2, scopeX3, scopeX4, and scopeX6 in the code as the coefficient for bare equipment. (Usually you don't need so many magnification coefficients, you can sacrifice one magnification coefficient that you don't use as the coefficient for bare equipment.)

### Feedback

* If you have any questions or find any deficiencies while using the script, please feel free to leave feedback for me in [`Issues`](https://github.com/kiccer/Soldier76/issues).

### About macros

Macros are like a resourceful blind person. They can help you perform more complex and delicate operations, but they cannot adapt to real-time situations, so inexperienced people will still be inexperienced in reality...

### About the fairness of the game

I agree with [@liantian-cn](https://github.com/liantian-cn/logitech-pubg/tree/f816d1da3e2d5cf82708bf4225b4cf3f03c06332#q2-%E6%80%8E%E4%B9%88%E7%9C%8B%E5%BE%85%E9%BC%A0%E6%A0%87%E5%AE%8F)'s point of view.

Is it unfair to win against an opponent with a $400 display using a $4,000 display? Is it unfair to win against an opponent with a $1,000 graphics card using a $10,000 graphics card? Then why do some people think it's cheating to win against an opponent with a $30 mouse using a mouse macro?

The impact of good displays and graphics cards on game skill is much greater than that of a mouse macro, so why do people specifically think that mouse macros are unfair?

Some people might argue that you can use a $30 mouse that has macro capabilities, but you have the right not to use them. Likewise, you can argue that a $4,000 display gives you 144Hz and 2K or even 4K resolution, but you also have the right not to use them and revert to 60Hz and 1080p resolution. The same applies to graphics cards.

Due to some people's biases, I have to make these things clear. Mouse macros are not guilty, being bad at the game is the original sin. For those who believe that others using mouse macros have ruined their game experience, please try using them first and then answer. It's not as magical as you think.

**Mouse macros are just like training wheels when you learn how to ride a bike**, once you learn how to ride, you only want to take them off, it's that simple.

> Translated from [chatGPT](https://chat.openai.com/chat)
