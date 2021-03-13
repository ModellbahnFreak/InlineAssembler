#include <iostream>
#include "InlineAssemblerConfig.h"

inline
long foo(int A) {
    int out;
    // You can't assume A will be in RDI: after inlining it prob. won't be
    __asm {
        mov   ecx, A                   // comment syntax
        add   ecx, 5
        mov   out, ecx
    }
    return out;
}

int main(int argc, char** argv) {
    std::cout << "Code for sheet " << SHEET_NUM << " task " << TASK_NUM << std::endl;
    std::cout << "Result of foo(12): " << foo(12) << std::endl;
}