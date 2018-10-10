
#include <stdio.h>
#include <stdlib.h>

int check(int a, int b)
{
	if(a > b)
	{
		b = a;
	}

	printf("a = %d, b = %d\n", a, b);
	return 0;
}
