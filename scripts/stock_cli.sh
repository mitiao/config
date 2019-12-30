#!/bin/bash
set -e

LANG=zh_CN.UTF-8

COLOR_BOLD="\e[1;37m"
COLOR_GREEN="\e[32m"
COLOR_RED="\e[31m"
COLOR_RESET="\e[00m"
declare -a STOCKS=()

function parseArguments() {
	# Loop through the arguments
	while [[ ${#} -gt 0 ]]; do
		case ${1} in
			-l)
				shift
				CONFIG="${1}"
                displayFromConfig;;
			-h | --help)
				displayUsage
				exit;;
            *)
                displayUsage
		esac
		shift
	done
}

function displayFromConfig() {
    if [[ -z ${CONFIG} ]]; then
		CONFIG='stock.ini'
	fi

    while IFS=' ' read -r line
    do
        case $line in
            "")   ;;
            \#*)  ;;
            \;*)  ;;
            *)
                STOCKS+=("$line")
                ;;
        esac
    done < "${CONFIG}"
    printHeader
    display
}

function displayUsage() {
	echo "Usage: ./stock-cli.sh -l [file]"
	echo "   -l,           Load stocks from file"
	echo "   -h, --help    Show help"
}

function printHeader() {
    printf "%-25s|" '股票名称'
    printf "%-10s|" '开盘价'
    printf "%-10s|" '当前价'
    printf "%-13s|" '涨跌幅'
    printf "%-10s\n" '涨跌额'
}

function queryStock(){
    ret="`curl --silent http://hq.sinajs.cn/list=$1 | iconv -f gbk -t utf8`"
    stock_info=${ret#*\"}
    stock_info=${stock_info%\"*}
    IFS=","
    ret_arr=($stock_info)
    echo ${ret_arr[*]}
}

function display(){
    for symbol in ${STOCKS[@]}; do
        ret="`queryStock $symbol`"
    #    echo "----------->"
    #    echo $ret;
    #    echo "<-----------"
        ret_arr=($ret);

        stock_name=${ret_arr[0]}
        start_price=${ret_arr[2]}
        current_price=${ret_arr[3]}
        current_time=${ret_arr[31]}
        today_change=$(printf "%.3f" `echo "scale=3;${current_price} - ${start_price}"|bc`)
        today_change_rate=$( printf "%.2f" `echo "scale=4; ${today_change} / ${start_price} * 100" | bc` )

        if [ $(echo "$today_change > 0" | bc) -eq 1 ]; then
            color=$COLOR_RED
        elif [ $(echo "$today_change < 0" | bc) -eq 1 ]; then
            color=$COLOR_GREEN
        else
            color=''
        fi

        printf "%-25s|" $stock_name"["$symbol"]"
        printf "%-7.2f|" $start_price
        printf "$COLOR_BOLD%-7.2f$COLOR_RESET|" $current_price
        printf "$color%-10s$COLOR_RESET|" $(printf "%.2f%%" $today_change_rate)
        printf "$color%-7.2f$COLOR_RESET\n" $today_change
    done;
}

parseArguments "${@}"

#while true; do var=$(display);  sleep 1; done
