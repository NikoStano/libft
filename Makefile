# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nistanoj <nistanoj@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/02/26 16:35:06 by nistanoj          #+#    #+#              #
#    Updated: 2025/10/25 22:57:08 by nistanoj         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		=	libft.a

CC			=	cc
CFLAGS		=	-Wall -Wextra -Werror -ggdb
DEPFLAGS	=	-MMD -MP
COMPILE		=	$(CC) $(CFLAGS) $(DEPFLAGS)
RM			=	rm -rf

DIR_IS		=	is_funcs/
DIR_CONV	=	conv_funcs/
DIR_STR		=	str_funcs/
DIR_MEM		=	mem_funcs/
DIR_PUT		=	put_funcs/
DIR_LST		=	lst_funcs/
DIR_PRINTF	=	printf_funcs/
DIR_GNL		=	gnl_funcs/
DIR_UTILS	=	utils_funcs/

IS_FUNCS	=	ft_isalnum.c \
				ft_isalpha.c \
				ft_isascii.c \
				ft_isdigit.c \
				ft_isprint.c \
				ft_isspace.c
CONV_FUNCS	=	ft_atoi.c \
				ft_atol.c \
				ft_atoi_base.c \
				ft_itoa.c \
				ft_tolower.c \
				ft_toupper.c \
				ft_strtol.c
STR_FUNCS	=	ft_strchr.c \
				ft_strdup.c \
				ft_strlcat.c \
				ft_strlcpy.c \
				ft_strlen.c \
				ft_strcmp.c \
				ft_strncmp.c \
				ft_strnstr.c \
				ft_strrchr.c \
				ft_strjoin.c \
				ft_split.c \
				ft_substr.c \
				ft_strtrim.c \
				ft_strmapi.c \
				ft_striteri.c
MEM_FUNCS	=	ft_memset.c \
				ft_bzero.c \
				ft_calloc.c \
				ft_memcpy.c \
				ft_memmove.c \
				ft_memchr.c \
				ft_memcmp.c \
				ft_realloc.c
PUT_FUNCS	=	ft_putchar_fd.c \
				ft_putstr_fd.c \
				ft_putendl_fd.c \
				ft_putnbr_fd.c
LST_FUNCS	=	ft_lstnew.c \
				ft_lstadd_front.c \
				ft_lstsize.c \
				ft_lstlast.c \
				ft_lstadd_back.c \
				ft_lstdelone.c \
				ft_lstclear.c \
				ft_lstiter.c \
				ft_lstmap.c
PRINTF_FUNCS =	ft_print_char.c \
				ft_print_str.c \
				ft_print_nbr.c \
				ft_print_hex.c \
				ft_print_ptr.c \
				ft_printf.c
GNL_FUNCS	=	get_next_line.c \
				get_next_line_utils.c
UTILS_FUNCS	=	ft_free_sp.c

SRCS		=	$(addprefix $(DIR_IS), $(IS_FUNCS)) \
				$(addprefix $(DIR_CONV), $(CONV_FUNCS)) \
				$(addprefix $(DIR_STR), $(STR_FUNCS)) \
				$(addprefix $(DIR_MEM), $(MEM_FUNCS)) \
				$(addprefix $(DIR_PUT), $(PUT_FUNCS)) \
				$(addprefix $(DIR_LST), $(LST_FUNCS)) \
				$(addprefix $(DIR_PRINTF), $(PRINTF_FUNCS)) \
				$(addprefix $(DIR_GNL), $(GNL_FUNCS)) \
				$(addprefix $(DIR_UTILS), $(UTILS_FUNCS))

DIR_OBJ		=	obj/
OBJ			=	$(SRCS:%.c=$(DIR_OBJ)%.o)
DEPS		=	$(OBJ:.o=.d)

all:		$(NAME)

$(NAME):	$(OBJ)
	@echo "\033[0;36m[ ℹ ] Creating $(NAME)...\033[0m"
	@ar rcs $@ $^
	@echo "\033[0;32m[ ✓ ]$(NAME) created successfully.\033[0m"

$(DIR_OBJ)%.o:		%.c
	@mkdir -p $(dir $@)
	@echo "\033[0;33m[ ℹ ] Compiling $< ...\033[0m"
	@$(COMPILE) -o $@ -c $< -fPIE

-include $(DEPS)

clean:
	@$(RM) $(DIR_OBJ)
	@$(RM) $(OBJ)

fclean:		clean
	@$(RM) $(NAME)
	@echo "\033[0;31m[🧹 ] Removing $(NAME)...\033[0m"

re:			fclean all

.PHONY:	all clean fclean re
