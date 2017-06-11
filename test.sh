#! /bin/sh

echo "=== perl ==="
time ./sort.pl
echo
echo "=== ruby ==="
time ./sort.rb
echo
echo "=== python ==="
time ./sort.py
echo
echo "=== clisp ==="
time ./sort.lisp
echo
echo "=== java ==="
time java sort
echo
echo "=== C ==="
time ./sort
echo

