default rel
global  ft_read
extern  __errno_location

section .text
ft_read:
    mov     eax, 0
    syscall
    test    rax, rax
    js      .err
    ret

.err:
    neg     eax
    mov     edi, eax
    sub     rsp, 8
    call    __errno_location wrt ..plt
    add     rsp, 8
    mov     dword [rax], edi
    mov     rax, -1
    ret

section .note.GNU-stack noalloc noexec nowrite progbits
