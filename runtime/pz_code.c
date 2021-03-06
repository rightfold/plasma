/*
 * Plasma bytecode code structures and functions
 * vim: ts=4 sw=4 et
 *
 * Copyright (C) 2015-2016, 2018 Plasma Team
 * Distributed under the terms of the MIT license, see ../LICENSE.code
 */

#include <string.h>

#include "pz_common.h"

#include "pz_code.h"

struct PZ_Proc_Struct {
    uint8_t  *code;
    unsigned  code_size;
};

void
pz_proc_symbol_free(void *proc_void)
{
    PZ_Proc_Symbol *proc = proc_void;

    if (proc->need_free) {
        switch (proc->type) {
            case PZ_BUILTIN_BYTECODE:
                free(proc->proc.bytecode);
                break;
            case PZ_BUILTIN_C_FUNC:
                break;
        }
        free(proc);
    }
}

PZ_Proc *
pz_proc_init(unsigned size)
{
    PZ_Proc *proc = malloc(sizeof(PZ_Proc));

    proc->code = malloc(sizeof(uint8_t) * size);
    proc->code_size = size;

    return proc;
}

void
pz_proc_free(PZ_Proc *proc)
{
    free(proc->code);
    free(proc);
}

uint8_t *
pz_proc_get_code(PZ_Proc *proc)
{
    return proc->code;
}

unsigned
pz_proc_get_size(PZ_Proc *proc)
{
    return proc->code_size;
}


