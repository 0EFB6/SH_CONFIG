periods=($(date -d 07:28 +%s) $(date -d 07:49 +%s) $(date -d 8:27 +%s) $(date -d 9:07 +%s) $(date -d 10:02 +%s) $(date -d 10:42 +%s) $(date -d 11:22 +%s) $(date -d 12:02 +%s) $(date -d 13:07 +%s) $(date -d 13:47 +%s) $(date -d 14:27 +%s))

#Browser to open links, you should only change the "vivaldi" part, and leave alone the trailing " "
#browser="brave-browser-stable --new-window "
browser="brave --new-window "

#This is the path to your zoom binary, if it is already in your path use zoom="zoom"... otherwise specify the path to zoom in zoom_path and use the zoom template given
zoom="zoom --url="
#zoom_path=$HOME"/downloads/zoom/opt/zoom/"
#zoom="LD_LIBRARY_PATH="$zoom_path" "$zoom_path"zoom"" --url="
ax="?authuser=0"

name_ch="张伟升"
name_en="CHANG WEI SHENG"
class_num="37"
id="170224"
#how to get these cookies?
#1) go to you browser
#2) if you haven't logged in to your acc, log in please
#3) go to any google site, then tap the padlock on the upper left
#4) Select cookies, and under 'google.com' find those with the name HSID, SSID, and SID
#5) Replace the values below with yours
cookie="HSID=AABsKwUAQ13p_j_Y_; SSID=AuZ3g0g9FNKrm4HOS; SID=-QeQvQ040w-E32p-apA8a9YhgVif8Kx_FUWV0etS6p3g9wwiekfe8NY03ZNDf5ANbWbbyw."


#autologin="curl 'https://docs.google.com/forms/d/e/1FAIpQLSdJNLDkNHo_jq67IFEcUxY5CViFSwO__IoyttY-q2MCwsD3GA/viewform' -H 'cookie: ${cookie}' --data-urlencode \"entry.1710147335=$name_ch\" --data-urlencode \"entry.22811821=$name_en\" --data-urlencode \"entry.552061334=$class_num\" --data-urlencode \"entry.355708063=$id\" --data-urlencode \"fvv=1\" | html2text"

banhui=( "${browser}https://meet.google.com/lookup/bl6ganevqm${ax}" "班会" ) 
eng=( "${browser}https://us04web.zoom.us/j/73105043881?pwd=bmp6YmE1S0VvVGRLVVZ5M3ArTjVwUT09" "Eng" )
music=( "${browser}https://zoom.us/j/3022894614?pwd=SVRJN2p5Z3RFclMrWUczSkwybHdSQT09" "Music" ) 
bio=( "${browser}https://us04web.zoom.us/j/9627723604?pwd=UnY5cWtaZjh2RG9samlLbFRaRzZVdz09" "Bio" ) 
phy=( "${browser}https://meet.google.com/lookup/er3addd22s${ax}" "Phy" ) 
newmath=( "${browser}https://meet.google.com/lookup/enb4tfcfnb${ax}" "New-Math" ) 
malay=( "${browser}https://meet.google.com/lookup/d663sqcy5f${ax}" "Malay" ) 
engcom=( "${browser}https://us04web.zoom.us/j/73105043881?pwd=bmp6YmE1S0VvVGRLVVZ5M3ArTjVwUT09" "Eng-Com" )
chinese=( "${browser}https://meet.google.com/cvt-vbwa-msb${ax}" "Chinese" )
#chinese=( "${browser}https://meet.google.com/oeq-ypna-eus${ax}" "Chinese" )
#chinese=( "${browser}https://meet.google.com/lookup/gjpo5sc755${ax}" "Chinese" )
chem=( "${browser}https://meet.google.com/lookup/fiphko2zxt${ax}" "Chem" )
malayhis=( "${browser}https://meet.google.com/lookup/ge4afvfepp${ax}" "Malay-His" )
calc=( "${browser}https://meet.google.com/jwk-nkwj-wsx${ax}" "Calc" )
#calc=( "${browser}https://meet.google.com/lookup/h4rhaagn4f${ax}" "Calc" )
addmath=( "${browser}https://meet.google.com/qqy-jyvi-ynq${ax}" "Add-Math" )
#addmath=( "${browser}https://meet.google.com/lookup/fhsefgv6cn${ax}" "Add-Math" ) 
moral=( "${browser}https://zoom.us/j/6196952665?pwd=d2M5dlJpTTVjeVk5S203VGliVU13UT09" "Moral" ) 
pe=( "${browser}https://meet.google.com/lookup/hp5qq3nqiu${ax}" "PE" ) 
cont=("CONT" "CONT")
none=("NONE" "NONE")

#Number of periods + 1(zhao du ke)
PERIODS=11
#Number of minutes after the last class started so as to check whether you have accidentally skipped a class
#Here 30*60 seconds is the default value
DELTA_t=$((35*60))

