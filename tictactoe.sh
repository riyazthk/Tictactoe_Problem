#! /bin/bash -x
board=(_ _ _ _ _ _ _ _ _)

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
      local tossValue=$1
         if [[ $tossValue -eq 0 ]]
         then
             computerVariable="x"
         else
             computerVariable="o"
         fi
             echo $computerVariable
}

function userValue(){
    local computer=$1
       if [[ $computer == "x" ]]
       then
          userVariable="o"
       else
          userVariable="x"
       fi
          echo $userVariable
}

function computerVal(){
    local userVariable=$1
       if [[ $userVariable == "x" ]]
       then
           computerVariable="o"
       else
           computerVariable="x"
       fi
           echo $computerVariable
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
        while [[ board[cell]!="_" ]]
        do
            if [[ board[cell] -eq "_" ]]
            then
                break
            else
                cell=$(randomValues)
            fi
        done
                echo $((cell))
}

function randomValues(){
   cell=$((RANDOM%9))
   echo $((cell))
}

function printValues(){

        for i in ${!board[@]}
        do
        echo "$i=>${board[$i]}"
        done
echo $((0))
}

function rowChecking(){
    rowValue=0
       while [[ $rowValue -lt 9 ]]
       do
          firstValue=$(($rowValue))
          secondValue=$(($firstValue+1))
          thirdValue=$(($secondValue+1))
          if [[ ${board[firstValue]} -eq ${board[secondValue]} && ${board[secondValue]} -eq ${board[thirdValue]} ]]
          then
             result=1
             break
          else
             result=0
          fi
            rowValue=$(($thirdValue + 1))
       done
           echo $((result))
}

function columnChecking(){
    columnValue=0
    count=1
          while [[ $count -le 9 ]]
          do
            firstValue=$(($columnValue))
            secondValue=$(($firstValue+3))
            thirdValue=$(($secondValue+3))
            if [[ ${board[firstValue]} -eq ${board[secondValue]} && ${board[secondValue]} -eq ${board[thirdValue]} ]]
            then
               count=$(($count+3))
               result=1
               break
            else
               count=$(($count+3))
               result=0
            fi
               columnValue=$(($thirdValue-5))
            done
               echo $((result))
}

function diagonalChecking(){
    local count=$1
           if [[ ${board[0]} -eq ${board[4]} && ${board[4]} -eq ${board[8]} ]]
           then
               result=1
           elif [[ ${board[2]} -eq ${board[4]} && ${board[4]} -eq ${board[6]} ]]
           then
               result=1
           else
              if [[ $count -eq 8 ]]
              then
                  result=2
              fi
           fi
                 echo $((result))
}

function gameRule(){
    local count=$1
       if [[ $count -ge 5 ]]
       then
          result=$(rowChecking)
             if [[ $result -eq 1 ]]
             then
                break
             fi
           result=$(columnChecking)
             if [[ $result -eq 1 ]]
             then
                break
             fi
           result=$(diagonalChecking $count)
       fi
          echo $((result))
}

function playGame(){
     local starts=$1
     local computerSymbols=$2
     local userSymbols=$3
        while [[ $count -lt ${#board[@]} ]]
        do
           if [[ $starts -eq 1 ]]
           then
              read -p "Enter a cell number" cells
              board[$cells]=$userSymbols
              count=$(( $count+1 ))
              print=$(printValues)
              starts=$(alternatePlay $starts)
              result=$(gameRule $count)
                 if [[ $result -eq 1 ]]
                 then
                    break 3
                 fi
           else
               cell=$(randomValues)
               cell=$(cellChecking $cell)
               board[$cell]=$computerSymbols
               count=$(( $count+1 ))
               print=$(printValues)
               starts=$(alternatePlay $starts)
               result=$(gameRule $count)
                  if [[ $result -eq 1 ]]
                  then
                     break 3
                  fi
           fi
        done
              if [[ $result -eq 1 ]]
              then
                 echo "match win"
              else
                 echo "match tie"
              fi
}

calculateToss
if [[ $toss -eq $HEAD ]]
then
   echo "user win a toss"
   read -p "enter a x or o" userVariable
   computerVariable=$(computerVal $userVariable)
   $(playGame $userStarts $computerVariable $userVariable)
else
   echo "computer win a toss"
   tossValue=$(calculateToss)
   computerVariable=$(computerValue $tossValue)
   userVariable=$(userValue $computerVariable)
   $(playGame $computerStarts $computerVariable $userVariable)
fi
