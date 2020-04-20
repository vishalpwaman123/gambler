#!/bin/bash -x

Day=20
Stack=100
MaxMoney=150
MinMoney=50
Win=1
i=0
for (( M=0 ; M<12 ; M++ ))
do
	for (( C=0 ; C<30 ; C++ ))
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
		WinArray[$M,$C]=$WinPerDay
		LossArray[$M,$C]=$LossPerDay 
	done
done
for (( p=0 ;p<12 ;p++ ))
do
	echo "Win in $(($p+1)) Month"
	for(( q=0 ; q<30 ; q++ ))
	do
		echo "DAY $q :${WinArray[$p,$q]}"
	done
	
	echo "Loss in $(($p+1)) Month"
	for(( q=0 ; q<30 ; q++ ))
	do
		echo "DAY $q :${LossArray[$p,$q]}"
	done
done
