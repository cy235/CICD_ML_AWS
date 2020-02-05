#!/bin/bash
cd /home/ubuntu/cy235-app
source .venv/bin/activate
sudo apt install python3-pip
pip3 install -r requirements.txt
