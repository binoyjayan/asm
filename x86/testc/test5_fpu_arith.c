
#include <stdio.h>
#include <stdlib.h>

float sum(float a, float b)
{
	return a+b;
}
float diff(float a, float b)
{
	return a-b;
}

float pro(float a, float b)
{
	return a*b;
}

float quo(float a, float b)
{
	return a/b;
}

void disp(float a, float b, float s, float d, float p, float q)
{
	printf("Sum        (%.2f, %.2f) =  %.2f\n", a, b, s);
	printf("Difference (%.2f, %.2f) =  %.2f\n", a, b, d);
	printf("Product    (%.2f, %.2f) =  %.2f\n", a, b, p);
	printf("Quotient   (%.2f, %.2f) =  %.2f\n", a, b, q);
}

int main()
{
	float s, d, p, q, r, a, b;
	a = 10.00;
	b = 3.00;
	s = sum(a, b);
	d = diff(a, b);
	p = pro(a, b);
	q = quo(a, b);
	disp(a, b, s, d, p, q);
}


