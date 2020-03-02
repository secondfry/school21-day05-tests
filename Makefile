SHELL = /bin/zsh

DEFAULT = "\033[0;0m"
GREEN = "\033[0;32m"
BLUE = "\033[0;34m"
CYAN = "\033[0;36m"

all: cleanup getTests prepareFiles makeTests runTests

getTests:
	@echo ${CYAN} "Getting libft-unit-test" ${DEFAULT} ${BLUE}
	git clone https://github.com/alelievr/libft-unit-test.git
	@echo -n ${DEFAULT}

prepareFiles:
	@echo ${CYAN} "We are hoping that we are inside of day05 folder" ${DEFAULT}
	@echo ${CYAN} "Creating libft" ${DEFAULT} ${BLUE}
	mkdir libft
	ln -s ../ft_putchar.c libft/
	ln -s ../../ex00/ft_putstr.c libft/
	ln -s ../../ex01/ft_putnbr.c libft/
	ln -s ../../ex02/ft_atoi.c libft/
	ln -s ../../ex03/ft_strcpy.c libft/
	ln -s ../../ex04/ft_strncpy.c libft/
	ln -s ../../ex05/ft_strstr.c libft/
	ln -s ../../ex06/ft_strcmp.c libft/
	ln -s ../../ex07/ft_strncmp.c libft/
	ln -s ../../ex08/ft_strupcase.c libft/
	ln -s ../../ex09/ft_strlowcase.c libft/
	ln -s ../../ex10/ft_strcapitalize.c libft/
	ln -s ../../ex11/ft_str_is_alpha.c libft/
	ln -s ../../ex12/ft_str_is_numeric.c libft/
	ln -s ../../ex13/ft_str_is_lowercase.c libft/
	ln -s ../../ex14/ft_str_is_uppercase.c libft/
	ln -s ../../ex15/ft_str_is_printable.c libft/
	ln -s ../../ex16/ft_strcat.c libft/
	ln -s ../../ex17/ft_strncat.c libft/
	ln -s ../../ex18/ft_strlcat.c libft/
	ln -s ../../ex19/ft_strlcpy.c libft/
	cp -a Makefile.libft libft/Makefile
	cp -a libft.h libft/
	@echo -n ${DEFAULT}

makeTests:
	@echo ${CYAN} "Making libft-unit-test" ${DEFAULT} ${BLUE}
	${MAKE} -C libft-unit-test
	@echo -n ${DEFAULT}

runTests:
	@echo ${CYAN} "Running libft-unit-test" ${DEFAULT} ${BLUE}
	cd libft-unit-test; ./run_test ft_putstr ft_putnbr ft_atoi \
		ft_strcpy ft_strncpy ft_strstr ft_strcmp ft_strncmp \
		ft_strupcase ft_strlowcase ft_str_is_alpha \
		ft_str_is_numeric ft_str_is_lowercase \
		ft_str_is_printable ft_strcat ft_strncat ft_strlcat \
		ft_strlcpy
	@echo -n ${DEFAULT}

cleanup:
	rm -rf libft-unit-test
	rm -rf libft

.PHONY: cleanup getTests prepareFiles makeTests runTests
