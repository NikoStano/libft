#!/bin/sh

###########################################################
#                         COLORS                          #
###########################################################
BGREEN='\033[1;32m'
GREEN='\033[0;32m'
BRED='\033[1;31m'
RED='\033[0;31m'
GBLUE='\033[1;34m'
BLUE='\033[0;34m'
NC='\033[0m'

###########################################################
#                    MAIN TEST CREATION                   #
###########################################################
MAIN_FILE="main_test_libft.c"
EXEC_FILE="test_libft"

printf "${BGREEN}=== [0] Génération de $MAIN_FILE ===${NC}\n"

cat << EOF > $MAIN_FILE
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include <limits.h>
#include <unistd.h>
#include "libft.h"

typedef void (*test_fn)(void);

#define GREEN   "\033[0;32m"
#define RED     "\033[0;31m"
#define BLUE    "\033[1;34m"
#define RESET   "\033[0m"

#define SHOW(name) printf(BLUE "\n===== TEST %s =====\n" RESET, name)
#define CMP_INT(f, r) printf((f == r) ? GREEN "✅ OK" RESET : RED "\u274C KO" RESET), printf(" | ft: %d, real: %d\n", (int)f, (int)r)
#define CMP_SIZE(f, r) printf((f == r) ? GREEN "✅ OK" RESET : RED "\u274C KO" RESET), printf(" | ft: %zu, real: %zu\n", f, r)
#define CMP_STR(f, r) printf((strcmp(f, r) == 0) ? GREEN "✅ OK" RESET : RED "\u274C KO" RESET), printf(" | ft: [%s], real: [%s]\n", f, r)
#define CMP_MEM(f, r, n) printf((memcmp(f, r, n) == 0) ? GREEN "✅ OK" RESET : RED "\u274C KO" RESET), printf(" | memcmp=%d\n", memcmp(f, r, n))

void test_ft_strlen(void) {
    SHOW("ft_strlen");
    CMP_SIZE(ft_strlen(""), strlen(""));
    CMP_SIZE(ft_strlen("Hello"), strlen("Hello"));
    CMP_SIZE(ft_strlen("Lorem ipsum dolor sit amet."), strlen("Lorem ipsum dolor sit amet."));
}

void test_ft_isalpha(void) {
    SHOW("ft_isalpha");
    CMP_INT(ft_isalpha('b'), isalpha('b'));
    CMP_INT(ft_isalpha('B'), isalpha('B'));
    CMP_INT(ft_isalpha('0'), isalpha('0'));
}

void test_ft_memset(void) {
    SHOW("ft_memset");
    char buf1[10];
    char buf2[10];
    memset(buf1, 'A', 10);
    ft_memset(buf2, 'A', 10);
    CMP_MEM(buf1, buf2, 10);
}

void test_ft_strdup(void) {
    SHOW("ft_strdup");
    char *sys = strdup("hello");
    char *ft = ft_strdup("hello");
    CMP_STR(ft, sys);
    free(sys); free(ft);
}

void test_ft_calloc(void) {
    SHOW("ft_calloc");
    char *sys = calloc(4, 4);
    char *ft = ft_calloc(4, 4);
    CMP_MEM(ft, sys, 16);
    free(sys); free(ft);
}

void test_ft_substr(void) {
    SHOW("ft_substr");
    char *res = ft_substr("abcdef", 2, 3);
    CMP_STR(res, "cde");
    free(res);
}

void test_ft_split(void) {
    SHOW("ft_split");
    char **res = ft_split("aaa bb c", ' ');
    printf(GREEN "→ " RESET);
    for (int i = 0; res[i]; i++) printf("[%s] ", res[i]);
    printf("\n");
    for (int i = 0; res[i]; i++) free(res[i]);
    free(res);
}

void test_ft_itoa(void) {
    SHOW("ft_itoa");
    char *res = ft_itoa(-2147483648);
    CMP_STR(res, "-2147483648");
    free(res);
}

void test_ft_lstnew(void) {
    SHOW("ft_lstnew");
    t_list *node = ft_lstnew("data");
    printf((node && node->content) ? GREEN "✅ OK\n" RESET : RED "\u274C KO\n" RESET);
    free(node);
}

void run_all_tests(void) {
    test_ft_strlen();
    test_ft_isalpha();
    test_ft_memset();
    test_ft_strdup();
    test_ft_calloc();
    test_ft_substr();
    test_ft_split();
    test_ft_itoa();
    test_ft_lstnew();
}

int main(void) {
    run_all_tests();
    return (0);
}
EOF

###########################################################
#                     COMMANDE SHELL                      #
###########################################################
clean_files_and_exit() {
    printf "${GBLUE}=== [4] Cleaning Files ===${NC}\n"
    make fclean
    rm -f "$EXEC_FILE" "$MAIN_FILE"
    printf "${BGREEN}=== ✅ [4] ALL FILES CLEANED ! ✅ ===${NC}\n\n"
    exit 1
}

printf "${GBLUE}=== [1] Compilation avec make re ===${NC}\n"
make bonus
if [ $? -ne 0 ]; then
    printf "${BRED}Erreur lors du make${NC}\n"
    clean_files_and_exit
else
    printf "${BGREEN}=== ✅ [1] Librairie compilée avec succès ! ✅ ===${NC}\n\n"
fi

printf "${GBLUE}=== [2] Compilation du fichier de test ===${NC}\n"
cc -Wall -Wextra -Werror -g3 $MAIN_FILE libft.a -o $EXEC_FILE
if [ $? -ne 0 ]; then
    printf "${BRED}Erreur lors de la compilation du test${NC}\n"
    clean_files_and_exit
else
    printf "${BGREEN}=== ✅ [2] Test compilé avec succès ! ✅ ===${NC}\n\n"
fi

printf "${GBLUE}=== [3] Vérification mémoire avec valgrind ===${NC}\n"
valgrind --leak-check=full --show-leak-kinds=all -s ./$EXEC_FILE
if [ $? -ne 0 ]; then
    printf "${BRED}Erreur de mémoire${NC}\n"
    clean_files_and_exit
else
    printf "\n${BGREEN}=== ✅ [3] TESTS TERMINÉS SANS ERREURS ! ✅ ===${NC}\n\n"
fi

clean_files_and_exit
