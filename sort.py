#! /usr/bin/python
import sys

def pr(list):
  print "============"
  for no in list:
    print no

def mid3(x,y,z):
  if (x < y):
    if (y < z):
      return(y)
    elif (z < x):
      return(x)
    else:
      return(z)
  else:
    if (z < y):
      return(y)
    elif (x < z):
      return(x)
    else:
      return(z)
    
def sort(list,s,e):
#  target = list[s]
  target = list[s+(e-s)/2]
#  target = mid3(list[s],list[s + (e-s)/2],list[e])
  sp     = s
  ep     = e

  while 1:
    while list[sp] < target and sp + 1 < ep:
        sp += 1

    while list[ep] >= target and sp + 1 < ep:
        ep -= 1

    if list[sp] > list[ep]:
      tmp      = list[ep]
      list[ep] = list[sp]
      list[sp] = tmp

    if sp + 1 == ep:
      break

  if sp - s > 0:
    sort(list,s,sp)

  if e - ep > 0:
    sort(list,ep,e)
    

#list = [ 10,9,8,7,6,5,4,3,2,1 ]

list = []
for no in range(0, 100000):
  list.append(100000-no)

#pr(list)
#sys.setrecursionlimit(10000)
sort(list,0,len(list)-1)
#pr(list)
