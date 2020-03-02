PATH_TO_YOUR_DAY05 = ./../

SHELL = /bin/zsh

DEFAULT = "\033[0;0m"
RED = "\033[0;31m"
GREEN = "\033[0;32m"
BLUE = "\033[0;34m"
CYAN = "\033[0;36m"

all: clean getTests prepareFiles makeTests runTests
weak: clean getTests prepareFiles prepareWeakFiles makeTests runTests

getTests:
	@echo ${CYAN} "Getting libft-unit-test" ${DEFAULT} ${BLUE}
	[ -e libft-unit-test ] || git clone https://github.com/secondfry/libft-unit-test.git -b old
	@echo -n ${DEFAULT}

prepareFiles:
	@echo ${CYAN} "We are hoping that we are inside of day05 folder" ${DEFAULT}
	@echo ${CYAN} "Creating libft" ${DEFAULT} ${BLUE}
	mkdir libft
	ln -s ../ft_putchar.c libft/
	@[ -e ./${PATH_TO_YOUR_DAY05}/ex00/ft_putstr.c ] && ln -s ../${PATH_TO_YOUR_DAY05}/ex00/ft_putstr.c libft/ || echo ${RED} "ex00/ft_putstr.c is not present" ${DEFAULT} ${BLUE}
	@[ -e ./${PATH_TO_YOUR_DAY05}/ex01/ft_putnbr.c ] && ln -s ../${PATH_TO_YOUR_DAY05}/ex01/ft_putnbr.c libft/ || echo ${RED} "ex01/ft_putnbr.c is not present" ${DEFAULT} ${BLUE}
	@[ -e ./${PATH_TO_YOUR_DAY05}/ex02/ft_atoi.c ] && ln -s ../${PATH_TO_YOUR_DAY05}/ex02/ft_atoi.c libft/ || echo ${RED} "ex02/ft_atoi.c is not present" ${DEFAULT} ${BLUE}
	@[ -e ./${PATH_TO_YOUR_DAY05}/ex03/ft_strcpy.c ] && ln -s ../${PATH_TO_YOUR_DAY05}/ex03/ft_strcpy.c libft/ || echo ${RED} "ex03/ft_strcpy.c is not present" ${DEFAULT} ${BLUE}
	@[ -e ./${PATH_TO_YOUR_DAY05}/ex04/ft_strncpy.c ] && ln -s ../${PATH_TO_YOUR_DAY05}/ex04/ft_strncpy.c libft/ || echo ${RED} "ex04/ft_strncpy.c is not present" ${DEFAULT} ${BLUE}
	@[ -e ./${PATH_TO_YOUR_DAY05}/ex05/ft_strstr.c ] && ln -s ../${PATH_TO_YOUR_DAY05}/ex05/ft_strstr.c libft/ || echo ${RED} "ex05/ft_strstr.c is not present" ${DEFAULT} ${BLUE}
	@[ -e ./${PATH_TO_YOUR_DAY05}/ex06/ft_strcmp.c ] && ln -s ../${PATH_TO_YOUR_DAY05}/ex06/ft_strcmp.c libft/ || echo ${RED} "ex06/ft_strcmp.c is not present" ${DEFAULT} ${BLUE}
	@[ -e ./${PATH_TO_YOUR_DAY05}/ex07/ft_strncmp.c ] && ln -s ../${PATH_TO_YOUR_DAY05}/ex07/ft_strncmp.c libft/ || echo ${RED} "ex07/ft_strncmp.c is not present" ${DEFAULT} ${BLUE}
	@[ -e ./${PATH_TO_YOUR_DAY05}/ex08/ft_strupcase.c ] && ln -s ../${PATH_TO_YOUR_DAY05}/ex08/ft_strupcase.c libft/ || echo ${RED} "ex08/ft_strupcase.c is not present" ${DEFAULT} ${BLUE}
	@[ -e ./${PATH_TO_YOUR_DAY05}/ex09/ft_strlowcase.c ] && ln -s ../${PATH_TO_YOUR_DAY05}/ex09/ft_strlowcase.c libft/ || echo ${RED} "ex09/ft_strlowcase.c is not present" ${DEFAULT} ${BLUE}
	@[ -e ./${PATH_TO_YOUR_DAY05}/ex10/ft_strcapitalize.c ] && ln -s ../${PATH_TO_YOUR_DAY05}/ex10/ft_strcapitalize.c libft/ || echo ${RED} "ex10/ft_strcapitalize.c is not present" ${DEFAULT} ${BLUE}
	@[ -e ./${PATH_TO_YOUR_DAY05}/ex11/ft_str_is_alpha.c ] && ln -s ../${PATH_TO_YOUR_DAY05}/ex11/ft_str_is_alpha.c libft/ || echo ${RED} "ex11/ft_str_is_alpha.c is not present" ${DEFAULT} ${BLUE}
	@[ -e ./${PATH_TO_YOUR_DAY05}/ex12/ft_str_is_numeric.c ] && ln -s ../${PATH_TO_YOUR_DAY05}/ex12/ft_str_is_numeric.c libft/ || echo ${RED} "ex12/ft_str_is_numeric.c is not present" ${DEFAULT} ${BLUE}
	@[ -e ./${PATH_TO_YOUR_DAY05}/ex13/ft_str_is_lowercase.c ] && ln -s ../${PATH_TO_YOUR_DAY05}/ex13/ft_str_is_lowercase.c libft/ || echo ${RED} "ex13/ft_str_is_lowercase.c is not present" ${DEFAULT} ${BLUE}
	@[ -e ./${PATH_TO_YOUR_DAY05}/ex14/ft_str_is_uppercase.c ] && ln -s ../${PATH_TO_YOUR_DAY05}/ex14/ft_str_is_uppercase.c libft/ || echo ${RED} "ex14/ft_str_is_uppercase.c is not present" ${DEFAULT} ${BLUE}
	@[ -e ./${PATH_TO_YOUR_DAY05}/ex15/ft_str_is_printable.c ] && ln -s ../${PATH_TO_YOUR_DAY05}/ex15/ft_str_is_printable.c libft/ || echo ${RED} "ex15/ft_str_is_printable.c is not present" ${DEFAULT} ${BLUE}
	@[ -e ./${PATH_TO_YOUR_DAY05}/ex16/ft_strcat.c ] && ln -s ../${PATH_TO_YOUR_DAY05}/ex16/ft_strcat.c libft/ || echo ${RED} "ex16/ft_strcat.c is not present" ${DEFAULT} ${BLUE}
	@[ -e ./${PATH_TO_YOUR_DAY05}/ex17/ft_strncat.c ] && ln -s ../${PATH_TO_YOUR_DAY05}/ex17/ft_strncat.c libft/ || echo ${RED} "ex17/ft_strncat.c is not present" ${DEFAULT} ${BLUE}
	@[ -e ./${PATH_TO_YOUR_DAY05}/ex18/ft_strlcat.c ] && ln -s ../${PATH_TO_YOUR_DAY05}/ex18/ft_strlcat.c libft/ || echo ${RED} "ex18/ft_strlcat.c is not present" ${DEFAULT} ${BLUE}
	@[ -e ./${PATH_TO_YOUR_DAY05}/ex19/ft_strlcpy.c ] && ln -s ../${PATH_TO_YOUR_DAY05}/ex19/ft_strlcpy.c libft/ || echo ${RED} "ex19/ft_strlcpy.c is not present" ${DEFAULT} ${BLUE}
	cp -a Makefile.libft libft/Makefile
	cp -a libft.h libft/
	@echo -n ${DEFAULT}

prepareWeakFiles:
	@echo ${CYAN} "Making libft weak – ignoring errors" ${DEFAULT} ${BLUE}
	cp -a Makefile.weak.libft libft/Makefile
	@echo -n ${DEFAULT}

makeTests:
	@echo ${CYAN} "Making libft-unit-test [libclean]" ${DEFAULT} ${BLUE}
	${MAKE} -C libft-unit-test libclean
	@echo -n ${DEFAULT}
	@echo ${CYAN} "Making libft-unit-test [all]" ${DEFAULT} ${BLUE}
	${MAKE} -C libft-unit-test all
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

clean:
	rm -rf libft

fclean: clean
	rm -rf libft-unit-test

re: fclean all

.PHONY: clean getTests prepareFiles prepareWeakFiles makeTests runTests fclean re
