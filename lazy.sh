# INTRO

cd art
cat hello.txt
read -t 1
cat l.txt
read -t 1

function lazy()
{
  clear
  cat l.txt
}

#PRINTING FUNCTIONS

function mainMenu()
{
  echo "options"
  echo "1) Accessories          2) Tools"
  echo "3) Editors"
  echo "xx) exit"
}

function access()
{
  echo "1) cmatrix              2) neofetch"
  echo "3) sl                   4) hollywood"
  echo "5) cheat.sh"
  echo "00) back"
}

function tools()
{
  echo "1) htop                 2) ifconfig"
  echo "3) netstat              4) nnn"
  echo "5) ncdu                 6) speedtest-cli"
  echo "7) terminator"
  echo "00) back"
}

function editors()
{
  echo "1) vim                  2) vi"
  echo "00) back"
}

function error()
{
  echo "you dont have software installed"
  read -t 0.5
  echo "do you want to install tool?"
  echo "if you do press y [y/n]"
}

#SPINNER

spinner=( Ooooo oOooo ooOoo oooOo ooooO )

function spin()
{
  while [ 1 ]
  do
    for i in "${spinner[@]}"
    do
      echo -ne "\r$i"
      sleep 0.2
    done
  done
}

#BACK FUNCTIONS

function inputMainMenu()
{
  read inp
  if [ $inp -eq 1 ]
  then
    access
    inputAccess
    back
  elif [ $inp -eq 2 ]
  then
    tools
    inpuTools
    back
  elif [ $inp -eq 3 ]
  then
    editors
    inputEditors
    back
  elif [ $inp == xx ]
  then
    clear
    exit
  else
    clear
    echo "unknown command"
    read -t 1
  fi
  back
}

function inputAccess()
{
  read inp
  if [ $inp -eq 1 ]
  then
    if command -v cmatrix
    then
      cmatrix
      back
    else
      error
      read inp
      if [ $inp == y ]
      then
        sudo apt install cmatrix
      else
        back
      fi
    fi
  elif [ $inp -eq 2 ]
  then
    if command -v neofetch
    then
      neofetch
      read
      back
    else
      error
      read inp
      if [ $inp == y ]
      then
        sudo apt-get install neofetch
      else
        back
      fi
    fi
  elif [ $inp -eq 3 ]
  then
    if command -v sl
    then
      sl
      back
    else
      error
      read inp
      if [ $inp == y ]
      then
        sudo apt-get install sl
      else
        back
      fi
    fi
  elif [ $inp -eq 4 ]
  then
    if command -v hollywood
    then
      hollywood
      back
    else
      error
      read inp
      if [ $inp == y ]
      then
        sudo apt-get install hollywood
      else
        back
      fi
    fi
  elif [ $inp -eq 5 ]
  then
    curl cheat.sh
    read
  elif [ $inp -eq 00 ]
  then
    back
  else
    clear
    echo "unknown command"
    read -t 1
    back
  fi
}

function inpuTools()
{
  read inp
  if [ $inp -eq 1 ]
  then
    if command -v htop
    then
      htop
      back
    else
      error
      read inp
      if [ $inp == y ]
      then
        sudo apt-get install htop
      else
        back
      fi
    fi
  elif [ $inp -eq 2 ]
  then
    if command -v ifconfig
    then
      ifconfig
      read
      back
    else
      error
      read inp
      if [ $inp == y ]
      then
        sudo apt-get install ifconfig
      else
        back
      fi
    fi
  elif [ $inp -eq 3 ]
  then
    if command -v netstat
    then
      netstat
      read
      back
    else
      error
      read inp
      if [ $inp == y ]
      then
        sudo apt-get install netstat
      else
        back
      fi
    fi
  elif [ $inp -eq 4 ]
  then
    if command -v nnn
    then
      nnn
      back
    else
      error
      read inp
      if [ $inp == y ]
      then
        sudo apt-get install nnn
      else
        back
      fi
    fi
  elif [ $inp -eq 5 ]
  then
    if command -v ncdu
    then
      ncdu
      back
    else
      error
      read inp
      if [ $inp == y ]
      then
        sudo apt install ncdu
      else
        back
      fi
    fi
  elif [ $inp -eq 6 ]
  then
    if command -v speedtest
    then
      speedtest
      echo
      echo "DONE"
      read
      back
    else
      error
      read inp
      if [ $inp == y ]
      then
        sudo apt install speedtest-cli
      else
        back
      fi
    fi
  elif [ $inp -eq 7 ]
  then
    if command -v terminator
    then
      terminator
    else
      error
      read inp
      if [ $inp == y ]
      then
        sudo apt-get install terminator
      else
        back
      fi
    fi
  elif [ $inp -eq 123 ]
  then
    echo "YOU HAVE FOUND SECRET PLACE"
    if command -v wireshark
    then
      wireshark
      back
    else
      echo "unfortunately you dont have wireshark installed..."
      echo "do you want to install wireshark [y/n]"
      read inp
      if [ $inp == y ]
      then
        sudo apt-get install wireshark
      else
        back
      fi
    fi
  elif [ $inp -eq 00 ]
  then
    back
  else
    clear
    echo "command unknown"
    read -t 1
    back
  fi
}

function inputEditors()
{
  read inp
  if [ $inp -eq 1 ]
  then
    if command -v vim
    then
      vim
      back
    else
      error
      read inp
      if [ $inp == y ]
      then
        sudo apt-get install vim
      else
        back
      fi
    fi
  elif [ $inp -eq 2 ]
  then
    if command -v vi
    then
      vi
      back
    else
      error
      read inp
      if [ $inp == y ]
      then
        sudo apt-get install vi
      else
        back
      fi
    fi
  elif [ $inp -eq 00 ]
  then
    back
  else
    clear
    echo "unknown command"
    read -t 1
    back
  fi
}

function back()
{
  lazy
  mainMenu
  inputMainMenu
}

back
