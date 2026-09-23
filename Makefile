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
		ft_striteri.c ft_strtrim.c \
		ft_split.c ft_itoa.c \
		ft_lstnew.c
OBJ_DIR	= obj
OBJS = $(patsubst %.c, $(OBJ_DIR)/%.o, $(SRCS))

all: $(NAME)

$(NAME): $(OBJS)
	ar rcs $@ $^

$(OBJ_DIR)/%.o: %.c libft.h | $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

clean::
	rm -rf $(OBJ_DIR)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re

# ============================================================
# TESTS -- local development only, not needed for submission.
# Safe to delete everything from here to the end of the file:
# nothing in the CORE section above depends on anything below.
# (Uses ASan to improve robustness of tests.)
# ============================================================
ASAN_FLAGS = -fsanitize=address -g
ASAN_OBJS = $(patsubst %.c,$(OBJ_DIR)/%.asan.o,$(SRCS))
TEST_DIR = tests
TEST_OBJ_DIR = $(TEST_DIR)/obj
TEST_SRCS = $(TEST_DIR)/main.c \
			$(TEST_DIR)/test_ft_strlen.c \
			$(TEST_DIR)/test_ft_memset.c \
			$(TEST_DIR)/test_ft_is.c \
			$(TEST_DIR)/test_ft_bzero.c \
			$(TEST_DIR)/test_ft_memcpy.c \
			$(TEST_DIR)/test_ft_memmove.c \
			$(TEST_DIR)/test_ft_memchr.c \
			$(TEST_DIR)/test_ft_memcmp.c \
			$(TEST_DIR)/test_ft_strchr.c \
			$(TEST_DIR)/test_ft_strrchr.c \
			$(TEST_DIR)/reference_strlcpy.c \
			$(TEST_DIR)/test_ft_strlcpy.c \
			$(TEST_DIR)/reference_strlcat.c \
			$(TEST_DIR)/test_ft_strlcat.c \
			$(TEST_DIR)/test_ft_strncmp.c \
			$(TEST_DIR)/reference_strnstr.c \
			$(TEST_DIR)/test_ft_strnstr.c \
			$(TEST_DIR)/test_ft_atoi.c \
			$(TEST_DIR)/test_ft_calloc.c \
			$(TEST_DIR)/test_ft_strdup.c \
			$(TEST_DIR)/test_ft_substr.c \
			$(TEST_DIR)/test_ft_strjoin.c \
			$(TEST_DIR)/test_ft_put_fd.c \
			$(TEST_DIR)/test_ft_strm_iter.c \
			$(TEST_DIR)/test_ft_strtrim.c \
			$(TEST_DIR)/test_ft_split.c \
			$(TEST_DIR)/test_ft_itoa.c \
			$(TEST_DIR)/test_ft_lstnew.c
TEST_OBJS = $(patsubst $(TEST_DIR)/%.c,$(TEST_OBJ_DIR)/%.o,$(TEST_SRCS))

$(OBJ_DIR)/%.asan.o: %.c libft.h | $(OBJ_DIR)
	$(CC) $(CFLAGS) $(ASAN_FLAGS) -c $< -o $@

$(TEST_OBJ_DIR)/%.o: $(TEST_DIR)/%.c libft.h $(TEST_DIR)/tests.h | $(TEST_OBJ_DIR)
	$(CC) $(CFLAGS) $(ASAN_FLAGS) -I. -c $< -o $@

$(TEST_OBJ_DIR):
	mkdir -p $(TEST_OBJ_DIR)

test: $(TEST_OBJS) $(ASAN_OBJS)
	$(CC) $(CFLAGS) $(ASAN_FLAGS) $(TEST_OBJS) $(ASAN_OBJS) -o tests/test_runner

check: test
	./tests/test_runner

clean::
	rm -rf $(TEST_OBJ_DIR)
	rm -f $(TEST_DIR)/test_runner

.PHONY: test check
