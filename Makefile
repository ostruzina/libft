# ============================================================
# CORE -- required for submission. Nothing here depends on
# anything in the TESTS section below.
# ============================================================
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
		ft_strchr.c ft_strrchr.c \
		ft_strlcpy.c ft_strlcat.c \
		ft_strncmp.c ft_strnstr.c \
		ft_atoi.c ft_calloc.c \
		ft_strdup.c ft_substr.c \
		ft_strjoin.c ft_putchar_fd.c \
		ft_putnbr_fd.c ft_putendl_fd.c \
		ft_putstr_fd.c ft_strmapi.c \
		ft_striteri.c
OBJS = $(patsubst %.c,%.o,$(SRCS))

all: $(NAME)

$(NAME): $(OBJS)
	ar rcs $@ $^

%.o: %.c libft.h
	$(CC) $(CFLAGS) -c $< -o $@

clean::
	/bin/rm -f *.o

fclean: clean
	/bin/rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re

# ============================================================
# TESTS -- local development only, not needed for submission.
# Safe to delete everything from here to the end of the file:
# nothing in the CORE section above depends on anything below.
# (Uses ASan to improve robustness of tests.)
# ============================================================
ASAN_FLAGS = -fsanitize=address -g
ASAN_OBJS = $(patsubst %.c,%.asan.o,$(SRCS))
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
			tests/test_ft_strrchr.c \
			tests/reference_strlcpy.c \
			tests/test_ft_strlcpy.c \
			tests/reference_strlcat.c \
			tests/test_ft_strlcat.c \
			tests/test_ft_strncmp.c \
			tests/reference_strnstr.c \
			tests/test_ft_strnstr.c \
			tests/test_ft_atoi.c \
			tests/test_ft_calloc.c \
			tests/test_ft_strdup.c \
			tests/test_ft_substr.c \
			tests/test_ft_strjoin.c \
			tests/test_ft_put_fd.c \
			tests/test_ft_strm_iter.c
TEST_OBJS = $(patsubst %.c,%.o,$(TEST_SRCS))

%.asan.o: %.c libft.h
	$(CC) $(CFLAGS) $(ASAN_FLAGS) -c $< -o $@

tests/%.o: tests/%.c libft.h tests/tests.h
	$(CC) $(CFLAGS) $(ASAN_FLAGS) -I. -c $< -o $@

test: $(TEST_OBJS) $(ASAN_OBJS)
	$(CC) $(CFLAGS) $(ASAN_FLAGS) $(TEST_OBJS) $(ASAN_OBJS) -o tests/test_runner

check: test
	./tests/test_runner

clean::
	/bin/rm -f *.asan.o
	/bin/rm -f tests/*.o tests/test_runner

.PHONY: test check
