# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: oadhesiv <oadhesiv@student.21-school.ru>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/04/04 17:41:01 by oadhesiv          #+#    #+#              #
#    Updated: 2019/07/12 17:47:16 by oadhesiv         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

LFT_FUNCTIONS = ft_putstr.c ft_putnbr.c ft_atoi.c ft_strcpy.c ft_strncpy.c \
	ft_strstr.c ft_strcmp.c ft_strncmp.c ft_strupcase.c ft_strlowcase.c \
	ft_strcapitalize.c ft_str_is_alpha.c ft_str_is_numeric.c \
	ft_str_is_lowercase.c ft_str_is_uppercase.c ft_str_is_printable.c \
	ft_str_is_printable.c ft_strcat.c ft_strncat.c ft_strlcat.c \
	ft_putchar.c

SAD_FUNCTIONS = $(wildcard *.c)

OBJECTS = $(patsubst %.c,objs/%.o,$(SAD_FUNCTIONS))

OBJ_DIR = ./objs

CFLAGS = -Wall -Wextra -Werror -O1 -funroll-loops
SOFLAGS = -fPIC -shared

NAME = libft.a
DYNN = libft.so

CC = gcc

all: $(NAME)

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

$(NAME): $(OBJECTS)
	ar rc $(NAME) $(OBJECTS)

so: $(OBJECTS)
	$(CC) $(SOFLAGS) -o $(DYNN) $(OBJECTS)

objs/%.o: %.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) -include libft.h -c -o $@ $<

clean:
	rm -f $(OBJECTS)
	rm -rfv objs

fclean: clean
	rm -f $(NAME) $(DYNN)

re: fclean all

.PHONY: all clean fclean re so
