#!/usr/bin/env bash
#
# set -x
# set -eou pipefail
#
# Program: get_latest_cloud_images.sh
# Description: Update our cloud images 
#
# Author: Maxime Daraiche <maxiscoding@gmail.com>
#
#/ Usage: get_latest_cloud_images [OPTIONS]... [ARGUMENTS]...
#/
#/ 
#/ OPTIONS
#/   -h, --help
#/                Print this help message
#/
#/   
#/ EXAMPLES
#/ 

IMG_DIR="/data/templates/"

DEBIAN_BUSTER=(
  "http://cloud.debian.org/images/cloud/buster/latest/debian-10-generic-amd64.qcow2"
  "http://cloud.debian.org/images/cloud/buster/latest/SHA512SUMS"
)

ROCKY_LINUX8=(
  "https://download.rockylinux.org/pub/rocky/8/images/Rocky-8-GenericCloud.latest.x86_64.qcow2"
  "https://download.rockylinux.org/pub/rocky/8/images/CHECKSUM"
)

# Boy, what a very useful wizardry, jolly good !
usage() { grep '^#/' "$0" | cut -c4- && exit 0; }

parse_arguments() {
  while [[ "$#" -gt 0 ]]; do
    case "$1" in
      --help|help|-h)
	      usage
        shift
	      ;;
      *)
        #HOST_NAME="$1"
        shift
        ;;
    esac
  done
}

download_img() {
  data="$@"
  for item in "${data}"; do
    wget --no-http-keep-alive --directory-prefix="/tmp/" $(echo "$item" | awk '{print $1}')
    wget --no-http-keep-alive --directory-prefix="/tmp/" $(echo "$item" | awk '{print $2}')
  done
}

verify_checksum() {
  data="$@"
  for item in "${data[0]}"; do
    echo "$item"
    #img_checksum=$(sha256sum "/tmp/${item}") 
    #orig_checksum=$(cat /tmp/)
  done
}

update_img() {
  :
}

main() {
    
    #parse_arguments "$@"
    
    download_img "${DEBIAN_BUSTER[@]}"
    download_img "${ROCKY_LINUX8[@]}"
}

main "$@"
