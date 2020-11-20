#!/usr/bin/env bash

# Colors
RESET='\e[0m'

RED='\e[91m'
GREEN='\e[92m'
CYAN='\e[96m'
PURPLE='\e[95m'

BG_GREY='\e[100m'


# Create a splash screen
splash="$RED
                    _ap@@@@@@b                        
               _ap@@@@@@@@@@@@@b                      
            @@@@@@P@@@P     ~@@@i                     
             ~~~~   @@@      @@@I                     
             ,qq,   @@@      @@@I                     
             ~~P@b,d@@      d@@@                      
                 .d@@    ._d@@@                       
               .aPP       ~@@P                        
            .       ,_          .__                   
          dP   @     @@b   _,     ~P@be.              
         @@   I@      P@@@@@~   e_  ~P@@b             
        @@@    @@b     \`~~'     I@b   @@@             
        \`@P     @@@@eeeeeeeeeee@@@'   P~              
                  ~~~@@@@@@@@@@~
        
$RESET"


USERNAME=$(whoami)
AUTH_LEVEL="匿"
token=
key_sum=7c6bc7255ab39809881c2b3c88af3acd6e326490


# Displays all colors
colors ()
{
    for fgbg in 38 48 ; do # Foreground / Background
        for color in {0..255} ; do # Colors
            # Display the color
            printf "\e[${fgbg};5;%sm  %3s  \e[0m" $color $color
            # Display 6 colors per lines
            if [ $((($color + 1) % 6)) == 4 ] ; then
                echo # New line
            fi
        done
        echo # New line
    done
    
}

# Desktop files
desktop_files ()
{
    read -p "? #: " amount < /dev/tty
    read -p "? n: " name < /dev/tty
    read -p "? c: " content < /dev/tty
    for ((i=1;i<=amount;i++)); do
        echo $content >> ~/Desktop/${name}-${i}.txt
    done
    printf "${GREEN}You're welcome :)$RESET"
    echo ""
}

error ()
{
    printf "${RED}错误: $1${RESET}"
    echo ""
    prompt
}

# Authenticate
authenticate ()
{
    auth_level=$1
    if [ "$auth_level" == "" ];
    then
        read -p "? Level: " auth_level < /dev/tty
    fi

    if [ "$auth_level" == "0" ];
    then
        read -s -p "? Key: " key < /dev/tty

        hashed_key=`echo -n $key | shasum | awk '{print $1}'`
        echo ""

        # test if the hashes don't match
        if [ "$hashed_key" != "$key_sum" ];
        then
            error "Invalid Key"
            return 1
        fi

        AUTH_LEVEL="零"

        main true

        printf "${GREEN}很好，你现在是零${RESET}"
        echo ""

    else
        error "Invalid Auth Level"
    fi
}

# Install ZSH function
install_zsh ()
{

    # ZSH setup
    echo "Downloading your ZSH profile"

    # Set the download URL
    DOWNLOAD_URL="https://koon.dev/zshrc.sh"

    # Download the profile to the .zshrc file
    curl -o "$HOME/.zshrc" -L --progress-bar $DOWNLOAD_URL

    echo "ZSH profile set up!"

    # Success
    echo ""
    echo "✨ All done!"

    exit 0
}

header () 
{
    time_string=`date "+%m/%d/%Y %H:%M:%S"`
    printf "$BG_GREY 用户: $AUTH_LEVEL@$USERNAME  |  时间: $time_string $RESET"
    echo ""
}

# process a command
process_command ()
{
    IFS=' ' read -ra parts <<< "$1"

    case "${parts[0]}" in
        # authenticates to a degree
        auth)
            authenticate ${parts[1]}
            ;;
        # display all display colors
        colors)
            colors
            ;;
        # Desktop files :)
        filefun | dskf)
            desktop_files
            ;;
        # clear the screen
        clear | cls)
            main
            ;;
        # shows help
        help | ?)
            echo "不好，再见！"
            sleep 3
            clear
            exit 1
            ;;
        # exit the program
        exit | ex)
            clear
            exit 0
            ;;
        # invalid command
        *)
            error "\"${parts[0]}\"是一个不好的命令"
            ;;
    esac
}

# Create the main menu
prompt ()
{
    read -p "$AUTH_LEVEL " command < /dev/tty
    if [ "$command" != "" ];
    then
        process_command $command
    fi

    # TODO: add a check for '!'  to exit after command runs
    # TODO: add a check for '!!' to clear history and exit after command runs.

    prompt
}

main ()
{
    # Set IFS to nothing to preserve new lines
    IFS=
    
    clear
    header

    printf $splash
    echo ""

    if [ "$1" != true ];
    then
        prompt
    fi
}


main

