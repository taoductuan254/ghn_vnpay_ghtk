Add-Type @"
using System;
using System.Runtime.InteropServices;

public class MouseSimulator {
    [DllImport("user32.dll")]
    public static extern void mouse_event(int flags, int dx, int dy, int data, int extraInfo);

    private const int MOUSEEVENTF_LEFTDOWN = 0x02;
    private const int MOUSEEVENTF_LEFTUP = 0x04;

    public static void Click(int x, int y) {
        System.Windows.Forms.Cursor.Position = new System.Drawing.Point(x, y);
        mouse_event(MOUSEEVENTF_LEFTDOWN, x, y, 0, 0);
        mouse_event(MOUSEEVENTF_LEFTUP, x, y, 0, 0);
    }
}
"@

[MouseSimulator]::Click(500,300)
