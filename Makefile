NAME = libft.a
CC = cc
CFLAGS = -Wall -Wextra -Werror
SRCS = ft_strlen.c ft_memset.c \
		ft_isalpha.c ft_isdigit.c \
		ft_isalnum.c ft_isprint.c \
		ft_isascii.c ft_bzero.c \
		ft_memcpy.c ft_toupper.c \
		ft_tolower.c ft_memmove.c \
		ft_memchr.c ft_memcmp.c \
		ft_strchr.c ft_strrchr.c
OBJS = $(patsubst %.c,%.o,$(SRCS))
TEST_SRCS = tests/main.c \
			tests/test_ft_strlen.c \
			tests/test_ft_memset.c \
			tests/test_ft_is.c \
			tests/test_ft_bzero.c \
			tests/test_ft_memcpy.c \
			tests/test_ft_memmove.c \
			tests/test_ft_memchr.c \
			tests/test_ft_memcmp.c \
			tests/test_ft_strchr.c \
			tests/test_ft_strrchr.c
TEST_OBJS = $(patsubst %.c,%.o,$(TEST_SRCS))

all: $(NAME)

$(NAME): $(OBJS)
	ar rcs $@ $^

%.o: %.c libft.h
	$(CC) $(CFLAGS) -c $< -o $@

tests/%.o: tests/%.c libft.h tests.h
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	/bin/rm -f *.o
	/bin/rm -f tests/*.o tests/test_runner

fclean: clean
	/bin/rm -f $(NAME)

re: fclean all

test: $(TEST_OBJS) $(NAME)
	$(CC) $(CFLAGS) $^ -o tests/test_runner

check: test
	./tests/test_runner

.PHONY: all clean fclean re test check