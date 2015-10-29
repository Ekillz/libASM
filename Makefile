# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: emammadz <emammadz@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2014/11/09 15:44:49 by emammadz          #+#    #+#              #
#    Updated: 2015/10/29 16:50:23 by emammadz         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libfts.a

NASM = ~/homebrew/Cellar/nasm/2.11.08/bin/nasm

SRCC =	ft_bzero.s		ft_isalpha.s	ft_isprint.s	ft_puts.s		\
		ft_strlen.s		ft_cat.s		ft_isascii.s	ft_memcpy.s		\
		ft_strcat.s		ft_tolower.s	ft_isalnum.s	ft_isdigit.s	\
		ft_memset.s		ft_strdup.s		ft_toupper.s \
		ft_islower.s	ft_isupper.s	ft_isblank.s	ft_putstr.s \
		ft_putstr_fd.s

SRCO = $(SRCC:%.s=%.o)

FLAG = -f macho64 --prefix _

all: $(NAME) test

$(NAME) : $(SRCO)
	echo "Compiling $(NAME)..."
	ar rc $(NAME) $(SRCO)
	ranlib $(NAME)
	echo "DONE"

%.o: %.s
	@$(NASM) $(FLAG) $<

test:
	@gcc -o test test_main.c libfts.a

clean:
	@rm -f $(SRCO)

fclean: clean
	@rm -f $(NAME)
	@rm test

re: fclean all

