#!/bin/sh

# PATH TO YOUR HOSTS FILE
ETC_HOSTS=/etc/hosts

# DEFAULT IP FOR val
IP="127.0.0.1"

# Declare an array of string with type
declare -a HOSTNAMES=("tinder.com" "www.tinder.com" "www.facebook.com" "facebook.com" "www.fetlife.com" "fetlife.com" "reddit.com" "www.reddit.com" )
 
# Iterate the string array using for loop
removehost() {
    echo "adding host";
    HOSTS_LINE="$IP\t$val"
    for val in ${HOSTNAMES[@]}; do
        if [ -n "$(grep $val /etc/hosts)" ]
            then
                echo "Remove $val from your $ETC_HOSTS";
                sudo -- sh -c -e "echo '$HOSTS_LINE' >> /etc/hosts";

                if [ -n "$(grep $val /etc/hosts)" ]
                    then
                        echo "$val was added succesfully \n $(grep $val /etc/hosts)";
                    else
                        echo "Failed to Add $val, Try again!";
                fi
            else
                echo "$val already exists : $(grep $val $ETC_HOSTS)"
        fi
    done
}


addhost() {
    echo "adding host";
    HOSTS_LINE="$IP\t$val"
    for val in ${HOSTNAMES[@]}; do
        if [ -n "$(grep $val /etc/hosts)" ]
            then
                echo "$val already exists : $(grep $val $ETC_HOSTS)"
            else
                echo "Adding $val to your $ETC_HOSTS";
                sudo -- sh -c -e "echo '$HOSTS_LINE' >> /etc/hosts";

                if [ -n "$(grep $val /etc/hosts)" ]
                    then
                        echo "$val was added succesfully \n $(grep $val /etc/hosts)";
                    else
                        echo "Failed to Add $val, Try again!";
                fi
        fi
    done
}

date_time() {
  hours="(date +"%H:%M")"
  if [[ ${hours} -lt 17  ]]
      addhost()
  fi 
}

