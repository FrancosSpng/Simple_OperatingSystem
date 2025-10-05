[BITS 16]
[ORG 0x7C00]

start:
   
    mov ax, 0x0003
    int 0x10
    
    
    mov si, boot_msg
    call print_string
    
    
    mov ax, 0xB800
    mov es, ax
    
    mov di, 0
    mov cx, 80*25
    mov ax, 0x1F00 | ' '  
    rep stosw
    
   
    
 
    mov di, 0
    mov si, line1
    call print_vga_line
    
   
    mov di, 160
    mov si, line2
    call print_vga_line
    
    
    mov di, 320
    mov si, line3
    call print_vga_line
    
 
    mov di, 480
    mov si, line4
    call print_vga_line
    
   
    mov di, 24*160  
    mov si, line5
    call print_vga_line
    
    jmp $


print_string:
    mov ah, 0x0E
.loop:
    lodsb
    test al, al
    jz .done
    int 0x10
    jmp .loop
.done:
    ret


print_vga_line:
    mov ah, 0x1F  
.vga_loop:
    lodsb
    test al, al
    jz .done
    stosw         
    jmp .vga_loop
.done:
    ret


boot_msg db "Booting SimpleOS...", 0x0D, 0x0A, 0
line1 db "Welcome to SimpleOS v1.0!", 0
line2 db "System: Monolithic Kernel | Display: VGA 80x25", 0
line3 db "Memory: Boot 0x7C00 | Kernel 0x8000 | VGA 0xB8000", 0
line4 db "Status: OPERATIONAL", 0
line5 db "(C) 2024 SimpleOS - Educational OS", 0

times 510-($-$$) db 0
dw 0xAA55