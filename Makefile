CC = gcc

NAME = flow_parser

SRCS = $(filter-out %~,$(shell ls src))
OBJS = $(addprefix obj/,$(SRCS:.c=.o))

CFLAGS = -W -Wall -Werror -Wextra

all: $(NAME)

$(NAME): $(OBJS)
	 $(CC) $(OBJS) -o $(NAME) $(LDFLAGS) $(CFLAGS)

obj/%.o: src/%.c
	 @mkdir -p obj
	 $(CC) -o $@ -c $< -I include/

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
