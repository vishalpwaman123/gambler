#!/bin/bash -x

Day=20
Stack=100
MaxMoney=150
MinMoney=50
Win=1
i=0
for (( C=0 ; C<20 ; C++ ))
do	
	Money=$Stack
	WinPerDay=0
	LossPerDay=0
	while (( $MaxMoney > $Money && $MinMoney < $Money ))
	do 
		check=$(($RANDOM%2))
		if (( $check == $Win ))
		then
			WinPerDay=$(($WinPerDay + 1))
			Money=$(($Money+1))
		else
			LossPerDay=$(($LossPerDay + 1))
			Money=$(($Money-1))
		fi
	done
        echo "Win : $WinPerDay  Loss : $LossPerDay"
	WinArray[$C]=$WinPerDay
	LossArray[$C]=$LossPerDay 

done

echo "Win Per Day  : ${WinArray[@]}"
echo "Loss Per DAy : ${LossArray[@]}"
