#!/bin/bash
file_name=""
COMPUTER_NAME=$(scutil --get ComputerName);
if [ "$1" == "-d" ]; then
	wget "http://10.215.99.238:8081/artifactory/mobile-plus/iOS/Development/dev-295-3.5.0-6f990ae6.ipa"
	# until $(wget "http://10.215.99.238:8081/artifactory/mobile-plus/iOS/Development/dev-295-3.5.0-6f990ae6.ipa"); do
		echo "SUCCESS";
  #   	$file_name=$2
  #   	sleep 1
    	
		# for DEVICE in $(instruments -s devices | grep -v Simulator | grep -v Known | grep -v "$COMPUTER_NAME" |cut -f 2 -d [ | cut -f 1 -d ]
		# );
		# do
  #  		./fruitstrap -i $DEVICE -b $file_name
		# done
	# done

	
else
	# $file_name=$1
	# for DEVICE in $(instruments -s devices | grep -v Simulator | grep -v Known | grep -v "$COMPUTER_NAME" |cut -f 2 -d [ | cut -f 1 -d ]
	# );
	# do
 #   	./fruitstrap -i $DEVICE -b $file_name
	# done
fi



