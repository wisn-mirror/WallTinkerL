#while read line
#sed '/^.*#.*\|^$/d' /Users/mac/Desktop/githubworkspace/Testwalle/app/channel
#cat '^#' /Users/mac/Desktop/githubworkspace/Testwalle/app/channel
#sed '/^#.*\|^$/d' | while read line
#do
#echo ${line}
#done < /Users/mac/Desktop/githubworkspace/Testwalle/app/channel
#exit 0
#
#while read line
#do
#if echo "$line"|grep -q -E "^$|^#"
#then
#continue
#fi
##substr=${line#*#}
##substr=${line##*#}
#substr=${line%#*}
##echo aaa===${line}
#echo ok===${substr}
#done </Users/mac/Desktop/githubworkspace/Testwalle/app/channel
#echo ${substr}
#echo ${substr}
#echo ${substr}
#echo ${substr}
#/Users/mac/Desktop/tool/fir.sh


#上传到fir.im 账户jenkins@hollywant.com
#cd /Users/mac/Desktop/githubworkspace/Testwalle/app/
sudo fir login -T fec2af37884ca655fc5859e79deea2c5
#apkfile=`ls app_hollywant/build/outputs/jiagu | grep ${tag}`
sudo fir publish /Users/mac/Desktop/githubworkspace/Testwalle/app/build/outputs/channels/3gcn_app-check-release_10_jiagu_xiaomi.apk

