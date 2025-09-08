#Requires AutoHotkey v2.0

SendKeycode(pid, keycode) {
    try {
        WinActivate(pid)
    }
    return keycode
}