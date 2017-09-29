#!/bin/bash
echo "Switch to kbank_ci2’s iMac access point."
until $(networksetup -setairportnetwork "en0" "kbank_ci2’s iMac" "1234567890");
do
	sleep 1
done
echo "kbank_ci2’s iMac is connected!"


file_name=""
COMPUTER_NAME=$(scutil --get ComputerName);
if [ $1 == "-d" ]; then

	until $(curl -uadmin:password -X GET "http://10.215.99.238:8081/artifactory/api/storage/mobile-plus/iOS/Development" | python -m json.tool > archives.json); do
		sleep 1
	done

	THE_FILE_NAME=$2;
	if [ "$2" == "last" ]; then
			THE_FILE_NAME=$(cat archives.json | ./jq '[.children[].uri]' | ./jq 'reverse' | ./jq 'limit(1;.[])' | sed -l 's/"\///g' | sed -l 's/"//g');
			echo "=================================================================="
			echo "DOWNFILE FILE ========>".$THE_FILE_NAME;
			echo "=================================================================="
	else
			sleep 1
	fi

	echo "FILE NAME = ".$THE_FILE_NAME
	if [ -f $THE_FILE_NAME ]
	then
		echo "======> ON CACHE <======"
	else
		echo "Downloading.....";
		until $(wget "http://10.215.99.238:8081/artifactory/mobile-plus/iOS/Development/$THE_FILE_NAME"); do
	    	sleep 1
		done
		echo "Download Success ^_^";
	fi
	for DEVICE in $(instruments -s devices | grep -v Simulator | grep -v Known | grep -v "$COMPUTER_NAME" |cut -f 2 -d [ | cut -f 1 -d ]
			);
	do
	   	./fruitstrap -i $DEVICE -b $THE_FILE_NAME
	done
elif [ $1 == "-df" ]; then

		until $(curl -uadmin:password -X GET "http://10.215.99.238:8081/artifactory/api/storage/mobile-plus/iOS/Development" | python -m json.tool > archives.json); do
		sleep 1
		done

		THE_FILE_NAME=$2;
		if [ "$2" == "last" ]; then
			THE_FILE_NAME=$(cat archives.json | ./jq '[.children[].uri]' | ./jq 'reverse' | ./jq 'limit(1;.[])' | sed -l 's/"\///g' | sed -l 's/"//g');
		else
			sleep 1
		fi

		if [ -f $THE_FILE_NAME ]
		then
			rm $THE_FILE_NAME
		else
			sleep 1
		fi
		
		echo "=================================================================="
		echo "DOWNFILE FILE ========>".$THE_FILE_NAME;
		echo "=================================================================="
		echo "Downloading.....";
		until $(wget "http://10.215.99.238:8081/artifactory/mobile-plus/iOS/Development/$THE_FILE_NAME"); do
	    	sleep 1
		done
		echo "Download Success ^_^";

		for DEVICE in $(instruments -s devices | grep -v Simulator | grep -v Known | grep -v "$COMPUTER_NAME" |cut -f 2 -d [ | cut -f 1 -d ]
			);
		do
	   		./fruitstrap -i $DEVICE -b $THE_FILE_NAME
		done
elif [ $1 == "-l" ]; then
	until $(curl -uadmin:password -X GET "http://10.215.99.238:8081/artifactory/api/storage/mobile-plus/iOS/Development" | python -m json.tool > archives.json); do
		sleep 1
	done
	cat archives.json | ./jq '[.children[].uri]' | ./jq 'reverse' | ./jq 'limit(5;.[])' ;
elif [ $1 == "-la" ]; then
	until $(curl -uadmin:password -X GET "http://10.215.99.238:8081/artifactory/api/storage/mobile-plus/iOS/Development" | python -m json.tool > archives.json); do
		sleep 1
	done
	cat archives.json | ./jq '[.children[].uri]' | ./jq 'limit(999;.[])' ;
else
	echo "INSTALL =====>".$1
	for DEVICE in $(instruments -s devices | grep -v Simulator | grep -v Known | grep -v "$COMPUTER_NAME" |cut -f 2 -d [ | cut -f 1 -d ]
	);
	do
   		./fruitstrap -i $DEVICE -b $1
	done
fi