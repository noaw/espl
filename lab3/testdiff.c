#include <stdlib.h>
#include <stdio.h>
#include "diff.h"

int main(int argc, char **argv) {
    struct diff diff;
    fputdiff(stdout, parsediff("byte 33 -174 +230", &diff));

    return 0;
}


