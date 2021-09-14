#include <stdio.h>

int main()
{
  int test[100];

  int i = 0;

  /* for (i = 0; i < 25; i += 4) */
  /*   { */
  /*     test[i] = i; */
  /*     test[i + 1] = i + 1; */
  /*     test[i + 2] = i + 2; */
  /*     test[i + 3] = i + 3; */
  /*   } */

  for (i = 0; i < 100; i++)
    {
      test[i] = i;
    }

  for (i = 0; i < 100; i++)
    {
      printf("%d\n", test[i]);
    }

  return;
}
