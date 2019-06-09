function initForm(settings, guiForm)
    guiForm.mainForm = forms.newform(300, 380, "Castlevania: SOTN Relic Autotracker")

    guiForm.lightweightModeCheckbox = forms.checkbox(guiForm.mainForm, "Lightweight mode", 10, 10)
    forms.setproperty(guiForm.lightweightModeCheckbox, "Checked", settings.lightweightMode)
    forms.setproperty(guiForm.lightweightModeCheckbox, "Width", 200)

    guiForm.onlyTrackProgressionRelicsCheckbox = forms.checkbox(guiForm.mainForm, "Only track progression relics", 10, 30)
    forms.setproperty(guiForm.onlyTrackProgressionRelicsCheckbox, "Checked", settings.onlyTrackProgressionRelics)
    forms.setproperty(guiForm.onlyTrackProgressionRelicsCheckbox, "Width", 200)

    guiForm.pixelProModeCheckbox = forms.checkbox(guiForm.mainForm, "PixelPro mode", 10, 50)
    forms.setproperty(guiForm.pixelProModeCheckbox, "Checked", settings.pixelProMode)
    forms.setproperty(guiForm.pixelProModeCheckbox, "Width", 200)

    guiForm.relicBox = forms.pictureBox(guiForm.mainForm, 0, 80, 300, 300) 
end

function updateSettings(settings, lightweightModeCheckbox, onlyTrackProgressionRelicsCheckbox, pixelProModeCheckbox)
    if forms.ischecked(lightweightModeCheckbox) then
        settings.lightweightMode = true
    else
        settings.lightweightMode = false
    end

    if forms.ischecked(onlyTrackProgressionRelicsCheckbox) then
        settings.onlyTrackProgressionRelics = true
    else
        settings.onlyTrackProgressionRelics = false
    end

    if forms.ischecked(pixelProModeCheckbox) then
        settings.pixelProMode = true
        settings.drawingOffsetX = 150
        settings.drawingOffsetY = 40
    else
        settings.pixelProMode = false
        settings.drawingOffsetX = 15
        settings.drawingOffsetY = 19
    end
end