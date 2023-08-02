/

#include <stdio.h>
#include <math.h>
int main (void)
{
int n = 1;
double g = 1.64676025812, delta = 1;
double tmpx, tmpy, sigma;
double x = 1, y = 0, z = 0.6; // Initialwert fuer z entspricht Theta
do {
sigma = z < 0 ? -1 : 1;
tmpx = x - (sigma * delta * y);
tmpy = y + (sigma * delta * x);
x = tmpx;
y = tmpy;
z = z - sigma * atan(delta);
delta = delta / 2;
n++;
} while (n <= 24);
x = x / g;
y = y / g;
printf("x = %1.8lf, y = %1.8lf\n", x, y);
return 0;
}