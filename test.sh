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
duiqiisOk=ok
if [ "$duiqiisOk" != ok ];then
exit
echo 4kok
fi

keytool -list -v -keystore ./lyf_app/keystore/laiyifen.key
#
#WORKSPACE=/Users/mac/Desktop/githubworkspace/Testwalle/app
#
#gradle clean assembleCheckRelease | grep -v 'apkduiqilist.txt' > ${WORKSPACE}/apkduiqilist.txt
#while read channelsline
#do
#if echo "$channelsline"|grep -q -E "^:"
#then
#continue
#echo "$channelsline"
#elif [ "$channelsline" = "BUILD SUCCESSFUL" ];then
#echo 'buildSUCCESSFUL'
#break
#elif [ "$channelsline" = "BUILD FAILED" ];then
#echo 'BUILDFAILEDbbbbbbb'
#exit
#fi
#done <${WORKSPACE}/apkduiqilist.txt

##awk 'END {print}'
#aaa=
#if [ ${buildresult} == *'SUCCESSFUL'* ];then
#echo success
#else
#echo failed
#fi
#
#if [ -n "$aaa" ]; then
#exit
#else if[]
#echo bbb
#fi
#上传到fir.im 账户jenkins@hollywant.com
#cd /Users/mac/Desktop/githubworkspace/Testwalle/app/
#sudo fir login -T fec2af37884ca655fc5859e79deea2c5
#apkfile=`ls app_hollywant/build/outputs/jiagu | grep ${tag}`
#sudo fir publish /Users/mac/Desktop/githubworkspace/Testwalle/app/build/outputs/channels/3gcn_app-check-release_10_jiagu_xiaomi.apk
#sudo fir publish /Users/mac/Desktop/Android_lyf_ody/lyf_app/build/outputs/channels/_360_lyf_app-edu_5212_jiagu.apk

#curl -F "file=@/tmp/example.ipa" -F "uKey=ed639f2e5cac76e08c1eb24b775c2b69" -F "_api_key=30ddd93225add3ed02677a8ae9722d80" https://qiniu-storage.pgyer.com/apiv1/app/upload
#curl -F "file=@/Users/mac/Desktop/Android_lyf_ody/lyf_app/build/outputs/channels/_360_lyf_app-edu_5212_jiagu.apk" -F "uKey=ed639f2e5cac76e08c1eb24b775c2b69" -F "_api_key=30ddd93225add3ed02677a8ae9722d80" https://qiniu-storage.pgyer.com/apiv1/app/upload


