function initForm(settings, guiForm)
    guiForm.mainForm = forms.newform(320, 440, "Castlevania: SOTN Relic Autotracker")

    guiForm.cloakColorCheckbox = forms.checkbox(guiForm.mainForm, "Cloak random color", 10, 10)
    forms.setproperty(guiForm.cloakColorCheckbox, "Checked", settings.randomCloakColor)
    forms.setproperty(guiForm.cloakColorCheckbox, "Width", 200)

    guiForm.onlyTrackProgressionRelicsCheckbox = forms.checkbox(guiForm.mainForm, "Only track progression relics", 10, 30)
    forms.setproperty(guiForm.onlyTrackProgressionRelicsCheckbox, "Checked", settings.onlyTrackProgressionRelics)
    forms.setproperty(guiForm.onlyTrackProgressionRelicsCheckbox, "Width", 200)

    guiForm.pixelProModeCheckbox = forms.checkbox(guiForm.mainForm, "PixelPro mode", 10, 50)
    forms.setproperty(guiForm.pixelProModeCheckbox, "Checked", settings.pixelProMode)
    forms.setproperty(guiForm.pixelProModeCheckbox, "Width", 200)

    guiForm.relicBox = forms.pictureBox(guiForm.mainForm, 0, 80, 320, 374) 
end

function updateSettings(settings, cloakColorCheckbox, onlyTrackProgressionRelicsCheckbox, pixelProModeCheckbox)
    if forms.ischecked(cloakColorCheckbox) then
        settings.randomCloakColor = true
    else
        settings.randomCloakColor = false
    end

    if forms.ischecked(onlyTrackProgressionRelicsCheckbox) then
        settings.onlyTrackProgressionRelics = true
    else
        settings.onlyTrackProgressionRelics = false
    end

    if forms.ischecked(pixelProModeCheckbox) then
        settings.pixelProMode = true
        settings.drawingOffsetX = 148
        settings.drawingOffsetY = 38
    else
        settings.pixelProMode = false
        settings.drawingOffsetX = 13
        settings.drawingOffsetY = 19
    end
end