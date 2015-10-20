#include <stdlib.h>
#include <unistd.h>
void ft_bzero(void *s, size_t n);
int main(void)
{
	char *s;

	s = malloc(sizeof(char) * 7);
	ft_bzero((void *)s, 7);
}
