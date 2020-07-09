#! /bin/bash -x
board=(0 0 0 0 0 0 0 0 0)

#constant variables
HEAD=0
TAIL=1

#variables
count=0
userStarts=1
computerStarts=2

function calculateToss(){
toss=$((RANDOM%2))
}
function computerValue(){
      local tossvalue=$1
         if [[ $tossvalue -eq 0 ]]
         then
             computerVariable=3
         else
             computerVariable=4
         fi
             echo $((computerVariable))
}

function userValue(){
    local computerVariable=$1
       if [[ $computerVariable -eq 3 ]]
       then
          userVariable=4
       else
          userVariable=3
       fi
          echo $((userVariable))
}

function computerVal(){
    local userVariable=$1
       if [[ $userVariable -eq 3  ]]
       then
           computerVariable=4
       else
           computerVariable=3
       fi
           echo $((computerVariable))
}
function alternatePlay(){
       local starts=$1
           if [[ $starts -eq 1 ]]
           then
               starts=2
           else
               starts=1
           fi
               echo $((starts))
}

function cellChecking(){
     local cell=$1
        while [[ board[cell]!=0 ]]
        do
            if [[ board[cell] -eq 0 ]]
            then
                break
            else
                cell=$(randomValues)
            fi
        done
                echo $((cell))
}
function randomValues(){
   cell=$((RANDOM%9+1))
   echo $((cell))
}
function printValues(){

        for i in ${!board[@]}
        do
        echo "$i=>${board[$i]}"
        done
echo $((0))
}

function playGame(){
     local starts=$1
     local computerVariables=$2
     local userVariables=$3
        while [[ $count -lt ${#board[@]} ]]
        do
           if [[ $starts -eq 1 ]]
           then
              read -p "Enter a cell number" cells
              board[(cells)]=$(( $userVariable ))
              count=$(( $count+1 ))
              print=$(printValues)
              starts=$(alternatePlay $starts)
           else
               cell=$(randomValues)
               cell=$(cellChecking $cell)
               board[(cell)]=$(( $computerVariable ))
               count=$(( $count+1 ))
               print=$(printValues)
               starts=$(alternatePlay $starts)
           fi
        done
}

calculateToss
if [[ $toss -eq $HEAD ]]
then
   echo "user win a toss"
   read -p "enter a 3 or 4" userVariable
   computerVariable=$(computerVal $userVariables)
   $(playGame $userStarts $ComputerVariables $userVariables)
else
   echo "computer win a toss"
   tossValue=$(calculateToss)
   computerVariable=$(computerValue $tossValue)
   userVariable=$(userValue $computerVariable)
   $(playGame $computerStarts $computerVariable $userVariable)
fi
