#SingleInstance Force

#Requires AutoHotkey v2.0

#Include SendInput.ahk

if !FileExist("Keycode.txt") {
    FileAppend("F15", "Keycode.txt")
}
Keycode := FileRead("Keycode.txt")

; Why Would You Be Running Multiple Roblox Instances
; Just Send Inputs To All Of Them
SendInputs() {
    for pid in WinGetList("Roblox") {
        SplitPath WinGetProcessPath(pid), &name

        ; Double Checking
        if (name == "RobloxPlayerBeta.exe") {
            SendKeycode(pid, Keycode)
        }
    }
}

SendInputs()
SetTimer(SendInputs, 19 * 60 * 1000) ; 19 Minutes In MS