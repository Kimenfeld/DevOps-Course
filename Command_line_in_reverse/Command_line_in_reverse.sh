#!/usr/bin/sh
n=$#
while [ "$n" -gt 0 ]; do
	eval "value=\${$n}"
	echo "Parameter $n is $value"
  n=$((n-1))
done
