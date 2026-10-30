#!/bin/bash

read -p "Enter Username: " user
read -p "Enter Password: " pwrd
User@dd /bin/bash $user
passwd $pwrd
