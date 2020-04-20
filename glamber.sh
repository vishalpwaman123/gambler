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
			Large=$(($Winner+$Large))
		fi
		Losser=${LossArray[$c]}
		if (( $Small < $Losser ))
		then
			Small=$(($Losser+$Small))
		fi
	done
	
	echo "Large :$Large  Small : $Small"
	
	if (( $Large > $Small ))
	then
		echo "Yes U r Able to Playing Next Month"
	else
		echo "No U r Not Able To Playing Next Month "
	fi
