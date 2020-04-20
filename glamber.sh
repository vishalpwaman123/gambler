#!/bin/bash -x

Day=20
Stack=100
MaxMoney=150
MinMoney=50
Win=1
i=0
Winner=0
Losser=0
Large=0
Day1=0
Day2=0
Small=10000
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
		WinArray[$C]=$WinPerDay
		LossArray[$C]=$LossPerDay 
	done



	Large=0
	Small=0
	for(( c=0 ; c<30 ; c++ ))
	do
		Winner=${WinArray[$c]}
		if (( $Winner > $Large ))
		then
			Large=$Winner
			Day1=$(($c+1))
		fi
		Losser=${LossArray[$c]}
		if (( $Small < $Losser ))
		then
			Small=$Losser
			Day2=$(($c+1))
		fi
	done
	echo "Lucky day in $(($p+1)) Month is $Day1 and Win Game that Day is $Large"
	echo "UnLucky day in $(($p+1)) Month is $Day2 and Loss Game That Day is $Small"

