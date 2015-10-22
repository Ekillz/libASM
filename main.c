#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>

void ft_bzero(void *s, size_t n);
char *ft_strcat(char *s1, const char *s2);
int	  ft_isalpha(int c);
int   ft_isdigit(int c);
int   ft_isalnum(int c);

int main(void)
{
	printf("%d\n", ft_isalnum(10));
}
