-----------------------------------------------------------------
-- Castlevania: Symphony of the Night Relic Tracker for Bizhawk--
-----------------------------------------------------------------
-- By TalicZealot
-----------------
----settings-----
-----------------
local onlyTrackProgressionRelics = true
local trackerBackgroundEnabled = false
local trackerBackgroundColor = 0xFF00FF00 -- Color format: OORRGGBB(Opacity, Red, Green, Blue)

-------------------------
local alucardModeStarted = false

local relics = {
    {
        path = "images/SoulOfBat.png",
        status = false,
        progression = true,
        address = 0x97964
    }, {
        path = "images/FireOfBat.png",
        status = false,
        progression = false,
        address = 0x97965
    }, {
        path = "images/EchoOfBat.png",
        status = false,
        progression = true,
        address = 0x97966
    }, {
        path = "images/ForceOfEcho.png",
        status = false,
        progression = false,
        address = 0x97967
    }, {
        path = "images/SoulOfWolf.png",
        status = false,
        progression = true,
        address = 0x97968
    }, {
        path = "images/PowerOfWolf.png",
        status = false,
        progression = false,
        address = 0x97969
    }, {
        path = "images/SkillOfWolf.png",
        status = false,
        progression = false,
        address = 0x9796A
    }, {
        path = "images/FormOfMist.png",
        status = false,
        progression = true,
        address = 0x9796B
    }, {
        path = "images/PowerOfMist.png",
        status = false,
        progression = true,
        address = 0x9796C
    }, {
        path = "images/GasCloud.png",
        status = false,
        progression = false,
        address = 0x9796D
    }, {
        path = "images/CubeOfZoe.png",
        status = false,
        progression = false,
        address = 0x9796E
    }, {
        path = "images/SpiritOrb.png",
        status = false,
        progression = false,
        address = 0x9796F
    }, {
        path = "images/GravityBoots.png",
        status = false,
        progression = true,
        address = 0x97970
    }, {
        path = "images/LeapStone.png",
        status = false,
        progression = true,
        address = 0x97971
    }, {
        path = "images/HolySymbol.png",
        status = false,
        progression = false,
        address = 0x97972
    }, {
        path = "images/FaerieScroll.png",
        status = false,
        progression = false,
        address = 0x97973
    }, {
        path = "images/JewelOfOpen.png",
        status = false,
        progression = true,
        address = 0x97974
    }, {
        path = "images/MermanStatue.png",
        status = false,
        progression = true,
        address = 0x97975
    }, {
        path = "images/BatCard.png",
        status = false,
        progression = false,
        address = 0x97976
    }, {
        path = "images/GhostCard.png",
        status = false,
        progression = false,
        address = 0x97977
    }, {
        path = "images/FaerieCard.png",
        status = false,
        progression = false,
        address = 0x97978
    }, {
        path = "images/DemonCard.png",
        status = false,
        progression = false,
        address = 0x97979
    }, {
        path = "images/SwordCard.png",
        status = false,
        progression = false,
        address = 0x9797A
    }, {
        path = "images/HeartOfVlad.png",
        status = false,
        progression = true,
        address = 0x9797D
    }, {
        path = "images/ToothOfVlad.png",
        status = false,
        progression = true,
        address = 0x9797E
    }, {
        path = "images/RibOfVlad.png",
        status = false,
        progression = true,
        address = 0x9797F
    }, {
        path = "images/RingOfVlad.png",
        status = false,
        progression = true,
        address = 0x97980
    }, {
        path = "images/EyeOfVlad.png",
        status = false,
        progression = true,
        address = 0x97981
    }
}

local function checkAlucardModeStart()
    local playerHp = memory.readbyte(0x097BA0)
        if playerHp > 60 and playerHp < 85 then
        alucardModeStarted = true
    end
end

local function detectRelics()
    for i = 1, 28, 1 do
        if mainmemory.readbyte(relics[i].address) ~= 0x00 then
            relics[i].status = true
        end
    end
end

local function drawRelics()
    local rows = 1
    local columns = 1
    if trackerBackgroundEnabled == true then
        gui.drawBox(107, 40, 150, 295, trackerBackgroundColor, trackerBackgroundColor)
    end
    for i = 1, 28, 1 do
        if onlyTrackProgressionRelics then
            if relics[i].status and relics[i].progression then
                gui.drawImage(relics[i].path, 150 - 21 * columns, 20 + 21 * rows, 20, 20, true)
                rows = rows + 1
                if rows > 14 then
                    rows = 1
                    columns = 2
                end
            end
        else
            if relics[i].status then
                gui.drawImage(relics[i].path, 150 - 21 * columns, 20 + 21 * rows, 20, 20, true)
                rows = rows + 1
                if rows > 14 then
                    rows = 1
                    columns = 2
                end
            end
        end
    end
end

while true do
    if alucardModeStarted then
        drawRelics()
        if emu.framecount() % 120 == 0 then detectRelics() end
    else
        if emu.framecount() > 2100 and emu.framecount() % 120 == 0 then checkAlucardModeStart() end
    end
    emu.frameadvance()
end
