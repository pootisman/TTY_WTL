#include <stdlib.h>
#include <stdio.h>
#include <math.h>

int main(int argc, char *argv[]){
  FILE *I = fopen(argv[1], "r"), *O = fopen(argv[2], "w");
  double d = 0.0, Z = 0.0;

  while(!feof(I)){
    (void)fscanf(I, "%lf\t%lf\n", &d, &Z);
    d = 0.200/d;
    (void)fprintf(O, "%lf\t%lf\n", d, Z);
  }

  (void)fclose(I);
  (void)fclose(O);

  return EXIT_FAILURE;

}
