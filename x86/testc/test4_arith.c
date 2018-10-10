
#include <stdio.h>
#include <stdlib.h>

int sum(int a, int b)
{
	return a+b;
}
int diff(int a, int b)
{
	return a-b;
}

int pro(int a, int b)
{
	return a*b;
}

int quo(int a, int b)
{
	return a/b;
}
int rem(int a, int b)
{
	return a%b;
}

void disp(int a, int b, int s, int d, int p, int q, int r)
{
	printf("sum        (%d, %d) =  %d\n", a, b, s);
	printf("Difference (%d, %d) =  %d\n", a, b, d);
	printf("Product    (%d, %d) =  %d\n", a, b, p);
	printf("Quotient   (%d, %d) =  %d\n", a, b, q);
	printf("Remainder  (%d, %d) =  %d\n", a, b, r);
}

int main()
{
	int s, d, p, q, r, a, b;
	a = 10;
	b = 3;
	s = sum(a, b);
	d = diff(a, b);
	p = pro(a, b);
	q = quo(a, b);
	r = rem(a, b);
	disp(a, b, s, d, p, q, r);
}

