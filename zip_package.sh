#生成渠道包
#./gradlew clean assembleReleaseChannels
#支持 productFlavors
#./gradlew clean assembleMeituanReleaseChannels
#gradle  clean assembleProductRelease -PchannelList=qihu,vivo,lenovo
#gradle clean assembleProductRelease -PchannelFile=channel


#gradle clean assembleProductReleaseChannels
#选中渠道打包
#gradle assembleProductRelease -PchannelList=qihu,vivo,lenovo


#加固
WORKSPACE=/Users/mac/Desktop/githubworkspace/Testwalle/app
jgPath=/Users/mac/Desktop/tool/360jiagu/jiagu
keystorePath=/Users/mac/Desktop/tool/store
wallePath=/Users/mac/Desktop/tool/walle/walle-cli
buildtools25=/Users/mac/Library/Android/sdk/build-tools/25.0.2
#
#gradle clean assembleCheckRelease
#java -jar ${jgPath}/jiagu.jar -login wuyishun_kmk@outlook.com nihao@123456
#java -jar ${jgPath}/jiagu.jar -importsign ${keystorePath}/aaa.jks 123456 android  123456
#java -jar ${jgPath}/jiagu.jar -showsign
#java -jar ${jgPath}/jiagu.jar -showconfig
#java -jar ${jgPath}/jiagu.jar -showmulpkg
#
#rm -rf ${WORKSPACE}/build/outputs/jiagu
#mkdir ${WORKSPACE}/build/outputs/jiagu
##加固
#ls ${WORKSPACE}/build/outputs/apk/ |grep -v 'apkjiagulist.txt' > ${WORKSPACE}/build/apkjiagulist.txt
#while read lineapk
#do
#echo ${lineapk}
#java -jar ${jgPath}/jiagu.jar -jiagu ${WORKSPACE}/build/outputs/apk/${lineapk} ${WORKSPACE}/build/outputs/jiagu/ -autosign
#done < ${WORKSPACE}/build/apkjiagulist.txt
#
#
#rm -rf ${WORKSPACE}/build/outputs/duiqi
#mkdir ${WORKSPACE}/build/outputs/duiqi
##对齐
#ls ${WORKSPACE}/build/outputs/jiagu/ |grep -v 'apkduiqilist.txt' > ${WORKSPACE}/build/apkduiqilist.txt
#while read lineduiqi
#do
#echo ${lineduiqi}
#${buildtools25}/zipalign -v 4   ${WORKSPACE}/build/outputs/jiagu/${lineduiqi}  ${WORKSPACE}/build/outputs/duiqi/${lineduiqi}
#done < ${WORKSPACE}/build/apkduiqilist.txt
#
#
##签名
#ls ${WORKSPACE}/build/outputs/duiqi/ |grep -v 'apksign.txt' > ${WORKSPACE}/build/apksign.txt
#while read linesign
#do
#echo ${linesign}
#${buildtools25}/apksigner sign --ks   ${keystorePath}/aaa.jks --ks-key-alias android --ks-pass pass:123456  ${WORKSPACE}/build/outputs/duiqi/${linesign}
#done < ${WORKSPACE}/build/apksign.txt
#

apkName
rm -rf ${WORKSPACE}/build/outputs/channels
mkdir ${WORKSPACE}/build/outputs/channels
#多渠道
ls ${WORKSPACE}/build/outputs/duiqi/ |grep -v 'apkchannels.txt' > ${WORKSPACE}/build/apkchannels.txt
while read linechannel
do
echo ${linechannel}
apkName=${linechannel}
done <${WORKSPACE}/build/apkchannels.txt
echo path:${WORKSPACE}/build/outputs/duiqi/${apkName}
while read channelsline
do
if echo "$channelsline"|grep -q -E "^$|^#"
then
continue
fi
substr=${channelsline%#*}
echo 渠道${substr}
java -jar ${wallePath}/walle-cli-all.jar put -c ${substr} ${WORKSPACE}/build/outputs/duiqi/${apkName}   ${WORKSPACE}/build/outputs/channels/${substr}_${apkName}
done <${WORKSPACE}/channel

#rm -rf ${WORKSPACE}/build/outputs/channels
#mkdir ${WORKSPACE}/build/outputs/channels
##多渠道
#ls ${WORKSPACE}/build/outputs/duiqi/ |grep -v 'apkchannels.txt' > ${WORKSPACE}/build/apkchannels.txt
#while read linechannel
#do
#echo ${linechannel}
#java -jar ${wallePath}/walle-cli-all.jar batch -f ${WORKSPACE}/channel  ${WORKSPACE}/build/outputs/duiqi/${linechannel}  ${WORKSPACE}/build/outputs/channels
#done < ${WORKSPACE}/build/apkchannels.txt





#单渠道打包输入：java -jar walle-cli-all.jar put -c[渠道名称] [apk路径] [生成的新apk路径（可选）]
#批量多渠道打包输入：java -jar walle-cli-all.jar batch -f [渠道文件] [apk路径] [生成的新apk路径（可选）]



#jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore [keystore文件路径] -storepass [keystore文件密码] [待签名apk路径] [keystore文件别名]
#jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore ${keystorePath}/aaa.jks -storepass 123456 ${WORKSPACE}/build/outputs/jiagu/${line} android

# keytool -list -keystore debug.keystore
#keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android