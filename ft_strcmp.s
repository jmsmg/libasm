global ft_strcmp

section .text

ft_strcmp:

.loop:
    movzx   eax, byte [rdi] ; EAX = (unsigned char)*s1 제로 확장
    movzx   edx, byte [rsi]

    cmp     al, dl      ; 현재 바이트와 동일한지
    jne     .equal      ; null이면 0환반환

    inc     rdi
    inc     rsi
    jmp     .loop

.diff:
    sub     eax, edx
    ret


.equal:
    xor     eax, eax    ; EAX = 0
    ret