day_1=( "${banhui[@]}" "${calc[@]}" "${eng[@]}" "${malay[@]}" "${chem[@]}" "${cont[@]}" "${moral[@]}" "${calc[@]}" "${bio[@]}" "${newmath[@]}" "${chinese[@]}" )
day_2=( "${banhui[@]}" "${engcom[@]}" "${malay[@]}" "${music[@]}" "${chinese[@]}" "${eng[@]}" "${newmath[@]}" "${malayhis[@]}" "${moral[@]}" "${malay[@]}" "${addmath[@]}" )
day_3=( "${banhui[@]}" "${cont[@]}" "${phy[@]}" "${cont[@]}" "${calc[@]}" "${chinese[@]}" "${cont[@]}" "${malayhis[@]}" "${eng[@]}" "${addmath[@]}" "${chem[@]}" )
day_4=( "${banhui[@]}" "${malay[@]}" "${chinese[@]}" "${addmath[@]}" "${bio[@]}" "${bio[@]}" "${phy[@]}" "${eng[@]}" "${calc[@]}" "${chem[@]}" "${moral[@]}" )
day_5=( "${banhui[@]}" "${malayhis[@]}" "${phy[@]}" "${calc[@]}" "${eng[@]}" "${eng[@]}" "${chinese[@]}" "${pe[@]}" "${bio[@]}" "${malay[@]}" "${cont[@]}" )
day_6=( "${banhui[@]}" "${chem[@]}" "${phy[@]}" "${malay[@]}" "${bio[@]}" "${addmath[@]}" "${eng[@]}" "${malayhis[@]}" "${chinese[@]}" "${none[@]}" "${none[@]}")

auto=1
auto_close=1
#read -p "Multiplex?(Y/n): " yn
case $yn in
    [Nn]* ) auto=0;;
esac
#read -p "Autoclose?(Y/n): " yn
case $yn in
    [Nn]* ) auto_close=0;;
esac

if [ -n "$auto_close" ];
then
    end_periods=($(date -d 7:49 +%s) $(date -d 8:25 +%s) $(date -d 9:05 +%s) $(date -d 9:45 +%s) $(date -d 10:40 +%s) $(date -d 11:20 +%s) $(date -d 12:00 +%s) $(date -d 12:38 +%s) $(date -d 13:45 +%s) $(date -d 14:25 +%s) $(date -d 15:05 +%s))
    #This is the process name visible to pkill, make sure it matches urs"
    #browser_pkill="chrome"
    #zoom_pkill="zoom"

    auto_close_func(){
	    local -n arg_1=$1
	    name_="day_${day}[$(($arg_1 + 3))]"
    	    name=${!name_}
	    echo "Next class : $name"
	    if [[ "$name" == "CONT" ]]
	    then
		arg_1=$(($arg_1 + 2))
	    elif [[ "$name" == "NONE" ]] || [[ -z $name ]]
	    then
		return 2
	    fi
		temp=1800
	    dt=`expr ${end_periods[$(($arg_1 / 2))]} - $(date +%s)`
	    echo "sleeping $dt s"
	    sleep 5 
	    while [[ $ret -eq 0 ]]
	    do
		xmessage -center -timeout 5 -buttons yes:2,no:1 -default yes "Close now?"
	   	ret=$?
		if [[ $ret -eq 0 ]]
		then
		    sleep 60
		fi
	    done
	    if [[ $ret -eq 1 ]]
	    then
		return
	    fi
	    #xdotool search Meet windowkill
	    #pkill $zoom_pkill
    }
fi

day=$(date +%u)
if [ -z "$current_time" ];
then
    current_time=$(date +%s)
fi
autorun=0
for ((i = 0; i < $(($PERIODS*2)); i += 2))
do
    tmp="day_${day}[${i}]"
    name_="day_${day}[$(($i + 1))]"
    name=${!name_}
    dt=`expr ${periods[$(($i / 2))]} - $current_time`
    if [ $dt -le  0 ] && [ $dt -gt $(($DELTA_t * -1)) ] && [ $autorun == 0 ]
    then
        #read -p "$name skipped, launch it? (Y/n): " yn
        case $yn in
            [Nn]* ) echo "Okay then..." && continue;;
        esac
	eval "${!tmp}" &
	if test $auto_close = 1
	then
	    auto_close_func i
	    if test $? = 2
	    then
		continue
	    fi
	fi
    fi

    if [ $dt -gt 0 ]
    then
	if [[ "$name" == "NONE" ]]
	then
	    echo "School ended!"
	    break
	fi
        while [ $dt -gt 0 ];
        do
            min=`expr $dt / 60`
            echo -ne "\033[1A${name} in ${dt}s (${min}min)...\033[0K\r\n"
            sleep 1
            : $((dt--))
        done
        eval "${!tmp}"&
	echo -ne "${name} joined at $(date)\n"
	if test $auto_close = 1
	then
	    auto_close_func i
	fi
        if test $auto = 1
        then
            echo "Preparing next class..."
            current_time=$(date +%s)
            autorun=1
            continue
        fi
        break
    fi
done
echo "No class to prepare, quitting..."
