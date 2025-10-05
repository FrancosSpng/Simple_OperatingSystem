#!/bin/bash
echo "=== Building SimpleOS ==="

echo "1. Compiling bootloader..."
nasm -f bin boot.asm -o boot.bin

echo "2. Compiling kernel (Assembly)..."
nasm -f bin kernel.asm -o kernel.bin

echo "3. Creating disk image..."
dd if=/dev/zero of=os.img bs=512 count=2880 2>/dev/null
dd if=boot.bin of=os.img bs=512 count=1 conv=notrunc 2>/dev/null
dd if=kernel.bin of=os.img bs=512 seek=1 conv=notrunc 2>/dev/null

echo "4. Cleaning up..."
rm -f boot.bin kernel.bin

echo "=== Build successful! ==="