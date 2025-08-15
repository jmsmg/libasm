#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>
#include "libasm.h"

static void chk(const char* name, int pass) {
    printf("[%s] %s\n", name, pass ? "OK" : "FAIL");
}

int main(void) {
    // ft_strlen
    chk("strlen empty", ft_strlen("") == strlen(""));
    {
        char big[8192]; memset(big, 'A', sizeof(big)); big[sizeof(big)-1] = 0;
        chk("strlen long", ft_strlen(big) == strlen(big));
    }

    // ft_strcpy
    {
        char dst1[64], dst2[64];
        chk("strcpy empty", !strcmp(ft_strcpy(dst1, ""), strcpy(dst2, "")));
        char big[4096]; memset(big, 'B', sizeof(big)-1); big[sizeof(big)-1]=0;
        char d1[4096], d2[4096];
        chk("strcpy long", !strcmp(ft_strcpy(d1, big), strcpy(d2, big)));
    }

    // ft_cmp
    chk("strcmp 2 empty", ft_strcmp("", "") == strcmp("", ""));
    chk("strcmp empty vs non", ft_strcmp("", "a") == strcmp("", "a"));
    chk("strcmp non vs empty", ft_strcmp("a", "") == strcmp("a", ""));
    chk("strcmp equal", ft_strcmp("hello", "hello") == strcmp("hello", "hello"));
    chk("strcmp diff", (ft_strcmp("abc", "abd")<0) == (strcmp("abc","abd")<0));
    chk("strcmp swap", (ft_strcmp("abd", "abc")>0) == (strcmp("abd","abc")>0));
    printf("cmp(\"\", \"a\"): lib=%d asm=%d\n", strcmp("", "a"), ft_strcmp("", "a"));
    printf("cmp(\"a\", \"\"): lib=%d asm=%d\n", strcmp("a", ""), ft_strcmp("a", ""));


    // ft_write 테스트
    errno = 0;
    ssize_t w1 = ft_write(1, "STDOUT\n", 7);
    chk("write stdout", w1 == 7 && errno == 0);

    int fd = open("tmp_libasm_test.txt", O_CREAT|O_TRUNC|O_WRONLY, 0644);
    errno = 0;
    ssize_t w2 = ft_write(fd, "FILE\n", 5);
    chk("write file", w2 == 5 && errno == 0);
    close(fd);

    errno = 0;
    ssize_t w3 = ft_write(-42, "X", 1);
    chk("write bad fd errno", w3 == -1 && errno != 0);

    // ft_read
    char rb[8];
    errno = 0;
    ssize_t r1 = ft_read(0, rb, sizeof(rb)); /* stdin 테스트: 수동 입력 필요할 수 있음 */
    (void)r1; /* 점수에 영향 없게 패스, 아래는 확실한 테스트만 판정 */

    fd = open("tmp_libasm_test.txt", O_RDONLY);
    errno = 0; memset(rb, 0, sizeof(rb));
    ssize_t r2 = ft_read(fd, rb, sizeof(rb));
    chk("read file", r2 >= 0 && errno == 0);
    close(fd);

    errno = 0; memset(rb, 0, sizeof(rb));
    ssize_t r3 = ft_read(-42, rb, sizeof(rb));
    chk("read bad fd errno", r3 == -1 && errno != 0);

    // ft_strdup
    char *d0 = ft_strdup("");
    chk("strdup empty", d0 && strcmp(d0, "") == 0);
    free(d0);

    char *longs = (char*)malloc(10000); memset(longs, 'C', 9999); longs[9999]=0;
    char *d1p = ft_strdup(longs);
    chk("strdup long", d1p && strcmp(d1p, longs) == 0);
    free(d1p); free(longs);

    printf("\nAll tests done.\n");
    return 0;
}
