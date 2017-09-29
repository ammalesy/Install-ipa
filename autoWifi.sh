#!/bin/bash
echo "Switch to kbank_ci2’s iMac access point."
until $(networksetup -setairportnetwork "en0" "kbank_ci2’s iMac" "1234567890");
do
	sleep 1
done
echo "kbank_ci2’s iMac is connected!"