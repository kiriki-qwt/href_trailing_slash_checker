#!/bin/bash

usage_exit() {
        echo "Usage: $0 [-c] [-d dir] [-s]" 1>&2
        exit 1
}

while getopts cd:hs: OPT
do
    case $OPT in
        c)  count_flg=1
            ;;    
        d)  target_dir=$OPTARG
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

rgexp="href\s*=\s*[\"|\']([^\"|^\']+)[\"|\']"

if [ $slush_flg ]; then
    case $slush_flg in
        0)  rgexp="href\s*=\s*[\"|\']([^\"|^\']+[^\/])[\"|\']"
          ;;
        *) rgexp="href\s*=\s*[\"|\']([^\"|^\']+\/)[\"|\']"
          ;;
    esac
fi

if [ $count_flg ]; then
  egrep -r $rgexp $target_dir | wc -l
else
  egrep -r $rgexp $target_dir
fi
exit 0
