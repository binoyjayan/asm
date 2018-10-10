
#include <stdio.h>
#include <stdlib.h>

float sum(float a, float b)
{
	return a+b;
}

void disp(float a)
{
	printf("%f\n", a);
}
int main()
{
	float c;
	c = sum(1.0, 2.0);
	
	disp(c);
}
