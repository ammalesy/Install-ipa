## Deploy ipa to iPhone.

# Install-ipa
==========
Install ipa application on iOS device.

## Requirements

* Xcode must be installed, along with the SDK for your iOS version.

## Usage

* `sh install.sh [-d] <filename | last>`
* `-d download` item on artifactory  (10.215.99.238:8081/artifactory)
* `-d last` //<=== download last item on artifactory (10.215.99.238:8081/artifactory)

## Demo

* sh install.sh dev.ipa
* sh install.sh -d dev.ipa
* sh install.sh -d last
