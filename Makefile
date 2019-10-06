# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: thberrid <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/07/29 19:26:47 by thberrid          #+#    #+#              #
#    Updated: 2019/10/01 12:03:37 by thberrid         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SHELL = /bin/sh
NAME = lem-in
DIR_C = src
DIR_O = obj
NAME_C = ft_init.c \
		  ft_init_utils.c \
		  init_graph.c \
		  lst_util.c \
		  parse.c \
		  parse_utils.c \
		  short_path.c \
		  path_back.c \
		  count_ant.c \
		  tools.c     \
		  bfs_addq.c \
		  utils.c	\
		  free_utils.c \
		  graph_cpy.c \
		  print_input.c \
		  print_ants.c \
		  short_path_utils.c
		  
NAME_O = $(NAME_C:.c=.o)
FILES_O = $(addprefix $(DIR_O)/, $(NAME_O))
FILES_H = lem_in.h
LIBFT = ./libft/libft.a
FLAGS = -Wall -Wextra -Werror

all : $(NAME)

$(NAME) : $(FILES_O) $(FILES_H) $(LIBFT)
	gcc -I. -L ./libft/ -lft -o $(NAME) $(FILES_O)
 
$(DIR_O)/%.o : %.c $(FILES_H)
	@ mkdir -p $(DIR_O)
	gcc -I. $(FLAGS) -c -o $@ $<

$(LIBFT) :
	make -C ./libft/

.PHONY : clean
clean :
	rm -f $(FILES_O)
	make -C ./libft fclean

.PHONY : fclean
fclean : clean
	rm -f $(NAME)

.PHONY : re
re : fclean all
