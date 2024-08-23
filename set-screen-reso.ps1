# Function to change screen resolution
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class ScreenResolution
{
    [DllImport("user32.dll")]
    public static extern bool EnumDisplaySettings(string deviceName, int modeNum, ref DEVMODE devMode);

    [DllImport("user32.dll")]
    public static extern int ChangeDisplaySettings(ref DEVMODE devMode, int flags);

    public struct DEVMODE
    {
        [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 32)]
        public string dmDeviceName;
        public short dmSpecVersion;
        public short dmDriverVersion;
        public short dmSize;
        public short dmDriverExtra;
        public int dmFields;

        public int dmPositionX;
        public int dmPositionY;
        public ScreenOrientation dmDisplayOrientation;
        public int dmDisplayFixedOutput;

        public short dmColor;
        public short dmDuplex;
        public short dmYResolution;
        public short dmTTOption;
        public short dmCollate;

        [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 32)]
        public string dmFormName;

        public short dmLogPixels;
        public int dmBitsPerPel;
        public int dmPelsWidth;
        public int dmPelsHeight;
        public int dmDisplayFlags;
        public int dmDisplayFrequency;
        public int dmICMMethod;
        public int dmICMIntent;
        public int dmMediaType;
        public int dmDitherType;
        public int dmReserved1;
        public int dmReserved2;
        public int dmPanningWidth;
        public int dmPanningHeight;
    };

    public enum ScreenOrientation : int
    {
        DMDO_DEFAULT = 0,
        DMDO_90 = 1,
        DMDO_180 = 2,
        DMDO_270 = 3
    }

    public static void ChangeResolution(int width, int height)
    {
        DEVMODE dm = new DEVMODE();
        EnumDisplaySettings(null, -1, ref dm);
        dm.dmPelsWidth = width;
        dm.dmPelsHeight = height;

        int result = ChangeDisplaySettings(ref dm, 0);
        if (result != 0)
        {
            throw new Exception("Could not change screen resolution.");
        }
    }
}
"@

# Change screen resolution to 1920x1080
[ScreenResolution]::ChangeResolution(1360, 768s)

# Open Windows Explorer
Start-Process explorer.exe

# Add necessary types for user32.dll functions
Add-Type @"
using System;
using System.Runtime.InteropServices;

public class User32
{
    [DllImport("user32.dll", SetLastError = true)]
    public static extern IntPtr FindWindow(string lpClassName, string lpWindowName);

    [DllImport("user32.dll", SetLastError = true)]
    public static extern IntPtr GetWindowLongPtr(IntPtr hWnd, int nIndex);

    [DllImport("user32.dll", SetLastError = true)]
    public static extern int SetWindowLongPtr(IntPtr hWnd, int nIndex, IntPtr dwNewLong);

    public const int GWL_STYLE = -16;
    public const int WS_BORDER = 0x00800000;
}
"@

# Find the VALORANT window
$windowName = "VALORANT"
$hWnd = [User32]::FindWindow($null, $windowName)

if ($hWnd -eq [IntPtr]::Zero) {
    Write-Host "VALORANT window not found."
    exit
}

# Get the current window style
$currentStyle = [User32]::GetWindowLongPtr($hWnd, [User32]::GWL_STYLE)

# Remove the WS_BORDER style
$newStyle = $currentStyle -band -bnot [User32]::WS_BORDER

# Set the new window style
[User32]::SetWindowLongPtr($hWnd, [User32]::GWL_STYLE, $newStyle)

Write-Host "WS_BORDER style removed from VALORANT window."