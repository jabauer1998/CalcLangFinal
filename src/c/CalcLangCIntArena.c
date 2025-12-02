#include "CalcLangCIntArena.h"

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

LLVMIntArena* arenaInit(unsigned int capacity){
  LLVMIntArena *arena = (LLVMIntArena*)malloc(sizeof(LLVMIntArena));
  if (arena == NULL) {
        perror("Failed to allocate Arena struct");
        return NULL;
  }

  arena->buffer = (char*)malloc(capacity);
  
  if (arena->buffer == NULL) {
       perror("Failed to allocate arena buffer");
       free(arena); // Free the arena struct if buffer allocation fails
       return NULL;
  }

   arena->capacity = capacity;
   arena->offset = 0;
   return arena;
}

void* arenaAlloc(LLVMIntArena* arena, int size){
    if (arena == NULL) {
        fprintf(stderr, "Error: Arena is NULL in arena_alloc\n");
        return NULL;
    }
    if (arena->offset + size > arena->capacity) {
      fprintf(stderr, "Error: Arena out of memory for allocation of size %zu\n and capacity %d, and current offset %d\n", size, arena->capacity, arena->offset);
      fflush(stdout);
        return NULL; // Not enough space
    }

    void *ptr = arena->buffer + arena->offset;
    arena->offset += size;
    fflush(stdout);
    memset(ptr, 0, size); // Initialize allocated memory to zero
    return ptr;
}

void arenaReset(LLVMIntArena *arena) {
    if (arena != NULL) {
        arena->offset = 0; // Reset offset to beginning, ready for new allocations
        // Optionally, memset the entire buffer to zero for security/debugging
        // memset(arena->buffer, 0, arena->capacity);
    }
}

void arenaFree(LLVMIntArena *arena) {
    if (arena != NULL) {
        free(arena->buffer);
        free(arena);
    }
}
