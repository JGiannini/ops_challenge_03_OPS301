#!/bin/bash
#
# Author: Jamie Giannini

# Objectives: Create a bash script that launches a menu system with the following options:
# [X] Hello world (prints “Hello world!” to the screen)
# [X] Ping self (pings this computer’s loopback address)
# [X] IP info (print the network adapter information for this computer)
# [X] Exit
# [X] Requests and gets user input 
# [X] Use a conditional statement to evaluate the user’s input, then act according to what the user selected
# [X] Use a loop to bring up the menu again after the request has been executed
echo "
   / \__
  (    @\___
  /         O
 /   (_____/
/_____/   U
"
echo "
    _   __     __                      __      __  __                      __
   / | / /__  / /__      ______  _____/ /__   / / / /___  __  ______  ____/ /
  /  |/ / _ \/ __/ | /| / / __ \/ ___/ //_/  / /_/ / __ \/ / / / __ \/ __  / 
 / /|  /  __/ /_ | |/ |/ / /_/ / /  / ,<    / __  / /_/ / /_/ / / / / /_/ /  
/_/ |_/\___/\__/ |__/|__/\____/_/  /_/|_|  /_/ /_/\____/\__,_/_/ /_/\__,_/ "
echo -e "\nHello! Welcome to Network Hound--sniffing out your vital network information. \n\nWhat is your name?"
read -r user_name #reads user response
echo -e "\nHello world! I mean...hello ${user_name}."

function run_program () {
while true #setting to true kicks off my while loop 
do

echo -e "\nWhat would you like to do, ${user_name}?:\n[1] Ping this computer\n[2] Show network adapter info\n[3] Get IP Address\n[4] Get Connection Status\n[5] Exit Program"
read -r user_input #reads user response

    if [ "$user_input" == 1 ] #series of if/else if statements to check for input
        then
        echo -e "\n######################### Licking...I mean...Pinging...myself! #########################\n"
        command ping -ac 3 127.0.0.1 #ping loopback address
        echo -e "\n######################### End #########################"
    elif [ "$user_input" == 2 ]
        then
        echo -e "\n######################### Fetching network adapter info... #########################\n"
        command sudo lshw -class network -short # displays network adapter info
        echo -e "\n######################### End #########################"
    elif [ "$user_input" == 3 ]
        then
        echo "Enter the device name: "
        read -r device_name
        echo -e "\n######################### Digging up IP info... #########################\n"
        command ip a s "${device_name}" # displays ip address info for specified device
        echo -e "\n######################### End #########################"
    elif [ "$user_input" == 4 ]
        then
        echo -e "Ok ${user_name}, make a selection:"
        echo -e "[1] Show all devices\n[2] Show specific device"
        read -r connection_select
            if [ "$connection_select" == 1 ]
                then
                echo -e "\n######################### Sniffing out the Status... #########################\n"
                command nmcli device status #display connection status
                echo -e "\n######################### End #########################"
            elif [ "$connection_select" == 2 ]
                then
                echo -e "Enter device name: "
                read -r device_name_choice
                echo -e "\n######################### Sniffing out the Status... #########################\n"
                command nmcli device status | grep "${device_name_choice}" # display connection status by device name
                echo -e "\n######################### End #########################"
            else
                echo "Invalid selection"
            fi
    elif [ "$user_input" == 5 ]
        then
        echo "Cya later ${user_name}!"
        break #This breaks us out of the loop when exit command is initiated
    else
        echo -e "\nInvalid selection, please try again!" #Catches any invalid input
    fi
done
}

run_program #Kicks off our function

#ASCII art credit: Joan Stark