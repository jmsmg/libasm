default rel
global  ft_strdup
extern  ft_strlen
extern  ft_strcpy
extern  malloc

section .text
; char *ft_strdup(const char *s) ; RDI = src
ft_strdup:
    push    rdi                 ; save src across calls
    call    ft_strlen           ; rax = len(src)
    lea     rdi, [rax + 1]      ; rdi = size (len+1)
    call    malloc wrt ..plt    ; *** PIE-safe: call via PLT ***
    test    rax, rax
    jz      .fail
    mov     rdi, rax            ; dst
    pop     rsi                 ; src
    jmp     ft_strcpy           ; tail call (returns dst in rax)

.fail:
    pop     rcx                 ; balance the stack
    xor     eax, eax            ; return NULL
    ret

section .note.GNU-stack noalloc noexec nowrite progbits
