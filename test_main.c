#include "libfts.h"
#include <stdio.h>
#include <ctype.h>
#include <unistd.h>

#define DEBUG   0

static void     putstr(char *str)
{
	write(1, str, strlen(str));
}

static int      ok(void)
{
	putstr("\033[32;01mOK\033[0m\n");
	return (1);
}

static int      ko(int input, int test, int ctrl)
{
	printf("\033[31;01mKO\033[0m input:%d test:%d ctrl:%d\n", \
			input, test, ctrl);
	return (0);
}

static int      test_is(int (*test)(int), int(*ctrl)(int))
{
	for (int i = -1; i <= 255; i++)
		if ((!test(i) && ctrl(i)) || (test(i) && !ctrl(i)) || test(i) < 0)
			return ko(i, test(i), ctrl(i));
		else if (DEBUG && test(i) != ctrl(i))
			printf("\033[33;01mDiff\033[0m input:%d test:%d ctrl:%d\n", \
					i, test(i), ctrl(i));
	return ok();
}

static int      test_to(int (*test)(int), int(*ctrl)(int))
{
	for (int i = -1; i <= 255; i++)
		if (test(i) != ctrl(i))
			return ko(i, test(i), ctrl(i));
		else if (DEBUG && test(i) != ctrl(i))
			printf("\033[33;01mDiff\033[0m input:%d test:%d ctrl:%d\n", \
					i, test(i), ctrl(i));
	return ok();
}

static int      test_memset(void)
{
	char    s_test[5];
	char    s_ctrl[5];
	char    *ret_ctrl = NULL;
	char    *ret_test = NULL;

	bzero(s_test, 5);
	bzero(s_ctrl, 5);

	ret_ctrl = memset(s_ctrl, 'z', 4);
	ret_test = ft_memset(s_test, 'z', 4);
	if (memcmp(s_test, s_ctrl, 5))
	{
		printf("\033[31;01mKO\033[0m ptr c:z n:4 ctrl:%s test:%s cmp:%d\n", \
				s_ctrl, s_test, memcmp(s_test, s_ctrl, 5));
		return (0);
	}
	if (ret_ctrl != s_ctrl || memcmp(ret_test, ret_ctrl, 5))
	{
		printf("\033[31;01mKO\033[0m ret c:z n:4 ctrl:%s test:%s cmp:%d\n", \
				ret_ctrl, ret_test, memcmp(ret_test, ret_ctrl, 5));
		return (0);
	}

	ret_ctrl = NULL;
	ret_test = NULL;
	ret_ctrl = memset(s_ctrl, 'a', 0);
	ret_test = ft_memset(s_test, 'a', 0);
	if (memcmp(s_test, s_ctrl, 5))
	{
		printf("\033[31;01mKO\033[0m ptr c:a n:0 ctrl:%s test:%s cmp:%d\n", \
				s_ctrl, s_test, memcmp(s_test, s_ctrl, 5));
		return (0);
	}
	if (ret_ctrl != s_ctrl || memcmp(ret_test, ret_ctrl, 5))
	{
		printf("\033[31;01mKO\033[0m ret c:a n:0 ctrl:%s test:%s cmp:%d\n", \
				ret_ctrl, ret_test, memcmp(ret_test, ret_ctrl, 5));
		return (0);
	}

	/*
	 *     char    *s_null = NULL;
	 *         memset(s_null, 'z', 4);
	 *             ft_memset(s_null, 'z', 4);
	 *                 // std function segfault with null too :D
	 *                     */

	return ok();
}

static int      test_bzero(void)
{
	char    s_test[5];
	char    s_ctrl[5];

	bzero(s_test, 5);
	bzero(s_ctrl, 5);
	memset(s_test, 'z', 4);
	memset(s_ctrl, 'z', 4);

	bzero(s_ctrl, 4);
	ft_bzero(s_test, 4);
	if (memcmp(s_test, s_ctrl, 5))
	{
		printf("\033[31;01mKO\033[0m n:4 ctrl:%s test:%s cmp:%d\n", \
				s_ctrl, s_test, memcmp(s_test, s_ctrl, 5));
		return (0);
	}

	memset(s_test, 'a', 4);
	memset(s_ctrl, 'a', 4);
	bzero(s_ctrl, 0);
	ft_bzero(s_test, 0);
	if (memcmp(s_test, s_ctrl, 4))
	{
		printf("\033[31;01mKO\033[0m n:0 ctrl:%s test:%s cmp:%d\n", \
				s_ctrl, s_test, memcmp(s_test, s_ctrl, 5));
		return (0);
	}

	/*
	 *     char    *s_null = NULL;
	 *         bzero(s_null, 4);
	 *             ft_bzero(s_null, 4);
	 *                 // std function segfault with null too :D
	 *                     */

	return ok();
}

static int      test_memcpy(void)
{
	char    src[] = "test_memcpy";
	char    dest[12];
	char    *ret = NULL;

	ret = ft_memcpy(dest, src, 12);
	if (memcmp(src, dest, 12))
	{
		printf("\033[31;01mKO\033[0m ptr n:12 src:%s dest:%s cmp:%d\n", \
				src, dest, memcmp(src, dest, 12));
		return (0);
	}
	if (ret != dest || memcmp(dest, ret, 12))
	{
		printf("\033[31;01mKO\033[0m ret n:12 ctrl:%s test:%s cmp:%d\n", \
				src, ret, memcmp(ret, dest, 12));
		return (0);
	}

	ret = NULL;
	strcpy(dest, "memcpy_test");
	ret = ft_memcpy(dest, src, 0);
	if (memcmp("memcpy_test", dest, 12))
	{
		printf("\033[31;01mKO\033[0m ptr n:0 src:memcpy_test dest:%s cmp:%d\n", \
				dest, memcmp("memcpy_test", dest, 12));
		return (0);
	}
	if (ret != dest || memcmp(dest, ret, 12))
	{
		printf("\033[31;01mKO\033[0m ret n:0 ctrl:memcpy_test test:%s cmp:%d\n", \
				ret, memcmp(ret, dest, 12));
		return (0);
	}
	return ok();
}

