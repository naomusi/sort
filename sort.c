#include <stdio.h>
#include <stdlib.h>

void
pr(int *list,int max)
{
  int i = 0;

  printf("========\n");
  for(i=0;i<max;i++) {
    printf("%d\n",list[i]);
  }
}

int
mid3(int x, int y, int z) {
    if (x < y) {
        if (y < z) return y; else if (z < x) return x; else return z;
    } else {
        if (z < y) return y; else if (x < z) return x; else return z;
    }
}

void
sort(int *list,int s,int e)
{
  // int target = list[s];
  int target = list[s+(e-s)/2];
  // int target = mid3(list[s], list[s + (e - s) / 2], list[e]); 
  int sp     = s;
  int ep     = e;

  
  while(1) {
    while(list[sp]<target && sp+1 < ep) {
      sp++;
    }
    while(list[ep]>=target && sp+1 < ep) {
      ep--;
    }
    if (list[sp]>list[ep]) {
      int tmp = list[ep];
      list[ep] = list[sp];
      list[sp] = tmp;
    }

    if (sp + 1 == ep) break;
  }
  if(sp - s > 0) {
    sort(list,s,sp);
  }
  if(e - ep > 0) {
    sort(list,ep,e);
  }
}

int
main(int argc,char *argv[])
{
  int max = 100000;
  int i = 0;
  int *list = calloc(sizeof(int),max);

  for(i=0;i<max;i++) {
    list[i] = max - i;
  }

  //  pr(list,max);
  sort(list,0,max-1);
  // pr(list,max);
}
