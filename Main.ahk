#SingleInstance Force

#Requires AutoHotkey v2.0

if !FileExist("Keycode.txt") {
    FileAppend("{F15}", "Keycode.txt")
}
Keycode := FileRead("Keycode.txt")

SendInputs() {
    for pid in WinGetList("Roblox") {
        SplitPath WinGetProcessPath(pid), &name

        ; Double Checking
        if (name == "RobloxPlayerBeta.exe") {
            while true {
                DllCall("SendInput")
                SendMessage(0x0102, 0x78, 0, pid)
                Sleep 1000
            }
        }
    }
}

SetTimer(SendInputs, 19 * 60 * 1000)
SendInputs()