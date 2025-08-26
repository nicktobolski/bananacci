#Requires AutoHotkey v2.0

; ========================================
; BANANACCI VOLUME - VOLUME CONTROL PACKAGE
; ========================================
; A user-friendly volume control package with 16-step increments and banana emoji feedback
; For non-technical Windows users

; ========================================
; GLOBAL VARIABLES
; ========================================

; Initialize global variables for volume GUI
global volumeGUI := ""
global volumeTextControl := ""

; ========================================
; VOLUME CONTROL HOTKEYS
; ========================================

; Volume Up (16-step curve)
Volume_Up::
{
    ; Get current volume
    currentVolume := SoundGetVolume()
    
    ; Calculate new volume using 16-step curve
    newVolume := GetNextVolumeStep(currentVolume, true)
    
    ; Unmute if going from 0 to higher volume
    if (currentVolume = 0 && newVolume > 0)
    {
        SoundSetMute(false)  ; Unmute the system
    }
    
    ; Fade to new volume smoothly
    FadeVolume(currentVolume, newVolume)
    
    ; Show custom volume indicator
    ShowVolumeIndicator(newVolume)
}

; Volume Down (16-step curve)
Volume_Down::
{
    ; Get current volume
    currentVolume := SoundGetVolume()
    
    ; Calculate new volume using 16-step curve
    newVolume := GetNextVolumeStep(currentVolume, false)
    
    ; Fade to new volume smoothly
    FadeVolume(currentVolume, newVolume)
    
    ; Show custom volume indicator
    ShowVolumeIndicator(newVolume)
}

; ========================================
; VOLUME CONTROL FUNCTIONS
; ========================================

; Function to calculate next volume level using 16-step curve
GetNextVolumeStep(currentVolume, increase := true)
{
    ; Define 16 volume steps from 0 to 100
    volumeSteps := [0, 1, 2, 3, 5, 8, 13, 21, 34, 50, 65, 75, 82, 88, 94, 100]
    
    ; Find the closest step to current volume
    closestStep := 1
    closestDistance := 100
    
    Loop volumeSteps.Length
    {
        distance := Abs(currentVolume - volumeSteps[A_Index])
        if (distance < closestDistance)
        {
            closestDistance := distance
            closestStep := A_Index
        }
    }
    
    ; Calculate next step
    if (increase)
    {
        nextStep := Min(closestStep + 1, volumeSteps.Length)
    }
    else
    {
        nextStep := Max(closestStep - 1, 1)
    }
    
    ; Return the volume for the next step
    return volumeSteps[nextStep]
}

; Function to fade volume smoothly between two levels
FadeVolume(startVolume, endVolume, duration := 50)
{
    ; Calculate the difference and number of steps
    volumeDiff := endVolume - startVolume
    steps := 10  ; Number of steps for smooth fade
    stepDuration := duration / steps
    stepSize := volumeDiff / steps
    
    ; Start the fade timer
    SetTimer(FadeStep, stepDuration)
    
    ; Store fade data in global variables
    global fadeData := {
        currentStep: 0,
        totalSteps: steps,
        startVolume: startVolume,
        stepSize: stepSize,
        targetVolume: endVolume
    }
}

; Function called by timer to perform each fade step
FadeStep()
{
    global fadeData
    
    ; Increment step
    fadeData.currentStep++
    
    ; Calculate current volume
    currentVolume := fadeData.startVolume + (fadeData.stepSize * fadeData.currentStep)
    
    ; Ensure we don't exceed target volume
    if (fadeData.stepSize > 0)
        currentVolume := Min(currentVolume, fadeData.targetVolume)
    else
        currentVolume := Max(currentVolume, fadeData.targetVolume)
    
    ; Set the volume
    SoundSetVolume(currentVolume)
    
    ; Stop timer if we've reached the target
    if (fadeData.currentStep >= fadeData.totalSteps)
    {
        SetTimer(FadeStep, 0)  ; Stop the timer
        SoundSetVolume(fadeData.targetVolume)  ; Ensure exact target volume
    }
}

; Function to show custom volume indicator
ShowVolumeIndicator(volume)
{
    ; Find which step the current volume corresponds to
    volumeSteps := [0, 1, 3, 5, 8, 13, 21, 32, 44, 57, 70, 83, 92, 100]
    currentStep := 0  ; Start at 0 for no bananas
    
    Loop volumeSteps.Length
    {
        if (volume <= volumeSteps[A_Index])
        {
            currentStep := A_Index - 1  ; Subtract 1 to get correct banana count
            break
        }
    }
    
    ; Create a visual bar representation with 15 fixed banana positions
    barLength := 15  ; 15 banana positions total
    filledBars := currentStep
    emptyBars := barLength - filledBars
    
    ; Create the visual bar using loops (fixed positions)
    filledPart := ""
    emptyPart := ""
    
    Loop filledBars
        filledPart .= "🍌"
    
    Loop emptyBars
        emptyPart .= " "
    
    visualBar := filledPart . emptyPart
    
    ; Calculate position: center horizontally, 95% down vertically
    xPos := A_ScreenWidth // 2  ; Center horizontally
    yPos := Round(A_ScreenHeight * 0.95)  ; 95% down the screen
    
    ; Show custom GUI
    ShowVolumeGUI(visualBar, xPos, yPos)
}

; Function to show custom volume GUI with colored bananas
ShowVolumeGUI(visualBar, xPos, yPos)
{
    global volumeGUI, volumeTextControl
    
    ; Create GUI if it doesn't exist
    if (!volumeGUI)
    {
        volumeGUI := Gui()
        volumeGUI.Opt("+AlwaysOnTop -Caption +ToolWindow +E0x20")  ; E0x20 makes it click-through
        volumeGUI.BackColor := "FF00FF"  ; Background color to be made transparent
                
        ; Add only the banana text control with large font
        volumeTextControl := volumeGUI.Add("Text", "x5 y5 w900 h90 cFFFF00 Left", visualBar)  ; Large yellow bananas
        volumeTextControl.SetFont("s36")  ; Set font size to 48 points
        
        ; Show GUI at calculated position (adjusted for text padding, moved 200px left)
        volumeGUI.Show("x" . (xPos - 550) . " y" . (yPos - 50) . " w910 h100 NoActivate")
        
        ; Set transparency after showing the GUI
        WinSetTransColor("FF00FF", volumeGUI)
    }
    else
    {
        ; Update existing GUI text if it still exists
        try
        {
            volumeTextControl.Value := visualBar
        }
        catch
        {
            ; GUI was destroyed, recreate it
            volumeGUI := ""
            ShowVolumeGUI(visualBar, xPos, yPos)
        }
    }
    
    ; Reset timer to destroy GUI after 1.5 seconds (restart on each key press)
    SetTimer(DestroyVolumeGUI, 0)  ; Stop any existing timer first
    SetTimer(DestroyVolumeGUI, -1500)  ; Start new timer
}

; Function to destroy volume GUI
DestroyVolumeGUI()
{
    global volumeGUI
    try
        volumeGUI.Destroy()
}

; ========================================
; INITIALIZATION
; ========================================

; Show current volume as bananas on startup
ShowCurrentVolumeOnStartup()

; Function to show current volume as bananas when script starts
ShowCurrentVolumeOnStartup()
{
    ; Get current system volume
    currentVolume := SoundGetVolume()
    
    ; Show the volume indicator with current volume
    ShowVolumeIndicator(currentVolume)
}
