default rel
global ft_strcmp

section .text

ft_strcmp:
.loop:
    mov     al, [rdi]
    mov     dl, [rsi]
    cmp     al, dl
    jne     .diff
    inc     rdi
    inc     rsi
    test    al, al
    jne     .loop
    xor     eax, eax
    ret

.diff: 
    jb      .neg
    mov     eax, 1
    ret
.neg:
    mov     eax, -1
    ret

section .note.GNU-stack noalloc noexec nowrite progbits
