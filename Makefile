NAME    = libasm.a
CC      = cc
NASM    = nasm
AR      = ar
CFLAGS  = -Wall -Wextra -Werror
SRC     = ft_strlen.s ft_strcpy.s ft_strcmp.s ft_read.s ft_write.s ft_strdup.s
OBJ     = $(SRC:.s=.o)

all: $(NAME)

%.o: %.s
	$(NASM) -f elf64 $< -o $@

$(NAME): $(OBJ)
	$(AR) rcs $@ $^

# 과제 지침: 평가용 main은 -L. -lasm 으로 링크
test: $(NAME) main.c
	$(CC) $(CFLAGS) main.c -L. -lasm -o test_asm

run: test
	./test_asm

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME) test_asm

re: fclean all

.PHONY: all test run clean fclean re
