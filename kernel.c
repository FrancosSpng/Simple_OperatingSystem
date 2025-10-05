void kernel_main()
{

    char *vga = (char *)0xB8000;

    for (int i = 0; i < 80 * 25 * 2; i += 2)
    {
        vga[i] = ' ';
        vga[i + 1] = 0x1F;
    }

    char *welcome = "Welcome to SimpleOS!";
    int pos = 0;
    for (int i = 0; welcome[i] != 0; i++)
    {
        vga[pos] = welcome[i];
        vga[pos + 1] = 0x1F;
        pos += 2;
    }

    char *info1 = "Kernel: SimpleOS v1.0";
    char *info2 = "Memory: 0x8000";
    char *info3 = "Display: VGA 80x25";
    char *status = "System Ready!";

    pos = 160;
    for (int i = 0; info1[i] != 0; i++)
    {
        vga[pos] = info1[i];
        vga[pos + 1] = 0x1E;
        pos += 2;
    }

    pos = 320;
    for (int i = 0; info2[i] != 0; i++)
    {
        vga[pos] = info2[i];
        vga[pos + 1] = 0x1E;
        pos += 2;
    }

    pos = 480;
    for (int i = 0; info3[i] != 0; i++)
    {
        vga[pos] = info3[i];
        vga[pos + 1] = 0x1E;
        pos += 2;
    }

    pos = 640;
    for (int i = 0; status[i] != 0; i++)
    {
        vga[pos] = status[i];
        vga[pos + 1] = 0x1A;
        pos += 2;
    }

    while (1)
    {
    }
}