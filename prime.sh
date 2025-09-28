#!/bin/bash
echo "enter number"
read num

if [ $num -lt 2 ]; then
    echo "$num is not prime"
    exit 1
fi
count=1
for((i=2; i*i<=$num; i++)); do
    if [ $(($num % i)) -eq 0 ]; then
        echo "$num is not prime"
        exit 1
    fi
    count=$((count+1))
done

echo "count : $count"

echo "$num is prime"
exit 0