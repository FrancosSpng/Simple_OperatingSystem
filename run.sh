#!/bin/bash
echo "=== Starting SimpleOS ==="

if [ ! -f "os.img" ]; then
    echo "Error: os.img not found"
    exit 1
fi

echo "Starting QEMU..."
qemu-system-i386 -fda os.img