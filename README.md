# 📚 Libft [![nistanoj's 42 Libft Score](https://badge.nimon.fr/api/v2/cmgjygisn1482501pa9h6l9sg4/project/4270267)](https://github.com/Nimon77/badge42)

Libft est une bibliothèque en **C** regroupant un ensemble de fonctions utiles ré-implémentées à partir des standards de la libc, ainsi que des ajouts pratiques (gestion de chaînes, mémoire, listes chaînées, printf, get_next_line, etc.).  
Ce projet constitue une base réutilisable pour tous les autres projets de l’école 42.  

---

## 🚀 Contenu

### 🔹 Fonctions de la libc ré-implémentées
- `ft_isalpha`, `ft_isdigit`, `ft_isalnum`, `ft_isascii`, `ft_isprint`
- `ft_strlen`, `ft_memset`, `ft_bzero`, `ft_memcpy`, `ft_memmove`, `ft_strlcpy`, `ft_strlcat`
- `ft_toupper`, `ft_tolower`
- `ft_strchr`, `ft_strrchr`, `ft_strncmp`, `ft_memchr`, `ft_memcmp`, `ft_strnstr`, `ft_strdup`
- `ft_atoi`, `ft_calloc`

### 🔹 Fonctions supplémentaires
- Gestion de chaînes : `ft_substr`, `ft_strjoin`, `ft_strtrim`, `ft_split`, `ft_itoa`, `ft_strmapi`, `ft_striteri`
- Fonctions d’affichage : `ft_putchar_fd`, `ft_putstr_fd`, `ft_putendl_fd`, `ft_putnbr_fd`
- Extensions : `ft_atol`, `ft_atoi_base`, `ft_strtol`, `ft_isspace`, `ft_free_sp`

### 🔹 Listes chaînées (bonus)
- `ft_lstnew`, `ft_lstadd_front`, `ft_lstadd_back`, `ft_lstsize`, `ft_lstlast`
- `ft_lstdelone`, `ft_lstclear`, `ft_lstiter`, `ft_lstmap`

### 🔹 Fonctions additionnelles
- **printf** : `ft_printf` et ses fonctions associées (`ft_print_char`, `ft_print_str`, `ft_print_nbr`, `ft_print_hex`, `ft_print_ptr`)
- **get_next_line** : lecture ligne par ligne avec `get_next_line` et `get_next_line_utils`

---

## ⚙️ Installation & Compilation

Clonez le dépôt puis compilez la bibliothèque avec `make` :

```bash
git clone https://github.com/NikoStano/libft.git
cd libft
make
```
