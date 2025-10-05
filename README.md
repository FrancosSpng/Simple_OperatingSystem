# Simple_OperatingSystem
An educational operating system made by C
```markdown
# SimpleOS

A minimal, working operating system written in x86 Assembly and C. Boots directly and displays a functional interface with VGA graphics.

## 🚀 Features

- **Complete Boot Process**: Full MBR bootloader in Assembly
- **Kernel in C**: Demonstrates mixed-language OS development
- **VGA Display**: 80x25 text mode with color support
- **Educational**: Perfect for learning OS development basics

## 📁 Project Structure

```
simple_os/
├── boot.asm          # Bootloader (x86 Assembly)
├── kernel.c          # Kernel main code (C language)
├── build.sh          # Build script
├── run.sh            # Run script
├── os.img            # OS disk image (built)
└── README.md         # This file
```

## 🛠️ Step-by-Step Guide

### 1. Install Required Tools

**Windows (UCRT64/MINGW64):**
```bash
pacman -Syu
pacman -S nasm gcc qemu
```

**Ubuntu/Debian:**
```bash
sudo apt-get update
sudo apt-get install nasm gcc qemu-system-x86
```

**macOS:**
```bash
brew install nasm qemu
```

### 2. Build the Operating System

```bash
# Make scripts executable
chmod +x build.sh run.sh

# Build the OS (compiles both boot.asm and kernel.c)
./build.sh
```

This will:
- Compile `boot.asm` with NASM (bootloader)
- Compile `kernel.c` with GCC (kernel)
- Link them together into `os.img`

### 3. Run in Emulator

```bash
# Run the OS in QEMU
./run.sh
```

**To exit QEMU**: Press `Ctrl+A` then `X`

### 4. What You'll See

When successful, you'll see:
1. **Text message**: "Booting SimpleOS..." (from bootloader)
2. **Blue screen** with colored text displaying system information (from kernel)

## 🏗️ System Architecture

### Memory Layout
- **0x7C00**: Bootloader (Assembly)
- **0x8000**: Kernel (C code)
- **0xB8000**: VGA text buffer

### Languages Used
- **Assembly**: Low-level boot process, hardware interaction
- **C**: Kernel logic, memory management, display functions

## 🎯 Learning Outcomes

Understand:
- Boot process and BIOS interrupts (Assembly)
- Mixed-language programming (Assembly + C)
- VGA text mode programming
- Memory segmentation and addressing
- Cross-compilation for OS development

## 🐛 Troubleshooting

**Build fails?**
- Check tools: `nasm -v` and `gcc --version`
- Ensure both `boot.asm` and `kernel.c` exist

**Black screen?**
- Check build completed: `ls -lh os.img`
- Ensure QEMU window has focus

**Permission denied?**
```bash
chmod +x build.sh run.sh
```

---

**From bootloader to kernel - a complete OS development journey!** 🎉
```
