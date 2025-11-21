$code = @"
using System;
using System.Runtime.InteropServices;

public class MouseControl {
    [DllImport("user32.dll")]
    public static extern bool SetCursorPos(int X, int Y);

    [DllImport("user32.dll")]
    public static extern void mouse_event(uint dwFlags, uint dx, uint dy, uint dwData, UIntPtr dwExtraInfo);

    public const uint MOUSEEVENTF_LEFTDOWN = 0x0002;
    public const uint MOUSEEVENTF_LEFTUP   = 0x0004;
}
"@

Add-Type $code

function MoveAndClick($posX, $posY){
    [MouseControl]::SetCursorPos($continueX, $continueY)
    Start-Sleep -Milliseconds 100
    [MouseControl]::mouse_event([MouseControl]::MOUSEEVENTF_LEFTDOWN, 0, 0, 0, [UIntPtr]::Zero)
    Start-Sleep -Milliseconds 50
    [MouseControl]::mouse_event([MouseControl]::MOUSEEVENTF_LEFTUP, 0, 0, 0, [UIntPtr]::Zero)
}

# small i letter over the play button
MoveAndClick 110 1315
Start-Sleep -Milliseconds 1500

#### block button
MoveAndClick 1450 150
Start-Sleep -Milliseconds 400

#### continue button
MoveAndClick 1500 780
Start-Sleep -Milliseconds 100

#### click away
MoveAndClick 100 100

