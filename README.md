## Deploy ipa to iPhone.

# Install-ipa
==========
Install ipa application on iOS device.

## Requirements

* Xcode must be installed, along with the SDK for your iOS version.

## Install
* `make fruitstrap`
## Usage
(10.215.99.238:8081/artifactory)
* `sh deploy.sh [-d] <filename | last>`
* `-d` download item on artifactory (Apply cache file.)
* `-d last` download last item on artifactory (Apply cache file.)
* `-df` download last item on artifactory (Froce download.)
* `-l` list top five item on artifactory
* `-la` list all item on artifactory  

## Demo

* sh deploy.sh dev.ipa
* sh deploy.sh -d dev.ipa
* sh deploy.sh -d last
* sh deploy.sh -l
