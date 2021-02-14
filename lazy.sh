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
  echo "00) exit"
}

function access()
{
  echo "1) cmatrix              2) neofetch"
  echo "00) back"
}

function tools()
{
  echo "1) htop                 2) ifconfig"
  echo "3) netstat"
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
  read -t 1
  back
}

#BACK FUNCTIONS

function inputMainMenu()
{
  read inp
  if [ $inp -eq 1 ]
  then
    access
    inputAccess
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
  elif [ $inp -eq 00 ]
  then
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
    fi
  elif [ $inp -eq 3 ]
  then
    sl
    back
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
      read -t 1
      back
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
    fi
  elif [ $inp -eq 2 ]
  then
    if command -v vi
    then
      vi
      back
    else
      error
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