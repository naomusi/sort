#! /usr/bin/ruby

def pr(list)
  printf("======================\n")
  list.each do |no|
     printf("%d\n", no)
  end
end

def mid3(x,y,z)
  if (x < y) then
    if (y < z) then return(y) elsif (z < x) then return(x) else return(z) end
  else 
    if (z < y) then return(y) elsif (x < z) then return(x) else return(z) end
  end
end

def sort(list,s,e)
#  target = list[s]
  target = list[s + (e-s)/2]
#  target = mid3(list[s],list[s + (e-s)/2],list[e])
  sp     = s
  ep     = e

  while true do
    while list[sp] < target && sp+1 < ep do
      sp += 1
    end
    
    while list[ep] >= target && sp+1 < ep do
      ep -= 1
    end

    if (list[sp] > list[ep])
      tmp      = list[ep]
      list[ep] = list[sp]
      list[sp] = tmp
    end

    if (sp + 1 == ep)
      break
    end
  end

  if ((sp - s) > 0)
    sort(list,s,sp)
  end
  if ((e - ep) > 0)
    sort(list,ep,e)
  end
end

#list = [ 10,9,8,7,6,5,4,3,2,1 ]
list = []
for no in 1..100000 do
  list.push(100000-no)
end

#pr(list)
sort(list,0,list.length-1)
#pr(list)

