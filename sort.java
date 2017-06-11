import java.io.*;
import java.util.*;

class sort {
  void pr(List<Integer>list) {
    System.out.printf("======\n");
      for(int no:list) {
        System.out.printf("%d\n",no);
      }
  }
    
  int mid3(int x, int y, int z) {
    if (x < y) {
      if (y < z) return y; else if (z < x) return x; else return z;
    } else {
      if (z < y) return y; else if (x < z) return x; else return z;
    }
  }

  void sort(List<Integer>list,int s,int e) {
    // int target = list.get(s);o
    int target = list.get(s+(e-s)/2);
    // int target = mid3(list.get(s),list.get(s + (e-s)/2),list.get(e));
    int sp     = s;
    int ep     = e;

    while(true) {
      while(list.get(sp) < target && sp + 1 < ep) {
        sp++;
      }
      while(list.get(ep) >= target && sp + 1 < ep) {
        ep--;
      }
      if (list.get(sp) > list.get(ep)) {
        int tmp = list.get(ep);
        list.set(ep,list.get(sp));
        list.set(sp,tmp);
      }
      if (sp + 1 == ep) {
        break;
      }
    }
    if (sp - s > 0) {
      sort(list,s,sp);
    }
    if (e - ep > 0) {
      sort(list,ep,e);
    }
  }
    
  public static void main(String args[]) {
    List<Integer>list = new ArrayList<Integer>();
    for(int i=0;i<100000;i++) {
      list.add(100000-i);
    }
    sort obj = new sort();
    // obj.pr(list);
    obj.sort(list,0,list.size()-1);
    // obj.pr(list);
  }
}
