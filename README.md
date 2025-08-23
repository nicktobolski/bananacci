# 🍌 Bananacci Volume

**The most fun way to control your Windows volume!**

Bananacci Volume transforms your boring volume controls into a delightful experience with smooth 10-step increments and visual banana emoji feedback.

## ✨ Features

- **🍌 Visual Feedback**: See your volume level with large yellow banana emojis
- **🎛️ 10-Step Control**: Precise volume adjustments (0%, 1%, 3%, 5%, 8%, 13%, 21%, 34%, 55%, 100%)
- **🎵 Smooth Fading**: Beautiful volume transitions instead of jarring jumps
- **🔊 Auto-Unmute**: Automatically unmutes when you increase from 0%
- **⚡ Rapid Response**: Hold down volume keys for quick adjustments
- **🎯 Transparent Display**: Clean, modern interface that doesn't interfere with your work

## 🚀 Quick Start

### For Non-Technical Users

1. **Download AutoHotkey v2** (if you don't have it):
   - Go to [https://www.autohotkey.com/](https://www.autohotkey.com/)
   - Download and install AutoHotkey v2

2. **Download Bananacci Volume**:
   - Click the green "Code" button above
   - Select "Download ZIP"
   - Extract the ZIP file to a folder

3. **Run the script**:
   - Double-click `BananacciVolume.ahk`
   - You'll see a welcome message
   - Use your volume keys to test it!

### For Advanced Users

```autohotkey
#Include BananacciVolume.ahk
```

## 🎮 How to Use

- **Volume Up Key**: Increase volume (shows more bananas)
- **Volume Down Key**: Decrease volume (shows fewer bananas)
- **Hold Keys**: Rapidly adjust volume by holding down the keys

## 📊 Volume Levels

| Bananas | Volume | Description |
|---------|--------|-------------|
| 🍌🍌🍌🍌🍌🍌🍌🍌🍌 | 100% | Maximum volume |
| 🍌🍌🍌🍌🍌🍌🍌🍌  | 55% | High volume |
| 🍌🍌🍌🍌🍌🍌🍌   | 34% | Medium-high |
| 🍌🍌🍌🍌🍌🍌    | 21% | Medium |
| 🍌🍌🍌🍌🍌     | 13% | Medium-low |
| 🍌🍌🍌🍌      | 8% | Low |
| 🍌🍌🍌       | 5% | Very low |
| 🍌🍌        | 3% | Whisper |
| 🍌         | 1% | Barely audible |
|           | 0% | Muted |

## 🛠️ System Requirements

- **Windows 10/11** (tested on Windows 10)
- **AutoHotkey v2.0** or later
- **Volume keys** on your keyboard

## 🔧 Troubleshooting

### Script won't run
- Make sure AutoHotkey v2 is installed
- Right-click the file and select "Run as administrator"

### Volume keys not working
- Check if other software is using the volume keys
- Try restarting the script

### Bananas not appearing
- Ensure your keyboard has volume control keys
- Check that the script is running (look for the AutoHotkey icon in system tray)

### Performance issues
- Close other AutoHotkey scripts that might conflict
- Restart the script if it becomes unresponsive

## 🎨 Customization

Want to change the appearance? Edit `BananacciVolume.ahk`:

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

### v1.0.0
- Initial release
- 10-step volume control
- Smooth volume fading
- Banana emoji visual feedback
- Auto-unmute functionality
- Transparent GUI

## 🤝 Contributing

Found a bug or have an idea? We'd love to hear from you!

1. Open an issue on GitHub
2. Describe the problem or feature request
3. We'll get back to you as soon as possible

## 📄 License

This project is open source and available under the MIT License. Feel free to use, modify, and distribute!

## 🙏 Acknowledgments

- Built with AutoHotkey v2
- Inspired by the need for better volume control
- Made with 🍌 and ❤️

---

**Enjoy your bananas! 🍌**
