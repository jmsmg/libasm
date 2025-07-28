global ft_strlen ; export부분

section .text ; 코드 섹션

; .data, .bss 같은 섹션이 따로 있음 메모리 구조에 따른듯
; 앞에 . 표시를 붙인걸 label이라고 표현함 jmp .loop라고 하면 점프해서 반복함

ft_strlen:
    xor rax, rax    ; rax 초기화
    cmp byte [rdi + rax], 0 ; 핵심 로직 -> byte는 1바이트씩 읽는 것, cmp로 비교
    je  .done   ; null이면 끝
    inc rax ; 글자 하나 추가
    jmp .loop   ; 다시 반복

.done:
    ret     ;RAX 반환