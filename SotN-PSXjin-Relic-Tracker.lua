-----------------------------------------------------------------
-- Castlevania: Symphony of the Night Relic Tracker for PSXjin--
-----------------------------------------------------------------
-- By TalicZealot
-----------------
----settings-----
-----------------
local onlyTrackProgressionRelics = true
local trackerBackgroundEnabled = false
local trackerBackgroundColor = "#00FF00FF" -- Color format: "#RRGGBBOO" (Red, Green, Blue, Opacity)

-------------------------
require "gd"

local alucardModeStarted = false

local relics = {
    {
        image = gd.createFromPng("images/SoulOfBat.png"):gdStr(),
        status = false,
        progression = true,
        address = 0x97964
    }, {
        image = gd.createFromPng("images/FireOfBat.png"):gdStr(),
        status = false,
        progression = false,
        address = 0x97965
    }, {
        image = gd.createFromPng("images/EchoOfBat.png"):gdStr(),
        status = false,
        progression = true,
        address = 0x97966
    }, {
        image = gd.createFromPng("images/ForceOfEcho.png"):gdStr(),
        status = false,
        progression = false,
        address = 0x97967
    }, {
        image = gd.createFromPng("images/SoulOfWolf.png"):gdStr(),
        status = false,
        progression = true,
        address = 0x97968
    }, {
        image = gd.createFromPng("images/PowerOfWolf.png"):gdStr(),
        status = false,
        progression = false,
        address = 0x97969
    }, {
        image = gd.createFromPng("images/SkillOfWolf.png"):gdStr(),
        status = false,
        progression = false,
        address = 0x9796A
    }, {
        image = gd.createFromPng("images/FormOfMist.png"):gdStr(),
        status = false,
        progression = true,
        address = 0x9796B
    }, {
        image = gd.createFromPng("images/PowerOfMist.png"):gdStr(),
        status = false,
        progression = true,
        address = 0x9796C
    }, {
        image = gd.createFromPng("images/GasCloud.png"):gdStr(),
        status = false,
        progression = false,
        address = 0x9796D
    }, {
        image = gd.createFromPng("images/CubeOfZoe.png"):gdStr(),
        status = false,
        progression = false,
        address = 0x9796E
    }, {
        image = gd.createFromPng("images/SpiritOrb.png"):gdStr(),
        status = false,
        progression = false,
        address = 0x9796F
    }, {
        image = gd.createFromPng("images/GravityBoots.png"):gdStr(),
        status = false,
        progression = true,
        address = 0x97970
    }, {
        image = gd.createFromPng("images/LeapStone.png"):gdStr(),
        status = false,
        progression = true,
        address = 0x97971
    }, {
        image = gd.createFromPng("images/HolySymbol.png"):gdStr(),
        status = false,
        progression = false,
        address = 0x97972
    }, {
        image = gd.createFromPng("images/FaerieScroll.png"):gdStr(),
        status = false,
        progression = false,
        address = 0x97973
    }, {
        image = gd.createFromPng("images/JewelOfOpen.png"):gdStr(),
        status = false,
        progression = true,
        address = 0x97974
    }, {
        image = gd.createFromPng("images/MermanStatue.png"):gdStr(),
        status = false,
        progression = true,
        address = 0x97975
    }, {
        image = gd.createFromPng("images/BatCard.png"):gdStr(),
        status = false,
        progression = false,
        address = 0x97976
    }, {
        image = gd.createFromPng("images/GhostCard.png"):gdStr(),
        status = false,
        progression = false,
        address = 0x97977
    }, {
        image = gd.createFromPng("images/FaerieCard.png"):gdStr(),
        status = false,
        progression = false,
        address = 0x97978
    }, {
        image = gd.createFromPng("images/DemonCard.png"):gdStr(),
        status = false,
        progression = false,
        address = 0x97979
    }, {
        image = gd.createFromPng("images/SwordCard.png"):gdStr(),
        status = false,
        progression = false,
        address = 0x9797A
    }, {
        image = gd.createFromPng("images/HeartOfVlad.png"):gdStr(),
        status = false,
        progression = true,
        address = 0x9797D
    }, {
        image = gd.createFromPng("images/ToothOfVlad.png"):gdStr(),
        status = false,
        progression = true,
        address = 0x9797E
    }, {
        image = gd.createFromPng("images/RibOfVlad.png"):gdStr(),
        status = false,
        progression = true,
        address = 0x9797F
    }, {
        image = gd.createFromPng("images/RingOfVlad.png"):gdStr(),
        status = false,
        progression = true,
        address = 0x97980
    }, {
        image = gd.createFromPng("images/EyeOfVlad.png"):gdStr(),
        status = false,
        progression = true,
        address = 0x97981
    }
}

local function checkAlucardModeStart()
    local playerHp = memory.readbyte(0x097BA0)
    if playerHp > 60 and playerHp < 85 then
        alucardModeStarted = true
        print("start")
    end
end

local function detectRelics()
    for i = 1, 28, 1 do
        if memory.readbyte(relics[i].address) ~= 0x00 then
            relics[i].status = true
        end
    end
end

local function drawRelics()
    local relicsPerRow = 1
    local rows = 0

    if trackerBackgroundEnabled == true then
        gui.box(0, 0, 256, 20, trackerBackgroundColor, trackerBackgroundColor)
    end
    for i = 1, 28, 1 do
        if onlyTrackProgressionRelics then
            if relics[i].status and relics[i].progression then
                gui.gdoverlay(13 * (relicsPerRow - 1) + (rows * 130), rows * 14, relics[i].image, 1.0)
                relicsPerRow = relicsPerRow + 1
                if relicsPerRow > 19 then
                    relicsPerRow = 1
                    rows = 1
                end
            end
        else
            if relics[i].status then
                gui.gdoverlay(13 * (relicsPerRow - 1) + (rows * 130), rows * 20, relics[i].image, 1.0)
                relicsPerRow = relicsPerRow + 1
                if relicsPerRow > 19 then
                    relicsPerRow = 1
                    rows = 1
                end
            end
        end
    end
end

gui.register(function()
    if alucardModeStarted then
        drawRelics()
        if emu.framecount() % 120 == 0 then detectRelics() end
    else
        if emu.framecount() > 2100 and emu.framecount() % 120 == 0 then checkAlucardModeStart() end
    end
end)
