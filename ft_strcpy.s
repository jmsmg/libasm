global ft_strcpy

section .text

ft_strcpy:
    push    rdi             ; 원래의 dst 주소 보관

.loop:
    mov     al, [rsi]       ; AL ← *src (1바이트 읽기)
    mov     [rdi], al       ; *dst ← AL (1바이트 쓰기)
    inc     rsi             ; src++
    inc     rdi             ; dst++
    test    al, al          ; AL == 0? (널 문자 체크)
    jnz     .loop           ; 아니면 계속

    pop     rax             ; 원래의 dst 주소 반환
    ret
