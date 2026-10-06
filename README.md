*This project has been created as part of the 42 curriculum by verosvec.*

# Libft

## Description

**Libft** is a custom C standard library implementation, built as the foundational project at 42.

It re-implements standard C library functions, along with additional utility functions for string manipulation, memory management, and linked list operations.

All code strictly adheres to **42 Norm v4.1** standards.

---

## Project Structure
```text
.
├── libft.h          # Header file containing prototypes and t_list struct
├── ft_memset.c      # Core library source files
├── ft_split.c
├── ft_lstnew.c
├── ...
├── obj/             # Object files generated during compilation (gitignored)
├── Makefile         # Build automation
└── README.md
```
---

## Function Summary

### Part 1 - Libc Functions
Libc functions re-implemented with the same behaviour as described by the `man` pages related to the original functions (without the `ft_` prefix).
Any differences or specificities in behaviour are described in the Notes below.

* **Memory:** `ft_memset`, `ft_bzero`, `ft_memcpy`, `ft_memmove`, `ft_memchr`, `ft_memcmp`, `ft_calloc`
* **String Analysis:** `ft_strlen`, `ft_strchr`, `ft_strrchr`, `ft_strncmp`, `ft_strnstr`
* **String Manipulation:** `ft_strlcpy`, `ft_strlcat`, `ft_strdup`
* **Character Checks & Conversion:** `ft_isalpha`, `ft_isdigit`, `ft_isalnum`, `ft_isascii`, `ft_isprint`, `ft_toupper`, `ft_tolower`, `ft_atoi`

Notes:
- Some of the original functions use the `restrict` qualifier in their prototype. The `libft` implementations do not use it, as the subject forbids it as a C99 keyword.
- The character classification functions (`isalpha`, `isdigit`, `isalnum`, `isascii`, `isprint`) differ from the original functions in that they return **1** if the character matches the tested class and **0** if the character does not match.
- `ft_calloc` follows this rule: If `nmemb` or `size` is `0`, then `ft_calloc()` returns a unique pointer value that can be successfully passed to `free()`.
- `ft_strlcpy`, `ft_strlcat` and `ft_bzero` are re-implemented from BSD libc original functions.

### Part 2 - Additional Functions
Utility functions for enhanced string formatting and dynamic memory allocation. Please refer to `libft.h` for their signatures.

* **Substrings & Joining:**

`ft_substr` - allocates memory (using `malloc(3)`) and returns a substring from the string `s`. The substring starts at index `start` and has a maximum length of `len`.

`ft_strjoin` - allocates memory (using `malloc(3)`) and returns a new string, which is the result of concatenating `s1` and `s2`.

`ft_strtrim` - allocates memory (using `malloc(3)`) and returns a copy of `s1` with characters from `set` removed from the beginning and the end.

* **Parsing & Conversion:**

`ft_split` - allocates memory (using `malloc(3)`) and returns an array of strings obtained by splitting `s` using the character `c` as a delimiter. Each string in the returned array is allocated independently. The array of pointers itself is also allocated dynamically. The returned array is `NULL`-terminated.

`ft_itoa` - allocates memory (using `malloc(3)`) and returns a string representing the integer received as an argument. Negative numbers are handled.

* **Functional String Mapping:**

`ft_strmapi` - applies the function `f` to each character of the string `s`, passing its index as the first argument and the character itself as the second. A new string is created (using `malloc(3)`) to store the results from the successive applications of `f`.

`ft_striteri` - applies the function `f` to each character of the string passed as argument, passing its index as the first argument. Each character is passed by address to `f` so it can be modified if necessary.

* **File Descriptor Output:**

`ft_putchar_fd` - outputs the character `c` to the specified file descriptor.

`ft_putstr_fd` - outputs the string `s` to the specified file descriptor.

`ft_putendl_fd` - outputs the string `s` to the specified file descriptor followed by a newline.

`ft_putnbr_fd` - outputs the integer `n` to the specified file descriptor.

### Part 3 - Linked Lists
Functions for creating, manipulating, and managing generic singly linked list structures (`t_list`):

```c
typedef struct s_list
{
    void            *content;
    struct s_list   *next;
}   t_list;
```

* **Creation & Traversal:**

`ft_lstnew` - allocates memory (using `malloc(3)`) and returns a new node. The `content` member variable is initialized with the given parameter `content`. The variable `next` is initialized to `NULL`.

`ft_lstsize` - counts the number of nodes in the list.

`ft_lstlast` - returns the last node of the list.

* **Insertion:**

`ft_lstadd_front` - adds the node `new` at the beginning of the list.

`ft_lstadd_back` - adds the node `new` at the end of the list.

* **Deletion & Cleanup:**

`ft_lstdelone` - takes a node as parameter and frees its content using the function `del`. Frees the node itself but does NOT free the next node.

`ft_lstclear` - deletes and frees the given node and all its successors, using the function `del` and `free(3)`. Finally, sets the pointer to the list to `NULL`.

* **Iteration & Mapping:**

`ft_lstiter` - iterates through the list `lst` and applies the function `f` to the content of each node.

`ft_lstmap` - iterates through the list `lst`, applies the function `f` to each node’s content, and creates a new list resulting of the successive applications of the function `f`. The `del` function is used to delete the content of a node if needed.

---

## Instructions

The project includes a `Makefile` that compiles all source files into a static library `libft.a`.

### Makefile Rules

| Rule | Description |
| :--- | :--- |
| `make` / `make all` / `make libft.a` | Compiles core source files and creates `libft.a` |
| `make clean` | Removes object files (`obj/` directory) |
| `make fclean` | Removes object files and `libft.a` |
| `make re` | Performs a full recompilation (`fclean` + `all`) |

### Using Libft in Your Project

Run `make` at the repository root, which produces `libft.a` there.

Include the header in your C code and link the static library during compilation:

```c
#include "libft.h"

int	main(void)
{
	ft_putendl_fd("Hello world!", 1);
	return (0);
}
```
```bash
cc -Wall -Wextra -Werror main.c -I. -L. -lft -o my_program
```

---

## Resources

* Related `man` pages
* https://cppreference.com/c
* https://github.com/unix-tools/tutorial-makefiles
* https://git-scm.com/
* https://linux.die.net/
* https://stackoverflow.com/
* https://www.gnu.org/software/gnu-c-manual/gnu-c-manual.html
* https://github.com/42School/norminette
* https://valgrind.org/
* GCC AddressSanitizer Documentation (`-fsanitize=address`)
* https://github.com/Tripouille/libftTester
* Friends' and peers' help and tips

The functions, the header file, the Makefile and this README have been written and developed by myself.

LLM tools Claude and Gemini have been consulted for the following purposes:

* Research: finding documentation and references on C language, GNU Make, Git, algorithms, and related topics
* Testing: test infrastructure and Makefile `test` rules (not part of the submitted project)
* Study and review sessions
* Code review of the finished functions

In study sessions I asked for hints, never direct solutions.

In review sessions I asked for analysis of finished code. I made any fixes myself.
