#!/bin/bash
echo "enter number"
read num

if [ $num -lt 2 ]; then
    echo "$num is not prime"
    exit 1
fi

for((i=2; i*i<=$num; i++)); do
    if [ $(($num % i)) -eq 0 ]; then
        echo "$num is not prime"
        exit 1
    fi
done

echo "$num is prime"
exit 0