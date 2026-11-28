#!/bin/bash

echo "=== Simple Bash Calculator ==="
read -p "Enter first number: " num1
read -p "Enter operator (+, -, *, /): " op
read -p "Enter second number: " num2

case $op in
  +)
    result=$(echo "$num1 + $num2" | bc -l)
    ;;
  -)
    result=$(echo "$num1 - $num2" | bc -l)
    ;;
  \*)
    result=$(echo "$num1 * $num2" | bc -l)
    ;;
  /)
    if [ "$num2" == "0" ]; then
      echo "Error: Division by zero is not allowed."
      exit 1
    fi
    result=$(echo "scale=2; $num1 / $num2" | bc -l)
    ;;
  *)
    echo "Invalid operator. Please use +, -, *, or /."
    exit 1
    ;;
esac

echo "Result: $num1 $op $num2 = $result"