static int      test_strlen()
{
	char    *t[] =
	{
		"",
		"toto",
		"schtroumpf",
		"schtroumpfschtroumpfschtroumpfschtroumpfschtroumpfschtroumpfschtroumpfschtroumpfschtroumpfschtroumpfschtroumpfschtroumpfschtroumpfschtroumpfschtroumpfschtroumpfschtroumpfschtroumpfschtroumpfschtroumpfschtroumpfschtroumpfschtroumpf"
	};
	for (int i = 0; i < 4; i++)
		if (ft_strlen(t[i]) != strlen(t[i]))
		{
			printf("\033[31;01mKO\033[0m test:%s ret:%d\n", \
					t[i], (int)(ft_strlen(t[i])));
			return (0);
		}
	return ok();
}

static int      test_strcat()
{
	char    src[] = "test_strcat";
	char    dest[42];
	char    ctrl[42];
	char    *ret = NULL;


	bzero(dest, 42);
	bzero(ctrl, 5);
	ret = ft_strcat(dest, src);
	if (strcmp(dest, strcat(ctrl, src)))
	{
		printf("\033[31;01mKO\033[0m src:\"\"+%s dest:%s\n", src, dest);
		return 0;
	}
	if (ret != dest || strcmp(dest, ret))
	{
		printf("\033[31;01mKO\033[0m dest:%s ret:%s cmp:%d\n", \
				dest, ret, strcmp(ret, dest));
		return (0);
	}
	bzero(dest, 20);
	bzero(ctrl, 20);
	strcpy(dest, "toto");
	strcpy(ctrl, "toto");
	ret = ft_strcat(dest, src);
	if (strcmp(dest, strcat(ctrl, src)))
	{
		printf("\033[31;01mKO\033[0m src:toto+%s dest:%s\n", src, dest);
		return 0;
	}
	if (ret != dest || strcmp(dest, ret))
	{
		printf("\033[31;01mKO\033[0m dest:%s ret:%s cmp:%d\n", \
				dest, ret, strcmp(ret, dest));
		return (0);
	}
	return ok();
}

static int      test_strdup()
{
	char    *t[] =
	{
		"",
		"toto",
		"schtroumpf",
		"schtroumpfschtroumpfschtroumpfschtroumpfschtroumpfschtroumpfschtroumpfschtroumpfschtroumpfschtroumpfschtroumpfschtroumpfschtroumpfschtroumpfschtroumpfschtroumpfschtroumpfschtroumpfschtroumpfschtroumpfschtroumpfschtroumpfschtroumpf"
	};
	char    *test;
	char    *ctrl;

	for (int i = 0; i < 4; i++)
	{
		ctrl = strdup(t[i]);
		test = ft_strdup(t[i]);
		if (strcmp(test, ctrl))
		{
			printf("\033[31;01mKO\033[0m test:%s ctrl:%s\n", test, ctrl);
			return 0;
		}
		free(ctrl);
		free(test);
	}
	return ok();
}

static int      test_puts()
{
	ft_puts("\033[32;01mOK\033[0m");

	return (1);
}

static int      test_cat()
{

	ft_cat(-42);
	ok();
	ft_cat(0);
	return 1;
}

static int		test_putstr()
{
	ft_putstr("\033[32;01mOK\033[0m\n");
	return (1);
}

static int		test_putstr_fd()
{
	ft_putstr_fd("\033[32;01mOK\033[0m\n", 1);
	return (1);
}

int             main(void)
{
	putstr("-ft_isdigit...\t\t");
	test_is(ft_isdigit, isdigit);

	putstr("-ft_isascii...\t\t");
	test_is(ft_isascii, isascii);

	putstr("-ft_isprint...\t\t");
	test_is(ft_isprint, isprint);

	putstr("-ft_isalpha:...\t\t");
	test_is(ft_isalpha, isalpha);

	putstr("-ft_isalnum:...\t\t");
	test_is(ft_isalnum, isalnum);

	putstr("-ft_toupper:...\t\t");
	test_to(ft_toupper, toupper);

	putstr("-ft_tolower:...\t\t");
	test_to(ft_tolower, tolower);

	putstr("-ft_memset:...\t\t");
	test_memset();

	putstr("-ft_bzero:...\t\t");
	test_bzero();

	putstr("-ft_memcpy:...\t\t");
	test_memcpy();

	putstr("-ft_strlen:...\t\t");
	test_strlen();

	putstr("-ft_strcat:...\t\t");
	test_strcat();

	putstr("-ft_strdup:...\t\t");
	test_strdup();

	putstr("-ft_puts:...\t\t");
	test_puts();

	putstr("-ft_cat:...\t\t");
	test_cat();

	putstr("\nBonus:\n");
	putstr("-ft_islower...\t\t");
	test_is(ft_islower, islower);

	putstr("-ft_isupper:...\t\t");
	test_is(ft_isupper, isupper);

	putstr("-ft_isblank:...\t\t");
	test_is(ft_isblank, isblank);

	putstr("-ft_putstr:...\t\t");
	test_putstr();

	putstr("-ft_putstr_fd:...\t");
	test_putstr_fd();

	return 0;
}
