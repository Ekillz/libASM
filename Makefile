# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: emammadz <emammadz@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2014/11/09 15:44:49 by emammadz          #+#    #+#              #
#    Updated: 2015/10/28 19:20:21 by emammadz         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libfts.a

NASM = /nfs/zfs-student-3/users/2014/emammadz/homebrew/Cellar/nasm/2.11.08/bin/nasm

SRCC =	ft_bzero.s		ft_isalpha.s	ft_isprint.s	ft_puts.s		\
		ft_strlen.s		ft_cat.s		ft_isascii.s	ft_memcpy.s		\
		ft_strcat.s		ft_tolower.s	ft_isalnum.s	ft_isdigit.s	\
		ft_memset.s		ft_strdup.s		ft_toupper.s \

SRCO = $(SRCC:%.s=%.o)

FLAG = -f macho64 --prefix _

all: $(NAME)

$(NAME) : $(SRCO)
	echo "Compiling $(NAME)..."
	ar rc $(NAME) $(SRCO)
	ranlib $(NAME)
	echo "DONE"

%.o: %.s
	@$(NASM) $(FLAG) $<

clean:
	@rm -f $(SRCO)

fclean: clean
	@rm -f $(NAME)

re: fclean all

