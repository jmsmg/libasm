# libasm

어셈블리어 입문 과제입니다.  
C 표준 라이브러리 함수들을 x86-64 어셈블리(NASM, Intel 문법)로 직접 구현합니다.

---

## 🧠 과제 목표

- x86-64bit 환경에서 어셈블리 프로그래밍에 익숙해지기
- 시스템 콜(write, read)과 메모리 관리(malloc 등) 직접 사용해보기
- 레지스터, 메모리, 스택 등의 저수준 동작 이해하기

---

## 🔧 개발 환경

- **OS**: Linux
- **아키텍처**: x86-64 (64비트)
- **어셈블러**: [NASM](https://www.nasm.us/)
- **컴파일러**: gcc (옵션: `-no-pie`)
- **언어**: Assembly (Intel syntax), C (테스트용)

---

## ✍️ 구현한 함수 목록

### ✅ 필수 함수 (Mandatory)

| 함수명 | 설명 |
|--------|------|
| `ft_strlen` | 문자열 길이 계산 |
| `ft_strcpy` | 문자열 복사 |
| `ft_strcmp` | 문자열 비교 |
| `ft_write` | 파일 디스크립터에 출력 (시스템 콜) |
| `ft_read` | 파일 디스크립터로부터 입력 (시스템 콜) |
| `ft_strdup` | 문자열 복사 + 동적 메모리 할당 (malloc 호출 가능) |

> `ft_write`, `ft_read`는 오류 발생 시 `errno`를 정확히 설정해야 합니다.  
> → `extern __errno_location` 호출 사용 가능

---

### 🌟 보너스 (선택 구현)

> 필수 과제 통과 후 평가됨

| 함수명 | 설명 |
|--------|------|
| `ft_atoi_base` | 진법 변환 (ex. 16진수 문자열 → 정수) |
| `ft_list_push_front` | 연결리스트 앞에 노드 추가 |
| `ft_list_size` | 연결리스트 노드 수 계산 |
| `ft_list_sort` | 연결리스트 정렬 |
| `ft_list_remove_if` | 조건에 맞는 노드 삭제 |

---

## 📦 빌드 및 실행

```bash
nasm -f elf64 ft_strlen.s -o ft_strlen.o
gcc -no-pie main.c ft_strlen.o -o main
./main

