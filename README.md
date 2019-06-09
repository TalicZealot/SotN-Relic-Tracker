# SotN Relic and Location check Autoracker
Autotracker LUA script for the Castlevania:SotN Randomizer https://sotn.io/
## Version 1.1.1
### changelog
#### 1.1.1
* Fixed Relic box to always be colored
#### 1.1.0
* Added support for different rendering modes in bizhawk
* Extracted relic display in a separate window
* Added GUI for settings
#### 1.0.0
* Release

## Bizhawk Instructions: 
* Download repository from *Clone or download* > *Download ZIP*
* Set Config > Customize > Advanced > Lua Core > Lua+LuaInterface
* Launch the script after running the game through Tools > Lua Console > Script > Open Script

## Bizhawk Optimal Settings:
* Config > Display > Scaling Filter: None
* Config > Display > Maintain aspect ratio: checked
* Config > Display > Aspect Ratio Selection > Use 1:1 pixel size
* Config > Display > Expand pixels by integers only: checked
* PSX > Options > Pixel Pro Mode
* Sace window through View > Window Size

## PSXjin Instructions: 
* Download the repository
* Install https://github.com/rjpcomputing/luaforwindows/releases
* If needed copy GD.dll from the installation folder to the script folder
* Launch the script after running the game through File > Lua Scripting > New Lua Script Window (Ctrl + L) > Browse

## PSXjin Setup:
* Configuration > Graphics > Color Depth > 32
* Configuration > Graphics > Window Mode > Size: 1030 x 962
* Configuration > Graphics > Stretch to full window size
* Configuration > Graphics > No Dithering
* Configuration > Graphics > Use FPS Limit
* Configuration > Graphics > Use Frame Skipping
* Configuration > Graphics > Auto-detect FPS/Frame skipping