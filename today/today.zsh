# USING ANSI COLORS
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
LBLUE="\e[94m"
LGREEN="\e[92m"
CYAN="\e[36m"
LCYAN="\e[96m"
PURPLE="\e[1;35m"
STOP="\e[0m"

# LOGIN SCREEN MESSAGE
printf "${YELLOW}"
echo "                                |                    "
echo "                          \     |     /              "
echo "                     \     \    |    /     /         "
echo "                       \    \   |   /    /           "
echo "                 \       \   @@@@@@@   /       /     "
echo "                    \    @@@@@@@@@@@@@@@    /        "
echo "                       \@@@@@@@@@@@@@@@@@/           "
echo "             ~~ ~ ~ ~ ~ @@@@@@@@@@@@@@@@@ ~ ~ ~ ~ ~~ "
printf "${BLUE}"
figlet "Good morning $USER"
printf "${CYAN}"
shuf -n 1 ${HOME}/Documents/advice.txt
echo " "
printf "${YELLOW}"
curl -s http://wttr.in/\?format\=3
printf "${STOP}"
echo " "
icalBuddy -b ⚡ -iep datetime,title -f 'eventsToday'
