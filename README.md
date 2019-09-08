# SotN Relic and Location check Autotracker
Autotracker LUA script for the Castlevania:SotN Randomizer https://sotn.io/
## Version 1.3.7

## Bizhawk Instructions: 
* Download repository from *Clone or download* > *Download ZIP*
* Set Config > Customize > Advanced > Lua Core > Lua+LuaInterface > Restart
* Launch the script after running the game through Tools > Lua Console > Script > Open Script
* Tools > Lua Console > Settings > Autoload
* Tools > Lua Console > File > Recent Scripts > Autoload

## Bizhawk Optimal Settings:
* Config > Display > Scaling Filter: None
* Config > Display > Maintain aspect ratio: checked
* Config > Display > Aspect Ratio Selection > Use 1:1 pixel size
* Config > Display > Expand pixels by integers only: checked
* PSX > Options > Pixel Pro Mode
* Sace window through View > Window Size

### changelog
#### 1.3.7
* Bug fixes
* Leapstone location availability fix
#### 1.3.6
* Added thrust weapon tracking
* Improved soft reset behavior
#### 1.3.5
* Setings save behavior adjustments
* Rewrote location availability logic
* Adjusted location availability colors
#### 1.3.4
* Adjusted location display visualization
* Tweaks to location tracking
#### 1.3.3
* Fixed crash caused by new Bizhawk Lua core
* Separated normal relics, Drac relics and Items to different rows
#### 1.3.2
* Values reset upon quitting to main menu
* Relic window closes when the script ends
#### 1.3.1
* Fixed a display bug
#### 1.3.0
* Fixed bug that caused relics to not be shown
* Added tracking for progression items
#### 1.2.0
* Added location reachability color coding
#### 1.1.1
* Fixed Relic box to always be colored
#### 1.1.0
* Added support for different rendering modes in bizhawk
* Extracted relic display in a separate window
* Added GUI for settings
#### 1.0.0
* Release

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