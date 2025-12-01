#ifndef CALC_LANG_C_INT_ARENA
#define CALC_LANG_C_INT_ARENA

typedef struct LLVMIntArena {
    char *buffer;      // Pointer to the start of the allocated memory buffer
    int capacity;   // Total capacity of the arena
    int offset;     // Current allocation offset within the buffer
} LLVMIntArena;

LLVMIntArena* arenaInit(int size);
void* arenaAlloc(LLVMIntArena* arena, int size);
void arenaReset(LLVMIntArena *arena);
void arenaFree(LLVMIntArena *arena);

#endif
