#ifndef SCREEN_H
#define SCREEN_H
#define VGA_ADD 0xb8000
typedef enum {
    BLACK         = 0,
    BLUE          = 1,
    GREEN         = 2,
    CYAN          = 3,
    RED           = 4,
    MAGENTA       = 5,
    BROWN         = 6,   // Dark yellow (VGA calls it "brown")
    LIGHT_GRAY    = 7,   // Light gray (not white!)
    DARK_GRAY     = 8,
    LIGHT_BLUE    = 9,
    LIGHT_GREEN   = 10,
    LIGHT_CYAN    = 11,
    LIGHT_RED     = 12,
    LIGHT_MAGENTA = 13,
    YELLOW        = 14,
    WHITE         = 15
} VGA_Color;
void clear_screen();
#endif                            // SCREEN_H
