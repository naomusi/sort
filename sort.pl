#! /usr/bin/perl

for($i=0;$i<100000;$i++) {
    push(@LIST,100000-$i);
}

#&pr();
&qsort(\@LIST,0,scalar(@LIST)-1);
#&pr();

sub mid3 {
  my($x,$y,$z) = @_;

  if ($x < $y) {
    if ($y < $z) {return($y);} elsif ($z < $x) {return($x);} else {return($z);}
  } 
  else {
    if ($z < $y) {return($y);} elsif ($x < $z) {return($x);} else {return($z);}
  }
}

sub qsort {
  my($LIST,$s,$e) =@_;

#  my($target) = $$LIST[$s];
  my($target) = $$LIST[$s + int(($e-$s)/2)];
#  my($target) = &mid3($$LIST[$s],$$LIST[int($s + ($e - $s)/2)],$$LIST[$e]);
  my($sp)     = $s;
  my($ep)     = $e;

  while(1) {
    while($$LIST[$sp]<$target && ($sp+1)<$ep) {
      $sp++;
    }
    while($$LIST[$ep]>=$target && ($sp+1)<$ep) {
      $ep--;
    }
    if ($$LIST[$sp]>$$LIST[$ep]) {
      my($tmp)    = $$LIST[$ep];
      $$LIST[$ep] = $$LIST[$sp];
      $$LIST[$sp] = $tmp;
    }
    if (($sp+1) == $ep) {
      last;
    }
  }

  if ($sp - $s > 0) {
    &qsort($LIST,$s,$sp);
  }

  if ($e - $ep > 0) {
    &qsort($LIST,$ep,$e);
  }
}

sub pr {
  printf("========\n");
  foreach $no (@LIST) {
    printf("%d\n",$no);
  }
}

