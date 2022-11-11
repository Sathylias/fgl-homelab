#!/usr/bin/env python3

import requests
import hashlib
import json

data = {
    "images": [
        { 
            "name": "Debian 10",
            "img":"http://cloud.debian.org/images/cloud/buster/latest/debian-10-generic-amd64.qcow2",
            "checksum": "http://cloud.debian.org/images/cloud/buster/latest/SHA512SUMS"
        },
        #{
        #    "name": "Rocky 8",
        #    "img":"https://download.rockylinux.org/pub/rocky/8/images/Rocky-8-GenericCloud.latest.x86_64.qcow2",
        #    "checksum": "test"
        #}
    ]
}

def download_images_data(url_img, url_checksum):
    pass

def main():
    
    result = json.loads(json.dumps(data))

    for items in result['images']:
        out_file = items['img'].rsplit('/', 1)[1]
         
        with requests.get(items['img']) as response:
            with open(out_file, 'wb') as f:
                f.write(response.content)

if __name__ == "__main__":
    main()
