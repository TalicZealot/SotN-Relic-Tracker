# SotN Relic and Location check Autotracker
Autotracker LUA script for the Castlevania:SotN Randomizer https://sotn.io/
## Version 1.7.5

## Bizhawk Instructions: 
* Download repository from *Clone or download* > *Download ZIP*
* Set Config > Customize > Advanced > Lua Core > Lua+LuaInterface > Restart
* Launch the script through Tools > Lua Console > Script > Open Script > SotN-Bizhawk-Relic-Tracker.lua
* Tools > Lua Console > Settings > Autoload
* Tools > Lua Console > File > Recent Scripts > Autoload
* Update by running update.ps1

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
* Update by running updateJin.bat

## PSXjin Setup:
* Configuration > Graphics > Color Depth > 32
* Configuration > Graphics > Window Mode > Size: 1030 x 962
* Configuration > Graphics > Stretch to full window size
* Configuration > Graphics > No Dithering
* Configuration > Graphics > Use FPS Limit
* Configuration > Graphics > Use Frame Skipping
* Configuration > Graphics > Auto-detect FPS/Frame skipping

#### 1.7.5
* Adventure location fixes.
* Speedrun logic fixes.
#### 1.7.4
* Updated speedrun Silver Ring locks.
* Adventure location fixes.
#### 1.7.3
* Updated Caverns locks.
* Adventure location fixes.
#### 1.7.2
* Fix updater not removing Presets folder.
* Larger font size.
* Cube of Zoe as progression for adventure.
#### 1.7.1
* Added adventure mode locations.
* Dynamic font size.
#### 1.7.0
* Automatic preset detection.
* Automatic graphics mode detection.
* New UI.
* Major refactoring to allow for multiple preset logic sets.
* Separated in and out of logic allowed available checks.
* New Card sprites by fatihG.
* New updater.

<details><summary>show more:</summary>

#### 1.6.1
* Performance improvements.
* Added Silver Ring, Gold Ring, Spike Breaker and Holy Glasses as locations.
* PSXJin now has location availability indication and progression item tracking.
#### 1.6.0
* Complete vlad relic set indication.
* Better cloak randomization.
* Redone location availability in preparation for new logic.
* Psxjin update bat file.
#### 1.5.4
* Location availability fix.
#### 1.5.3
* Added new locations for Guarded rando logic to psxjin tracker.
* Added seed name console display to psxjin tracker.
#### 1.5.2
* Added character decoding for non-alphanumeric symbols.
#### 1.5.1
* Added update.bat, which people can use to quickly update the Bizhawk lua file.
#### 1.5.0
* Added new locations for Guarded rando logic in a toggleable 'Extended Locations' mode
* Better remaining location counting
#### 1.4.9
* Location fixes for Power of Mist and Bat Card.
* Cloak randomization for psxjin.
#### 1.4.8
* Seed name is shown right away
* Performance improvements by caching icons early
#### 1.4.7
* Updated location availability for new randomizer logic.
#### 1.4.6
* Adjusted cloak color randomization.
#### 1.4.5
* Adjusted seed name display for more visibility.
#### 1.4.4
* Added seed name display
#### 1.4.3
* Checkbox bugfix
#### 1.4.2
* Fixed location availability bug
#### 1.4.1
* Changed Joseph's Cloak functionality to randomize color
* Replaced light mode toggle with cloak random color toggle
* Adjustments to location availability logic
#### 1.4.0
* Fixed Sword Card being counted as a Drac relic
* Added Joseph's Cloak color saving
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

</details>