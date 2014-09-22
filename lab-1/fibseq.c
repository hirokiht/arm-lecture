#include <stdio.h>
#include <time.h>

extern int fibonacci(int x);

int main(int argc, char **argv)
{
  int number=0;
  int result=0;
  if(scanf("%d",&number) != 1)
    return 1;
  clock_t t = clock();
  result = fibonacci(number);   
  t = clock() - t;
  printf("The fibonacci sequence at %d is: %d\n", number, result);
  printf("Clock needed: %d\n", (int)t);
  
  return 0;
}

