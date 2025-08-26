# 🍌 Bananacci Volume

**Enhanced Windows volume control with visual feedback**

Bananacci Volume provides an improved volume control experience with smooth 14-step increments and visual banana emoji feedback. No AutoHotkey installation required.

## ✨ Features

- **🍌 Visual Feedback**: See your volume level with 0-13 large yellow banana emojis
- **🎛️ 14-Step Control**: Precise volume adjustments (0%, 1%, 3%, 5%, 8%, 13%, 21%, 32%, 44%, 57%, 70%, 83%, 92%, 100%)
- **🎵 Smooth Fading**: Beautiful volume transitions instead of jarring jumps
- **🔊 Auto-Unmute**: Automatically unmutes when you increase from 0%
- **⚡ Rapid Response**: Hold down volume keys for quick adjustments
- **🎯 Transparent Display**: Clean, modern interface that doesn't interfere with your work
- **🚀 Standalone Executable**: No AutoHotkey installation required

## 🚀 Quick Start

### For Everyone (Recommended)

1. **Download the latest release**:
   - Go to the [Releases](https://github.com/nicktobolski/bananacci/releases) page
   - Download `BananacciVolume-vX.X.X.zip` (latest version)
   - Extract the ZIP file

2. **Run the executable**:
   - Double-click `BananacciVolume.exe`
   - You'll see your current volume displayed as bananas
   - Use your volume keys to test it

### For Developers

1. **Clone the repository**:
   ```bash
   git clone https://github.com/nicktobolski/bananacci.git
   cd bananacci
   ```

2. **Run the source script** (requires AutoHotkey v2):
   - Install AutoHotkey v2 from [autohotkey.com](https://www.autohotkey.com/)
   - Double-click `BananacciVolume.ahk`

## 🎮 How to Use

- **Volume Up Key**: Increase volume (shows more bananas)
- **Volume Down Key**: Decrease volume (shows fewer bananas)
- **Hold Keys**: Rapidly adjust volume by holding down the keys

## 📊 Volume Levels

| Bananas | Volume Range | Description |
|---------|-------------|-------------|
| 🍌🍌🍌🍌🍌🍌🍌🍌🍌🍌🍌🍌🍌 | 92-100% | Maximum volume |
| 🍌🍌🍌🍌🍌🍌🍌🍌🍌🍌🍌🍌  | 83-91% | Very high |
| 🍌🍌🍌🍌🍌🍌🍌🍌🍌🍌🍌   | 70-82% | High volume |
| 🍌🍌🍌🍌🍌🍌🍌🍌🍌🍌    | 57-69% | Medium-high |
| 🍌🍌🍌🍌🍌🍌🍌🍌🍌     | 44-56% | Medium |
| 🍌🍌🍌🍌🍌🍌🍌🍌      | 32-43% | Medium-low |
| 🍌🍌🍌🍌🍌🍌🍌       | 21-31% | Low-medium |
| 🍌🍌🍌🍌🍌🍌        | 13-20% | Low |
| 🍌🍌🍌🍌🍌         | 8-12% | Very low |
| 🍌🍌🍌🍌          | 5-7% | Quiet |
| 🍌🍌🍌           | 3-4% | Very quiet |
| 🍌🍌            | 1-2% | Whisper |
| 🍌             | >0-1% | Barely audible |
|               | 0% | Muted |

## 🛠️ System Requirements

- **Windows 10/11** (tested on Windows 10)
- **Volume keys** on your keyboard
- **No AutoHotkey installation required** (for the executable)

## 🔧 Troubleshooting

### Executable won't run
- Make sure you're on Windows 10/11
- Right-click the file and select "Run as administrator"
- Check Windows Defender isn't blocking it

### Volume keys not working
- Check if other software is using the volume keys
- Try restarting the executable
- Ensure the program is running (check system tray)

### Bananas not appearing
- Ensure your keyboard has volume control keys
- Check that the program is running
- Try pressing volume keys to trigger the display

### Performance issues
- Close other volume control software that might conflict
- Restart the executable if it becomes unresponsive

## 🎨 Customization

Want to customize the appearance? You'll need to modify the source code and recompile:

1. **Edit `BananacciVolume.ahk`** with your changes
2. **Install AutoHotkey v2** for compilation
3. **Use the compiler**: `Ahk2Exe.exe /in BananacciVolume.ahk /out BananacciVolume.exe`

### Change Banana Color
```autohotkey
volumeTextControl := volumeGUI.Add("Text", "x5 y5 w900 h90 cFFFF00 Left", visualBar)
```
Change `cFFFF00` to:
- `cFF0000` for red bananas
- `c00FF00` for green bananas
- `c0000FF` for blue bananas

### Change Font Size
```autohotkey
volumeTextControl.SetFont("s48")
```
Change `s48` to `s36` for smaller or `s60` for larger bananas.

### Change Display Position
```autohotkey
yPos := Round(A_ScreenHeight * 0.95)  ; 95% down the screen
```
Change `0.95` to `0.5` for center screen or `0.1` for top of screen.

## 📝 Version History

### v1.1.0
- **Standalone executable** - no AutoHotkey installation required
- Improved startup experience - shows current volume immediately
- Better GitHub Actions workflow with automatic compilation
- Enhanced installer script

### v1.0.0
- Initial release
- 14-step volume control
- Smooth volume fading
- Banana emoji visual feedback
- Auto-unmute functionality
- Transparent GUI

## 🚀 Development

### Building from Source

1. **Clone the repository**:
   ```bash
   git clone https://github.com/nicktobolski/bananacci.git
   cd bananacci
   ```

2. **Install AutoHotkey v2** for compilation

3. **Compile to executable**:
   ```bash
   "C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe" /in BananacciVolume.ahk /out BananacciVolume.exe
   ```

### Automated Builds

The project uses GitHub Actions to automatically:
- Compile the .ahk file to .exe
- Create releases with proper versioning
- Generate installers and ZIP packages

## 🤝 Contributing

Found a bug or have an idea? We'd love to hear from you.

1. Open an issue on GitHub
2. Describe the problem or feature request
3. We'll get back to you as soon as possible

## 📄 License

This project is open source and available under the MIT License. Feel free to use, modify, and distribute.

## 🙏 Acknowledgments

- Built with AutoHotkey v2
- Inspired by the need for better volume control
- Made with 🍌 and ❤️

---

**Enjoy your bananas 🍌**
