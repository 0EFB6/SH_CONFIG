periods=($(date -d 07:30 +%s) $(date -d 07:50 +%s) $(date -d 08:30 +%s) $(date -d 9:10 +%s) $(date -d 10:05 +%s) $(date -d 10:45 +%s) $(date -d 11:25 +%s) $(date -d 12:05 +%s) $(date -d 13:09 +%s) $(date -d 14:50 +%s) $(date -d 14:30 +%s))

#Browser to open links, you should only change the "vivaldi" part, and leave alone the trailing " "
browser="brave-browser-stable"" "

#This is the path to your zoom binary, if it is already in your path use zoom="zoom"... otherwise specify the path to zoom in zoom_path and use the zoom template given
zoom="zoom --url="
#zoom_path=$HOME"/usr/bin/zoom"
#zoom="LD_LIBRARY_PATH="$zoom_path" "$zoom_path"zoom"" --url="
ax="?authuser=0"

banhui=( "${browser}https://meet.google.com/lookup/bl6ganevqm${ax}" "班会" ) 
eng=( "${zoom}https://us04web.zoom.us/j/73105043881?pwd=bmp6YmE1S0VvVGRLVVZ5M3ArTjVwUT09" "Eng" )
music=( "${zoom}https://zoom.us/j/3022894614?pwd=SVRJN2p5Z3RFclMrWUczSkwybHdSQT09" "Music" ) 
bio=( "${zoom}https://us04web.zoom.us/j/9627723604?pwd=UnY5cWtaZjh2RG9samlLbFRaRzZVdz09" "Bio" ) 
phy=( "${browser}https://meet.google.com/lookup/er3addd22s${ax}" "Phy" ) 
newmath=( "${browser}https://meet.google.com/lookup/enb4tfcfnb${ax}" "New-Math" ) 
malay=( "${browser}https://meet.google.com/lookup/d663sqcy5f${ax}" "Malay" ) 
engcom=( "${zoom}https://us04web.zoom.us/j/73105043881?pwd=bmp6YmE1S0VvVGRLVVZ5M3ArTjVwUT09" "Eng-Com" )
chinese=( "${browser}https://meet.google.com/lookup/gjpo5sc755${ax}" "Chinese" )
chem=( "${browser}https://meet.google.com/lookup/fiphko2zxt${ax}" "Chem" )
malayhis=( "${browser}https://meet.google.com/lookup/ge4afvfepp${ax}" "Malay-His" )
calc=( "${browser}https://meet.google.com/lookup/h4rhaagn4f${ax}" "Calc" )
addmath=( "${browser}https://meet.google.com/lookup/fhsefgv6cn${ax}" "Add-Math" ) 
moral=( "${zoom}https://zoom.us/j/6196952665?pwd=d2M5dlJpTTVjeVk5S203VGliVU13UT09" "Moral" ) 
pe=( "${browser}https://meet.google.com/lookup/d663sqcy5f${ax}" "PE" ) 
none=("NONE" "NONE")

#Number of periods + 1(zhao du ke)
PERIODS=11
#Number of minutes after the last class started so as to check whether you have accidentally skipped a class
#Here 30*60 minutes is the default value
DELTA_t=$((30*60))

day_1=( "${banhui[@]}" "${calc[@]}" "${eng[@]}" "${malay[@]}" "${chem[@]}" "${none[@]}" "${moral[@]}" "${calc[@]}" "${chinese[@]}" "${newmath[@]}" "${bio[@]}" )
day_2=( "${banhui[@]}" "${engcom[@]}" "${malay[@]}" "${music[@]}" "${chinese[@]}" "${eng[@]}" "${newmath[@]}" "${malayhis[@]}" "${moral[@]}" "${malay[@]}" "${addmath[@]}" )
day_3=( "${banhui[@]}" "${none[@]}" "${phy[@]}" "${none[@]}" "${calc[@]}" "${chinese[@]}" "${none[@]}" "${malay[@]}" "${eng[@]}" "${addmath[@]}" "${chem[@]}" )
day_4=( "${banhui[@]}" "${malay[@]}" "${chinese[@]}" "${addmath[@]}" "${bio[@]}" "${bio[@]}" "${phy[@]}" "${eng[@]}" "${calc[@]}" "${chem[@]}" "${moral[@]}" )
day_5=( "${banhui[@]}" "${malayhis[@]}" "${bio[@]}" "${calc[@]}" "${eng[@]}" "${eng[@]}" "${chinese[@]}" "${pe[@]}" "${phy[@]}" "${malay[@]}" "${none[@]}" )
day_6=( "${banhui[@]}" "${chem[@]}" "${phy[@]}" "${malay[@]}" "${chinese[@]}" "${addmath[@]}" "${eng[@]}" "${malayhis[@]}" "${bio[@]}" "${none[@]}" "${none[@]}")

auto=1
#read -p "Do you want me to automatically open the next link ( put into waiting ) when a class has started?(Y/n): " yn
case $yn in
    [Yy]* ) auto=1;;
    * ) auto=1;;
esac

day=$(date +%u)
current_time=$(date +%s)
autorun=0
for ((i = 0; i < $(($PERIODS*2)); i += 2))
do
    tmp="day_${day}[${i}]"
    name_="day_${day}[$(($i + 1))]"
    name=${!name_}
    dt=`expr ${periods[$(($i / 2))]} - $current_time`
    if [ $dt -le  0 ] && [ $dt -gt $(($DELTA_t * -1)) ] && [ $autorun == 0 ]
    then
        #read -p "Well, it seems that you might have skipped a class ($name), do you want me to launch it for you? (Y/n): " yn
        case $yn in
            [Nn]* ) echo "Okay then...";;
            * ) eval "${!tmp}";;
        esac
    fi

    if [ $dt -gt 0 ]
    then
	if [ $name == NONE ]
	then
	    echo "No more classes, you mad lad"
	    break
	fi
        while [ $dt -gt 0 ];
        do
            min=`expr $dt / 60`
            echo -ne "\033[1ADelaying $dt second(s) (approximately $min minute(s)) until the next class ($name) starts...\033[0K\r\n"
            sleep 1
            : $((dt--))
        done
        eval "${!tmp}"
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
