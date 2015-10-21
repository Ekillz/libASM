#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>

void ft_bzero(void *s, size_t n);
int main(void)
{

	char *s;

	s = malloc(sizeof(char) * 5);
	s[0] = 'd';
	s[1] = 'u';
	s[2] = 'd';
	s[3] = 'e';
	s[4] = '\0';
	ft_bzero((void *)s, 4);
	printf("%s", s);
}
