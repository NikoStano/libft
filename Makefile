# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nistanoj <nistanoj@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/02/26 16:35:06 by nistanoj          #+#    #+#              #
#    Updated: 2025/03/27 02:38:21 by nistanoj         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCS			=	ft_atoi.c ft_bzero.c ft_calloc.c ft_isalnum.c ft_isalpha.c ft_isascii.c \
					ft_isdigit.c ft_isprint.c ft_strchr.c ft_strdup.c ft_strlcat.c ft_strlcpy.c \
					ft_strlen.c ft_strncmp.c ft_strnstr.c ft_strrchr.c ft_tolower.c ft_toupper.c \
					ft_memset.c ft_putchar_fd.c ft_putstr_fd.c ft_putendl_fd.c ft_putnbr_fd.c \
					ft_memcpy.c ft_memmove.c ft_memchr.c ft_memcmp.c ft_strjoin.c ft_split.c \
					ft_itoa.c ft_substr.c ft_strtrim.c ft_strmapi.c ft_striteri.c \

BONUS			=	ft_lstnew_bonus.c ft_lstadd_front_bonus.c ft_lstsize_bonus.c ft_lstlast_bonus.c \
					ft_lstadd_back_bonus.c ft_lstdelone_bonus.c ft_lstclear_bonus.c ft_lstiter_bonus.c \
					ft_lstmap_bonus.c

NAME			=	libft.a

BONUS_OBJS		=	$(BONUS:.c=.o)

OBJ				=	$(SRCS:.c=.o)

CC				=	gcc

CFLAGS			=	-Wall -Wextra -Werror -g3

HEADER			=	libft.h

all				:	$(NAME)

$(NAME)			:	$(OBJ)
	@ar rc $@ $^
	@ranlib $@

%.o				:	%.c $(HEADER)
	@$(CC) $(CFLAGS) -o $@ -c $<

clean			:
	@rm -f $(OBJ)
	@rm -f $(BONUS_OBJS)

fclean			:	clean
	@rm -f $(NAME)

re				:	fclean all

bonus			:	$(NAME) $(BONUS_OBJS)
	@ar rcs $(NAME) $(OBJ) $(BONUS_OBJS)

.PHONY			:	all clean fclean re
