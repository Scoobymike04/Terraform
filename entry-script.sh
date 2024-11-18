#!/bin/bash
sudo systemctl start docker
sudo usermod -aG docker ec2-user
docker run -it -d -p 8080:80 nginx