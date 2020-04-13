function toggle(settings, box, guiForm)
    local x = forms.getMouseX(box)
    local y = forms.getMouseY(box)

    if x > 12 and x < 36 and y > 6 and y < 19 then
        if settings.trackAllRelics == true then
            settings.trackAllRelics = false
            forms.drawString(guiForm.relicBox, 35, 4, "progress", 0xFFFFFFFF, 0xFF110011, 12, "arial", "bold")
            forms.drawImage(guiForm.relicBox, guiForm.toggleOffPath, 14, 7, guiForm.toggleWidth, guiForm.toggleHeight, true)
        else
            settings.trackAllRelics = true
            forms.drawString(guiForm.relicBox, 35, 4, "all relics", 0xFFFFFFFF, 0xFF110011, 12, "arial", "bold")
            forms.drawImage(guiForm.relicBox, guiForm.toggleOnPath, 14, 7, guiForm.toggleWidth, guiForm.toggleHeight, true)
        end
    end
    forms.refresh(guiForm.relicBox)
end

function initForm(settings, guiForm)
    guiForm.mainForm = forms.newform(296, 390, "SOTN Autotracker")
    guiForm.relicBox = forms.pictureBox(guiForm.mainForm, 0, 0, 296, 390)

    guiForm.allRelicsCheckbox = forms.checkbox(guiForm.mainForm, "", 400, 400)

    forms.addclick(guiForm.relicBox, function() toggle(settings, guiForm.relicBox, guiForm) end)
end

function drawControls(guiForm, settings)
    forms.drawString(guiForm.relicBox, 250, 4, guiForm.version, 0xFFFFFFFF, 0xFF110011, 10, "arial", "bold")
    if settings.trackAllRelics then
        forms.drawString(guiForm.relicBox, 35, 4, "all relics", 0xFFFFFFFF, 0xFF110011, 12, "arial", "bold")
        forms.drawImage(guiForm.relicBox, guiForm.toggleOnPath, 14, 7, guiForm.toggleWidth, guiForm.toggleHeight, true)
    else
        forms.drawString(guiForm.relicBox, 35, 4, "progress", 0xFFFFFFFF, 0xFF110011, 12, "arial", "bold")
        forms.drawImage(guiForm.relicBox, guiForm.toggleOffPath, 14, 7, guiForm.toggleWidth, guiForm.toggleHeight, true)
    end
end