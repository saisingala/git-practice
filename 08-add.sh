#!bin/bash
date 
a=$1
b=$2
add=` expr $a + $b `
echo "add= $add"
subtract=` expr $a - $b `
echo "Sub= $subtract"
Multiply=` expr $a*$b `
echo "Multiply= $Multiply"
Division=` expr $a / $b `
echo "Div= $Division"
