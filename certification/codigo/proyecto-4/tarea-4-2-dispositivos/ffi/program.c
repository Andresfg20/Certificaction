#include <stdlib.h>

void chcp65001() {
#ifdef _WIN32
    system("chcp 65001");
#endif
}

void clearScreen() {
#ifdef _WIN32
    system("cls");
#else
    system("clear");
#endif
}
