#include "../drivers/screen.h"

void clear_screen() {
    char* VGA = (char*)0xb8000;
    for (int i = 0; i < 80 * 25; ++i) {
        VGA[i] = ' '; // два байта fg bg
    }
}
