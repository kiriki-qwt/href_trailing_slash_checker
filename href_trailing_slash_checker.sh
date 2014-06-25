#!/bin/bash

usage_exit() {
        echo "Usage: $0 [-c] [-f] [-s] /path/to/dir" 1>&2
        exit 1
}


while getopts cfhs: OPT
do
    case $OPT in
        c)  count_flg=1
            ;;    
        f)  only_file_flg=1
            ;;              
        h)  usage_exit
            ;;
        s)  slush_flg=$OPTARG
            ;;            
        \?) usage_exit
            ;;
    esac
done

shift $((OPTIND - 1))

if [ $# -ne 1 ]; then
  usage_exit
fi

target_dir=$1

rgexp="href\s*=\s*[\"|\']([^\"|^\']+)[\"|\']"

if [ $slush_flg ]; then
    case $slush_flg in
        0)  rgexp="href\s*=\s*[\"|\']([^\"|^\']+[^\/])[\"|\']"
          ;;
        *) rgexp="href\s*=\s*[\"|\']([^\"|^\']+\/)[\"|\']"
          ;;
    esac
fi

#grepオプション
if [ $only_file_flg ]; then
  grepOption="ln"
else
  grepOption="n"
fi

if [ $count_flg ]; then
    find $target_dir ! -name "*.js" -type f | xargs egrep -$grepOption $rgexp | wc -l
else
    find $target_dir ! -name "*.js" -type f | xargs egrep -$grepOption $rgexp
fi
exit 0
