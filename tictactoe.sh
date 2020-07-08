#! /bin/bash -x
board=(0 0 0 0 0 0)

#constant variables
HEAD=0
TAIL=1

function calculateToss(){
toss=$((RANDOM%2))
}

calculateToss
if [[ $toss -eq $HEAD ]]
then
   echo "user win a toss"
   #userVariable=read -p "x or o take anyone"
else
   echo "computer win a toss"
  # tossValue=$(calculateToss)
   #   if [[ $tossvalue -eq 0 ]]
    #  then
     #     computerVariable=o
      #else
       #   computerVariable=x
      #fi
fi
