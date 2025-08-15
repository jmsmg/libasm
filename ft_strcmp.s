default rel
global ft_strcmp

section .text
; int ft_strcmp(const char *s1, const char *s2)
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

.diff:                       ; unsigned 비교 기준으로 부호만 반환
    jb      .neg            ; al < dl  (unsigned) ? 음수
    mov     eax, 1          ; al > dl
    ret
.neg:
    mov     eax, -1
    ret

section .note.GNU-stack noalloc noexec nowrite progbits
