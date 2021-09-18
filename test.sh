#!/bin/bash
value=unhealthy
value1="$value"
value2=unhealthy
mystring1="$value1"
mystring2="unhealthy"

if [ $mystring1 == $mystring2 ]; then
	echo "true"
else
	echo "false"
fi

